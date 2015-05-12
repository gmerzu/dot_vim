#!/bin/bash
# --------------------------------------------------
# SCRIPT TO INSTALL DOT_VIM
#
# Author: Anton Kozhemyachenko <gmerzu@gmail.com>
# --------------------------------------------------

export PATH=/bin:/usr/bin:/sbin:/usr/sbin

info()
{
	local line=
	for line in "$@"; do
		printf "  [ \033[00;34m..\033[0m ] ${line}\n"
	done
}

warn()
{
	local line=
	for line in "$@"; do
		printf "  [ \033[00;33m..\033[0m ] \033[00;33m${line}\033[0m\n"
	done
}

success()
{
	local line=
	for line in "$@"; do
		printf "\r\033[2K  [ \033[00;32mOK\033[0m ] ${line}\n"
	done
	EXIT_STATUS=0
	exit ${EXIT_STATUS}
}

fail()
{
	local line=
	for line in "$@"; do
		printf "\r\033[2K  [\033[0;31mFAIL\033[0m] ${line}\n"
	done
	EXIT_STATUS=1
	exit ${EXIT_STATUS}
}

print_seq()
{
	local nsec=$1
	local tmp=
	printf "  [ \033[00;33m..\033[0m ] "
	for tmp in $(seq ${nsec} -1 1); do
		printf "\033[00;33m${tmp}... \033[0m"
		sleep 1
	done
	printf "\033[00;33m0\033[0m\n"
}

print_attention()
{
	local nsec=10
	warn "ATTENTION"
	info "You are forcing to remove old vim configuration"
	warn "\t===> ~/.vimrc to be removed !!!" \
		"\t===> ~/.vim to be removed !!!"
	info "Press <Ctrl-C> to stop this script if it's not what you expect !!!" \
		"You have only ${nsec} seconds !!!"
	print_seq ${nsec}
}

check()
{
	local exe=
	info "Checking for required apps ..."
	info "------------------------------"
	for exe in $@; do
		if test $(which ${exe}); then
			[ x"${VERBOSE}" = x"1" ] && info "${exe} found"
		else
			fail "${exe} not found" \
				"refer to your Linux Distribution manual how to install it, then rerun this script."
		fi
	done
	info "Done."
}

gen_random()
{
	echo $(date +"%G%m%d%H%M%S").${RANDOM}
}

gen_bak()
{
	echo $(gen_random).bak
}

do_action()
{
	if [ x"${DRYRUN}" = x"1" ]; then
		echo -e "  [ \033[00;35m**\033[0m ] Would run: $@"
		return 0
	else
		[ x"${VERBOSE}" = x"1" ] &&	echo -e "  [ \033[00;35m**\033[0m ] $@"
		eval "$@"
		return $?
	fi
}

ask()
{
	local ask="$@"
	local ans=
	[ x"${INTERACTIVE}" = x"1" ] || return 0
	printf "  [\033[00;33mWAIT\033[0m] "
	read -N 1 -s -p "${ask} [y/N]: " ans && echo
	if [ x"${ans}" = x"y" -o x"${ans}" = x"Y" ]; then
		return 0
	else
		return 1
	fi
}

