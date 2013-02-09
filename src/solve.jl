# full analytic solution for 
# global minimum variance portfolio
# returns the tip of the bullet

function globalmin(df::DataFrame) #hard-coded for four assets

  df     = copy(df)
  names  = colnames(df)
  onevec = ones(ncol(df))
  sigma  = cov(df)
  invsig = inv(sigma)
  port   = (invsig * onevec) / (onevec' * invsig * onevec)
  # port   = rowsums(DataArray(invsig)) / sum(invsig) # alternate method 

  gminvar = DataFrame(quote
                     $(names[1]) = $port[1]              
                     $(names[2]) = $port[2]              
                     $(names[3]) = $port[3]              
                     $(names[4]) = $port[4]              
                      end)              
  gminvar
end

function modelparams(df::AbstractDataFrame)
  df = copy(df)

  muhat  = mean(EachRow(df))
  #muhat  = float([mean(df[:,i]) for i in 1:ncol(df)])
  varhat = float([var(df[:,i]) for i in 1:ncol(df)])
  sdhat  = float([std(df[:,i]) for i in 1:ncol(df)])
  covmat = cov(df) 
  cormat = cor(df) 

  return muhat, varhat, sdhat, covmat, cormat
end

function efficient(x)
  #code here
end

function tangency(x)
  #code here
end

function frontier()
  #code here
end
