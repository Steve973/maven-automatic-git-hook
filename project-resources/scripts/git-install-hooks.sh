#!/usr/bin/env bash

PROJECT_BASE_DIR=${1}

echo "Installing git hooks"

# Ensure that the project-resources git pre-commit hook script is executable
chmod +x ${PROJECT_BASE_DIR}/project-resources/git/hooks/pre-commit.sh

# Install the project-resources git pre-commit hook as a symlink in the git hooks directory
ln -sfn ${PROJECT_BASE_DIR}/project-resources/git/hooks/pre-commit.sh ${PROJECT_BASE_DIR}/.git/hooks/pre-commit
