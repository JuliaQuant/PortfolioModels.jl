function build_globalmin{T <: Union(ASCIIString, UTF8String)}(list::Array{T})

  stocks  = stock_returns(list)
  params  = modelparams(stocks)
  weights = rowsums(DataArray(inv(params[5]))) / sum(inv(params[5]))

  port = Portfolio(params[1],
                   params[2],
                   params[3],
                   params[4],
                   params[5],
                   weights)
  port
end

function build_efficient(x)
  #code here
end

function build_tangency(x)
  #code here
end
