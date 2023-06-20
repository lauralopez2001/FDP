library(haven)
group_scores <- read_dta("pca_scoresdata.dta")

##dichotomize variables
library(sjmisc)

group_scores$pc1_dummy <- dicho(group_scores$pc1, dich.by = "median", var.label = "dicho pc1")

group_scores$pc2_dummy <- dicho(group_scores$pc2, dich.by = "median", var.label = "dicho pc2")

group_scores$pc3_dummy <- dicho(group_scores$pc3, dich.by = "median", var.label = "dicho pc3")

group_scores$pc4_dummy <- dicho(group_scores$pc4, dich.by = "median", var.label = "dicho pc4")

group_scores$pc5_dummy <- dicho(group_scores$pc5, dich.by = "median", var.label = "dicho pc5")

#subselect adults from de dataset 
df_adults <- group_scores[(group_scores$age_year>=18 & group_scores$age_year<=64), ]

##remove subjects that have missing information on the varaibles we want to adjust for
df_adults <- df_adults[-which(df_adults$subject == 749),]

df_999 <- df_adults[df_adults$stato_civ_r == 999 | df_adults$prof_svolta_r == 999
                    | df_adults$che_freq_alcool_r == 999| df_adults$colazione_r == 999
                    | df_adults$ore_sport_sett_r == 999,]
df9 <- df_adults[ !(df_adults$subject %in% df_999$subject), ]

df_na <- df9[df9$stato_civ_r == "NA" | df9$prof_svolta_r == "NA"
             | df9$che_freq_alcool_r == "NA"| df9$colazione_r == "NA",]

dfa <- df9[ !(df9$subject %in% df_na$subject), ]

dfa$sex <- factor(dfa$sex)
dfa$area_type <- factor(dfa$area_type)
dfa$area <- factor(dfa$area)
dfa$stato_civ_r <- factor(dfa$stato_civ_r)
dfa$prof_svolta_r <- factor(dfa$prof_svolta_r)
dfa$colazione_r <- factor(dfa$colazione_r)
dfa$alchol <- factor(dfa$alchol)
dfa$fuma <- factor(dfa$fuma)
dfa$ore_sport_sett_r <- factor(dfa$ore_sport_sett_r)
dfa$weekend <- factor(dfa$weekend)

write.csv(dfa, "C:/Users/Laura Roca/Documents/INTERNSHIP/ITA_00134/dfa.csv", row.names=FALSE)


