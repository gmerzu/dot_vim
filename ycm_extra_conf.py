# vim:noet:ts=4:sw=4:
# Author: Anton Kozhemyachenko <gmerzu@gmail.com>

import os
import ycm_core


FLAGS = [
    '-Wall',
    '-Wextra',
    '-Wno-long-long',
    '-Wno-variadic-macros',
    '-fexceptions',
    '-DNDEBUG',
    '-I', '.'
]
C_FLAGS = [
    '-std=c99',
    '-x', 'c',
]
CXX_FLAGS = [
    '-Wc++98-compat',
    '-std=c++11',
    '-x', 'c++',
]


SOURCE_EXTENSIONS = ['.cpp', '.cxx', '.cc', '.c', '.m', '.mm']
SOURCE_C_EXTENSIONS = ['.c']
SOURCE_CXX_EXTENSIONS = ['.cpp', '.cxx', '.cc']
HEADER_EXTENSTIONS = ['.h', '.hxx', '.hpp', '.hh']

GCC_CMD = 'gcc -v -x c++ -E -'
GCC_BEGIN_SEARCH_FOR_INCLUDE = '#include <...> search starts here:'
GCC_END_SEARCH_FOR_INCLUDE = 'End of search list.'

def GetSystemIncludeFlags():
    try:
        import subprocess
        sub = subprocess.Popen(GCC_CMD.split(),
            stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    except OSError:
        return []

    sub.stdin.close()

    includes = []

    in_search = False
    for line in sub.stdout:
        line = line.strip()
        if line == GCC_BEGIN_SEARCH_FOR_INCLUDE:
            in_search = True
        elif line == GCC_END_SEARCH_FOR_INCLUDE:
            break
        elif in_search:
            includes.append(line)

    sub.wait()

    return ['-I' + include for include in includes]


def GenerateAlsoInUpper(strings):
    return [s.upper() for s in strings] + strings


def IsHeaderFile(filename):
    extension = os.path.splitext(filename)[1]
    return extension in HEADER_EXTENSTIONS


def IsCSourceFile(filename):
    extension = os.path.splitext(filename)[1]
    return extension in SOURCE_C_EXTENSIONS


def IsCXXSourceFile(filename):
    extension = os.path.splitext(filename)[1]
    return extension in SOURCE_CXX_EXTENSIONS


def DirectoryOfThisScript():
    return os.path.dirname(os.path.abspath(__file__))


def MakeRelativePathsInFlagsAbsolute(flags, working_directory):
    if not working_directory:
        return list(flags)
    new_flags = []
    make_next_absolute = False
    path_flags = ['-isystem', '-I', '-iquote', '--sysroot=']
    for flag in flags:
        new_flag = flag

        if make_next_absolute:
            make_next_absolute = False
            if not flag.startswith('/'):
                new_flag = os.path.join(working_directory, flag)

        for path_flag in path_flags:
            if flag == path_flag:
                make_next_absolute = True
                break

            if flag.startswith(path_flag):
                path = flag[len(path_flag):]
                new_flag = path_flag + os.path.join(working_directory, path)
                break

        if new_flag:
            new_flags.append(new_flag)
    return new_flags


def FlagsForFile(filename, **kwargs):
    final_flags = MakeRelativePathsInFlagsAbsolute(FLAGS, DirectoryOfThisScript())
    c_flags = MakeRelativePathsInFlagsAbsolute(C_FLAGS, DirectoryOfThisScript())
    cxx_flags = MakeRelativePathsInFlagsAbsolute(CXX_FLAGS, DirectoryOfThisScript())
    final_flags += GetSystemIncludeFlags()
    if IsCSourceFile(filename):
        final_flags += c_flags
    elif IsCXXSourceFile(filename):
        final_flags += cxx_flags
    return {'flags': final_flags, 'do_cache': True}
