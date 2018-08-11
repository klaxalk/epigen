#!/bin/bash

EPIGEN_SOURCE_LOC=`dirname "$BASH_SOURCE"`
export EPIGEN_SOURCE_LOC=`( cd "$EPIGEN_SOURCE_LOC" && pwd )`

epigen() {

  DEBUG="0"

  HELP="usage: epigen [arguments]
  Arguments:
  -m [mode]               Mode (addition/deletion)
    Modes:
      addition            Addition (used to uncomment blocks which are commented by default)
      deletion            Reduction (used to comment blocks which are uncommented by default)
  -s                      Set (uncomments in addition and comments in deletion)
  -u                      Unset (comments in addition and uncomments in deletion)
  -A                      Reverses to default for all (comments all in addition and uncomments all un deletion)
  -g [name]               Block name 
  -f [path]               File path
  -c [format string]      Custom formatting rule for the file
  -b [path]               Specify the path to the vim/nvim binary

  'addition' and 'deletion' modes are mutually exclusive.
  'set', 'unset' and 'all' operations are mutually exclusive.
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

    # shift
    OPTIND=1

    MODE_SET=0
    MODE=""

    SET=0
    UNSET=0
    ALL=0
    OPERATION_SET=0

    GEN_SET=0
    GEN_NAME=""

    FILE_SET=0
    FILE_PATH=""

    CUSTOM_BINARY_PATH=0
    VIM_BIN=""

    CUSTOM_FORMAT=""

    FORMAT_FILE_SET=0
    FORMAT_FILE_PATH=":"

    while getopts "hH?:m:M:sSuUaAg:G:f:F:c:C:" opt; do
      case "$opt" in
        h|H|\?)
          echo "$HELP"
          return 0
          ;;
        m|M)
          MODE="${OPTARG}"
          MODE_SET=1
          ;;
        s|S)
          SET=1
          OPERATION_SET=1
          ;;
        u|U)
          UNSET=1
          OPERATION_SET=1
          ;;
        a|A)
          ALL=1
          OPERATION_SET=1
          ;;
        g|G)
          GEN_NAME="${OPTARG}"
          GEN_SET=1
          ;;
        f|F)
          FILE_SET=1
          FILE_PATH="$(cd "$(dirname "${OPTARG}")"; pwd)/$(basename "${OPTARG}")"
          ;;
        c|C)
          CUSTOM_FORMAT=":setlocal commentstring=${OPTARG}"
          ;;
        b|B)
          VIM_BIN="${OPTARG}"
          CUSTOM_BINARY_PATH=1
      esac
    done

    # non of the operations were selected
    if [[ "$OPRATION" == 0 ]]; then
      echo "An operation needs to be selected!"
      echo ""
      echo "$HELP"
      return 1
    fi

    # the mode has not been selected
    if [[ "$MODE_SET" == 0 ]]; then
      echo "A mode has to be selected!"
      echo ""
      echo "$HELP"
      return 1
    fi

    # the file path is missing
    if [[ "$FILE_SET" == 0 ]]; then
      echo "A file path has to be filled in!"
      echo ""
      echo "$HELP"
      return 1
    fi

    # the gen name is missing
    if [[ "$ALL" == 0 ]] && [[ "$GEN_SET" == 0 ]]; then
      echo "A gen name has to be filled in!"
      echo ""
      echo "$HELP"
      return 1
    fi

    # locate the vim/nvim binaries
    VIM_BIN="$(whereis -b vim | awk '{print $2}')"
    NVIM_BIN="$(whereis -b nvim | awk '{print $2}')"

    if [[ "$CUSTOM_BINARY_PATH" == 0 ]]; then
      # localte the vim binary
      if [ -x "$NVIM_BIN" ]; then
        VIM_BIN="$NVIM_BIN"
        HEADLESS="--headless"
      elif [ -x "$VIM_BIN" ]; then
        VIM_BIN="$VIM_BIN"
      else
        echo "Nor vim and neovim are installed!"
        return 1
      fi
    fi

    if [[ "$MODE" == "addition" ]]; then

      if [[ "$ALL" == "1" ]]; then

        # comment all mode-specific lines (line)
        $VIM_BIN -u "$VIMRC_PATH" $HEADLESS -E -s -c "$CUSTOM_FORMAT" -c ":delmarks!" -c "%g/^.*\s\+EPIGEN_ADD_LINE_.\+\s\+ACTIVE\s*$/norm gclc^/ACTIVEdaw" -c ":delmarks!" -c "wqa" -- "$FILE_PATH"

        # comment all mode-specific lines (block)
        $VIM_BIN -u "$VIMRC_PATH" $HEADLESS -E -s -c "$CUSTOM_FORMAT" -c ":delmarks!" -c "%g/^.*\S\+\s\+EPIGEN_ADD_BLOCK_.*\s\+ACTIVE\s\+{\s*$/norm jmak^/ACTIVEB*kmb'agcbc'b'ak^/ACTIVEdaw" -c ":delmarks!" -c "wqa" -- "$FILE_PATH"

        if [[ "$DEBUG" == "1" ]]; then
          echo "Epigen (Addition): set all in the file: $FILE_PATH"
        fi

      elif [[ "$SET" == "1" ]]; then

        # uncomment lines with specific mode (line)
        $VIM_BIN -u "$VIMRC_PATH" $HEADLESS -E -s -c "$CUSTOM_FORMAT" -c ":delmarks!" -c "%g/^.\+EPIGEN_ADD_LINE_$GEN_NAME\>\(\s\<ACTIVE\>\)\@!.*$/norm gclu\$Bea ACTIVE"  -c ":delmarks!" -c "wqa" -- "$FILE_PATH"

        # uncomment lines with specific mode (block)
        $VIM_BIN -u "$VIMRC_PATH" $HEADLESS -E -s -c "$CUSTOM_FORMAT" -c ":delmarks!" -c "%g/^.\+EPIGEN_ADD_BLOCK_$GEN_NAME\>\(\s\<ACTIVE\>\)\@!.*{\s*$/norm f{iACTIVE jmak^/EPIGEN_ADD_BLOCK_$GEN_NAME nkmb'agcbu'b" -c ":delmarks!" -c "wqa" -- "$FILE_PATH"

        if [[ "$DEBUG" == "1" ]]; then
          echo "Epigen (Addition): set $GEN_NAME in the file: $FILE_PATH"
        fi

      elif [[ "$UNSET" == "1" ]]; then

        # comment all mode-specific lines (line)
        $VIM_BIN -u "$VIMRC_PATH" $HEADLESS -E -s -c "$CUSTOM_FORMAT" -c ":delmarks!" -c "%g/^.\+EPIGEN_ADD_LINE_$GEN_NAME\>\s\+.*\<ACTIVE\>.*$/norm gclc^/ACTIVEdaw" -c ":delmarks!" -c "wqa" -- "$FILE_PATH"

        # comment all mode-specific lines (block)
        $VIM_BIN -u "$VIMRC_PATH" $HEADLESS -E -s -c "$CUSTOM_FORMAT" -c ":delmarks!" -c "%g/^.\+EPIGEN_ADD_BLOCK_$GEN_NAME\>\s\+.*\<ACTIVE\>\s*{\s*$/norm jmak^/EPIGEN_ADD_BLOCK_$GEN_NAME nkmb'agcbc'b'ak^f{Bdaw" -c ":delmarks!" -c "wqa" -- "$FILE_PATH"

        if [[ "$DEBUG" == "1" ]]; then
          echo "Epigen (Addition): unset $GEN_NAME in the file: $FILE_PATH"
        fi

      else
        echo "$HELP"
        return 1
      fi

    elif [[ "$MODE" == "deletion" ]]; then

      if [[ "$ALL" == "1" ]]; then

        # uncomment all mode-specific lines (line)
        $VIM_BIN -u "$VIMRC_PATH" $HEADLESS -E -s -c "$CUSTOM_FORMAT" -c ":delmarks!" -c "%g/^.\+\s\+EPIGEN_DEL_LINE_.\+\s\+ACTIVE\s*$/norm gclu^/ACTIVEdaw"  -c ":delmarks!" -c "wqa" -- "$FILE_PATH"

        # uncomment lines with specific mode (block)
        $VIM_BIN -u "$VIMRC_PATH" $HEADLESS -E -s -c "$CUSTOM_FORMAT" -c ":delmarks!" -c "%g/^.\+\s\+EPIGEN_DEL_BLOCK_.*\s\+ACTIVE\s\+{\s*$/norm f{Bdawjmak^f_*kmb'agcbu'b" -c ":delmarks!" -c "wqa" -- "$FILE_PATH"

        if [[ "$DEBUG" == "1" ]]; then
          echo "Epigen (Reduction): unset all modes in the file: $FILE_PATH"
        fi

      elif [[ "$SET" == "1" ]]; then

        # comment all mode-specific lines (line)
        $VIM_BIN -u "$VIMRC_PATH" $HEADLESS -E -s -c "$CUSTOM_FORMAT" -c ":delmarks!" -c "%g/^.\+EPIGEN_DEL_LINE_$GEN_NAME\>\(\s\<ACTIVE\>\)\@!.*$/norm \$Bea ACTIVEgclc" -c ":delmarks!" -c "wqa" -- "$FILE_PATH"

        # comment all mode-specific lines (block)
        $VIM_BIN -u "$VIMRC_PATH" $HEADLESS -E -s -c "$CUSTOM_FORMAT" -c ":delmarks!" -c "%g/^.\+EPIGEN_DEL_BLOCK_$GEN_NAME\>\(\s\<ACTIVE\>\)\@!.*{\s*$/norm f{iACTIVE ^jmak^/EPIGEN_DEL_BLOCK_$GEN_NAME nkmb'agcbc'b" -c ":delmarks!" -c "wqa" -- "$FILE_PATH"

        if [[ "$DEBUG" == "1" ]]; then
          echo "Epigen (Reduction): set $GEN_NAME in the file: $FILE_PATH"
        fi

      elif [[ "$UNSET" == "1" ]]; then

        # uncomment lines with specific mode (line)
        $VIM_BIN -u "$VIMRC_PATH" $HEADLESS -E -s -c "$CUSTOM_FORMAT" -c ":delmarks!" -c "%g/^.\+EPIGEN_DEL_LINE_$GEN_NAME\>\s\+.*\<ACTIVE\>.*$/norm gclu^/ACTIVEdaw"  -c ":delmarks!" -c "wqa" -- "$FILE_PATH"

        # uncomment lines with specific mode (block)
        $VIM_BIN -u "$VIMRC_PATH" $HEADLESS -E -s -c "$CUSTOM_FORMAT" -c ":delmarks!" -c "%g/^.\+EPIGEN_DEL_BLOCK_$GEN_NAME\>\s\+.*\<ACTIVE\>\s*{\s*$/norm ^/ACTIVEdaw^jmak^f_*kmb'agcbu'b" -c ":delmarks!" -c "wqa" -- "$FILE_PATH"

        if [[ "$DEBUG" == "1" ]]; then
          echo "Epigen (Reduction): uset $GEN_NAME in the file: $FILE_PATH"
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
