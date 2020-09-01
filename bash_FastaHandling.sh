# From: https://www.biostars.org/p/17680/

grep -c "^>" file.fa

sed 's/>.*/&WHATEVERYOUWANT/' file.fa > outfile.fa

awk '{print $1}' file.fa > output.fa


# Remove first line from a file
sed -i '' 1d file.txt


# Split multi-fasta into multiple files
awk -F "|" '/^>/ {F = $2".fasta"} {print > F}' yourfile.fa
