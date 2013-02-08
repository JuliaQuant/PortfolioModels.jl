using DataFrames, Calendar, UTF16, Thyme 

module Broth

using DataFrames, Calendar, UTF16, Thyme

export minvarport,
       stock_returns,

## testsuite macro
       @broth

include("preprocess.jl")
include("solve.jl")
include("build.jl")
include("testbroth.jl")

end 
