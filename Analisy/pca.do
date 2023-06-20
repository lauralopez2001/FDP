cd "C:\Users\Laura Roca\Documents\INTERNSHIP\ITA_00134"
import delimited EI_hour.csv, clear varnames(1) delimiter(",")
pca mean*,cov
screeplot
scoreplot
predict pc1_scores pc2_scores pc3_scores pc4_scores pc5_scores
save "C:\Users\Laura Roca\Documents\INTERNSHIP\ITA_00134\hour_scores.dta"
pca absdiff*, cov
screeplot
scoreplot
pca irregularity*, cov
screeplot
scoreplot


import delimited EI_group.csv, clear varnames(1) delimiter(",")
pca mean* irregularity*, cov
predict pc1_scores pc2_scores pc3_scores pc4_scores pc5_scores
save "C:\Users\Laura Roca\Documents\INTERNSHIP\ITA_00134\group_scores.dta"
