d = read.csv("assoctest.csv")

# Compute the Chi-square test for the association of genotype with case/control status (using the table() function and the chisq.test() function). Examine the table to see if it looks enriched for association by eye.
# What is the X-squared statistic?
table(d$allele, d$case)
chisq.test(d$allele,d$case)


# Compute the Fisher's exact test ( fisher.test() ) for the same table. What is the p-value?
fisher.test(d$allele,d$case)$p-value
