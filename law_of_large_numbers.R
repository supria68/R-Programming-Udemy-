# R Programming: assignment - 1
# Test the Law Of Large Numbers for N random normally distributed numbers with mean = 0, stdev = 1:
# Create an R script that will count how many of these numbers fall between -1 and 1
# and divide by the total quantity of N
# You know that E(X) = 68.2%
# Check that Mean(X) -> E(X) as you rerun your script while increasing N

N <- 1000 #sample size
count <- 0 #keeps a count of numbers fall between -1 and 1

for (i in rnorm(N)){
  if (i <= 1 & i >= -1){
    count <- count + 1
  }
}

result = count / N
result
# As N increases (1000, 10000, 100000,...) the result reaches the expected mean 68.2%