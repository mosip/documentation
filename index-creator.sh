#!/usr/bin/env bash
root=$1
echo "<!DOCTYPE html>"
echo "<html>"
echo "<head>"
echo "    <link rel="stylesheet" type="text/css" href="../index.css">"
echo "    <meta name='view' content='width=device-width, initial-scale=1'>"
echo "</head>"
echo "<body>"
echo "<div class='logo'>"
echo "    <img src='https://mosip.github.io/mosip-helm/mosip_logo.png'>"
echo "    <h2 style='font-family:verdana;'>MOSIP API Documentation</h2>"
echo "</div>"
echo "<div class='content'>"
echo "    <p1>for release <b>$root</b></p1>"
echo "</div>"
echo "<div class='nav'>"
echo "<ul>"
for file in $(ls $root/); do
  parentpath=${file#*/}
  filename=${file##*/}
  fname=${filename%.*}
  name=$(echo $fname | tr "-" " ")
  if [[ "$filename" == "$root.html" ]]; then
    continue
  fi
  echo "  <li><a href=\"$parentpath\">$name</a></li>"
done
echo "</ul>"
echo "</div>"
echo "</body>"
echo "</html>"
