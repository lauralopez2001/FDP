getwd()
setwd("C:/Users/Laura Roca/Documents/INTERNSHIP/ITA_00134/")

library(plyr)
library(dplyr)
library(tidyr)
library(tibble)
library(openxlsx)
library(ggplot2)

consumption_user <- read.csv("C:/Users/Laura Roca/Documents/INTERNSHIP/ITA_00134/consumption_user_corrected.csv")
questionari <- read.xlsx("C:/Users/Laura Roca/Documents/INTERNSHIP/ITA_00134/INRAN_SCAI_2005_06_questionari.xlsx")
link <- read.csv("C:/Users/Laura Roca/Documents/INTERNSHIP/ITA_00134/Subject_random_IDs.csv", header = TRUE)

questionari$code_ind <- as.numeric(questionari$code_ind)

df1 <- questionari[, c(1,2)] %>% inner_join( link, 
                                             by=c('code_ind'='SUBJECT'))

c_u <- df1 %>% inner_join( consumption_user, 
                           by=c('SUBJECT_NEW'='subject'))

c_u <- consumption_user

c_u$consumption_day[which((c_u$code_ind == 11403302) & (c_u$survey_day == 2))] 

c_u$consumption_day[which((c_u$code_ind == 11403301) & (c_u$survey_day == 1))] <- 19
c_u$week_day[which((c_u$code_ind == 11403301) & (c_u$survey_day == 1))] <- 2

c_u$consumption_day[which((c_u$code_ind == 11403304) & (c_u$survey_day == 2))] <- 20
c_u$week_day[which((c_u$code_ind == 11403304) & (c_u$survey_day == 2))] <- 3


c_u$consumption_month[which((c_u$famiglia == 114042) & (c_u$survey_day == 2))]<- 7
c_u$week_day[which((c_u$famiglia == 114042) & (c_u$survey_day == 2))] <- 4 


c_u$consumption_day[which((c_u$code_ind == 12110602) & (c_u$survey_day == 2))] 
c_u$consumption_day[which((c_u$code_ind == 12110601) & (c_u$survey_day == 2))] <- 30 

c_u$week_day[which((c_u$code_ind == 12110602) & (c_u$survey_day == 2))] 
c_u$week_day[which((c_u$code_ind == 12110601) & (c_u$survey_day == 2))] <- 1

c_u$consumption_day[which((c_u$code_ind == 12110602) & (c_u$survey_day == 3))] 
c_u$consumption_day[which((c_u$code_ind == 12110601) & (c_u$survey_day == 3))] <- 31

c_u$week_day[which((c_u$code_ind == 12110602) & (c_u$survey_day == 3))] 
c_u$week_day[which((c_u$code_ind == 12110601) & (c_u$survey_day == 3))] <- 2


c_u$consumption_day[which((c_u$code_ind == 12111701) & (c_u$survey_day == 3))] 
c_u$consumption_day[which((c_u$code_ind == 12111702) & (c_u$survey_day == 3))] <- 4 

c_u$week_day[which((c_u$code_ind == 12111701) & (c_u$survey_day == 3))] 
c_u$week_day[which((c_u$code_ind == 12111702) & (c_u$survey_day == 3))] <- 7


c_u$consumption_day[which((c_u$code_ind == 12112002) & (c_u$survey_day == 1))] 
c_u$consumption_day[which((c_u$code_ind == 12112001) & (c_u$survey_day == 1))] <- 15

c_u$week_day[which((c_u$code_ind == 12112002) & (c_u$survey_day == 1))] 
c_u$week_day[which((c_u$code_ind == 12112001) & (c_u$survey_day == 1))] <- 4

c_u$consumption_day[which((c_u$code_ind == 12113001) & (c_u$survey_day == 1))] 
c_u$consumption_day[which((c_u$code_ind == 12113002) & (c_u$survey_day == 1))] <- 26

c_u$week_day[which((c_u$code_ind == 12113001) & (c_u$survey_day == 1))] 
c_u$week_day[which((c_u$code_ind == 12113002) & (c_u$survey_day == 1))] <- 4



c_u$consumption_day[which((c_u$code_ind == 13362002) & (c_u$survey_day == 1))] 
c_u$consumption_day[which((c_u$code_ind == 13362003) & (c_u$survey_day == 1))] <- 3

c_u$week_day[which((c_u$code_ind == 13362002) & (c_u$survey_day == 1))] 
c_u$week_day[which((c_u$code_ind == 13362003) & (c_u$survey_day == 1))] <- 2


c_u$consumption_day[which((c_u$code_ind == 13362002) & (c_u$survey_day == 3))] 
c_u$consumption_day[which((c_u$code_ind == 13362003) & (c_u$survey_day == 3))] <- 5 

c_u$week_day[which((c_u$code_ind == 13362002) & (c_u$survey_day == 3))] 
c_u$week_day[which((c_u$code_ind == 13362003) & (c_u$survey_day == 3))] <- 4

c_u$consumption_day[which((c_u$code_ind == 14170901) & (c_u$survey_day == 2))] 
c_u$consumption_day[which((c_u$code_ind == 14170902) & (c_u$survey_day == 2))] <- 8 

c_u$week_day[which((c_u$code_ind == 14170901) & (c_u$survey_day == 2))] 
c_u$week_day[which((c_u$code_ind == 14170902) & (c_u$survey_day == 2))] <- 4

