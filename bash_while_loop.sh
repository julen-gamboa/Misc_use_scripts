#!/bin/env/bash
# bash_while_loop.sh

while read r;do
    grep ""$r"" \
     ../005_Primate_Genomes_zGenome_Genes_iClusters_Ensembl_Run03_Genome_Gene_iClusters_IPScan_Plots.dir/Homo_sapiens.GRCh38.101_Genome_iGCluster_IPScan_Plots.dir/Homo_sapiens_all.csv \    
     >> Circadian_gene_classes_03.org;
done < ./Circadian_GeneIDs
    
exit 0
