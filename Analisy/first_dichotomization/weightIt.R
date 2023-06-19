
library("WeightIt")
d_ps <- read.csv("C:/Users/Laura Roca/Documents/INTERNSHIP/ITA_00134/dfa.csv", header = TRUE)


W.out <- weightit(pc1_dummy ~ sex+area_type+age_year+area+stato_civ_r+
                    prof_svolta_r+colazione_r+meandayintake+alchol+fuma+ore_sport_sett_r+weekend, data = d_ps, estimand = "ATE", method = "glm")

summary(W.out)

bal.tab(W.out, stats = c("m", "v"), thresholds = c(m = .05))
love.plot(W.out, binary = "std")

W.out2 <- weightit(pc2_dummy ~ sex+area_type+age_year+area+stato_civ_r+
                     prof_svolta_r+colazione_r+meandayintake+alchol+fuma+ore_sport_sett_r+weekend, data = d_ps, estimand = "ATE", method = "glm")

summary(W.out2)

bal.tab(W.out2, stats = c("m", "v"), thresholds = c(m = .05))
love.plot(W.out2, binary = "std")


W.out3 <- weightit(pc3_dummy ~ sex+area_type+age_year+area+stato_civ_r+
                     prof_svolta_r+colazione_r+meandayintake+alchol+fuma+ore_sport_sett_r+weekend, data = d_ps, estimand = "ATE", method = "glm")

summary(W.out3)

bal.tab(W.out3, stats = c("m", "v"), thresholds = c(m = .05))
love.plot(W.out3, binary = "std")

W.out4 <- weightit(pc4_dummy ~ sex+area_type+age_year+area+stato_civ_r+
                     prof_svolta_r+colazione_r+meandayintake+alchol+fuma+ore_sport_sett_r+weekend, data = d_ps, estimand = "ATE", method = "glm")

summary(W.out4)

bal.tab(W.out4, stats = c("m", "v"), thresholds = c(m = .05))
love.plot(W.out4, binary = "std")

W.out5 <- weightit(pc5_dummy ~ sex+area_type+age_year+area+stato_civ_r+
                     prof_svolta_r+colazione_r+meandayintake+alchol+fuma+ore_sport_sett_r+weekend, data = d_ps, estimand = "ATE", method = "glm")

summary(W.out5)

bal.tab(W.out5, stats = c("m", "v"), thresholds = c(m = .05))
love.plot(W.out5, binary = "std")