wait_for_pid()
{
	local pid=$1
	local timeout=20
	local msgs=("I'm still here ..." "Need couple of time ..." "You can drink a cup of tee :)")
	local msgs_count=${#msgs[*]}
	local step=0
	(
		((t=0))
		while true; do
			sleep 0.5
			((t++))
			if ((t > timeout)); then
				((t=0))
				((msg_idx=step%msgs_count))
				((step++))
				warn "${msgs[${msg_idx}]}"
			fi
			kill -0 ${pid} &>/dev/null || break
		done
	)
	wait ${pid}
	return $?
}

preserve_old()
{
	local tmp=
	if [ -e ~/.vimrc ]; then
		info "Found old ~/.vimrc, backuping ..."
		tmp="${HOME}/.vimrc.$(gen_bak)"
		do_action mv ~/.vimrc ${tmp} || fail "Can't mv to ${tmp}"
		info "Backup is ${tmp}"
	fi
	if [ -e ~/.vim ]; then
		info "Found old ~/.vim, backuping ..."
		tmp="${HOME}/.vim.$(gen_bak)"
		do_action mv ~/.vim ${tmp} || fail "Can't mv to ${tmp}"
		info "Backup is ${tmp}"
	fi
}

remove_old()
{
	if [ -e ~/.vimrc -o -e ~/.vim ]; then
		print_attention
	fi
	if [ -e ~/.vimrc ]; then
		info "Removing ~/.vimrc ..."
		do_action rm -rf ~/.vimrc || fail "Can't rm ~/.vimrc"
	fi
	if [ -e ~/.vim ]; then
		info "Removing ~/.vim ..."
		do_action rm -rf ~/.vim || fail "Can't rm ~/.vim"
	fi
}

init()
{
	info "Setting up VIM configuration"
	info "============================"
	echo ""

	SCRIPT_PATH=$(readlink -f "$0")
	[ $? -eq 0 ] || fail "Can't readlink $0"
	DOT_VIM=$(readlink -f "$(dirname "${SCRIPT_PATH}")"/..)
	[ $? -eq 0 ] || fail "Can't find dot_vim dir"
	info "DOT_VIM=${DOT_VIM}"
}

process_old()
{
	info "Checking for old symlinks and remove them ..."
	info "---------------------------------------------"
	if [ -L ~/.vimrc ]; then
		do_action rm -f ~/.vimrc || fail "Can't remove symlink ~/.vimrc"
	fi
	if [ -L ~/.vim ]; then
		do_action rm -f ~/.vim || fail "Can't remove symlink ~/.vim"
	fi
	info "Done."
	echo ""
	info "Processing old configuration ..."
	info "--------------------------------"
	if [ -d ~/.vim ]; then
		if [ -z "$(ls -A ~/.vim)" ]; then
			do_action rmdir ~/.vim || fail "Can't remove empty directory ~/.vim"
		fi
	fi
	[ ${FORCE} -eq 1 ] && remove_old || preserve_old
	info "Done."
}

process_new()
{
	local tmp=
	local need_symlinks=()
	local need_dirs=()

	need_symlinks+=(
		"README.md" "LICENSE"
		)
	need_symlinks+=(
		"vimrc"
		)
	need_symlinks+=(
		"autocmds.vim" "commands.vim" "config.vim" "functions.vim" "mappings.vim"
		"plugins.vim" "settings.vim" "vundle_install.vim" "vundle.vim"
		)
	need_symlinks+=(
		"ycm_extra_conf.py"
		)
	need_symlinks+=(
		"c-support" "licenses" "scripts" "snippets" "spell" "vundle_plugins"
		)

	need_dirs+=(
		".backup" ".cache" ".notes" ".sessions" ".swp" ".tmp" ".undo" ".view"
		)

	do_action mkdir ~/.vim || fail "Can't make directory ~/.vim"

	do_action "pushd \"${DOT_VIM}\" &>/dev/null" || fail "Can't pushd into ${DOT_VIM}"

	for tmp in ${need_symlinks[@]}; do
		do_action ln -sr ${tmp} ~/.vim/ || fail "Can't make symlink ~/.vim/${tmp}"
	done

	for tmp in ${need_dirs[@]}; do
		do_action mkdir ~/.vim/${tmp} || fail "Can't make directory ~/.vim/${tmp}"
		do_action chmod 700 ~/.vim/${tmp} || fail "Can't chmod directory ~/.vim/${tmp}"
	done

	do_action "popd &>/dev/null"
}

install_new()
{
	if [ ${SYMLINK} -eq 2 ]; then
		info "Setting up symlinks ..."
		info "-----------------------"
		process_new
	elif [ ${SYMLINK} -eq 1 ]; then
		info "Setting up symlink for whole dot_vim ..."
		info "----------------------------------------"
		do_action ln -srT \"${DOT_VIM}\" ~/.vim || fail "Can't make symlink ~/.vim"
	else
		info "Copying configuration ..."
		info "-------------------------"
		do_action cp -arT \"${DOT_VIM}\"/ ~/.vim || fail "Can't cp into ~/.vim"
	fi
	do_action "pushd ~ &>/dev/null" || fail "Can't pushd into ~"
	do_action ln -s .vim/vimrc .vimrc || fail "Can't make symlink ~/.vimrc"
	do_action "popd &>/dev/null"
	info "Done."
}

install_vundle()
{
	info "Installing Vundle ..."
	info "---------------------"
	do_action "pushd ~/.vim &>/dev/null" || fail "Can't pushd into ~/.vim"
	do_action git clone http://github.com/gmarik/Vundle.vim bundle/Vundle.vim || fail "Can't clone Vundle"
	do_action "popd &>/dev/null"
	info "Done."
}

install_plugins()
{
	info "Installing plugins ..."
	info "----------------------"
	do_action "pushd ~/.vim &>/dev/null" || fail "Can't pushd into ~/.vim"
	warn "Please wait a while ..."
	(do_action vim -X -T xterm --noplugin -n -i /tmp/viminfo-vundle-$(gen_random).tmp \
		-u vundle_install.vim -U NONE \"+PluginInstall!\" \"+PluginClean!\" \"+qall!\" "&>/dev/null" \
		|| fail "Can't install plugins") &
	wait_for_pid $! || fail "There were some errors while installing plugins"
	do_action "popd &>/dev/null"
	info "Done."
}

finish()
{
	success "Setup complete. Run VIM and enjoy."
}

exit_handler()
{
	trap - INT QUIT TERM EXIT
	[ ${EXIT_STATUS} -eq 0 ] && success "Exiting successfully." || fail "Exiting with errors."
	exit ${EXIT_STATUS}
}

print_help()
{
	info "USE: $0 <OPTIONS>..." \
		"\t-h|--help          this help" \
		"\t-f|--force         remove existing vim configurations (~/.vimrc, ~/.vim)" \
		"\t-L|--symlinks      make symlinks (default)" \
		"\t-l|--symlink       make symlink for whole dot_vim" \
		"\t-c|--copy          copy this configuration instead of make symlinks" \
		"\t-i|--interactive   ask each step whether to process it" \
		"\t-n|--dry-run       do nothing actually"
	exit 0
}

parse_args()
{
	while [ $# -ne 0 ]; do
		case $1 in
			-h|--help)
				print_help
				;;
			-f|--force)
				FORCE=1
				;;
			-L|--symlinks)
				SYMLINK=2
				;;
			-l|--symlink)
				SYMLINK=1
				;;
			-c|--copy)
				SYMLINK=0
				;;
			-v|--verbose)
				VERBOSE=1
				;;
			-i|--interactive)
				INTERACTIVE=1
				;;
			-n|--dry-run)
				DRYRUN=1
				;;
		esac
		shift
	done
}

EXIT_STATUS=0
trap 'exit_handler' INT QUIT TERM EXIT

FORCE=0
SYMLINK=2
VERBOSE=0
INTERACTIVE=0
DRYRUN=0

init
parse_args $@

echo ""
check date seq readlink vim git

echo ""
ask "Process old vim files?" && process_old

echo ""
ask "Install new vim files?" && install_new

echo ""
ask "Install Vundle?" && install_vundle

echo ""
ask "Install plugins?" && install_plugins

echo ""
finish
