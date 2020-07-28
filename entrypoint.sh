#!/usr/bin/env bash

cd ${GITHUB_WORKSPACE}

PARAM_THEME=""
if [[ ${THEME} ]]; then
  PARAM_THEME="-c ${theme}"
fi

PARAM_USER=""
if [[ ${USERNAME} ]]; then
  PARAM_USER="-u ${username}"
fi

/githubchart ${PARAM_USER} ${PARAM_THEME} ${OUTPUT_FILE} || { echo "githubchart FAILED"; exit 1}
