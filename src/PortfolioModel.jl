using DataFrames, Calendar, UTF16, TimeSeries

module PortfolioModel 

using DataFrames, Calendar, UTF16, TimeSeries

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
       @portfolio

include("preprocess.jl")
include("solve.jl")
include("build.jl")
include("testportfoliomodel.jl")

end 
