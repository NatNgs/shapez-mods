APPDATA="~/AppData/Roaming/shapez.io"
ZIP="c:/Program Files/7-Zip/7z.exe"

# Get version (line starting with "version:" in the file)
NAME='buyChunks'

SRC="src/$NAME.js"

VERSION=$( grep 'version:' "$SRC" | head -n 1 | grep -o '\([0-9]\+\.\)\+[0-9]' )
DST="$NAME@$VERSION.js"

curl -X POST -s --data-urlencode "input@$SRC" https://www.toptal.com/developers/javascript-minifier/raw > "generated/$DST"

cd generated
"$ZIP" a -mx9 "$NAME-$VERSION.zip" "$DST"
