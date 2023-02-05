#!/bin/bash
# rsID_parse.sh
usage(){
    echo \
"
# ######################################################################################################################################################
#
# USAGE: ${0} \\
#                                                 -a chromosome 
#
# INPUT01: -a FLAG Label (a single specific chromosome supplied as follows: chr1 or chrY for example)
# Script to generate a single column text file to be used as input to grep against Ensembl vcf files. The rsID list that serves as input
# contains variant IDs that have passed all gnomAD v3.1.2 hard QC filters.
# ######################################################################################################################################################
"
}

while getopts :a: option;do
    case $option in
        a) nameA=$OPTARG;;
        :) echo -e "\nInvalid option: $OPTARG requires an argument" 1>&2;;
        \?)echo -e "\nInvalid option: $OPTARG requires an argument" 1>&2;;
        *) usage && exit 1;;
    esac
done

if [[ $# -eq 0 ]];then
    usage;
    exit 0;
fi

va=${nameA};

awk '{print $2}' "$va"_PASS_protein_coding_rsID.out | sort | uniq >> ../vcf_database/"$va"_rsIDs_uniq.out

while read r;do
    grep ""$r"" \
     ../vcf_database/homo_sapiens-"$va".vcf \    
     >> ../"$va"_gnomad_PASS_protein_coding.vcf;
done < ../vcf_database/"$va"_rsIDs_uniq.out
    
exit 0
