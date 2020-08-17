# From: https://www.biostars.org/p/17680/

grep -c "^>" file.fa

sed 's/>.*/&WHATEVERYOUWANT/' file.fa > outfile.fa

awk '{print $1}' file.fa > output.fa
