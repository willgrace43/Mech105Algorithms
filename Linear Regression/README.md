# Linear Regression

Matlab function that filters data sets and then calculates the linear regression and R^2 value. Utilizes the minitab method from Wolfram Mathworld to calculate the interquartile range.

## Inputs
* x - array containing all x-values from data set
* y - array containing all y-values from data set

## Outputs
* fX - filtered x-values, order based off of sorted y-values
* fY - filtered y-values, sorted from smallest to largest
* slope - slope from linear regression
* intercept - intercept from linear regression
* Rsquared - R^2 value, computed using computer optimized formula for R
