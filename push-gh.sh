hugo -t Hucore
echo "HUGO GENERATED"
cd ./public
git add -A
git commit -m "Generate site"
git push
cd ..
