# full analytic solution for 
# global minimum variance portfolio
# returns the tip of the bullet

function globalmin(df::DataFrame) 

  df     = copy(df)
  names  = colnames(df)
  onevec = ones(size(df, 2)-1)
  sigma  = cov(df)
  invsig = inv(sigma)
  port   = (invsig * onevec) / (onevec' * invsig * onevec)
  # port   = rowsums(DataArray(invsig)) / sum(invsig) # alternate method 

  gminvar = DataFrame()

  for i in 2:length(names)
    colname  = names[i]
    within!(gminvar, :($colname = $port[$i-1]))
  end

  gminvar
end

function modelparams(df::AbstractDataFrame)
  df = copy(df)

  muhat  = mean(EachRow(df))
  #muhat  = float([mean(df[:,i]) for i in 1:size(df, 2)])
  varhat = float([var(df[:,i]) for i in 1:size(df, 2)])
  sdhat  = float([std(df[:,i]) for i in 1:size(df, 2)])
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
