cd "C:\Users\Laura Roca\Documents\INTERNSHIP\ITA_00134"
import delimited dfa_adults.csv, clear varnames(1) delimiter(",")
encode area, generate(area_f)
encode stato_civ_r , generate(stato_civ_f)
encode prof_svolta_r , generate(prof_svolta_f)
encode ore_sport_sett_r , generate( ore_sport_sett_f )
encode fuma, generate(fuma_f)
encode colazione_r , generate( colazione_f)
teffects ra ( bmi_d i.sex i.area_type age_year i.area_f i.stato_civ_f i.prof_svolta_f i.colazione_f meandayintake i.alchol i.fuma_f i.ore_sport_sett_f i.weekend, logit ) (pc2_dummy), vce(cluster famiglia)
teffects ipw (bmi_d) (pc2_dummy i.sex i.area_type age_year i.area_f i.stato_civ_f i.prof_svolta_f i.colazione_f meandayintake i.alchol i.fuma_f i.ore_sport_sett_f i.weekend), vce(cluster famiglia)
tebalance summarize
tebalance density area_f
teffects ipwra (bmi_d i.sex i.area_type age_year i.area_f i.stato_civ_f i.prof_svolta_f i.colazione_f meandayintake i.alchol i.fuma_f i.ore_sport_sett_f i.weekend, logit) ( pc2_dummy i.sex i.area_type age_year i.area_f i.stato_civ_f i.prof_svolta_f i.colazione_f meandayintake i.alchol i.fuma_f i.ore_sport_sett_f i.weekend ), vce(cluster famiglia)
tebalance summarize
teoverlap
teffects psmatch (bmi_d)(pc2_dummy i.sex i.area_type age_year i.area_f i.stato_civ_f i.prof_svolta_f i.colazione_f meandayintake i.alchol i.fuma_f i.ore_sport_sett_f i.weekend)
tebalance summarize
tebalance box

teffects ra ( bmi_d i.sex i.area_type age_year i.area_f i.stato_civ_f i.prof_svolta_f i.colazione_f meandayintake i.alchol i.fuma_f i.ore_sport_sett_f i.weekend, logit ) (pc3_dummy), vce(cluster famiglia)
teffects ipw (bmi_d) (pc3_dummy i.sex i.area_type age_year i.area_f i.stato_civ_f i.prof_svolta_f i.colazione_f meandayintake i.alchol i.fuma_f i.ore_sport_sett_f i.weekend), vce(cluster famiglia)
tebalance summarize
tebalance density area_f
teffects ipwra (bmi_d i.sex i.area_type age_year i.area_f i.stato_civ_f i.prof_svolta_f i.colazione_f meandayintake i.alchol i.fuma_f i.ore_sport_sett_f i.weekend, logit) ( pc3_dummy i.sex i.area_type age_year i.area_f i.stato_civ_f i.prof_svolta_f i.colazione_f meandayintake i.alchol i.fuma_f i.ore_sport_sett_f i.weekend ), vce(cluster famiglia)
tebalance summarize
teoverlap
teffects psmatch (bmi_d)(pc3_dummy i.sex i.area_type age_year i.area_f i.stato_civ_f i.prof_svolta_f i.colazione_f meandayintake i.alchol i.fuma_f i.ore_sport_sett_f i.weekend)
tebalance summarize
tebalance box

