last=$(cat last.txt)
this=$(($last + 1))

url=$1
filename=$(echo $url | sed -e 's/.*\///g')
slug=$(echo $filename | sed -e 's/\..*//g')

echo $slug
wget -O "images/$this"_"$filename" "$url" -q
cwebp -q 80 "images/$this"_"$filename" -o "images/$this"_"$slug".webp
rm "images/$this"_"$filename"

echo "---" > "../src/projects/$slug.md"
echo "title: $slug" >> "../src/projects/$slug.md"
echo "date: $(date +%Y-%m-%d)" >> "../src/projects/$slug.md"
echo "number: $this" >> "../src/projects/$slug.md"
echo "---" >> "../src/projects/$slug.md"

echo $this > last.txt

echo "We got and saved it as $this"_"$slug.webp"