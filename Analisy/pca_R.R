
EI_group_variables <- read.csv("C:/Users/Laura Roca/Documents/INTERNSHIP/ITA_00134/EI_group_variables.csv", header = TRUE)

mean_irregul <- cbind(EI_group_variables[, grep("mean", names(EI_group_variables))], EI_group_variables[, grep("Irregularity", names(EI_group_variables))] )
mean_irregul$meandayintake <- NULL
cov_matrix <- cov(mean_irregu)
pca_result <- prcomp(cov_matrix)

pc_scores <- predict(pca_result, newdata = mean_irregu)

EI_hour_variables <- read.csv("C:/Users/Laura Roca/Documents/INTERNSHIP/ITA_00134/EI_hour_variables.csv", header = TRUE)

mean_hour <- EI_hour_variables[, grep("mean", names(EI_hour_variables))]
mean_hour$meandayintake <- NULL
cov_matrix_hour <- cov(mean_hour)
pca_result_hour <- prcomp(cov_matrix_hour)

pc_scores_hour <- predict(pca_result_hour, newdata = mean_hour)