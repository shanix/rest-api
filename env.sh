DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

### Special rules on syntax ###
#
# To add a variable that should default to itself or another variable:
#   e.g., set VAR to VAR if set otherwise PATH:
#     export VAR=${VAR:=$PATH}
#
# To add a variable that should default to itself or something hard-coded:
#   e.g., set VAR to VAR if set otherwise "FOO":
#     export VAR=${VAR:-FOO}

### PATHS ###
export _ENV_TOPDIR="${_ENV_TOPDIR:="$DIR"}"
export _ENV_SCRIPTS="${_ENV_SCRIPTS:="$_ENV_TOPDIR/scripts"}"
export _ENV_SRC="${_ENV_SRC:="$_ENV_TOPDIR/src"}"
export _ENV_TEST="${_ENV_TEST:="$_ENV_TEST/test"}"

### SETTINGS ###
export _ENV_PORT=${_ENV_PORT:-60000}
export _ENV_OVERRIDE="${_ENV_OVERRIDE:="$_ENV_TOPDIR/env.sh.custom"}"


if [ -r "${CUSTOM_ENV_SH}" ]; then
    source ${CUSTOM_ENV_SH} || exit 1
fi

