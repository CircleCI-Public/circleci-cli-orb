#!/usr/bin/env bash
if [[ $EUID == 0 ]]; then export SUDO=""; else export SUDO="sudo"; fi

# grab CircleCI CLI version
if [[ "${ORB_VAL_VERSION}" == "latest" ]]; then
    # extract latest version from GitHub releases API
    CIRCLECI_CLI_VERSION=$(curl -Ls -o /dev/null -w %\{url_effective\} "https://github.com/CircleCI-Public/circleci-cli/releases/latest" | sed 's:.*/::')
else
    CIRCLECI_CLI_VERSION="${ORB_VAL_VERSION}"
    echo "Selected version of CircleCI CLI is $CIRCLECI_CLI_VERSION"
fi

OUTPUT="/dev/tty"

if [ "$ORB_VAL_DEBUG" = 1 ]; then
    OUTPUT="/dev/null"
fi

# check if CircleCI CLI needs to be installed

if command -v circleci > "$OUTPUT" 2>&1; then
    if circleci version | grep "${CIRCLECI_CLI_VERSION:1}" > /dev/null 2>&1; then
        echo "circleci $CIRCLECI_CLI_VERSION is already installed"
        exit 0
    else
        echo "A different version of the CircleCI CLI is installed ($(circleci version)); updating it"
        $SUDO rm -f "$(which circleci)"
        curl -fLSs https://raw.githubusercontent.com/CircleCI-Public/circleci-cli/master/install.sh | $SUDO bash
        echo "CircleCI CLI version $(circleci --skip-update-check version) has been installed to $(which circleci)"
    fi
fi
