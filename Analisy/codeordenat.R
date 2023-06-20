getwd()
setwd("C:/Users/Laura Roca/Documents/INTERNSHIP/ITA_00134/")

library(plyr)
library(dplyr)
library(tidyr)
library(tibble)
library(openxlsx)
library(ggplot2)

subject_user <- read.csv("C:/Users/Laura Roca/Documents/INTERNSHIP/ITA_00134/subject_user.csv")
questionari <- read.xlsx("C:/Users/Laura Roca/Documents/INTERNSHIP/ITA_00134/INRAN_SCAI_2005_06_questionari.xlsx")
spesa_familiare <- read.xlsx("C:/Users/Laura Roca/Documents/INTERNSHIP/ITA_00134/Spesa_familiare_alimentazione.xlsx")
link <- read.csv("C:/Users/Laura Roca/Documents/INTERNSHIP/ITA_00134/Subject_random_IDs.csv", header = TRUE)

##Build total energy_intake data frame

consumption_user <- read.csv("C:/Users/Laura Roca/Documents/INTERNSHIP/ITA_00134/consumption_user_corrected.csv")
consumption_user <- consumption_user[,c(3:80)]
colnames(consumption_user)[1] <- "subject"
new_consumption <- consumption_user[,c(1, 3, 11, 30)]

energy_intake <- new_consumption %>% group_by(subject, survey_day, consumption_time_hour ) %>% 
  summarise(total_Kcal=sum(energy_kcal))

EI <- split(energy_intake, f = energy_intake$survey_day)

Ei_1 <- as.data.frame(EI[1])
Ei_2 <- as.data.frame(EI[2])
Ei_3 <- as.data.frame(EI[3])

Ei_1 <- Ei_1[, -2]
Ei_2 <- Ei_2[, -2]
Ei_3 <- Ei_3[, -2]

t_EI1 <- pivot_wider(
  Ei_1,
  id_cols = c(X1.subject),
  names_from = X1.consumption_time_hour,
  values_from = X1.total_Kcal,
)
t_EI2 <- pivot_wider(
  Ei_2,
  id_cols = c(X2.subject),
  names_from = X2.consumption_time_hour,
  values_from = X2.total_Kcal,
)
t_EI3 <- pivot_wider(
  Ei_3,
  id_cols = c(X3.subject),
  names_from = X3.consumption_time_hour,
  values_from = X3.total_Kcal,
)
new_order <- as.character(seq(0,24))
Final_EI1 <- cbind(t_EI1$X1.subject, t_EI1[, new_order])
Final_EI2 <- t_EI2[, new_order]
Final_EI3 <- t_EI3[, new_order]

Final_EI1$`0` <- ifelse(is.na(Final_EI1$`0`), 0, Final_EI1$`0`) + ifelse(is.na(Final_EI1$`24`), 0, Final_EI1$`24`)
Final_EI2$`0` <- ifelse(is.na(Final_EI2$`0`), 0, Final_EI2$`0`) + ifelse(is.na(Final_EI2$`24`), 0, Final_EI2$`24`)
Final_EI3$`0` <- ifelse(is.na(Final_EI3$`0`), 0, Final_EI3$`0`) + ifelse(is.na(Final_EI3$`24`), 0, Final_EI3$`24`)

Final_EI1 <- Final_EI1[,1:25]
Final_EI2 <- Final_EI2[,1:24]
Final_EI3 <- Final_EI3[,1:24]

EI_hour <- cbind(Final_EI1, Final_EI2, Final_EI3)

##create data frame with grouped hours
Final_EI1[is.na(Final_EI1)]<- 0
Final_EI2[is.na(Final_EI2)]<- 0
Final_EI3[is.na(Final_EI3)]<- 0

ts_day1 <- data.frame(Subject = Final_EI1$`t_EI1$X1.subject`,
                      "Day1[6-9]" = Final_EI1$`6` + Final_EI1$`7` + Final_EI1$`8`,
                      "Day1[9-12]" = Final_EI1$`9` + Final_EI1$`10` + Final_EI1$`11`,
                      "Day1[12-15]" = Final_EI1$`12` + Final_EI1$`13` + Final_EI1$`14`,
                      "Day1[15-19]" = Final_EI1$`15` + Final_EI1$`16` + Final_EI1$`17` + Final_EI1$`18`,
                      "Day1[19-22]" = Final_EI1$`19` + Final_EI1$`20` + Final_EI1$`21`, 
                      "Day1[22-06]" = Final_EI1$`22` + Final_EI1$`23` + Final_EI1$`0` + Final_EI1$`1` + Final_EI1$`2` + Final_EI1$`3` +Final_EI1$`4` + Final_EI1$`5` + Final_EI1$`6`
)
ts_day2 <- data.frame("Day2[6-9]" = Final_EI2$`6` + Final_EI2$`7` + Final_EI2$`8`,
                      "Day2[9-12]" = Final_EI2$`9` + Final_EI2$`10` + Final_EI2$`11`,
                      "Day2[12-15]" = Final_EI2$`12` + Final_EI2$`13` + Final_EI2$`14`,
                      "Day2[15-19]" = Final_EI2$`15` + Final_EI2$`16` + Final_EI2$`17` + Final_EI2$`18`,
                      "Day2[19-22]" = Final_EI2$`19` + Final_EI2$`20` + Final_EI2$`21`, 
                      "Day2[22-06]" = Final_EI2$`22` + Final_EI2$`23` + Final_EI2$`0` + Final_EI2$`1` + Final_EI2$`2` + Final_EI2$`3` +Final_EI2$`4` + Final_EI2$`5` + Final_EI2$`6`
)