c_u$consumption_day[which((c_u$code_ind == 14170901) & (c_u$survey_day == 3))] 
c_u$consumption_day[which((c_u$code_ind == 14170902) & (c_u$survey_day == 3))] <- 9

c_u$week_day[which((c_u$code_ind == 14170901) & (c_u$survey_day == 3))] 
c_u$week_day[which((c_u$code_ind == 14170902) & (c_u$survey_day == 3))] <- 5

c_u$consumption_month[which((c_u$code_ind == 16291602) & (c_u$survey_day == 3))] 
c_u$consumption_month[which((c_u$code_ind == 16291601) & (c_u$survey_day == 3))] <- 2

c_u$consumption_day[which((c_u$code_ind == 16292902) & (c_u$survey_day == 2))] 
c_u$consumption_day[which((c_u$code_ind == 16292903) & (c_u$survey_day == 2))] <- 18

c_u$week_day[which((c_u$code_ind == 16292902) & (c_u$survey_day == 2))] 
c_u$week_day[which((c_u$code_ind == 16292903) & (c_u$survey_day == 2))] <- 5

c_u$consumption_day[which((c_u$code_ind == 16292902) & (c_u$survey_day == 3))] 
c_u$consumption_day[which((c_u$code_ind == 16292903) & (c_u$survey_day == 3))] <- 19

c_u$week_day[which((c_u$code_ind == 16292902) & (c_u$survey_day == 3))] 
c_u$week_day[which((c_u$code_ind == 16292903) & (c_u$survey_day == 3))] <- 6


write.csv(c_u, "C:/Users/Laura Roca/Documents/INTERNSHIP/ITA_00134/consumption_user_corrected.csv", row.names=FALSE)


c_u$consumption_day[which((c_u$code_ind == 17292001) & (c_u$survey_day == 1))] <- 25
c_u$consumption_day[which((c_u$code_ind == 17292001) & (c_u$survey_day == 2))] <- 26

c_u$week_day[which((c_u$code_ind == 17292001) & (c_u$survey_day == 1))] <- 5
c_u$week_day[which((c_u$code_ind == 17292001) & (c_u$survey_day == 2))] <- 6


c_u$consumption_day[which((c_u$code_ind == 17292101) & (c_u$survey_day == 2))] <- 6
c_u$week_day[which((c_u$code_ind == 17292101) & (c_u$survey_day == 2))] <- 3


c_u$consumption_month[which((c_u$code_ind == 18290601) & (c_u$survey_day == 2))] 
c_u$consumption_month[which((c_u$code_ind == 18290602) & (c_u$survey_day == 2))] <- 3


c_u$consumption_day[which((c_u$code_ind == 19360302) & (c_u$survey_day == 3))] 
c_u$consumption_day[which((c_u$code_ind == 19360303) & (c_u$survey_day == 3))] <- 28

c_u$week_day[which((c_u$code_ind == 19360302) & (c_u$survey_day == 3))] 
c_u$week_day[which((c_u$code_ind == 19360303) & (c_u$survey_day == 3))] <- 2

write.csv(c_u, "C:/Users/Laura Roca/Documents/INTERNSHIP/ITA_00134/consumption_user_corrected.csv", row.names=FALSE)


c_u$consumption_day[which((c_u$code_ind == 19361202) & (c_u$survey_day == 1))] 
c_u$consumption_day[which((c_u$code_ind == 19361201) & (c_u$survey_day == 1))] <- 1
c_u$consumption_day[which((c_u$code_ind == 19361203) & (c_u$survey_day == 1))] <- 1
c_u$consumption_day[which((c_u$code_ind == 19361204) & (c_u$survey_day == 1))] <- 1

c_u$consumption_month[which((c_u$code_ind == 19361202) & (c_u$survey_day == 1))] 
c_u$consumption_month[which((c_u$code_ind == 19361201) & (c_u$survey_day == 1))] <- 4
c_u$consumption_month[which((c_u$code_ind == 19361203) & (c_u$survey_day == 1))] <- 4
c_u$consumption_month[which((c_u$code_ind == 19361204) & (c_u$survey_day == 1))] <- 4

c_u$week_day[which((c_u$code_ind == 19361202) & (c_u$survey_day == 1))] 
c_u$week_day[which((c_u$code_ind == 19361201) & (c_u$survey_day == 1))] <- 7
c_u$week_day[which((c_u$code_ind == 19361203) & (c_u$survey_day == 1))] <- 7
c_u$week_day[which((c_u$code_ind == 19361204) & (c_u$survey_day == 1))] <- 7


c_u$consumption_day[which((c_u$code_ind == 20443203) & (c_u$survey_day == 1))] 
c_u$consumption_day[which((c_u$code_ind == 20443201) & (c_u$survey_day == 1))] <- 5
c_u$consumption_day[which((c_u$code_ind == 20443202) & (c_u$survey_day == 1))] <- 5


c_u$week_day[which((c_u$code_ind == 20443203) & (c_u$survey_day == 1))] 
c_u$week_day[which((c_u$code_ind == 20443201) & (c_u$survey_day == 1))] <- 4
c_u$week_day[which((c_u$code_ind == 20443202) & (c_u$survey_day == 1))] <- 4

c_u$consumption_day[which((c_u$code_ind == 20443203) & (c_u$survey_day == 2))] 
c_u$consumption_day[which((c_u$code_ind == 20443201) & (c_u$survey_day == 2))] <- 6
c_u$consumption_day[which((c_u$code_ind == 20443202) & (c_u$survey_day == 2))] <- 6


