set.seed(1)

library(dplyr)

dfAEGIS1 <- data.frame(cancer = rbinom(n = 298, size = 1, prob = 0.74)) %>%
  mutate(bronchoscopy = rbinom(n = n(), size = 1, prob = 0.43),
         bronchoscopy = as.numeric(cancer == 1 & bronchoscopy == 1),
         gene_expression_disease = rnorm(n = n(), mean = 1, sd = 1),
         gene_expression_nodisease = rnorm(n = n(), mean = 0, sd = 1),
         gene_expression = if_else(cancer == 1, gene_expression_disease, gene_expression_nodisease),
         sex = factor(rbinom(n = n(), size = 1, prob = 0.6),
                      labels = c("Male", "Female")),
         smoking_status = factor(rbinom(n = n(), size = 1, prob = 0.5),
                                 labels = c("Current", "Former")),
         age = rnorm(n = n(), mean = 63, sd = 10),
         study = "AEGIS-1") %>%
  select(-c(gene_expression_disease,
            gene_expression_nodisease))

dfAEGIS2 <- data.frame(cancer = rbinom(n = 341, size = 1, prob = 0.78)) %>%
  mutate(bronchoscopy = rbinom(n = n(), size = 1, prob = 0.43),
         bronchoscopy = as.numeric(cancer == 1 & bronchoscopy == 1),
         gene_expression_disease = rnorm(n = n(), mean = 1, sd = 1),
         gene_expression_nodisease = rnorm(n = n(), mean = 0, sd = 1),
         gene_expression = if_else(cancer == 1, gene_expression_disease, gene_expression_nodisease),
         sex = factor(rbinom(n = n(), size = 1, prob = 0.6),
                      labels = c("Male", "Female")),
         smoking_status = factor(rbinom(n = n(), size = 1, prob = 0.5),
                                 labels = c("Current", "Former")),
         age = rnorm(n = n(), mean = 63, sd = 10),
         study = "AEGIS-2") %>%
  select(-c(gene_expression_disease,
            gene_expression_nodisease))

dfBronchoscopy <- bind_rows(dfAEGIS1, dfAEGIS2)
