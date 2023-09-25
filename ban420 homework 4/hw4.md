## Homework - T-tests and insurance claims data 

In the real world you will sometimes encounter data with strange distributions. One such example is insurance claims. For many insurance products, e.g. fire insurance, most customer will never have a claim. But occasionally a house may burn down, leading to a large claim. For the insurance industry it is vital that the expected claim cost is estimated correctly. 

To see what claims data can look like, we can use the "tweedie"-package. We can interpret an observation as the total claim cost for one insurance held for a full year. The arguments ``phi`` and ``power`` control the shape of the distribution, and ``mu`` is the expected value. You can verify with ``mean(rtweedie(n=100000, mu=10000, phi=1000, power=1.9))`` that the mean is indeed 10 000 (with some sampling randomness). 
```{r, eval=FALSE}
library(tweedie)
hist(
  rtweedie(n=1000, mu=10000, phi=100, power=1.9)
  )
```

The t-test can be used for testing hypotheses of the population mean from an observed sample. You may recall that the t-test requires that the sample mean, not the data itself, is normally distributed. If the samples are random, and the mean and standard deviation of the population exists, then the central limit theorem states that the sample mean *will* indeed be approximately normally distributed - *if the sample is large enough*. 

In this homework, we will investigate what "large enough sample" means in an insurance context. Specifically, let's check how often we falsely reject a true null hypothesis with differing sample sizes. If the t-test is applicable, we should reject the true null 5% of the time if we are using a 5% significance level. 

```{r, eval=FALSE}
t.test(rtweedie(100, mu=10000, phi=100, power=1.9),mu=10000)
```

This is a task particularly well suited for simulation. The idea is simply to simulate $M$ datasets, each with $N$ observations, and run the t.test on each one of the $M$ datasets. Given that we are simulating data we know what the true mean is, and hence, we can check how often we reject the true null. Again, with a $\alpha=5\%$ significance level we should expect to reject the null $\alpha M$ times. 

```{r, eval=FALSE}
t.test(rtweedie(100, mu=10000, phi=100, power=1.9),mu=10000)$p.value
```


* Assignment 1: Create a function ``simTweedieTest`` that takes N as argument. The function should simulate a data set with a tweedie-distribution with parameters ``mu=10000,phi=100,power=1.9``, and run a t-test on the simulated data using the null $\mu_0=10000$. The function should return the p-value of the test. 

* Assignment 2: Create a function ``MTweedieTests``, that takes ``M, N`` and ``alpha`` as arguments. This function should call the ``simTweedieTests`` function ``M`` times with a sample size of ``N``. The function ``MTweedieTests`` should then return percentage of tests where the P-value is lower than ``alpha`` (e.g. if we run tests on $M=10$ datasets, and have P-values lower than $\alpha=.05$ in two of the tests, the function should return 0.2). Hint: You will have to use the function ``replicate(M,fun(...)``. Replicate works well random number generating functions. 

* Assignment 3: Create a data frame ``tibble(N = c(10,100,1000,5000),M = 100,share_reject = NA)``. Use a loop and the ``MTweedieTests``-function to fill in the values in the ``share_reject``-column. Create a figure with ``N`` on the X-axis and ``share_reject`` on the Y-axis. What does this tell you of the validity of the t-test in on this specific distribution? What does "large enough sample" mean for this

* Assignment 4 (trickier): How general are the findings in assignment 3? And can we be sure we wrote the code correctly? If the data follows a normal instead of a tweedie distribution we should expect that the t-test works better at lower sample sizes. Create a figure similar to assignment 3, but with two curves: one for tweedie-distributed data and normally distributed data. You will have to rewrite the functions from assignment 1-3. Think carefully on how you structure the functions: avoid duplicating code, use sensible names for arguments and functions, and ensure that the mean of the data and the test is consistent. 