# Grab last from last.txt, and add 1
last=$(cat last.txt)
this=$(($last + 1))

url=$1
filename=$(echo $url | sed -e 's/.*\///g')
slug=$(echo $filename | sed -e 's/\..*//g')

echo $slug
wget -O "images/$this"_"$filename" "$url" -q

echo "---" > "../src/projects/$slug.md"
echo "title: $slug" >> "../src/projects/$slug.md"
echo "date: $(date +%Y-%m-%d)" >> "../src/projects/$slug.md"
echo "number: $this" >> "../src/projects/$slug.md"
echo "---" >> "../src/projects/$slug.md"

echo $this > last.txt