c_u$week_day[which((c_u$code_ind == 20443203) & (c_u$survey_day == 2))] 
c_u$week_day[which((c_u$code_ind == 20443201) & (c_u$survey_day == 2))] <- 5
c_u$week_day[which((c_u$code_ind == 20443202) & (c_u$survey_day == 2))] <- 5

c_u$consumption_day[which((c_u$code_ind == 20443203) & (c_u$survey_day == 3))] 
c_u$consumption_day[which((c_u$code_ind == 20443201) & (c_u$survey_day == 3))] <- 7
c_u$consumption_day[which((c_u$code_ind == 20443202) & (c_u$survey_day == 3))] <- 7


c_u$week_day[which((c_u$code_ind == 20443203) & (c_u$survey_day == 3))] 
c_u$week_day[which((c_u$code_ind == 20443201) & (c_u$survey_day == 3))] <- 6
c_u$week_day[which((c_u$code_ind == 20443202) & (c_u$survey_day == 3))] <- 6


c_u$consumption_day[which((c_u$code_ind == 20445502) & (c_u$survey_day == 1))] 
c_u$consumption_day[which((c_u$code_ind == 20445501) & (c_u$survey_day == 1))] <- 29

c_u$week_day[which((c_u$code_ind == 20445502) & (c_u$survey_day == 1))] 
c_u$week_day[which((c_u$code_ind == 20445501) & (c_u$survey_day == 1))] <- 7

c_u$consumption_day[which((c_u$code_ind == 34322201) & (c_u$survey_day == 2))] 
c_u$consumption_day[which((c_u$code_ind == 34322202) & (c_u$survey_day == 2))] <- 7

c_u$week_day[which((c_u$code_ind == 34322201) & (c_u$survey_day == 2))] 
c_u$week_day[which((c_u$code_ind == 34322202) & (c_u$survey_day == 2))] <- 6

c_u$consumption_day[which((c_u$code_ind == 34322201) & (c_u$survey_day == 2))] 
c_u$consumption_day[which((c_u$code_ind == 34322202) & (c_u$survey_day == 2))] <- 7

c_u$week_day[which((c_u$code_ind == 34322201) & (c_u$survey_day == 2))] 
c_u$week_day[which((c_u$code_ind == 34322202) & (c_u$survey_day == 2))] <- 6



c_u$consumption_day[which((c_u$code_ind == 35320101) & (c_u$survey_day == 1))] 
c_u$consumption_day[which((c_u$code_ind == 35320102) & (c_u$survey_day == 1))] <- 22

c_u$week_day[which((c_u$code_ind == 35320101) & (c_u$survey_day == 1))] 
c_u$week_day[which((c_u$code_ind == 35320102) & (c_u$survey_day == 1))] <- 7


c_u$consumption_day[which((c_u$code_ind == 35322201) & (c_u$survey_day == 2))] 
c_u$consumption_day[which((c_u$code_ind == 35322202) & (c_u$survey_day == 2))] <- 23

c_u$week_day[which((c_u$code_ind == 35322201) & (c_u$survey_day == 2))] 
c_u$week_day[which((c_u$code_ind == 35322202) & (c_u$survey_day == 2))] <- 5


c_u$consumption_day[which((c_u$code_ind == 35322901) & (c_u$survey_day == 3))] 
c_u$consumption_day[which((c_u$code_ind == 35322902) & (c_u$survey_day == 3))] <- 10

c_u$week_day[which((c_u$code_ind == 35322901) & (c_u$survey_day == 3))] 
c_u$week_day[which((c_u$code_ind == 35322902) & (c_u$survey_day == 3))] <- 4

write.csv(c_u, "C:/Users/Laura Roca/Documents/INTERNSHIP/ITA_00134/consumption_user_corrected.csv", row.names=FALSE)

c_u$consumption_day[which((c_u$code_ind == 35323101) & (c_u$survey_day == 1))] 
c_u$consumption_day[which((c_u$code_ind == 35323102) & (c_u$survey_day == 1))] <- 24

c_u$week_day[which((c_u$code_ind == 35323101) & (c_u$survey_day == 1))] 
c_u$week_day[which((c_u$code_ind == 35323102) & (c_u$survey_day == 1))] <- 4

c_u$consumption_day[which((c_u$code_ind == 35323502) & (c_u$survey_day == 3))] 
c_u$consumption_day[which((c_u$code_ind == 35323501) & (c_u$survey_day == 3))] <- 28

c_u$week_day[which((c_u$code_ind == 35323502) & (c_u$survey_day == 3))] 
c_u$week_day[which((c_u$code_ind == 35323501) & (c_u$survey_day == 3))] <- 4

c_u$consumption_month[which((c_u$code_ind == 35323802) & (c_u$survey_day == 3))] 
c_u$consumption_month[which((c_u$code_ind == 35323801) & (c_u$survey_day == 3))] <- 7

c_u$week_day[which((c_u$code_ind == 35323802) & (c_u$survey_day == 3))] 
c_u$week_day[which((c_u$code_ind == 35323801) & (c_u$survey_day == 3))] <- 7

write.csv(c_u, "C:/Users/Laura Roca/Documents/INTERNSHIP/ITA_00134/consumption_user_corrected.csv", row.names=FALSE)

