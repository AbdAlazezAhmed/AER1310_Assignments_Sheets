#=
main:
- Julia version: 1.3.1
- Author: Abd Alaez Ahmed
- Date: 2020-03-22
=#
using Plots
pyplot()
P_SH = [0.01, 0.05, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1,1.5549]
P_SC = [1.5549,5,10,15,20,30,50]
V_SH = [21.8271,4.3566,2.1727 ,1.0807 ,0.7166 ,0.5345 ,0.4251 ,0.3522 ,0.3001 ,0.2609 ,0.2304 ,0.2060,0.1298]
V_SC = [0.001142,0.001156,0.001156 ,0.001156 ,0.001156 ,0.001156 ,0.001156]
V_WR = [0.001142,0.1298]
P_WR = [1.5549,1.5549]
function add(a,b)
    result = 0;
    for i = 1:length(a)-1
        result+=abs((a[i+1]-a[i])*(b[i]+b[i+1])/2)
    end
    return(result)
    end
println(add(V_SC,P_SC .*1000000))
println(add(V_WR,P_WR .*1000000))
println(add(V_SH,P_SH .*1000000))
println(add(V_SH,P_SH .*1000000)+add(V_WR,P_WR .*1000000)+add(V_SC,P_SC .*1000000))
println(add(V_WR,P_WR .*1000000)/(add(V_SH,P_SH .*1000000)+add(V_WR,P_WR .*1000000)+add(V_SC,P_SC .*1000000)))
plot(V_SC,log10.(P_SC))
plot!(V_SH,log10.(P_SH))
plot!(V_WR,log10.(P_WR))
savefig("log_PV")
plot(log10.(V_SC),log10.(P_SC))
plot!(log10.(V_SH),log10.(P_SH))
plot!(log10.(V_WR),log10.(P_WR))
savefig("D_log_PV")
plot(V_SC,log.(P_SC))
plot!(V_SH,log.(P_SH))
plot!(V_WR,log.(P_WR))
savefig("ln_PV")
plot(log.(V_SC),log.(P_SC))
plot!(log.(V_SH),log.(P_SH))
plot!(log.(V_WR),log.(P_WR))
savefig("D_ln_PV")
plot(V_SC,P_SC)
plot!(V_SH,P_SH)
plot!(V_WR,P_WR)
savefig("PV")
