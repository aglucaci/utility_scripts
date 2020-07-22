
#! bin/bash
# Alexander G Lucaci
PREMSA="/Users/alex/hyphy-analyses/codon-msa/pre-msa.bf"
POSTMSA="/Users/alex/hyphy-analyses/codon-msa/post-msa.bf"

#hyphy $PREMSA --input $FILE
#mafft --auto $FILE"_protein.fas" > $FILE"_protein.fas_aligned.msa"
#hyphy $POSTMSA --protein-msa $FILE"_protein.fas_aligned.msa" --nucleotide-sequences $FILE"_nuc.fas" --output $FILE"_CODON_AWARE.fasta" --compress No --code Universal


for GENE in ../analysis_02242020/GENES/*fasta
do
    echo $GENE
    hyphy $PREMSA --input $GENE
    mafft --auto $GENE"_protein.fas" > $GENE"_protein.fas_aligned.msa"
    hyphy $POSTMSA --protein-msa $GENE"_protein.fas_aligned.msa" --nucleotide-sequences $GENE"_nuc.fas" --output $GENE"_CODON_AWARE.fasta" --compress No --code Universal
done


