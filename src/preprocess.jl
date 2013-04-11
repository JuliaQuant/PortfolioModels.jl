function read_yahoo_for_sixty_months(stock::String, fm::Int, fd::Int, fy::Int, tm::Int, td::Int, ty::Int, period::String)

# take care of yahoo's 0 indexing for month
  fm-=1
  tm-=1

  ydata     = readlines(`curl -s "http://ichart.finance.yahoo.com/table.csv?s=$stock&a=$fm&b=$fd&c=$fy&d=$tm&e=$td&f=$ty&g=$period"`)
  numstring = ydata[2:end]
  sa  = split(numstring[1], ',')'

  for i in 2:length(numstring) 
    sa  = [sa ; split(numstring[i], ',')']
  end

  time_conversion = map(x -> parse("yyyy-MM-dd", x), convert(Array{UTF16String}, sa[:,1]))

  df = DataFrame(quote
     Date  = $time_conversion
     Open  = float($sa[:,2])
     High  = float($sa[:,3])
     Low   = float($sa[:,4])
     Close = float($sa[:,5])
     Vol   =   int($sa[:,6])
     Adj   = float($sa[:,7])
     end)

  flipud(df)

end

# default to last three years, monthly data

read_yahoo_for_sixty_months(stock::String) = read_yahoo_for_sixty_months(stock::String, month(now()), day(now()), year(now())-5, month(now()),  day(now()), year(now()), "m")

function stock_returns{T <: Union(ASCIIString, UTF8String)}(list::Array{T})

  str1 = list[1]
  str2 = list[2]
  str3 = list[3]
  str4 = list[4]
  str5 = list[5]

  s1 = read_yahoo_for_sixty_months(list[1]) 
  s2 = read_yahoo_for_sixty_months(list[2]) 
  s3 = read_yahoo_for_sixty_months(list[3]) 
  s4 = read_yahoo_for_sixty_months(list[4]) 
  s5 = read_yahoo_for_sixty_months(list[5]) 

  r1 = log_return(s1["Adj"])
  r2 = log_return(s2["Adj"])
  r3 = log_return(s3["Adj"])
  r4 = log_return(s4["Adj"])
  r5 = log_return(s5["Adj"])

  df = DataFrame(quote
                 $str1 = $r1 
                 $str2 = $r2 
                 $str3 = $r3 
                 $str4 = $r4 
                 $str5 = $r5 
                 end)
  df[2:end, :]
end

function read_monthlies(filename::String)

df  = read_table(filename)
time_conversion =  Calendar.parse("MMM-yy", df[:,1]) 

within!(df, quote
        Date = $(time_conversion)
        end)

#flipud(df)
end

function read_yahoo(stock::String, fm::Int, fd::Int, fy::Int, tm::Int, td::Int, ty::Int, period::String)

# take care of yahoo's 0 indexing for month
  fm-=1
  tm-=1

  ydata = readlines(`curl -s "http://ichart.finance.yahoo.com/table.csv?s=$stock&a=$fm&b=$fd&c=$fy&d=$tm&e=$td&f=$ty&g=$period"`)
  numstring = ydata[2:end]
  sa  = split(numstring[1], ',')'

  for i in 2:length(numstring) 
    sa  = [sa ; split(numstring[i], ',')']
  end

  time_conversion = map(x -> parse("yyyy-MM-dd", x), convert(Array{UTF16String}, sa[:,1]))

  df = DataFrame(quote
     Date  = $time_conversion
     Open  = float($sa[:,2])
     High  = float($sa[:,3])
     Low   = float($sa[:,4])
     Close = float($sa[:,5])
     Vol   =   int($sa[:,6])
     Adj   = float($sa[:,7])
     end)

  flipud(df)
end

# default to last three years, daily data
read_yahoo(stock::String) = read_yahoo(stock::String, month(now()), day(now()), year(now())-3, month(now()),  day(now()), year(now()), "d")
