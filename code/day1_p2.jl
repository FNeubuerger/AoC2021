
using DelimitedFiles
using DataStructures
#read the data from the curled file
a = readdlm("../data/raw_input.txt", '\t', Int, '\n')
b = Vector{String}()
#set the first row as unchanged -> could be done with exception handling
push!(b,"(N/A - no previous measurement)")
# define sliding window
sliding_w = Vector{Int32}()
#calculate the sum over 3 rows for sliding window
for i in 3:length(a)
    sum = a[i-2] + a[i-1] + a[i]
    push!(sliding_w, sum)
end
#do the checking like in part 1
for i in 2:length(sliding_w)   
    if sliding_w[i] > sliding_w[i-1]
        push!(b,"(increased)")

    elseif sliding_w[i] < sliding_w[i-1]        
        push!(b,"(decreased)")

    else        
        push!(b,"(no change)")
    end
end  
#write the result to a file
open("../results/result_day1_p2.txt", "w") do io
    writedlm(io, b)
end
# count the number of changes
c = counter(b)
println(c)
println(c["(increased)"])