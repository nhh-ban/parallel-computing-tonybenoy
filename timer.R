library(tictoc)
library(magrittr)
tic("solution")
source("scripts/hw4_solution.r")
toc(log = T)

tic("solution-PC")
source("scripts/hw4_solution-PC.r")
toc(log = T)

tic("solution-MC")
source("scripts/hw4_solution-MC.r")
toc(log = T)

printTicTocLog <-
    function() {
        tic.log() %>%
            unlist() %>%
            tibble(logvals = .) %>%
            separate(logvals,
                sep = ":",
                into = c("Function type", "log")
            ) %>%
            mutate(log = str_trim(log)) %>%
            separate(log,
                sep = " ",
                into = c("Seconds"),
                extra = "drop"
            )
    }

printTicTocLog() %>%
    knitr::kable()



# |Function type |Seconds |
# |:-------------|:-------|
# |solution      |113.242 |
# |solution-PC   |84.191  |
# |solution-MC   |54.316  |

# The solution-MC is is the fastest based on the timer as the function MTweedie is the most time consuming  due to the repeated simulations.
