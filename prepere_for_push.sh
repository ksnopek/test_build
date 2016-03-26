#!/bin/bash

if git rev-parse --verify HEAD >/dev/null 2>&1
then
        against=HEAD
else
        # Initial commit: diff against an empty tree object
        against=4b825dc642cb6eb9a060e54bf8d69288fbee4904
fi

# We should not pass non-C/C++ files to cppcheck. Filter filenames with pattern.
pattern='\.(c|cpp|cc|cxx|h|hpp)$'
changed_files=$(git diff-index --cached --name-only $against | grep -E $pattern)

if [ -n "$changed_files" ]; then
    cppcheck --enable=all --error-exitcode=1 $changed_files
    exit $?
fi

echo "testaa"

