library("XML")
library("logging")
library("openxlsx")
loggerName <- "sqlTools"
addHandler(writeToConsole, logger = loggerName)
loginfo("start", logger = loggerName)

# read html table to data.frame ###############################################
url <-
  "https://github.com/ktaranov/sqlserver-kit/blob/master/Utilities/README.md"
doc <- htmlParse(GET(url), asText = TRUE)
tableNodes = getNodeSet(doc, "//table")
sqlTools <- as.data.frame(readHTMLTable(tableNodes[[1]]))

# save results to .xlsx file ##################################################
# save


# Bencmark R ##################################################################
library("microbenchmark")

## Example check usage
my_check <- function(values) {
  all(sapply(values[-1], function(x) identical(values[[1]], x)))
}

f <- function(a, b)
  2 + 2
a <- 2

microbenchmark(2 + 2, 2 + a, f(2, a), f(2, 2), check=my_check)

loginfo("start microbenchmark median(1:10^6)", logger = loggerName)
microbenchmark(median(1:10^6))
loginfo("start microbenchmark median(1:10^6)", logger = loggerName)

loginfo("end", logger = loggerName)
