set.seed(1)

library(dplyr)

dfHp <- data.frame(status = c("Healthy", "Benign", "Other_cancer", "Ovarian_cancer"),
                   mean = c(147.1, 254.4, 260.9, 486.5),
                   sd = c(23.85, 53.1, 66.5, 85.75),
                   n = c(107, 46, 47, 51))

dfOsteopontin <- apply(dfHp, MARGIN = 1,
      FUN = function(row){
        res <- data.frame(rnorm(n = row[["n"]],
                                mean =as.numeric(row[["mean"]]),
                                sd = as.numeric(row[["sd"]])),
                          status = row[["status"]])
        colnames(res) <- c("osteopontin", "status")
        return(res)
      }) %>%
  bind_rows() %>%
  mutate(age = rnorm(n = n(), mean = 52, sd = 4))
