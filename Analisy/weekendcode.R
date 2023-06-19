new_consumption <- consumption_user[,c(1, 3, 9, 30)]

energy_intake <- new_consumption %>% group_by(subject, survey_day, week_day) %>% 
  summarise(total_Kcal=sum(energy_kcal))

energy_intake <- energy_intake[, c(1,2,3)]


EI <- split(energy_intake, f = energy_intake$survey_day)

Ei_1 <- as.data.frame(EI[1])
Ei_2 <- as.data.frame(EI[2])
Ei_3 <- as.data.frame(EI[3])

t_EI1 <- pivot_wider(
  Ei_1,
  id_cols = c(X1.subject),
  names_from = X1.survey_day,
  values_from = X1.week_day,
)

t_EI2 <- pivot_wider(
  Ei_2,
  id_cols = c(X2.subject),
  names_from = X2.survey_day,
  values_from = X2.week_day,
)

t_EI3 <- pivot_wider(
  Ei_3,
  id_cols = c(X3.subject),
  names_from = X3.survey_day,
  values_from = X3.week_day,
)

weekendvariable <- cbind(t_EI1, t_EI2, t_EI3)
weekendvariable <- weekendvariable[, c(1, 2, 4, 6)]

weekendvariable$weekend <- 0

for(i in seq_len(nrow(weekendvariable))){
  if(weekendvariable$`1`[i] == 1 || weekendvariable$`2`[i] == 1 || weekendvariable$`3`[i] == 1 ){
    weekendvariable$weekend[i] <- weekendvariable$weekend[i] + 1
  }
  if(weekendvariable$`1`[i] == 7 || weekendvariable$`2`[i] == 7 || weekendvariable$`3`[i] == 7 ){
    weekendvariable$weekend[i] <- weekendvariable$weekend[i] + 1
  }
}
weekendvariable$days <- paste(weekendvariable$`1`, weekendvariable$`2`, weekendvariable$`3`)
