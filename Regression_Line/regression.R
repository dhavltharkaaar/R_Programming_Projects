attach(mtcars)
plot(wt,mpg)
abline(lm(mpg~wt))
title("Regression on MPG on weight")
