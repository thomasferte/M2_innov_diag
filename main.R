set.seed(1)

library(dplyr)
library(ggplot2)

source(file = "bronchial_genomic_classifier.R")
source(file = "ddimer.R")
source(file = "osteopontin.R")

write.csv(dfOsteopontin, file="Osteopontin.csv", row.names=FALSE)
write.csv(dfDdimer, file="DDimer.csv", row.names=FALSE)
write.csv(dfBronchoscopy, file="Bronchoscopy.csv", row.names=FALSE)
