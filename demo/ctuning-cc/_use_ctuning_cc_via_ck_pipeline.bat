# Select ctuning-cc if more compiler choices are aviailable!

call _clean.bat

ck compile program:sample-milepost-codelet --speed --flags="--ct-extract-features" --compiler_tags=ctuning-cc

echo ""
echo "You can find extracted features in the following directory (see *.ft):"
