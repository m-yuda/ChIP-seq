@echo off

echo start

::macsまたはmacs2
set type=macs2

::peak_fileの指定(フルパス)
set peakFile="C:\Users\yuda\Documents\MotifFinder_20140306\91_1_2_common_peaks.txt"

::出力場所の指定(フルパス)
set output="C:\Users\yuda\Documents\MotifFinder_20140306"

::リファレンスファイルの指定:fasta_file(フルパス)
set reference="C:\Users\yuda\Documents\MotifFinder_20140306\Plasmodiumberghei_v3.txt"

::検索領域の指定(summitを中心に何bpsの領域を検索するか)
set region=50
::検索モチーフを指定(例: "[tc][ag]gc[tc][ag]" など(大文字小文字不問)。)
:: 複数指定の場合はそれぞれを引用符で括り、半角スペースを開ける
:: 複数の例)
:: set pattern="[TC]GCATG" "CATGC[AG]"
set pattern="tgta[tc][ag]taca"
::検索モチーフ配列の長さを指定
set motif_length=6
::
:: 以下実行コマンドのため、変更されないようお願いいたします。 -----
::

set CURRENT=%cd%

java -jar MotifFinder.jar --type %type% --input "%peakFile%" --output "%output%/" --pattern %pattern% --ref "%reference%" --size %motif_length% --region %region%

cd %output%

R --vanilla --quiet --args "pattern_for_fisher.txt"  < %CURRENT%/script.R

cd %CURRENT%

echo finish

