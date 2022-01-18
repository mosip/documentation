#!/bin/bash
root="1.2.0"
echo "    <!DOCTYPE html>"
echo "    <html>"
echo "    <style>"
echo "    .content {"
echo "      max-width: 700px;"
echo "      margin: auto;"
echo "      text-align: center;"
echo "    }"
echo "    </style>"
echo "    <body>"
echo "      <div class='content'>"
echo "        <img src='https://mosip.github.io/mosip-helm/mosip_logo.png'>"
echo "        <h2 style='font-family:verdana;'>MOSIP API Documentation</h2>"
echo "      </div>"
echo "    <ul>"
for file in $root/*; do
  parentpath=${file#*/}
  parent=${parentpath%/*}
  filename=${file##*/}
  if [[ "$filename" == "list.html" ]]; then
    continue
  fi
    if [[ -z $oldparent ]]; then
      echo "      <li> $parent </li>" && oldparent=$parent
      echo "        <ul>"
    elif [[ $oldparent != $parent ]]; then
      echo "        </ul>"
      echo "      <li> $parent </li>" && oldparent=$parent
      echo "        <ul>"
    fi
      echo "        <li><a href=\"$parentpath\">$filename</a></li>"
done
echo "      </ul>"
echo "    </ul>"
echo "    </body>"
echo "    </html>"