c_u$consumption_day[which((c_u$code_ind == 36270803) & (c_u$survey_day == 3))] 
c_u$consumption_day[which((c_u$code_ind == 36270804) & (c_u$survey_day == 3))] <- 12 

c_u$week_day[which((c_u$code_ind == 36270803) & (c_u$survey_day == 3))] 
c_u$week_day[which((c_u$code_ind == 36270804) & (c_u$survey_day == 3))] <- 1


c_u$consumption_day[which((c_u$code_ind == 36271301) & (c_u$survey_day == 2))] 
c_u$consumption_day[which((c_u$code_ind == 36271302) & (c_u$survey_day == 2))] <- 29

c_u$week_day[which((c_u$code_ind == 36271301) & (c_u$survey_day == 2))] 
c_u$week_day[which((c_u$code_ind == 36271302) & (c_u$survey_day == 2))] <- 7

c_u$consumption_day[which((c_u$code_ind == 37271002) & (c_u$survey_day == 3))] 
c_u$consumption_day[which((c_u$code_ind == 37271003) & (c_u$survey_day == 3))] <- 21

c_u$week_day[which((c_u$code_ind == 37271002) & (c_u$survey_day == 3))] 
c_u$week_day[which((c_u$code_ind == 37271003) & (c_u$survey_day == 3))] <- 7


c_u$consumption_day[which((c_u$code_ind == 37271703) & (c_u$survey_day == 1))] 
c_u$consumption_day[which((c_u$code_ind == 37271704) & (c_u$survey_day == 1))] <- 29

c_u$week_day[which((c_u$code_ind == 37271703) & (c_u$survey_day == 1))] 
c_u$week_day[which((c_u$code_ind == 37271704) & (c_u$survey_day == 1))] <- 4

c_u$week_day[which((c_u$code_ind == 37271703) & (c_u$survey_day == 2))] 
c_u$week_day[which((c_u$code_ind == 37271704) & (c_u$survey_day == 2))] <- 5

c_u$week_day[which((c_u$code_ind == 36271301) & (c_u$survey_day == 2))]
c_u$week_day[which((c_u$code_ind == 36271302) & (c_u$survey_day == 2))] <- 7

write.csv(c_u, "C:/Users/Laura Roca/Documents/INTERNSHIP/ITA_00134/consumption_user_corrected.csv", row.names=FALSE)

c_u$consumption_day[which((c_u$code_ind == 41220302) & (c_u$survey_day == 2))] 
c_u$consumption_day[which((c_u$code_ind == 41220301) & (c_u$survey_day == 2))]  <- 15 

c_u$week_day[which((c_u$code_ind == 41220302) & (c_u$survey_day == 2))] 
c_u$week_day[which((c_u$code_ind == 41220301) & (c_u$survey_day == 2))] <- 7

c_u$consumption_day[which((c_u$code_ind == 41221001) & (c_u$survey_day == 2))] 
c_u$consumption_day[which((c_u$code_ind == 41221002) & (c_u$survey_day == 2))] <- 8

c_u$week_day[which((c_u$code_ind == 41221001) & (c_u$survey_day == 2))] 
c_u$week_day[which((c_u$code_ind == 41221002) & (c_u$survey_day == 2))] <- 4 


c_u$consumption_month[which((c_u$code_ind == 41221301) & (c_u$survey_day == 2))] 
c_u$consumption_month[which((c_u$code_ind == 41221302) & (c_u$survey_day == 2))] <- 3

c_u$week_day[which((c_u$code_ind == 41221301) & (c_u$survey_day == 2))] 
c_u$week_day[which((c_u$code_ind == 41221302) & (c_u$survey_day == 2))] <- 2

c_u$consumption_day[which((c_u$code_ind == 41221001) & (c_u$survey_day == 2))] 
c_u$consumption_day[which((c_u$code_ind == 41221002) & (c_u$survey_day == 2))] <- 8

c_u$week_day[which((c_u$code_ind == 41221001) & (c_u$survey_day == 2))] 
c_u$week_day[which((c_u$code_ind == 41221002) & (c_u$survey_day == 2))] <- 4

c_u$consumption_day[which((c_u$code_ind == 43191002) & (c_u$survey_day == 1))] 
c_u$consumption_day[which((c_u$code_ind == 43191001) & (c_u$survey_day == 1))] <- 23

c_u$week_day[which((c_u$code_ind == 43191002) & (c_u$survey_day == 1))] 
c_u$week_day[which((c_u$code_ind == 43191001) & (c_u$survey_day == 1))] <- 6 

c_u$consumption_day[which((c_u$code_ind == 44310901) & (c_u$survey_day == 2))] 
c_u$consumption_day[which((c_u$code_ind == 44310902) & (c_u$survey_day == 2))] <- 16 
c_u$consumption_day[which((c_u$code_ind == 44310903) & (c_u$survey_day == 2))] <- 16

c_u$week_day[which((c_u$code_ind == 44310901) & (c_u$survey_day == 2))] 
c_u$week_day[which((c_u$code_ind == 44310902) & (c_u$survey_day == 2))] <- 4 
c_u$week_day[which((c_u$code_ind == 44310903) & (c_u$survey_day == 2))] <- 4  


