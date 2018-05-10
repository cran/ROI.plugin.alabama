\encoding{utf-8}

%% check says: \bold is invalid in a \code block
%% \newcommand{\codebf}{\code{\bold{#1}}}

\name{control}
\docType{package}
\alias{control-parameters}

\title{alabama}

\description{
This package provides a \pkg{ROI} plugin to the \pkg{alabama}
package. The following description of the control parameters
is mostly copied from the \pkg{alabama} manual.

\itemize{
    \item[\code{start}:]{
        The initial values for the parameter vector.
    }

    \item[\code{method}:]{
        Unconstrained optimization algorithm for inner loop optimization. 
        Allowed values are \code{"Nelder-Mead"}, \code{"BFGS"}, \code{"CG"}, 
        \code{"L-BFGS-B"}, \code{"SANN"}, \code{"Brent"} and \code{"nlminb"}.
    }

    \item[\code{lam0}:]{
        Initial value for the Lagrangian parameter. 
    }

    \item[\code{sig0}:]{
        A scaling parameter for penalty term that is augmented to the
        Lagrangian.
    }

    \item[\code{tol}:]{
        Tolerance for convergence of outer iterations of the barrier and/or 
        augmented lagrangian algorithm
    }

    \item[\code{max_iter}:]{
        Maximum number of outer iterations.
    }

    \item[\code{ilack.max}:]{
        Maximum number of outer iterations where no change in parameters is 
        tolerated.
    }

    \item[\code{verbose}:]{
        A logical variable indicating whether information on outer iterations should be printed out. If \code{TRUE}, at each outer iteration information is displayed on: (i) how well the inequality and equalities are satisfied, (ii) current parameter values, and (iii) current objective function value.
    }

    \item[\code{NMinit}:]{
        A logical variable indicating whether \code{"Nelder-Mead"} algorithm 
        should be used for the first outer iteration.
    }

    \item[\code{i.scale}:]{
        A vector of length equal to number of inequalities that may be used to scale the inequalities or it can be a scalar in which case all the inequalities are scaled by the same value.
    }

    \item[\code{e.scale}:]{
        A vector of length equal to number of equalities that may be used to scale the equalities or it can be a scalar in which case all the equalities are scaled by the same value. 
    }

    \item[\code{kkt2.check}:]{
        A logical variable (\code{TRUE}/\code{FALSE}) indicating whether the second-order KKT condition should be checked.  Deafult is TRUE.  It may be set to FALSE in problems where the Hessian computation can b etime consuming. 
    }

    \item[\code{control.optim}:]{
        A list of control parameters to be used by the unconstrained optimization algorithm in the inner loop. Identical to that used in \pkg{optim} or in \pkg{nlminb}.
    }
}

}

\examples{
library(ROI)

n <- 2L
x <- OP(F_objective(sum, n = n), 
        bounds = V_bound(nobj = 2, ld = -1, ud = 1))

control_optim <- list(trace = 0, fnscale = 1, parscale = rep.int(1, n), 
                      ndeps = rep.int(0.001, n), maxit = 100L, abstol = -Inf, 
                      reltol = sqrt(.Machine$double.eps), alpha = 1, 
                      beta = 0.5, gamma = 2, REPORT = 10, type = 1, lmm = 5,
                      factr = 1e+07, pgtol = 0, tmax = 10, temp = 10)

control <- list(start = c(0, 0), method = "BFGS", lam0 = 10, sig0 = 100,  
                tol = 1e-07, max_iter = 50, verbose = FALSE, NMinit = FALSE, 
                ilack.max = 6, i.scale = 1, e.scale = 1, kkt2.check = TRUE,
                control.optim = control_optim)

s <- ROI_solve(x, solver = "alabama", control)
}

\references{
Ravi Varadhan (2015). alabama: Constrained Nonlinear Optimization. 
R package version 2015.3-1. https://CRAN.R-project.org/package=alabama
}
