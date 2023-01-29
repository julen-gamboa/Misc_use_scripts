if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install("biomaRt")

library("biomaRt")

germline_variants = c("ENSG00000012048",
                      "ENSG00000073578",
                      "ENSG00000073584",
                      "ENSG00000076242",
                      "ENSG00000083093",
                      "ENSG00000100697",
                      "ENSG00000104320",
                      "ENSG00000111252",
                      "ENSG00000116062",
                      "ENSG00000122512",
                      "ENSG00000128513",
                      "ENSG00000132781",
                      "ENSG00000135100",
                      "ENSG00000139687",
                      "ENSG00000141510",
                      "ENSG00000160957",
                      "ENSG00000175054",
                      "ENSG00000183765",
                      "ENSG00000185920",
                      "ENSG00000286001",
                      "ENSG00000288208")

ensembl=useMart("ENSEMBL_MART_SNP", dataset = "hsapiens_snp")
#snpmart = useEnsembl(biomart = "snp", dataset = "hsapiens_snp", mirror = "asia")

#searchAttributes(mart= snpmart, pattern = "")
#searchFilters(mart= snpmart, pattern = "")

dat = getBM(attributes = c('refsnp_id',
                           'ensembl_gene_stable_id',
                           'ensembl_transcript_stable_id',
                           'ensembl_peptide_allele',
                           'ensembl_type',
                           'validated',
                           'clinical_significance',
                           'snp',
                           'associated_gene',
                           'phenotype_name'),
            filters = 'ensembl_gene',
            values = germline_variants,
            mart = ensembl)

write.table(dat, file="Germline_var_Biomart_Results_Clinical_Significance.out")