c_u$consumption_day[which((c_u$code_ind == 44311001) & (c_u$survey_day == 3))] <- 25
c_u$week_day[which((c_u$code_ind == 44311001) & (c_u$survey_day == 1))]  <- 4 
c_u$week_day[which((c_u$code_ind == 44311001) & (c_u$survey_day == 2))] <- 5 
c_u$week_day[which((c_u$code_ind == 44311001) & (c_u$survey_day == 3))]  <- 6

write.csv(c_u, "C:/Users/Laura Roca/Documents/INTERNSHIP/ITA_00134/consumption_user_corrected.csv", row.names=FALSE)

c_u$consumption_day[which((c_u$code_ind == 44311301) & (c_u$survey_day == 2))] 
c_u$consumption_day[which((c_u$code_ind == 44311302) & (c_u$survey_day == 2))] <- 31

c_u$consumption_month[which((c_u$code_ind == 44311301) & (c_u$survey_day == 2))] 
c_u$consumption_month[which((c_u$code_ind == 44311302) & (c_u$survey_day == 2))] <- 1

c_u$week_day[which((c_u$code_ind == 44311301) & (c_u$survey_day == 2))] 
c_u$week_day[which((c_u$code_ind == 44311302) & (c_u$survey_day == 2))] <- 3


c_u$consumption_day[which((c_u$code_ind == 44311702) & (c_u$survey_day == 2))] 
c_u$consumption_day[which((c_u$code_ind == 44311701) & (c_u$survey_day == 2))] <- 14 

c_u$week_day[which((c_u$code_ind == 44311702) & (c_u$survey_day == 2))]   
c_u$week_day[which((c_u$code_ind == 44311701) & (c_u$survey_day == 2))] <- 3


c_u$consumption_day[which((c_u$code_ind == 44314502) & (c_u$survey_day == 1))] 
c_u$consumption_day[which((c_u$code_ind == 44314501) & (c_u$survey_day == 1))] <- 29  

c_u$week_day[which((c_u$code_ind == 44314502) & (c_u$survey_day == 1))]   
c_u$week_day[which((c_u$code_ind == 44314501) & (c_u$survey_day == 1))] <- 2


c_u$consumption_day[which((c_u$code_ind == 44315001) & (c_u$survey_day == 1))] <- 4
c_u$consumption_day[which((c_u$code_ind == 44315001) & (c_u$survey_day == 2))] <- 5
c_u$consumption_day[which((c_u$code_ind == 44315001) & (c_u$survey_day == 3))] <- 6

c_u$consumption_month[which((c_u$code_ind == 44315001) & (c_u$survey_day == 1))] <- 7
c_u$consumption_month[which((c_u$code_ind == 44315001) & (c_u$survey_day == 2))] <- 7
c_u$consumption_month[which((c_u$code_ind == 44315001) & (c_u$survey_day == 3))] <- 7

c_u$week_day[which((c_u$code_ind == 44315001) & (c_u$survey_day == 1))] <- 3
c_u$week_day[which((c_u$code_ind == 44315001) & (c_u$survey_day == 2))] <- 4
c_u$week_day[which((c_u$code_ind == 44315001) & (c_u$survey_day == 3))] <- 5


write.csv(c_u, "C:/Users/Laura Roca/Documents/INTERNSHIP/ITA_00134/consumption_user_corrected.csv", row.names=FALSE)

c_u$consumption_month[which((c_u$code_ind == 44315803) & (c_u$survey_day == 3))] 
c_u$consumption_month[which((c_u$code_ind == 44315804) & (c_u$survey_day == 3))] <- 7

c_u$week_day[which((c_u$code_ind == 44315803) & (c_u$survey_day == 3))]   
c_u$week_day[which((c_u$code_ind == 44315804) & (c_u$survey_day == 3))] <- 6


c_u$consumption_day[which((c_u$code_ind == 44500201) & (c_u$survey_day == 2))] 
c_u$consumption_day[which((c_u$code_ind == 44500202) & (c_u$survey_day == 2))] <- 13  
c_u$consumption_day[which((c_u$code_ind == 44500202) & (c_u$survey_day == 3))] <- 14  

c_u$week_day[which((c_u$code_ind == 44500201) & (c_u$survey_day == 3))]   
c_u$week_day[which((c_u$code_ind == 44500202) & (c_u$survey_day == 2))] <- 1
c_u$week_day[which((c_u$code_ind == 44500202) & (c_u$survey_day == 3))] <- 2


c_u$consumption_day[which((c_u$code_ind == 51260902) & (c_u$survey_day == 1))] 
c_u$consumption_day[which((c_u$code_ind == 51260903) & (c_u$survey_day == 1))] <- 7  
c_u$consumption_day[which((c_u$code_ind == 51260903) & (c_u$survey_day == 3))] <- 9 


c_u$week_day[which((c_u$code_ind == 51260902) & (c_u$survey_day == 3))]   
c_u$week_day[which((c_u$code_ind == 51260903) & (c_u$survey_day == 1))] <- 6
c_u$week_day[which((c_u$code_ind == 51260903) & (c_u$survey_day == 3))] <- 1

c_u$consumption_day[which((c_u$code_ind == 51371103) & (c_u$survey_day == 2))] 
c_u$consumption_day[which((c_u$code_ind == 51371102) & (c_u$survey_day == 2))] <- 22 

c_u$week_day[which((c_u$code_ind == 51371103) & (c_u$survey_day == 2))]   
c_u$week_day[which((c_u$code_ind == 51371102) & (c_u$survey_day == 2))] <- 4

