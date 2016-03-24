. ./_clean.sh

ck set env tags=compiler,ctuning-cc bat_file=tmp-ck-env.sh --bat_new --print && . ./tmp-ck-env.sh && rm tmp-ck-env.sh || exit 1

mkdir tmp
cp *.c tmp
cd tmp

$CK_CC -O3 -lm *.c --ct-extract-features
$CK_OBJDUMP a.out > a.lst
