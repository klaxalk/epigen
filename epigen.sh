#!/bin/bash

# move the path to location of the script
# EPIGEN_SOURCE_LOC=`dirname "$BASH_SOURCE"`
# export EPIGEN_SOURCE_LOC=`( cd "$EPIGEN_SOURCE_LOC" && pwd )`

EPIGEN_SOURCE_LOC=`dirname "$BASH_SOURCE"`
export EPIGEN_SOURCE_LOC=`( cd "$EPIGEN_SOURCE_LOC" && pwd )`

epigen() {

  DEBUG="1"

  HELP="usage: epigen mode [arguments] file_path [block name]
Modes:
  addition        Addition (used to uncomment blocks which are commented by default)
  deletion        Reduction (used to comment blocks which are uncommented by default)
Arguments:
  -s              Set (uncomments in addition and comments in deletion)
  -u              Unset (comments in addition and uncomments in deletion)
  -A              Apply for all (comments all in addition and uncomments all un deletion)

'Addition' and 'Subtraction' are mutually exclusive.
'Set', 'Unset' and 'All' operations are mutually exclusive.
"

  # where is the epigen.vimrc file
  eval VIMRC_PATH="$EPIGEN_SOURCE_LOC/epigen.vimrc"
  if [ ! -e "$VIMRC_PATH" ]; then
    echo "The epigen.vimrc file does not exist!"
    echo "Debug: $VIMRC_PATH"
    return 1
  fi

  if [ $# -lt 2 ]; then
      echo "$HELP"
      return 1
  fi

  if [ $# -gt 2 ]; then

    OPERATION="$1"

    # purify the file path
    eval FILE_PATH="$(cd "$(dirname "$3")"; pwd)/$(basename "$3")"
    # echo "FILE_PATH $FILE_PATH"
    # FILE_PATH="$3"

    MODE_NAME="$4"

    SET=0
    UNSET=0
    ALL=0
    shift
    OPTIND=1
    while getopts "sSuUaAhH?:" opt; do
        case "$opt" in
        h|H|\?)
            echo "$HELP"
            return 0
            ;;
        s|S)  SET=1
            ;;
        u|U)  UNSET=1
            ;;
        a|A)  ALL=1
            ;;
        esac
    done

    if [[ "$(expr $SET + $UNSET + $ALL)" == "0" ]]; then
      echo "$HELP"
      return 1
    fi

    if [[ "$OPERATION" == "addition" ]]; then

      if [[ "$ALL" == "1" ]]; then

        # comment all mode-specific lines (line)
        /usr/bin/vim -u "$VIMRC_PATH" -E -s -c ":delmarks!" -c "%g/^.*\s\+EPIGEN_ADD_LINE_.\+\s\+ACTIVE\s*$/norm gclc^/ACTIVEdaw" -c "wqa" -- "$FILE_PATH"

        # comment all mode-specific lines (block)
        /usr/bin/vim -u "$VIMRC_PATH" -E -s -c ":delmarks!" -c "%g/^.*\S\+\s\+EPIGEN_ADD_BLOCK_.*\s\+ACTIVE\s\+{\s*$/norm jmak^/ACTIVEB*kmb'agcbc'b'ak^/ACTIVEdaw" -c "wqa" -- "$FILE_PATH"

        if [[ "$DEBUG" == "1" ]]; then
          echo "Epigen (Addition): set all in the file: $FILE_PATH"
        fi

      elif [[ "$SET" == "1" ]]; then

        # uncomment lines with specific mode (line)
        /usr/bin/vim -u "$VIMRC_PATH" -E -s -c ":delmarks!" -c "%g/^.\+EPIGEN_ADD_LINE_$MODE_NAME\>\(\s\<ACTIVE\>\)\@!.*$/norm gclu\$Bea ACTIVE"  -c "wqa" -- "$FILE_PATH"

        # uncomment lines with specific mode (block)
        /usr/bin/vim -u "$VIMRC_PATH" -E -s -c ":delmarks!" -c "%g/^.\+EPIGEN_ADD_BLOCK_$MODE_NAME\>\(\s\<ACTIVE\>\)\@!.*{\s*$/norm f{iACTIVE jmak^/EPIGEN_ADD_BLOCK_$MODE_NAME nkmb'agcbu'b" -c "wqa" -- "$FILE_PATH"

        if [[ "$DEBUG" == "1" ]]; then
          echo "Epigen (Addition): set $MODE_NAME in the file: $FILE_PATH"
        fi

      elif [[ "$UNSET" == "1" ]]; then

        # comment all mode-specific lines (line)
        /usr/bin/vim -u "$VIMRC_PATH" -E -s -c ":delmarks!" -c "%g/^.\+EPIGEN_ADD_LINE_$MODE_NAME\>\s\+.*\<ACTIVE\>.*$/norm gclc^/ACTIVEdaw" -c "wqa" -- "$FILE_PATH"

        # comment all mode-specific lines (block)
        /usr/bin/vim -u "$VIMRC_PATH" -E -s -c ":delmarks!" -c "%g/^.\+EPIGEN_ADD_BLOCK_$MODE_NAME\>\s\+.*\<ACTIVE\>\s*{\s*$/norm jmak^/EPIGEN_ADD_BLOCK_$MODE_NAME nkmb'agcbc'b'ak^f{Bdaw" -c "wqa" -- "$FILE_PATH"

        if [[ "$DEBUG" == "1" ]]; then
          echo "Epigen (Addition): unset $MODE_NAME in the file: $FILE_PATH"
        fi

      else
        echo "$HELP"
        return 1
      fi

    elif [[ "$OPERATION" == "deletion" ]]; then

      if [[ "$ALL" == "1" ]]; then

        # uncomment all mode-specific lines (line)
        /usr/bin/vim -u "$VIMRC_PATH" -E -s -c ":delmarks!" -c "%g/^.\+\s\+EPIGEN_DEL_LINE_.\+\s\+ACTIVE\s*$/norm gclu^/ACTIVEdaw"  -c "wqa" -- "$FILE_PATH"

        # uncomment lines with specific mode (block)
        /usr/bin/vim -u "$VIMRC_PATH" -E -s -c ":delmarks!" -c "%g/^.\+\s\+EPIGEN_DEL_BLOCK_.*\s\+ACTIVE\s\+{\s*$/norm f{Bdawjmak^f_*kmb'agcbu'b" -c "wqa" -- "$FILE_PATH"

        if [[ "$DEBUG" == "1" ]]; then
          echo "Epigen (Reduction): unset all modes in the file: $FILE_PATH"
        fi
        
      elif [[ "$SET" == "1" ]]; then

        # comment all mode-specific lines (line)
        /usr/bin/vim -u "$VIMRC_PATH" -E -s -c ":delmarks!" -c "%g/^.\+EPIGEN_DEL_LINE_$MODE_NAME\>\(\s\<ACTIVE\>\)\@!.*$/norm \$Bea ACTIVEgclc" -c "wqa" -- "$FILE_PATH"

        # comment all mode-specific lines (block)
        /usr/bin/vim -u "$VIMRC_PATH" -E -s -c ":delmarks!" -c "%g/^.\+EPIGEN_DEL_BLOCK_$MODE_NAME\>\(\s\<ACTIVE\>\)\@!.*{\s*$/norm f{iACTIVE ^jmak^/EPIGEN_DEL_BLOCK_$MODE_NAME nkmb'agcbc'b" -c "wqa" -- "$FILE_PATH"

        if [[ "$DEBUG" == "1" ]]; then
          echo "Epigen (Reduction): set $MODE_NAME in the file: $FILE_PATH"
        fi

      elif [[ "$UNSET" == "1" ]]; then

        # uncomment lines with specific mode (line)
        /usr/bin/vim -u "$VIMRC_PATH" -E -s -c ":delmarks!" -c "%g/^.\+EPIGEN_DEL_LINE_$MODE_NAME\>\s\+.*\<ACTIVE\>.*$/norm gclu^/ACTIVEdaw"  -c "wqa" -- "$FILE_PATH"

        # uncomment lines with specific mode (block)
        /usr/bin/vim -u "$VIMRC_PATH" -E -s -c ":delmarks!" -c "%g/^.\+EPIGEN_DEL_BLOCK_$MODE_NAME\>\s\+.*\<ACTIVE\>\s*{\s*$/norm ^/ACTIVEdaw^jmak^f_*kmb'agcbu'b" -c "wqa" -- "$FILE_PATH"

        if [[ "$DEBUG" == "1" ]]; then
          echo "Epigen (Reduction): uset $MODE_NAME in the file: $FILE_PATH"
        fi

      else
        echo "$HELP"
        return 1
      fi

    else
      echo "$HELP"
      return 1
    fi

  fi
}
