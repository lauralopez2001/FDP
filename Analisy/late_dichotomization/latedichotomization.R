library(haven)
group_scores <- read_dta("Group_scores.dta")
EI_group_variables <- read.csv("C:/Users/Laura Roca/Documents/INTERNSHIP/ITA_00134/EI_group_variables.csv", header = TRUE)


group_scores <- cbind(group_scores[,c(1:64)], group_scores[,c(68:75)] )
df <- EI_group_variables[,c(1,38,66,68)]
df1 <- group_scores %>% inner_join( df, 
                                    by=c('subject'='Subject'))

group_scores <- cbind(df1[,1:67], df1[,c(73, 74, 75, 68, 69, 70, 71, 72)])


df_adults <- group_scores[(group_scores$age_year>=18 & group_scores$age_year<=64), ]

df_adults <- df_adults[-which(df_adults$subject == 749),]

df_999 <- df_adults[df_adults$stato_civ_r == 999 | df_adults$prof_svolta_r == 999
                    | df_adults$che_freq_alcool_r == 999| df_adults$colazione_r == 999
                    | df_adults$ore_sport_sett_r == 999,]
df9 <- df_adults[ !(df_adults$subject %in% df_999$subject), ]

df_na <- df9[df9$stato_civ_r == "NA" | df9$prof_svolta_r == "NA"
             | df9$che_freq_alcool_r == "NA"| df9$colazione_r == "NA",]

dfa <- df9[ !(df9$subject %in% df_na$subject), ]

##dichotomize variables
library(sjmisc)

dfa$pc1_dummy <- dicho(dfa$pc1, dich.by = "median", var.label = "dicho pc1")

dfa$pc2_dummy <- dicho(dfa$pc2, dich.by = "median", var.label = "dicho pc2")

dfa$pc3_dummy <- dicho(dfa$pc3, dich.by = "median", var.label = "dicho pc3")

dfa$pc4_dummy <- dicho(dfa$pc4, dich.by = "median", var.label = "dicho pc4")

dfa$pc5_dummy <- dicho(dfa$pc5, dich.by = "median", var.label = "dicho pc5")

dfa$area_type <- factor(dfa$area_type)
dfa$area <- factor(dfa$area)
dfa$stato_civ_r <- factor(dfa$stato_civ_r)
dfa$prof_svolta_r <- factor(dfa$prof_svolta_r)
dfa$colazione_r <- factor(dfa$colazione_r)
dfa$alchol <- factor(dfa$alchol)
dfa$fuma <- factor(dfa$fuma)
dfa$ore_sport_sett_r <- factor(dfa$ore_sport_sett_r)
dfa$bmi <- as.numeric(dfa$bmi)
dfa$bmi_d[dfa$bmi <= 25] <- 0
dfa$bmi_d[dfa$bmi > 25] <- 1

write.csv(dfa, "C:/Users/Laura Roca/Documents/INTERNSHIP/ITA_00134/dfa_adults.csv", row.names=FALSE)


library("WeightIt")

#W.out <- weightit(pc1_dummy ~ sex+area_type+age_year+area+stato_civ_r+
#                    prof_svolta_r+colazione_r+meandayintake+alchol+fuma+ore_sport_sett_r+weekend, data = dfa, estimand = "ATT", method = "ebal")
W.out <- weightit(pc1_dummy ~ sex+area_type+age_year+area+stato_civ_r+
                    prof_svolta_r+colazione_r+meandayintake+alchol+fuma+ore_sport_sett_r+weekend, data = dfa, estimand = "ATE", method = "glm")

summary(W.out)

bal.tab(W.out, stats = c("m", "v"), thresholds = c(m = .05))
love.plot(W.out, binary = "std")

W.out2 <- weightit(pc2_dummy ~ sex+area_type+age_year+area+stato_civ_r+
                     prof_svolta_r+colazione_r+meandayintake+alchol+fuma+ore_sport_sett_r+weekend, data = dfa, estimand = "ATE", method = "glm")

summary(W.out2)

bal.tab(W.out2, stats = c("m", "v"), thresholds = c(m = .05))
love.plot(W.out2, binary = "std")


W.out3 <- weightit(pc3_dummy ~ sex+area_type+age_year+area+stato_civ_r+
                     prof_svolta_r+colazione_r+meandayintake+alchol+fuma+ore_sport_sett_r+weekend, data = dfa, estimand = "ATE", method = "glm")

summary(W.out3)

bal.tab(W.out3, stats = c("m", "v"), thresholds = c(m = .05))
love.plot(W.out3, binary = "std")

W.out4 <- weightit(pc4_dummy ~ sex+area_type+age_year+area+stato_civ_r+
                     prof_svolta_r+colazione_r+meandayintake+alchol+fuma+ore_sport_sett_r+weekend, data = dfa, estimand = "ATE", method = "glm")

summary(W.out4)

bal.tab(W.out4, stats = c("m", "v"), thresholds = c(m = .05))
love.plot(W.out4, binary = "std")

