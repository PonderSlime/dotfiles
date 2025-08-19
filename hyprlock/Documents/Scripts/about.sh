#!/bin/bash
YESTERDAY_DATE=$(date -d "yesterday" +%Y-%m-%d)
FILE_MOD_DATE=$(stat -c %y "verse.json" | cut -d ' ' -f 1)

if [[ "$FILE_MOD_DATE" == "$YESTERDAY_DATE" ]]; then
	curl -Lo verse.json https://bible-api.com/data/web/random/NT
fi

TEXT=$(jq -r '.random_verse.text' verse.json)

while [[ ${#TEXT} -gt 100 ]]; do
	curl -Lo verse.json https://bible-api.com/data/web/random/NT
	TEXT=$(jq -r '.random_verse.text' verse.json)
done

BOOK=$(jq -r '.random_verse.book' verse.json)
CHAPTER=$(jq -r '.random_verse.chapter' verse.json)
VERSE=$(jq -r '.random_verse.verse' verse.json)

echo Verse of the day: $TEXT -  $BOOK $CHAPTER:$VERSE

