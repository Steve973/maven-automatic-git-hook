#!/usr/bin/env bash

PROJECT_BASE_DIR=${1}
PRE_COMMIT_FILE="${PROJECT_BASE_DIR}/.git/hooks/pre-commit"
PRE_COMMIT_HOOK_SCRIPT="${PROJECT_BASE_DIR}/project-resources/git/hooks/pre-commit.sh"

function print {
  echo "**** ${1}"
}

function printBannerLine {
  echo "***************************************************************"
}

# Note that this is a minimal example, and I am not suggesting that this
# is how you should install the script.  Consider running some checks to
# determine if the user's development environment is correctly set up,
# and consider providing some feedback about any misconfiguration or other
# incompatibility that is found.

printBannerLine
print 'Installing git hooks...'

# Ensure that the project-resources git pre-commit hook script is executable
if [ ! -x "${PRE_COMMIT_HOOK_SCRIPT}" ] ; then
  print 'Making pre-commit hook script executable.'
  chmod +x "${PRE_COMMIT_HOOK_SCRIPT}"
  if [ ! -x "${PRE_COMMIT_HOOK_SCRIPT}" ] ; then
    print 'Pre-commit hook script is not executable. Exiting.'
    printBannerLine
    exit 1
  fi
fi
print 'Pre-commit hook script is executable. Attempting to link.'

# Install the project-resources git pre-commit hook as a symlink in the git hooks directory
if [ ! -L "${PRE_COMMIT_FILE}" ] ; then
  print 'Creating pre-commit link.'
  ln -sfn "${PRE_COMMIT_HOOK_SCRIPT}" "${PRE_COMMIT_FILE}"
  if [ ! -L "${PRE_COMMIT_FILE}" ] ; then
    print 'Could not create pre-commit link. Exiting.'
    printBannerLine
    exit 2
  fi
fi
print 'Pre-commit link exists.'

print 'Finished installing git hooks.'
printBannerLine
