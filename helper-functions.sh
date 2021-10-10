function ask_yes_no {
  local PROMPT=$1
  local DEFAULT=$2
  local USER_INPUT

  to_lowercase "${DEFAULT}"
  DEFAULT="${_RETURN_VALUE}"

  if [[ "${DEFAULT}" == "y" ]]; then
    Y_N_STRING="[Y/n]"
  else
    Y_N_STRING="[y/N]"
  fi

  read -r -p "${PROMPT} ${Y_N_STRING}: " USER_INPUT

  to_lowercase "${USER_INPUT}"
  USER_INPUT="${_RETURN_VALUE}"

  if [[ "${USER_INPUT}" == "" ]]; then
    USER_INPUT="${DEFAULT}"
  fi

  if [[ "${USER_INPUT}" == "y" ]]; then
    return 0
  else
    return 1
  fi
}

function to_lowercase {
  _RETURN_VALUE=$(echo "${1}" | tr '[:upper:]' '[:lower:]')
}

function to_uppercase {
  _RETURN_VALUE=$(echo "${1}" | tr '[:lower:]' '[:upper:]')
}

if [[ $(ask_yes_no "Are things good" "y") ]]; then
  echo "Things are good."
else
  echo "Things are not good."
fi



