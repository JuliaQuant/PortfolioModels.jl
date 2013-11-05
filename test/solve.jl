#df = readtime(Pkg.dir("PortfolioModels/test/data/monthlies.csv"))
df = readtime(Pkg.dir("PortfolioModels/test/data/monthlies_parsable.csv"))

g  = globalmin(df)

@assert  0.456204551678408  == g[1,1] #  0.4562 from Zivot's derivation
@assert 0.2232518040053831  == g[1,2] #  0.2233  
#@assert 0.223251804005383  == g[1,2] #  0.2233  
@assert 0.05122725260835459 == g[1,3] #  0.0512   
@assert 0.2693163917078543   == g[1,4] #  0.2693 

# > muhat.vals
#    Boeing Nordstrom Starbucks Microsoft 
#  0.011300  0.001545  0.028461  0.042712 
