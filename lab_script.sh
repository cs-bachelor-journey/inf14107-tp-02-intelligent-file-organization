#!/bin/bash

files="./files/*"
filesElements=()
extensionTab=()

for file in $files; do
  basename="$(basename "$file")"
  extension="${basename##*.}"
  
  found="false"
  for item in "${extensionTab[@]}"; do
    if [[ "$item" == "$extension" ]]; then
      found="true"
      break
    fi
  done
  
  if [[ $found == "false" ]]; then
    extensionTab+=("$extension")
  fi
  filesElements+=("$basename")
done

current_user=$USER
mkdir -p files_$current_user
cp ./files/* ./files_$current_user/

mkdir -p ./files_$current_user/code
mkdir -p ./files_$current_user/docs
mkdir -p ./files_$current_user/images

userFiles="./files_$current_user/*"

for f in $userFiles; do
  if [[ -f "$f" ]]; then
    basename="$(basename "$f")"
    extension="${basename##*.}"
  
    if [[ $extension == 'png' || $extension == 'jpg' || $extension == 'gif' ]]; then
      mv "$f" "./files_$current_user/images/"
    fi
    if [[ $extension == 'py' || $extension == 'php' || $extension == 'cpp' ]]; then
      mv "$f" "./files_$current_user/code/"
    fi
    if [[ $extension == 'txt' || $extension == 'odt' || $extension == 'ods' || $extension == 'odp' ]]; then
      mv "$f" "./files_$current_user/docs/"
    fi
  fi
done

file_code_count=$(find "./files_$current_user/code" -type f | wc -l)
file_image_count=$(find "./files_$current_user/images" -type f | wc -l)
file_doc_count=$(find "./files_$current_user/docs" -type f | wc -l)
current_date=$(date "+%d-%m-%Y")

touch "./files_$current_user/info.txt"

echo "Images : $file_image_count" > "./files_$current_user/info.txt"
echo "Docs : $file_doc_count" >> "./files_$current_user/info.txt"
echo "Code : $file_code_count" >> "./files_$current_user/info.txt"
echo "Date : $current_date" >> "./files_$current_user/info.txt"
echo "User : $current_user" >> "./files_$current_user/info.txt"
