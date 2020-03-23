#=
main:
- Julia version: 1.3.1
- Author: Abd Alaez Ahmed
- Date: 2020-03-22
=#
using Plots
pyplot()
Z_SH = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,0]
Z_SC = [0,0,0,0,0,0,0]
Z_WR = [0,0]
P_SH = [0.01, 0.05, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1,1.5549]
P_SC = [1.5549,5,10,15,20,30,50]
V_SH = [21.8271,4.3566,2.1727 ,1.0807 ,0.7166 ,0.5345 ,0.4251 ,0.3522 ,0.3001 ,0.2609 ,0.2304 ,0.2060,0.1298]
V_SC = [0.001142,0.001156,0.001156 ,0.001156 ,0.001156 ,0.001156 ,0.001156]
V_WR = [0.001142,0.1298]
P_WR = [1.5549,1.5549]
function add(a,b)
    result = 0;
    for i = 1:length(a)-1
        result+=abs(a[i+1]-a[i])*(b[i]+b[i+1])/2
    end
    return(result)
    end
println(add(V_SC,P_SC .*1000000))
println(add(V_WR,P_WR .*1000000))
println(add(V_SH,P_SH .*1000000))
println(add(V_SH,P_SH .*1000000)+add(V_WR,P_WR .*1000000)+add(V_SC,P_SC .*1000000))
println(add(V_WR,P_WR .*1000000)/(add(V_SH,P_SH .*1000000)+add(V_WR,P_WR .*1000000)+add(V_SC,P_SC .*1000000)))
println(add(log.(V_SC),exp.(log.(P_SC .*1000000) + log.(V_SC))))
println(add(log.(V_WR),exp.(log.(P_WR .*1000000) + log.(V_WR))))
println(add(log.(V_SH),exp.(log.(P_SH .*1000000) + log.(V_SH))))
println(exp(log(22)))
plot(V_SC,log10.(P_SC),label="Subcooled",line=(:solid,3,:blue))
plot!(V_WR,log10.(P_WR),label="Wet",line=(:solid,3,:green))
plot!(V_SH,log10.(P_SH),label="Superheated",line=(:solid,3,:red))
# plot!(V_SC,log10.(P_SC), ribbon=(log10.(P_SC),Z_SC), lab="estimate")
# plot!(V_WR,log10.(P_WR), ribbon=(log10.(P_WR),Z_WR), lab="estimate")
# plot!(V_SH,log10.(P_SH), ribbon=(log10.(P_SH),Z_SH), lab="estimate")
ylabel!("Log(P)")
xlabel!("V:(m^3)")
savefig("log_PV")
plot(log10.(V_SC),log10.(P_SC),label="Subcooled",line=(:solid,3,:blue))
plot!(log10.(V_WR),log10.(P_WR),label="Wet",line=(:solid,3,:green))
plot!(log10.(V_SH),log10.(P_SH),label="Superheated",line=(:solid,3,:red))
# plot!(log10.(V_SC),log10.(P_SC), ribbon=(log10.(P_SC),Z_SC), lab="estimate")
# plot!(log10.(V_WR),log10.(P_WR), ribbon=(log10.(P_WR),Z_WR), lab="estimate")
# plot!(log10.(V_SH),log10.(P_SH), ribbon=(log10.(P_SH),Z_SH), lab="estimate")
ylabel!("Log(P)")
xlabel!("Log(V)")
savefig("D_log_PV")
plot(V_SC,log.(P_SC),label="Subcooled",line=(:solid,3,:blue))
plot!(V_WR,log.(P_WR),label="Wet",line=(:solid,3,:green))
plot!(V_SH,log.(P_SH),label="Superheated",line=(:solid,3,:red))
# plot!(V_SC,log.(P_SC), ribbon=(log.(P_SC),Z_SC), lab="estimate")
# plot!(V_WR,log.(P_WR), ribbon=(log.(P_WR),Z_WR), lab="estimate")
# plot!(V_SH,log.(P_SH), ribbon=(log.(P_SH),Z_SH), lab="estimate")
ylabel!("Ln(P)")
xlabel!("V:(m^3)")
savefig("ln_PV")
plot(log.(V_SC),log.(P_SC),label="Subcooled",line=(:solid,3,:blue))
plot!(log.(V_WR),log.(P_WR),label="Wet",line=(:solid,3,:green))
plot!(log.(V_SH),log.(P_SH),label="Superheated",line=(:solid,3,:red))
# plot!(log.(V_SC),log.(P_SC), ribbon=(log.(P_SC),Z_SC), lab="estimate")
# plot!(log.(V_WR),log.(P_WR), ribbon=(log.(P_WR),Z_WR), lab="estimate")
# plot!(log.(V_SH),log.(P_SH), ribbon=(log.(P_SH),Z_SH), lab="estimate")
ylabel!("Ln(P)")
xlabel!("Ln(V)")
savefig("D_ln_PV")
plot(V_SC,P_SC,label="Subcooled",line=(:solid,3,:blue))
plot!(V_WR,P_WR,label="Wet",line=(:solid,3,:green))
plot!(V_SH,P_SH,label="Superheated",line=(:solid,3,:red))
# plot!(V_SC,P_SC, ribbon=(P_SC,Z_SC), lab="estimate")
# plot!(V_WR,P_WR, ribbon=(P_WR,Z_WR), lab="estimate")
# plot!(V_SH,P_SH, ribbon=(P_SH,Z_SH), lab="estimate")
ylabel!("P:(MPa)")
xlabel!("V:(m^3)")
savefig("PV")