write.csv(c_u, "C:/Users/Laura Roca/Documents/INTERNSHIP/ITA_00134/consumption_user_corrected.csv", row.names=FALSE)

c_u$consumption_month[which((c_u$code_ind == 52426203) & (c_u$survey_day == 1))] 
c_u$consumption_month[which((c_u$code_ind == 52426204) & (c_u$survey_day == 1))] <- 9  

c_u$week_day[which((c_u$code_ind == 52426203) & (c_u$survey_day == 1))]   
c_u$week_day[which((c_u$code_ind == 52426204) & (c_u$survey_day == 1))]<- 6 


c_u$consumption_day[which((c_u$code_ind == 53461403) & (c_u$survey_day == 3))] 
c_u$consumption_day[which((c_u$code_ind == 53461404) & (c_u$survey_day == 3))] <- 25  

c_u$week_day[which((c_u$code_ind == 53461403) & (c_u$survey_day == 3))]   
c_u$week_day[which((c_u$code_ind == 53461404) & (c_u$survey_day == 3))] <- 5

c_u$consumption_day[which((c_u$code_ind == 54340101) & (c_u$survey_day == 1))] <- 1
c_u$consumption_day[which((c_u$code_ind == 54340101) & (c_u$survey_day == 2))] <- 2
c_u$consumption_day[which((c_u$code_ind == 54340101) & (c_u$survey_day == 3))] <- 3

c_u$consumption_month[which((c_u$code_ind == 54340101) & (c_u$survey_day == 1))] <- 12
c_u$consumption_month[which((c_u$code_ind == 54340101) & (c_u$survey_day == 2))] <- 12
c_u$consumption_month[which((c_u$code_ind == 54340101) & (c_u$survey_day == 3))] <- 12

c_u$week_day[which((c_u$code_ind == 54340101) & (c_u$survey_day == 1))] <- 5 
c_u$week_day[which((c_u$code_ind == 54340101) & (c_u$survey_day == 2))] <- 6
c_u$week_day[which((c_u$code_ind == 54340101) & (c_u$survey_day == 3))] <- 7


c_u$consumption_day[which((c_u$code_ind == 55340904) & (c_u$survey_day == 1))] 
c_u$consumption_day[which((c_u$code_ind == 55340903) & (c_u$survey_day == 1))] <- 17  

c_u$week_day[which((c_u$code_ind == 55340904) & (c_u$survey_day == 1))]   
c_u$week_day[which((c_u$code_ind == 55340903) & (c_u$survey_day == 1))] 


write.csv(c_, "C:/Users/Laura Roca/Documents/INTERNSHIP/ITA_00134/consumption_user_corrected.csv", row.names=FALSE)


c_u$consumption_day[which((c_u$code_ind == 55341101) & (c_u$survey_day == 3))] 
c_u$consumption_day[which((c_u$code_ind == 55341102) & (c_u$survey_day == 3))] <- 22

c_u$week_day[which((c_u$code_ind == 55341101) & (c_u$survey_day == 3))]   
c_u$week_day[which((c_u$code_ind == 55341102) & (c_u$survey_day == 3))]<- 5 

c_u$consumption_day[which((c_u$code_ind == 55341702) & (c_u$survey_day == 3))] 
c_u$consumption_day[which((c_u$code_ind == 55341703) & (c_u$survey_day == 3))] <- 19

c_u$week_day[which((c_u$code_ind == 55341702) & (c_u$survey_day == 3))]   
c_u$week_day[which((c_u$code_ind == 55341703) & (c_u$survey_day == 3))]<- 5 

c_u$consumption_month[which((c_u$code_ind == 55342402) & (c_u$survey_day == 3))] 
c_u$consumption_month[which((c_u$code_ind == 55342401) & (c_u$survey_day == 3))] <- 5

c_u$week_day[which((c_u$code_ind == 55342402) & (c_u$survey_day == 3))]   
c_u$week_day[which((c_u$code_ind == 55342401) & (c_u$survey_day == 3))]<- 6 


c_u$consumption_month[which((c_u$code_ind == 55342503) & (c_u$survey_day == 2))] 
c_u$consumption_month[which((c_u$code_ind == 55342504) & (c_u$survey_day == 2))] <- 6

c_u$week_day[which((c_u$code_ind == 55342503) & (c_u$survey_day == 2))]   
c_u$week_day[which((c_u$code_ind == 55342504) & (c_u$survey_day == 2))]<- 4


c_u$consumption_day[which((c_u$famiglia == 553427) & (c_u$survey_day == 2))] <- 17
c_u$consumption_month[which((c_u$famiglia == 553427) & (c_u$survey_day == 2))] <- 5
c_u$week_day[which((c_u$famiglia == 553427) & (c_u$survey_day == 2))] <- 4


c_u$consumption_day[which((c_u$code_ind == 55343002) & (c_u$survey_day == 3))] 
c_u$consumption_day[which((c_u$code_ind == 55343004) & (c_u$survey_day == 3))] <- 19

c_u$week_day[which((c_u$code_ind == 55343002) & (c_u$survey_day == 3))]   
c_u$week_day[which((c_u$code_ind == 55343004) & (c_u$survey_day == 3))]<- 2 

c_u$consumption_month[which((c_u$code_ind == 55343603) & (c_u$survey_day == 3))] 
c_u$consumption_month[which((c_u$code_ind == 55343604) & (c_u$survey_day == 3))] <- 6

