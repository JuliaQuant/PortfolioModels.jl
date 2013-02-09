using DataFrames, Calendar, UTF16, Thyme 

module Broth

using DataFrames, Calendar, UTF16, Thyme

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
       @broth

include("preprocess.jl")
include("solve.jl")
include("build.jl")
include("testbroth.jl")

end 
