# full analytic solution for 
# global minimum variance portfolio
# returns the tip of the bullet

function globalmin(df::DataFrame) #hard-coded for four assets

  df     = copy(df)
  names  = colnames(df)
  onevec = ones(ncol(df))
  sigma  = cov(df)
  port   = (sigma' * onevec) / (onevec' * sigma' * onevec)

  gminvar = DataFrame(quote
                     $(names[1]) = $port[1]              
                     $(names[2]) = $port[2]              
                     $(names[3]) = $port[3]              
                     $(names[4]) = $port[4]              
                      end)              
  gminvar
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
