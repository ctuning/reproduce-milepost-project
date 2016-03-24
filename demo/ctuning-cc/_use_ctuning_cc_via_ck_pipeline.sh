# Select ctuning-cc if more compiler choices are aviailable!

ck compile program:*susan --speed --flags="--ct-extract-features"

echo ""
echo "You can find extracted features in the following directory (see *.ft):"
echo $(ck find program:*susan)/tmp