teffects ra ( bmi_d i.sex i.area_type age_year i.area_f i.stato_civ_f i.prof_svolta_f i.colazione_f meandayintake i.alchol i.fuma_f i.ore_sport_sett_f i.weekend, logit ) (pc4_dummy), vce(cluster famiglia)
teffects ipw (bmi_d) (pc4_dummy i.sex i.area_type age_year i.area_f i.stato_civ_f i.prof_svolta_f i.colazione_f meandayintake i.alchol i.fuma_f i.ore_sport_sett_f i.weekend), vce(cluster famiglia)
tebalance summarize
tebalance density area_f
teffects ipwra (bmi_d i.sex i.area_type age_year i.area_f i.stato_civ_f i.prof_svolta_f i.colazione_f meandayintake i.alchol i.fuma_f i.ore_sport_sett_f i.weekend, logit) ( pc4_dummy i.sex i.area_type age_year i.area_f i.stato_civ_f i.prof_svolta_f i.colazione_f meandayintake i.alchol i.fuma_f i.ore_sport_sett_f i.weekend ), vce(cluster famiglia)
tebalance summarize
teoverlap
teffects psmatch (bmi_d)(pc4_dummy i.sex i.area_type age_year i.area_f i.stato_civ_f i.prof_svolta_f i.colazione_f meandayintake i.alchol i.fuma_f i.ore_sport_sett_f i.weekend)
tebalance summarize
tebalance box

teffects ra ( bmi_d i.sex i.area_type age_year i.area_f i.stato_civ_f i.prof_svolta_f i.colazione_f meandayintake i.alchol i.fuma_f i.ore_sport_sett_f i.weekend, logit ) (pc5_dummy), vce(cluster famiglia)
teffects ipw (bmi_d) (pc5_dummy i.sex i.area_type age_year i.area_f i.stato_civ_f i.prof_svolta_f i.colazione_f meandayintake i.alchol i.fuma_f i.ore_sport_sett_f i.weekend), vce(cluster famiglia)
tebalance summarize
tebalance density area_f
teffects ipwra (bmi_d i.sex i.area_type age_year i.area_f i.stato_civ_f i.prof_svolta_f i.colazione_f meandayintake i.alchol i.fuma_f i.ore_sport_sett_f i.weekend, logit) ( pc5_dummy i.sex i.area_type age_year i.area_f i.stato_civ_f i.prof_svolta_f i.colazione_f meandayintake i.alchol i.fuma_f i.ore_sport_sett_f i.weekend ), vce(cluster famiglia)
tebalance summarize
teoverlap
teffects psmatch (bmi_d)(pc5_dummy i.sex i.area_type age_year i.area_f i.stato_civ_f i.prof_svolta_f i.colazione_f meandayintake i.alchol i.fuma_f i.ore_sport_sett_f i.weekend)
tebalance summarize
tebalance box

teffects ipw (bmi) (pc1_dummy i.sex i.area_type age_year i.area_f i.stato_civ_f i.prof_svolta_f i.colazione_f meandayintake i.alchol i.fuma_f i.ore_sport_sett_f i.weekend ), osample(nvar)
tab nvar
drop if nvar == 1

teffects ra ( bmi_d i.sex i.area_type age_year i.area_f i.stato_civ_f i.prof_svolta_f i.colazione_f meandayintake i.alchol i.fuma_f i.ore_sport_sett_f i.weekend, logit ) (pc1_dummy), vce(cluster famiglia)
teffects ipw (bmi_d) (pc1_dummy i.sex i.area_type age_year i.area_f i.stato_civ_f i.prof_svolta_f i.colazione_f meandayintake i.alchol i.fuma_f i.ore_sport_sett_f i.weekend ), vce(cluster famiglia)
tebalance summarize
tebalance density area_f
teffects ipwra (bmi_d i.sex i.area_type age_year i.area_f i.stato_civ_f i.prof_svolta_f i.colazione_f meandayintake i.alchol i.fuma_f i.ore_sport_sett_f i.weekend, logit) ( pc1_dummy i.sex i.area_type age_year i.area_f i.stato_civ_f i.prof_svolta_f i.colazione_f meandayintake i.alchol i.fuma_f i.ore_sport_sett_f i.weekend ), vce(cluster famiglia)
tebalance summarize
teoverlap
teffects psmatch (bmi_d)(pc1_dummy i.sex i.area_type age_year i.area_f i.stato_civ_f i.prof_svolta_f i.colazione_f meandayintake i.alchol i.fuma_f i.ore_sport_sett_f i.weekend)
tebalance summarize
tebalance box

