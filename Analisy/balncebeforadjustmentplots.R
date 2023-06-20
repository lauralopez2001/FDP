m.out1 <- matchit(pc1_dummy~sex+area_type+age_year+area+stato_civ_r+
                    prof_svolta_r+colazione_r+meandayintake+alchol+fuma+ore_sport_sett_r+weekend, data = dfa,
                  method = NULL, distance = "glm")
love.plot(m.out1, binary = "std")

m.out2 <- matchit(pc2_dummy~sex+area_type+age_year+area+stato_civ_r+
                    prof_svolta_r+colazione_r+meandayintake+alchol+fuma+ore_sport_sett_r+weekend, data = dfa,
                  method = NULL, distance = "glm")
love.plot(m.out2, binary = "std")

m.out3 <- matchit(pc3_dummy~sex+area_type+age_year+area+stato_civ_r+
                    prof_svolta_r+colazione_r+meandayintake+alchol+fuma+ore_sport_sett_r+weekend, data = dfa,
                  method = NULL, distance = "glm")
love.plot(m.out3, binary = "std")

m.out4 <- matchit(pc4_dummy~sex+area_type+age_year+area+stato_civ_r+
                    prof_svolta_r+colazione_r+meandayintake+alchol+fuma+ore_sport_sett_r+weekend, data = dfa,
                  method = NULL, distance = "glm")
love.plot(m.out4, binary = "std")

m.out5 <- matchit(pc5_dummy~sex+area_type+age_year+area+stato_civ_r+
                    prof_svolta_r+colazione_r+meandayintake+alchol+fuma+ore_sport_sett_r+weekend, data = dfa,
                  method = NULL, distance = "glm")
love.plot(m.out5, binary = "std")