ts_day3 <- data.frame("Day3[6-9]" = Final_EI3$`6` + Final_EI3$`7` + Final_EI3$`8`,
                      "Day3[9-12]" = Final_EI3$`9` + Final_EI3$`10` + Final_EI3$`11`,
                      "Day3[12-15]" = Final_EI3$`12` + Final_EI3$`13` + Final_EI3$`14`,
                      "Day3[15-19]" = Final_EI3$`15` + Final_EI3$`16` + Final_EI3$`17` + Final_EI3$`18`,
                      "Day3[19-22]" = Final_EI3$`19` + Final_EI3$`20` + Final_EI3$`21`, 
                      "Day3[22-06]" = Final_EI3$`22` + Final_EI3$`23` + Final_EI3$`0` + Final_EI3$`1` + Final_EI3$`2` + Final_EI3$`3` +Final_EI3$`4` + Final_EI3$`5` + Final_EI3$`6`
)

EI_group <- cbind(ts_day1, ts_day2, ts_day3)

##compute metrics
  
   #order dataframe
f <- seq(1.0,1.23, by = 0.01) 
s <- seq(2.0,2.23, by = 0.01)
t <- seq(3.0,3.23, by = 0.01)
fs <- append(f,s)
hournames <- append(fs, t) 
hn <- as.character(formatC(hournames, 2, format = "f"))
hn <- append("subject", hn)
colnames(EI_hour)<- hn

sequencia <- hournames[order((seq_along(hournames)-1) %% 24, hournames)]
sq <- as.character(formatC(sequencia, 2, format = "f"))

EI_hour2 <- EI_hour[1]
EI_hour <- EI_hour[,sq]

EI_hour <- cbind(EI_hour2, EI_hour[,sq])

EI_hour[is.na(EI_hour)]<- 0

j <- 2
while(j<ncol(EI_hour)){
  meancol <- apply(EI_hour[,j:(j+2)], 1, mean)
  EI_hour <- add_column(EI_hour, mean = meancol, .after = j+2)
  
  j <- j+4
  
}

i <- 2
while(i<ncol(EI_hour)){
  abs_dif <- abs(EI_hour[i] - EI_hour[i+3]) + abs(EI_hour[i+1] - EI_hour[i+3]) + abs(EI_hour[i+2] - EI_hour[i+3])
  EI_hour <- add_column(EI_hour, absdiff = unlist(abs_dif), .after = i+3)
  i <- i+5
}

z<-6
while(z<=ncol(EI_hour)){
  irr <- (EI_hour[z]/EI_hour[z-1])*100/3
  EI_hour <- add_column(EI_hour, Irregularity = unlist(irr), .after = z)
  z <- z+6
}


##same but for the grouped data frame

EI_group <- EI_group[c("Subject", "Day1.6.9.", "Day2.6.9.", "Day3.6.9.", "Day1.9.12.", "Day2.9.12.", "Day3.9.12.", "Day1.12.15.", "Day2.12.15.", "Day3.12.15.", "Day1.15.19.", "Day2.15.19.", "Day3.15.19.", "Day1.19.22.", "Day2.19.22.", "Day3.19.22.", "Day1.22.06.", "Day2.22.06.", "Day3.22.06." )]

j <- 2
while(j<ncol(EI_group)){
  meancol <- apply(EI_group[,j:(j+2)], 1, mean)
  EI_group <- add_column(EI_group, mean = meancol, .after = j+2)
  
  j <- j+4
  
}

i <- 2
while(i<ncol(EI_group)){
  abs_dif <- abs(EI_group[i] - EI_group[i+3]) + abs(EI_group[i+1] - EI_group[i+3]) + abs(EI_group[i+2] - EI_group[i+3])
  EI_group <- add_column(EI_group, absdiff = unlist(abs_dif), .after = i+3)
  i <- i+5
}

z<-6
while(z<=ncol(EI_group)){
  irr <- (EI_group[z]/EI_group[z-1])*100/3
  EI_group <- add_column(EI_group, Irregularity = unlist(irr), .after = z)
  z <- z+6
}

EI_group[is.na(EI_group)]<- 0

## append the rest of the variables to this new dataframes

questionari$code_ind <- as.numeric(questionari$code_ind)
df1 <- subject_user %>% inner_join( link, 
                                    by=c('SUBJECT'='SUBJECT_NEW'))

df1 <- df1 %>% inner_join( questionari, 
                           by=c('SUBJECT.y'='code_ind'))

