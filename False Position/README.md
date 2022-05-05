# False Position Algorithm

Algorithm that estimates the root of a function
Uses the False Position method


## Inputs
* func - function being evaluated
* xl - the lower guess
* xu - the upper guess
* es - desired relative error, default set to 0.0001% (stopping criteria)
* maxit - maximum number of iterations desired, default 200 (stopping criteria)
* varargin - additional parameters used by function **(unused in this code)

## Outputs
* root - estimated root location of function
* fx - function value at root location
* ea - approximate relative error (%)
* iter - number of iterations preformed