c_u$week_day[which((c_u$code_ind == 55343603) & (c_u$survey_day == 3))]   
c_u$week_day[which((c_u$code_ind == 55343604) & (c_u$survey_day == 3))]<- 1 

c_u$consumption_day[which((c_u$code_ind == 56240702) & (c_u$survey_day == 3))] 
c_u$consumption_day[which((c_u$code_ind == 56240701) & (c_u$survey_day == 3))] <- 28

c_u$week_day[which((c_u$code_ind == 56240702) & (c_u$survey_day == 3))]   
c_u$week_day[which((c_u$code_ind == 56240701) & (c_u$survey_day == 3))]<- 7

c_u$consumption_day[which((c_u$code_ind == 56241401) & (c_u$survey_day == 2))] 
c_u$consumption_day[which((c_u$code_ind == 56241402) & (c_u$survey_day == 2))] <- 23

c_u$week_day[which((c_u$code_ind == 56241401) & (c_u$survey_day == 2))]   
c_u$week_day[which((c_u$code_ind == 56241402) & (c_u$survey_day == 2))]<- 6

c_u$consumption_day[which((c_u$code_ind == 57241502) & (c_u$survey_day == 2))] 
c_u$consumption_day[which((c_u$code_ind == 57241503) & (c_u$survey_day == 2))] <- 25 

c_u$week_day[which((c_u$code_ind == 57241502) & (c_u$survey_day == 2))]   
c_u$week_day[which((c_u$code_ind == 57241503) & (c_u$survey_day == 2))]<- 4

c_u$consumption_day[which((c_u$code_ind == 57242202) & (c_u$survey_day == 3))] 
c_u$consumption_day[which((c_u$code_ind == 57242201) & (c_u$survey_day == 3))] <- 8 

c_u$week_day[which((c_u$code_ind == 57242202) & (c_u$survey_day == 3))]   
c_u$week_day[which((c_u$code_ind == 57242201) & (c_u$survey_day == 3))]<- 4

c_u$consumption_day[which((c_u$code_ind == 58471102) & (c_u$survey_day == 3))] 
c_u$consumption_day[which((c_u$code_ind == 58471103) & (c_u$survey_day == 3))] <- 3

c_u$week_day[which((c_u$code_ind == 58471102) & (c_u$survey_day == 3))]   
c_u$week_day[which((c_u$code_ind == 58471103) & (c_u$survey_day == 3))]<- 7

c_u$consumption_month[which((c_u$code_ind == 58474304) & (c_u$survey_day == 2))] 
c_u$consumption_month[which((c_u$code_ind == 58474305) & (c_u$survey_day == 2))] <- 5

c_u$week_day[which((c_u$code_ind == 58474304) & (c_u$survey_day == 2))]   
c_u$week_day[which((c_u$code_ind == 58474305) & (c_u$survey_day == 2))]<- 1

c_u$consumption_day[which((c_u$code_ind == 60153002) & (c_u$survey_day == 2))] 
c_u$consumption_day[which((c_u$code_ind == 60153001) & (c_u$survey_day == 2))] <- 26

c_u$week_day[which((c_u$code_ind == 60153002) & (c_u$survey_day == 2))]   
c_u$week_day[which((c_u$code_ind == 60153001) & (c_u$survey_day == 2))]<- 2

write.csv(c_u, "C:/Users/Laura Roca/Documents/INTERNSHIP/ITA_00134/consumption_user_corrected.csv", row.names=FALSE)


c_u$consumption_day[which((c_u$code_ind == 61151303) & (c_u$survey_day == 2))] 
c_u$consumption_day[which((c_u$code_ind == 61151304) & (c_u$survey_day == 2))] <- 26

c_u$week_day[which((c_u$code_ind == 61151303) & (c_u$survey_day == 2))]   
c_u$week_day[which((c_u$code_ind == 61151304) & (c_u$survey_day == 2))]<- 6

c_u$consumption_day[which((c_u$code_ind == 62200502) & (c_u$survey_day == 2))] 
c_u$consumption_day[which((c_u$code_ind == 62200501) & (c_u$survey_day == 2))] <- 5

c_u$week_day[which((c_u$code_ind == 62200502) & (c_u$survey_day == 2))]   
c_u$week_day[which((c_u$code_ind == 62200501) & (c_u$survey_day == 2))]<- 1

c_u$consumption_month[which((c_u$code_ind == 62200602) & (c_u$survey_day == 3))] 
c_u$consumption_month[which((c_u$code_ind == 62200601) & (c_u$survey_day == 3))] <- 4

c_u$week_day[which((c_u$code_ind == 62200602) & (c_u$survey_day == 3))]   
c_u$week_day[which((c_u$code_ind == 62200601) & (c_u$survey_day == 3))]<- 5


c_u$consumption_day[which((c_u$code_ind == 62201002) & (c_u$survey_day == 2))] 
c_u$consumption_day[which((c_u$code_ind == 62201001) & (c_u$survey_day == 2))] <- 19

c_u$week_day[which((c_u$code_ind == 62201002) & (c_u$survey_day == 2))]   
c_u$week_day[which((c_u$code_ind == 62201001) & (c_u$survey_day == 2))]<- 4


c_u$consumption_day[which((c_u$code_ind == 63200502) & (c_u$survey_day == 2))] 
c_u$consumption_day[which((c_u$code_ind == 63200501) & (c_u$survey_day == 2))] <- 6
c_u$consumption_day[which((c_u$code_ind == 63200503) & (c_u$survey_day == 2))] <- 6


