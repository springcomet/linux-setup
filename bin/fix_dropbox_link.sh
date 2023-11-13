#!/bin/bash
# 
##############################################################################
#                 Workaround for Dropbox shared links
#                 -----------------------------------
# Verified on Dropbox Linux package 2020.03.04
# Just make it executable (if need, using
#   $ chmod a+x fix_dropbox_link
# ) and run it.
# Author: Здравко
#   www.dropboxforum.com/t5/user/viewprofilepage/user-id/422790
##############################################################################

# Figure out the target places.
USR_HOME=`dirname ~/.local`
USR_LOCAL="$USR_HOME/.local"
USR_LOCAL_SHARE="$USR_LOCAL/share"
USR_LOCAL_SHARE_NAUTILUS="$USR_LOCAL_SHARE/nautilus"
USR_LOCAL_SHARE_NAUTILUS_SCRIPTS="$USR_LOCAL_SHARE_NAUTILUS/scripts"
SCRIPT_FILE="$USR_LOCAL_SHARE_NAUTILUS_SCRIPTS/Copy Dropbox Link"

##############################################################################
# Generate actual workaround component.

mkdir -p "$USR_LOCAL_SHARE_NAUTILUS_SCRIPTS"
cat - > "$SCRIPT_FILE" << EndOfInternal
#!/bin/bash
##############################################################################
#                 Workaround for Dropbox shared links
#                 -----------------------------------
# Verified on Dropbox Linux package 2020.03.04
# Author: Здравко
#   www.dropboxforum.com/t5/user/viewprofilepage/user-id/422790
##############################################################################

#Figure out the target places.
USR_HOME=\`dirname ~/.local\`
DROPBOX_INFO="\$USR_HOME/.dropbox/info.json"
#https://www.dropbox.com/download?dl=packages/dropbox.py
DROPBOX_CLI="\$USR_HOME/.dropbox-dist/dropbox.py"
if [ ! -f "\$DROPBOX_INFO" ]
then
  # One mandatory file seems missing. Let user know.
  title="Dropbox Install problem"
  mainmsg="Your Dropbox has not run properly yet"
  submsg="Make sure you have installed and signed in"
  if which notify-send > /dev/null
  then notify-send --icon=dropbox "\$title" "<b>\$mainmsg\!</b>\n\$submsg."
  elif which zenity > /dev/null
  then zenity --error --title="\$title" --timeout=10 --width=380 \\
    --text="<span size=\"xx-large\"><b>\$mainmsg\!</b>\n\$submsg.</span>" \\
    2> /dev/null
  fi
  exit 1
fi
if [[ "x\$NAUTILUS_SCRIPT_SELECTED_FILE_PATHS" == "x" ]]
then
  # Seems the selected is not file or folder.
  title="Dropbox No Selection"
  mainmsg="You have NOT selected local file or folder"
  submsg="Only regular files and/or folders are supported"
  if which notify-send > /dev/null
  then notify-send --icon=dropbox "\$title" "<b>\$mainmsg\!</b>\n\$submsg."
  elif which zenity > /dev/null
  then zenity --error --title="\$title" --timeout=10 --width=380 \\
    --text="<span size=\"xx-large\"><b>\$mainmsg\!</b>\n\$submsg.</span>" \\
    2> /dev/null
  fi
  exit 1
fi
DROPBOX_FOLDER="\$(realpath \`jq -r '.personal.path' "\$DROPBOX_INFO"\`)/"

#Precondition: Check if Dropbox application runs.
if \${DROPBOX_CLI} running
then
  exit 0
fi

##############################################################################
# Try take actual link(s).

#Entries are new line delimited.
IFS=\$'\n'

LINKS=""
ERRORS=""
for fe in "\$NAUTILUS_SCRIPT_SELECTED_FILE_PATHS"
do
  fe=\`realpath "\$fe"\`
  if [[ "\${fe:0:\${#DROPBOX_FOLDER}}" == "\$DROPBOX_FOLDER" ]]
  then
    LN=\`\${DROPBOX_CLI} sharelink "\$fe"\`
    if [[ "\${LN:0:8}" == "https://" ]]
    then
      LINKS="\$LINKS\$LN\$IFS"
    else
      ERRORS="\$ERRORS\$fe -> \$LN\$IFS"
    fi
  fi
done

#Check for valid Entries (at least 1).
if [[ "x\$LINKS" == "x" ]]
then
  # Seems everything fails.
  if [[ "x\$ERRORS" == "x" ]]
  then
    #No any Dropbox file/folder selected.
    title="Impossible Dropbox Links"
    mainmsg="No Dropbox file/folder has been selected"
    submsg="\$NAUTILUS_SCRIPT_SELECTED_FILE_PATHS"
    if which notify-send > /dev/null
    then notify-send --icon=dropbox "\$title" "<b>\$mainmsg\!</b>\n\$submsg."
    elif which zenity > /dev/null
    then zenity --error --title="\$title" --timeout=10 --width=380 \\
      --text="<span size=\"xx-large\"><b>\$mainmsg\!</b>\n\$submsg.</span>" \\
      2> /dev/null
    fi
  else
    #Inform user about what just failed.
    title="Dropbox Links Issues"
    mainmsg="Receiving Dropbox link fails"
    submsg="\$ERRORS"
    if which notify-send > /dev/null
    then notify-send --icon=dropbox "\$title" "<b>\$mainmsg\!</b>\n\$submsg."
    elif which zenity > /dev/null
    then zenity --error --title="\$title" --timeout=10 --width=380 \\
      --text="<span size=\"xx-large\"><b>\$mainmsg\!</b>\n\$submsg.</span>" \\
      2> /dev/null
    fi
  fi
  exit 1
fi

#Post link(s) to clipboard.
echo "\$LINKS" | xclip -selection clipboard
#... and inform user.
title="Ready Dropbox Link(s)"
mainmsg="You have link(s) pointing to Dropbox file(s) and/or folder(s)"
submsg="\$LINKS"
if which notify-send > /dev/null
then notify-send --icon=dropbox "\$title" "<b>\$mainmsg\!</b>\n\$submsg."
elif which zenity > /dev/null
then zenity --info --title="\$title" --timeout=10 --width=380 \\
  --text="<span size=\"xx-large\"><b>\$mainmsg\!</b>\n\$submsg.</span>" \\
  2> /dev/null
fi
EndOfInternal

##############################################################################
# Permission fix

chmod a+x "$SCRIPT_FILE"

##############################################################################
# Refresh Nautilus cach by just opening the folder. 😉

nautilus "$USR_LOCAL_SHARE_NAUTILUS_SCRIPTS"

echo "You can take link(s) by script command 'Copy Dropbox Link' "
echo "when available."
echo "Enjoy!"
