#!/bin/bash

# Check if a title was provided
if [ -z "$1" ]; then
  echo "Usage: ./new_post.sh \"Post Title Here\""
  exit 1
fi

# Variables
TITLE="$1"
SLUG=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g' | sed -E 's/^-+|-+$//g')
DATE=$(date +"%Y-%m-%d")
DATETIME=$(date +"%Y-%m-%d %H:%M:%S %z")
FILENAME="_posts/${DATE}-${SLUG}.md"

# Create the post file
cat <<EOF > "$FILENAME"
---
layout: post
title:  "$TITLE"
date:   $DATETIME
categories: []
---

EOF

echo "New post created: $FILENAME"
