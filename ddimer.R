set.seed(1)

library(dplyr)

dfDdimer <- data.frame(age = rnorm(n = 1096, mean = 58, sd = 10)) %>%
  mutate(sex = factor(rbinom(n = n(), size = 1, prob = 0.6),
                      labels = c("Male", "Female")),
         duration_symptoms = rnorm(n = n(), mean = 7.8, sd = 1),
         clinically_likely = factor(rbinom(n = n(), size = 1, prob = 0.5),
                                    labels = c("Likely", "Unlikely")),
         prior_venous_thromb = rbinom(n = n(), size = 1, prob = 0.18),
         cancer = rbinom(n = n(), size = 1, prob = 0.09),
         surgery_immobilisation = rbinom(n = n(), size = 1, prob = 0.14),
         grp_rando = factor(rbinom(n = n(), size = 1, prob = 0.5),
                            labels = c("DDimer", "Echo")),
         thrombosis_embolism_initial = rbinom(n = n(), size = 1, prob = 0.15),
         thrombosis_embolism_final = rbinom(n=n(), size = 1, prob = 0.01),
         thrombosis_embolism_final = as.numeric(thrombosis_embolism_initial == 1 | thrombosis_embolism_final == 1))
