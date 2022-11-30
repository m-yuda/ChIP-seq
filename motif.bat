@echo off

echo start

::macs�܂���macs2
set type=macs2

::peak_file�̎w��(�t���p�X)
set peakFile="C:\Users\yuda\Documents\MotifFinder_20140306\91_1_2_common_peaks.txt"

::�o�͏ꏊ�̎w��(�t���p�X)
set output="C:\Users\yuda\Documents\MotifFinder_20140306"

::���t�@�����X�t�@�C���̎w��:fasta_file(�t���p�X)
set reference="C:\Users\yuda\Documents\MotifFinder_20140306\Plasmodiumberghei_v3.txt"

::�����̈�̎w��(summit�𒆐S�ɉ�bps�̗̈���������邩)
set region=50
::�������`�[�t���w��(��: "[tc][ag]gc[tc][ag]" �Ȃ�(�啶���������s��)�B)
:: �����w��̏ꍇ�͂��ꂼ������p���Ŋ���A���p�X�y�[�X���J����
:: �����̗�)
:: set pattern="[TC]GCATG" "CATGC[AG]"
set pattern="tgta[tc][ag]taca"
::�������`�[�t�z��̒������w��
set motif_length=6
::
:: �ȉ����s�R�}���h�̂��߁A�ύX����Ȃ��悤���肢�������܂��B -----
::

set CURRENT=%cd%

java -jar MotifFinder.jar --type %type% --input "%peakFile%" --output "%output%/" --pattern %pattern% --ref "%reference%" --size %motif_length% --region %region%

cd %output%

R --vanilla --quiet --args "pattern_for_fisher.txt"  < %CURRENT%/script.R

cd %CURRENT%

echo finish

