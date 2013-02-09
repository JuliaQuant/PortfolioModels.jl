d  = read_monthlies(Pkg.dir("Broth", "test", "data"), "monthlies.csv")
df = d[:, 2:end]

g  = globalmin(df)

@assert 0.4562045516784078   == g[1,1] #  0.4562 from Zivot's derivation
@assert 0.2232518040053832   == g[1,2] #  0.2233  
@assert 0.051227252608354694 == g[1,3] #  0.0512   
@assert 0.26931639170785443  == g[1,4] #  0.2693 


# > muhat.vals
#    Boeing Nordstrom Starbucks Microsoft 
#  0.011300  0.001545  0.028461  0.042712 
