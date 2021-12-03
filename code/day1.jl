
using DelimitedFiles
using DataStructures
#read the data from the curled file
a = readdlm("../data/raw_input.txt", '\t', Int, '\n')
b = Vector{String}()
#set the first row as unchanged -> could be done with exception handling
push!(b,"(N/A - no previous measurement)")
# check if value increased or decreased
for i in 2:length(a)   
    if a[i] > a[i-1]
        push!(b,"(increased)")

    elseif a[i] < a[i-1]        
        push!(b,"(decreased)")

    else        
        push!(b,"(unchanged)")
    end
end  
# save the result to a file
open("../results/result_day1.txt", "w") do io
    writedlm(io, b)
end
# count the occurences
c = counter(b)
println(c)
println(c["(increased)"])