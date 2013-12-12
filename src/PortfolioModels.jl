using DataFrames, Datetime, TimeSeries

module PortfolioModels

using DataFrames, Datetime, TimeSeries

type Portfolio
  mean
  var
  std
  covmat
  cormat
  weights
end

export Portfolio, 
       stock_returns,
       read_monthlies,
       modelparams,
       globalmin,
       efficient,
       tangency,
       frontier,
       build_globalmin,
       build_efficient,
       build_tangency,

## testsuite macro
       @portfoliomodels

include("preprocess.jl")
include("solve.jl")
include("build.jl")
include("../test/testmacro.jl")

end 
