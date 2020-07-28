#!/usr/bin/env bash

echo "Args: $@"
USERNAME=$1
OUTPUT_FILE=$2
THEME=$3
if [[ -z $3 ]]; then
  THEME=default
fi

cd ${GITHUB_WORKSPACE} || echo "Couldn't cd to \${GITHUB_WORKSPACE}, did you checkout?" # used so that output_file's relative directory is inside the

PARAM_THEME="-c ${THEME}"

PARAM_USER=""
if [[ ${USERNAME} ]]; then
  PARAM_USER="-u ${USERNAME}"
fi

echo "Running /githubchart ${PARAM_USER} ${PARAM_THEME} ${OUTPUT_FILE}"
githubchart ${PARAM_USER} ${PARAM_THEME} ${OUTPUT_FILE}
