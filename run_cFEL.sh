#!/bin/bash
#PBS -N cFEL_allViruses
#PBS -l walltime=999:00:00

#@Usage: qsub -V -q epyc -l nodes=1:ppn=32 hyphy_tester.sh

clear

export PATH=/usr/local/bin:$PATH
source /etc/profile.d/modules.sh
#module load openmpi/gnu/3.0.2
module load openmpi

BASEDIR="/data/shares/veg/SARS-CoV-2/coronavirus-comparative"
cFEL=$BASEDIR"/hyphy-develop/res/TemplateBatchFiles/SelectionAnalyses/contrast-fel.bf"
HYPHYMPI=$BASEDIR"/hyphy-develop/HYPHYMPI"
RES=$BASEDIR"/hyphy-develop/res"

echo $BASEDIR
echo $HYPHY
echo $RES
echo $cFEL

#exit 1
for gene in E S M N ORF1a ORF1b 
#for gene in E 
do 
  for virus in MERS OC43 SARS SARS2 NL63 HKU1
  #for virus in MERS
  do 
    echo ""
    #echo /data/shares/veg/SARS-CoV-2/coronavirus-comparative-data/data/combined/${gene}.catted.qa.fasta_protein.aligned.combined.merged.compressed.fas
    #echo /data/shares/veg/SARS-CoV-2/coronavirus-comparative-data/data/combined/${gene}.catted.qa.fasta_protein.aligned.combined.merged.compressed.fas.raxml.bestTree.partitioned.nwk
    echo testing ${virus} in gene ${gene}
    
    #mpirun -np 32 hyphy-develop/HYPHYMPI LIBPATH=/data/shares/veg/SARS-CoV-2/coronavirus-comparative/hyphy-develop/res\
    #  hyphy-develop/res/TemplateBatchFiles/SelectionAnalyses/contrast-fel.bf
      #--alignment /data/shares/veg/SARS-CoV-2/coronavirus-comparative-data/data/combined/${gene}.catted.qa.fasta_protein.aligned.combined.merged.compressed.fas\
      #--tree /data/shares/veg/SARS-CoV-2/coronavirus-comparative-data/data/combined/${gene}.catted.qa.fasta_protein.aligned.combined.merged.compressed.fas.raxml.bestTree.partitioned.nwk\
      #--branch-set ${virus} --output /data/shares/veg/SARS-CoV-2/coronavirus-comparative-data/data/combined/${gene}.catted.qa.fasta_protein.aligned.combined.merged.compressed.fas.${virus}.CFEL.json 

   ALN="/data/shares/veg/SARS-CoV-2/coronavirus-comparative-data/data/combined/${gene}.catted.qa.fasta_protein.aligned.combined.merged.compressed.fas"
   TREE="/data/shares/veg/SARS-CoV-2/coronavirus-comparative-data/data/combined/${gene}.catted.qa.fasta_protein.aligned.combined.merged.compressed.fas.raxml.bestTree.partitioned.nwk"
   OUTPUT="/data/shares/veg/SARS-CoV-2/coronavirus-comparative-data/data/combined/${gene}.catted.qa.fasta_protein.aligned.combined.merged.compressed.fas.${virus}.CFEL.json"
   #echo $HYPHYMPI LIBPATH=$RES $cFEL --alignment $ALN --tree $TREE --branch-set ${virus} --output $OUTPUT
   #$HYPHYMPI LIBPATH=$RES $cFEL --alignment $ALN --tree $TREE --branch-set ${virus} --output $OUTPUT
  
   if [ -s $OUTPUT ]; 
   then
      echo "cFEL already ran"
   else 
      echo mpirun -np 32 $HYPHYMPI LIBPATH=$RES $cFEL --alignment $ALN --tree $TREE --branch-set ${virus} --output $OUTPUT
      mpirun -np 32 $HYPHYMPI LIBPATH=$RES $cFEL --alignment $ALN --tree $TREE --branch-set ${virus} --output $OUTPUT
   fi

  
  done
done