W.out5 <- weightit(pc5_dummy ~ sex+area_type+age_year+area+stato_civ_r+
                     prof_svolta_r+colazione_r+meandayintake+alchol+fuma+ore_sport_sett_r+weekend, data = dfa, estimand = "ATE", method = "glm")

summary(W.out5)

bal.tab(W.out5, stats = c("m", "v"), thresholds = c(m = .05))
love.plot(W.out5, binary = "std")


library("cobalt")
library("MatchIt")

m.out1 <- matchit(pc1_dummy~sex+area_type+age_year+area+stato_civ_r+
                    prof_svolta_r+colazione_r+meandayintake+alchol+fuma+ore_sport_sett_r+weekend, data = dfa,
                  method = "full", distance = "glm", estimand = "ATE")
m.out1


plot(m.out1, type = "jitter", interactive = FALSE)

love.plot(m.out1, binary = "std")
plot(m.out1, type = "density", interactive = FALSE,
     which.xs = ~age_year + sex + meandayintake)

summary(m.out1, un = FALSE)

m.out2 <- matchit(pc2_dummy~sex+area_type+age_year+area+stato_civ_r+
                    prof_svolta_r+colazione_r+meandayintake+alchol+fuma+ore_sport_sett_r+ weekend, data = dfa,
                  method = "full", distance = "glm", estimand = "ATE")


plot(m.out2, type = "jitter", interactive = FALSE)

love.plot(m.out2, binary = "std")
plot(m.out2, type = "density", interactive = FALSE,
     which.xs = ~age_year + sex + meandayintake)

summary(m.out2, un = FALSE)

m.out3 <- matchit(pc3_dummy~sex+area_type+age_year+area+stato_civ_r+
                    prof_svolta_r+colazione_r+meandayintake+alchol+fuma+ore_sport_sett_r+ weekend, data = dfa,
                  method = "full", distance = "glm", estimand = "ATE")

plot(m.out3, type = "jitter", interactive = FALSE)

love.plot(m.out3, binary = "std")
plot(m.out3, type = "density", interactive = FALSE,
     which.xs = ~age_year + sex + meandayintake)

summary(m.out3, un = FALSE)

m.out4 <- matchit(pc4_dummy~sex+area_type+age_year+area+stato_civ_r+
                    prof_svolta_r+colazione_r+meandayintake+alchol+fuma+ore_sport_sett_r+ weekend, data = dfa,
                  method = "full", distance = "glm", estimand = "ATE")

plot(m.out4, type = "jitter", interactive = FALSE)

love.plot(m.out4, binary = "std")
plot(m.out4, type = "density", interactive = FALSE,
     which.xs = ~age_year + sex + meandayintake)

summary(m.out4, un = FALSE)


m.out5 <- matchit(pc5_dummy~sex+area_type+age_year+area+stato_civ_r+
                    prof_svolta_r+colazione_r+meandayintake+alchol+fuma+ore_sport_sett_r+ weekend, data = dfa,
                  method = "full", distance = "glm", estimand = "ATE")

plot(m.out5, type = "jitter", interactive = FALSE)

love.plot(m.out5, binary = "std")
plot(m.out5, type = "density", interactive = FALSE,
     which.xs = ~age_year + sex + meandayintake)

summary(m.out5, un = FALSE)


m.data <- match.data(m.out2)

head(m.data)
mixedpsm4 <- glm(bmi ~ pc4_dummy * (sex+area_type+age_year+area+stato_civ_r+prof_svolta_r
                                    +colazione_r+meandayintake+alchol+fuma+ore_sport_sett_r), data = m.data, weights = weights) 
marginaleffects::avg_comparisons(mixedpsm4,
                                 variables = "pc4_dummy",
                                 vcov = ~subclass,
                                 newdata = subset(m.data, treat == 1),
                                 wts = "weights")
hist(dfa$pc2)

m.out2 <- matchit(pc5_dummy~sex+area_type+age_year+area+stato_civ_r+
                    prof_svolta_r+colazione_r+meandayintake+alchol+fuma+ore_sport_sett_r, data = dfa,
                  method = "full", distance = "glm")
m.out2

plot(m.out2, type = "jitter", interactive = FALSE)


love.plot(m.out2, binary = "std")
plot(m.out2, type = "density", interactive = FALSE,
     which.xs = ~age_year + sex + meandayintake)

summary(m.out2, un = FALSE)
m.data$bmi <- as.numeric(m.data$bmi)

m.data <- match.data(m.out2)

head(m.data)
mixedpsm5 <- glm(bmi ~ pc5_dummy * (sex+area_type+age_year+area+stato_civ_r+prof_svolta_r
                                    +colazione_r+meandayintake+alchol+fuma+ore_sport_sett_r), data = m.data, weights = weights) 
marginaleffects::avg_comparisons(mixedpsm5,
                                 variables = "pc5_dummy",
                                 vcov = ~subclass,
                                 newdata = subset(m.data, treat == 1),
                                 wts = "weights")

