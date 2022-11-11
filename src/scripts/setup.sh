#!/usr/bin/env bash

HOST=$(eval "echo $ORB_EVAL_HOST")

circleci setup --no-prompt --host "$HOST"  --token "${!ORB_ENV_CLI_TOKEN}"
