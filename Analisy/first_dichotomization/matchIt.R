library("cobalt")
library("MatchIt")

d_ps <- read.csv("C:/Users/Laura Roca/Documents/INTERNSHIP/ITA_00134/dfa.csv", header = TRUE)

m.out1 <- matchit(pc1_dummy~sex+area_type+age_year+area+stato_civ_r+
                    prof_svolta_r+colazione_r+meandayintake+alchol+fuma+ore_sport_sett_r+weekend, data = d_ps,
                  method = "full", distance = "glm", estimand = "ATE")
m.out1

plot(m.out1, type = "jitter", interactive = FALSE)

love.plot(m.out1, binary = "std")
plot(m.out1, type = "density", interactive = FALSE,
     which.xs = ~age_year + sex + meandayintake)

summary(m.out1, un = FALSE)

m.out2 <- matchit(pc2_dummy~sex+area_type+age_year+area+stato_civ_r+
                    prof_svolta_r+colazione_r+meandayintake+alchol+fuma+ore_sport_sett_r+ weekend, data = d_ps,
                  method = "full", distance = "glm", estimand = "ATE")


plot(m.out2, type = "jitter", interactive = FALSE)

love.plot(m.out2, binary = "std")
plot(m.out2, type = "density", interactive = FALSE,
     which.xs = ~age_year + sex + meandayintake)

summary(m.out2, un = FALSE)

m.out3 <- matchit(pc3_dummy~sex+area_type+age_year+area+stato_civ_r+
                    prof_svolta_r+colazione_r+meandayintake+alchol+fuma+ore_sport_sett_r+ weekend, data = d_ps,
                  method = "full", distance = "glm", estimand = "ATE")

plot(m.out3, type = "jitter", interactive = FALSE)

love.plot(m.out3, binary = "std")
plot(m.out3, type = "density", interactive = FALSE,
     which.xs = ~age_year + sex + meandayintake)

summary(m.out3, un = FALSE)

m.out4 <- matchit(pc4_dummy~sex+area_type+age_year+area+stato_civ_r+
                    prof_svolta_r+colazione_r+meandayintake+alchol+fuma+ore_sport_sett_r+ weekend, data = d_ps,
                  method = "full", distance = "glm", estimand = "ATE")

plot(m.out4, type = "jitter", interactive = FALSE)

love.plot(m.out4, binary = "std")
plot(m.out4, type = "density", interactive = FALSE,
     which.xs = ~age_year + sex + meandayintake)

summary(m.out4, un = FALSE)


m.out5 <- matchit(pc5_dummy~sex+area_type+age_year+area+stato_civ_r+
                    prof_svolta_r+colazione_r+meandayintake+alchol+fuma+ore_sport_sett_r+ weekend, data = d_ps,
                  method = "full", distance = "glm", estimand = "ATE")

plot(m.out5, type = "jitter", interactive = FALSE)

love.plot(m.out5, binary = "std")
plot(m.out5, type = "density", interactive = FALSE,
     which.xs = ~age_year + sex + meandayintake)

summary(m.out5, un = FALSE)