df <- cbind(df1[,c(7,25,2,5,9,10,14,15,18,29)], df1[,34:52])

EI_group <- EI_group %>% inner_join( df, 
                                by=c('Subject'='SUBJECT'))

EI_hour <- EI_hour %>% inner_join( df, 
                                by=c('subject'='SUBJECT'))

##add weekend and days variables

#code on weekendcode.R



EI_hour_variables <- EI_hour %>% inner_join( weekendvariable[,c(1,5,6)], 
                                             by=c('subject'='X1.subject'))

EI_group_variables <- EI_group %>% inner_join( weekendvariable[,c(1,5,6)], 
                                               by=c('Subject'='X1.subject'))

EI_group_variables <- EI_group_variables %>% mutate(fuma = case_when(fuma_R_C == "1.si" ~ "si",
                                                   fuma_R_C == "2.no" & ex_fumatore_R_C == "1.si" ~ 'ex',
                                                   fuma_R_C == "2.no" & ex_fumatore_R_C == "2.no" ~ 'no'  ))

EI_group_variables$fuma[is.na(EI_group_variables$fuma)] <- "no/ex"
EI_group_variables <- EI_group_variables %>% mutate(alchol = case_when(che_freq_alcool_R == "1.fino a 1 bicchiere a settimana" ~ "1",
                                                     che_freq_alcool_R == "2.qualche bicchiere a settimana" ~ "2",
                                                     che_freq_alcool_R == "3.1 bicchiere al giorno" ~ "3",
                                                     che_freq_alcool_R == "4.2 bicchieri al giorno" ~ "4",
                                                     che_freq_alcool_R == "5.3 o + bicchieri al giorno" ~ "5",
                                                     che_freq_alcool_R == "888" ~ "6"))

EI_hour_variables <- EI_hour_variables %>% mutate(fuma = case_when(fuma_R_C == "1.si" ~ "si",
                                                                     fuma_R_C == "2.no" & ex_fumatore_R_C == "1.si" ~ 'ex',
                                                                     fuma_R_C == "2.no" & ex_fumatore_R_C == "2.no" ~ 'no'  ))
EI_hour_variables$fuma[is.na(EI_hour_variables$fuma)] <- "no/ex"

EI_hour_variables <- EI_hour_variables %>% mutate(alchol = case_when(che_freq_alcool_R == "1.fino a 1 bicchiere a settimana" ~ "1",
                                                                       che_freq_alcool_R == "2.qualche bicchiere a settimana" ~ "2",
                                                                       che_freq_alcool_R == "3.1 bicchiere al giorno" ~ "3",
                                                                       che_freq_alcool_R == "4.2 bicchieri al giorno" ~ "4",
                                                                       che_freq_alcool_R == "5.3 o + bicchieri al giorno" ~ "5",
                                                                       che_freq_alcool_R == "888" ~ "6"))

EI_group_variables$bmi <- (EI_group_variables$WEIGHT)/(((EI_group_variables$HEIGHT)/100)^2)
EI_group_variables$meandayintake <- EI_group_variables$mean + EI_group_variables$mean + EI_group_variables$mean.1 + EI_group_variables$mean.2 + EI_group_variables$mean.3 + EI_group_variables$mean.4 + EI_group_variables$mean.5 


EI_hour_variables$bmi <- (EI_hour_variables$WEIGHT)/(((EI_hour_variables$HEIGHT)/100)^2)
EI_hour_variables$meandayintake <- EI_hour_variables$mean + EI_hour_variables$mean.1 + EI_hour_variables$mean.2 + EI_hour_variables$mean.3 + EI_hour_variables$mean.4 + EI_hour_variables$mean.5 + 
  EI_hour_variables$mean.6 + EI_hour_variables$mean.7 + EI_hour_variables$mean.8 + EI_hour_variables$mean.9 + EI_hour_variables$mean.10 + EI_hour_variables$mean.11 + EI_hour_variables$mean.12 +
  EI_hour_variables$mean.13 + EI_hour_variables$mean.14 + EI_hour_variables$mean.15 + EI_hour_variables$mean.16 + EI_hour_variables$mean.17 + EI_hour_variables$mean.18 + 
  EI_hour_variables$mean.19 + EI_hour_variables$mean.20 + EI_hour_variables$mean.21 + EI_hour_variables$mean.22 + EI_hour_variables$mean.23 

EI_group_variables$bmi_d[EI_group_variables$bmi <= 25] <- 0
EI_group_variables$bmi_d[EI_group_variables$bmi > 25] <- 1

EI_hour_variables$bmi_d[EI_hour_variables$bmi <= 25] <- 0
EI_hour_variables$bmi_d[EI_hour_variables$bmi > 25] <- 1

write.csv(EI_group_variables, "C:/Users/Laura Roca/Documents/INTERNSHIP/ITA_00134/EI_group_variables.csv", row.names=FALSE)
write.csv(EI_hour_variables, "C:/Users/Laura Roca/Documents/INTERNSHIP/ITA_00134/EI_hour_variables.csv", row.names=FALSE)





