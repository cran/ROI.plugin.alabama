\name{Example-1}
\alias{Example-1}
\title{Banana}

\description{
The following example is also known as Rosenbrock's banana function 
(\url{https://en.wikipedia.org/wiki/Rosenbrock_function}).
\deqn{minimize \ f(x) = 100 (x_2 - x_1^2)^2 + (1 - x_1)^2}
Solution: \code{c(1, 1)}
}

\examples{
library(ROI)

f <- function(x) {
    return( 100 * (x[2] - x[1]^2)^2 + (1 - x[1])^2 )
}

f.gradient <- function(x) {
    return( c( -400 * x[1] * (x[2] - x[1] * x[1]) - 2 * (1 - x[1]),
               200 * (x[2] - x[1] * x[1])) )
}

x <- OP(objective = F_objective(f, n = 2L, G = f.gradient), 
        bounds = V_bound(li = 1:2, ui = 1:2, lb = c(-3, -3), ub = c(3,  3)))

nlp <- ROI_solve(x, solver = "alabama", start = c(-2, 2.4), method = "BFGS")
nlp
## Optimal solution found.
## The objective value is: 3.049556e-23
solution(nlp)
## [1] 1 1
}
