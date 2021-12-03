
using DelimitedFiles
using DataFrames
using CSV

df = CSV.read("../data/day2.txt", DataFrame, delim=" ", header=false)

gdf = groupby(df, [:1])
df2 = combine(gdf, :2 => sum)
println(df2)

depth = df2.Column2_sum[2]- df2.Column2_sum[3]
println(depth*df2.Column2_sum[1])