c_u$week_day[which((c_u$code_ind == 63200502) & (c_u$survey_day == 2))]   
c_u$week_day[which((c_u$code_ind == 63200501) & (c_u$survey_day == 2))]<- 1
c_u$week_day[which((c_u$code_ind == 63200503) & (c_u$survey_day == 2))]<- 1


c_u$consumption_day[which((c_u$code_ind == 63201104) & (c_u$survey_day == 3))] 
c_u$consumption_day[which((c_u$code_ind == 63201105) & (c_u$survey_day == 3))] <- 18

c_u$week_day[which((c_u$code_ind == 63201104) & (c_u$survey_day == 3))]   
c_u$week_day[which((c_u$code_ind == 63201105) & (c_u$survey_day == 3))]<- 4

c_u$consumption_month[which((c_u$code_ind == 63202003) & (c_u$survey_day == 1))] 
c_u$consumption_month[which((c_u$code_ind == 63202004) & (c_u$survey_day == 1))] <- 5

c_u$week_day[which((c_u$code_ind == 63202003) & (c_u$survey_day == 1))]   
c_u$week_day[which((c_u$code_ind == 63202004) & (c_u$survey_day == 1))]<- 3

write.csv(c_u, "C:/Users/Laura Roca/Documents/INTERNSHIP/ITA_00134/consumption_user_corrected.csv", row.names=FALSE)


c_u$consumption_day[which((c_u$code_ind == 63203003) & (c_u$survey_day == 1))] <- 10 
c_u$consumption_day[which((c_u$code_ind == 63203003) & (c_u$survey_day == 2))] <- 11

c_u$week_day[which((c_u$code_ind == 63203003) & (c_u$survey_day == 1))] <- 2   
c_u$week_day[which((c_u$code_ind == 63203003) & (c_u$survey_day == 2))]<- 3


c_u$consumption_day[which((c_u$code_ind == 63210102) & (c_u$survey_day == 1))] 
c_u$consumption_day[which((c_u$code_ind == 63210101) & (c_u$survey_day == 1))] <- 12

c_u$week_day[which((c_u$code_ind == 63210102) & (c_u$survey_day == 1))]   
c_u$week_day[which((c_u$code_ind == 63210101) & (c_u$survey_day == 1))]<- 4

c_u$consumption_day[which((c_u$code_ind == 63210203) & (c_u$survey_day == 2))] 
c_u$consumption_day[which((c_u$code_ind == 63210204) & (c_u$survey_day == 2))] <- 1
c_u$consumption_month[which((c_u$code_ind == 63210204) & (c_u$survey_day == 2))] <- 11

c_u$week_day[which((c_u$code_ind == 63210203) & (c_u$survey_day == 2))]   
c_u$week_day[which((c_u$code_ind == 63210204) & (c_u$survey_day == 2))]<- 3

c_u$consumption_day[which((c_u$code_ind == 63210203) & (c_u$survey_day == 3))] 
c_u$consumption_day[which((c_u$code_ind == 63210201) & (c_u$survey_day == 3))] <- 2
c_u$week_day[which((c_u$code_ind == 63210203) & (c_u$survey_day == 3))]   
c_u$week_day[which((c_u$code_ind == 63210201) & (c_u$survey_day == 3))] <- 4

c_u$consumption_day[which((c_u$code_ind == 63210301) & (c_u$survey_day == 2))] 
c_u$consumption_day[which((c_u$code_ind == 63210302) & (c_u$survey_day == 2))] <- 1

c_u$week_day[which((c_u$code_ind == 63210301) & (c_u$survey_day == 2))]   
c_u$week_day[which((c_u$code_ind == 63210302) & (c_u$survey_day == 2))]<- 3


c_u$consumption_day[which((c_u$code_ind == 63210802) & (c_u$survey_day == 3))] 
c_u$consumption_day[which((c_u$code_ind == 63210803) & (c_u$survey_day == 3))] <- 12

c_u$week_day[which((c_u$code_ind == 63210802) & (c_u$survey_day == 3))]   
c_u$week_day[which((c_u$code_ind == 63210803) & (c_u$survey_day == 3))]<- 5

c_u$consumption_day[which((c_u$code_ind == 63211501) & (c_u$survey_day == 2))] <- 27  


c_u$consumption_day[which((c_u$code_ind == 63210802) & (c_u$survey_day == 3))] 
c_u$consumption_day[which((c_u$code_ind == 63210803) & (c_u$survey_day == 3))] <- 12

c_u$week_day[which((c_u$code_ind == 63210802) & (c_u$survey_day == 3))]   
c_u$week_day[which((c_u$code_ind == 63210803) & (c_u$survey_day == 3))]<- 5

write.csv(c_u, "C:/Users/Laura Roca/Documents/INTERNSHIP/ITA_00134/consumption_user_corrected.csv", row.names=FALSE)

c_u$consumption_day[which((c_u$code_ind == 61150701) & (c_u$survey_day == 2))] <- 22
c_u$week_day[which((c_u$code_ind == 61150701) & (c_u$survey_day == 2))] <- 4


write.csv(c_u, "C:/Users/Laura Roca/Documents/INTERNSHIP/ITA_00134/consumption_user_corrected.csv", row.names=FALSE)
