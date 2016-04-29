. ./_clean.sh

ck set env tags=compiler,ctuning-cc bat_file=tmp-ck-env.sh --bat_new --print && . ./tmp-ck-env.sh && rm tmp-ck-env.sh || exit 1

mkdir tmp
cp *.c tmp
cd tmp

$CK_CC -O3 *.c --ct-extract-features -lm
$CK_OBJDUMP a.out > a.lst
