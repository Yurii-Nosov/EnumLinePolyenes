module OutputGraphs

using ..CreateGraphs

using Plots

gr()


export showGraph2, showGraphHyd, showGraph2Wait, outputAllGraphsCC, outputAllGraphsHH



function  showGraph2(XG,YG)    
    #pts=plot(XG, YG, :path, :solid, 0.9, 4, color = :green,
    #showaxis = false, legend = false, aspect_ratio = :equal)
    pts=plot(XG, YG,ls = :solid,lw = 4,lc = :green, showaxis = false, 
    legend = false, aspect_ratio = :equal)
    scatter!(pts,XG, YG, mc = :black, ms = 7, ma = 0.9)
    display(pts)    
end

function  showGraph2Wait(XG,YG)
    #pts = plot(XG, YG,line = (:path, :solid,  0.5, 4, :green))
    pts = plot(XG,YG, ls = :solid, lw = 4, lc = :green,
    showaxis = false,legend = false,aspect_ratio = :equal)    
    x1 = 1;xe =2;  y1 = 1;ye =2; lngx = length(XG)
    for i = 1:(lngx-1)
        xgs = copy(XG[x1:1:xe])
        ygs = copy(YG[y1:1:ye])        
        plot!(pts,xgs, ygs, lc =:red)
        display(pts)
        xe += 1; ye += 1
    end
    display(pts)
end    


function showGraphHyd(edgHydro,XG,YG, XH,YH)
    pts = plot(XG, YG,ls =:solid, lw = 6, lc =:black)
    plot!(pts, showaxis = false, legend = false, aspect_ratio = :equal)    
    lnhdr = length(edgHydro)
    for j in 1:lnhdr    
        eh = edgHydro[j]
        v1=eh[1];
        v2=eh[2]
        x1=XG[v1]
        x2=XH[v2]
        y1=YG[v1]
        y2=YH[v2]
        LHX=[x1,x2]
        LHY=[y1,y2]
        plot!(pts,LHX, LHY, ls =:solid, lw = 6,lc =:blue)
    end
    scatter!(XH,YH, mc = :blue, ms = 6, ma = 0.65)
    scatter!(XG, YG, mc = :black, ms = 8, ma = 0.9)
    display(pts)    
end 

 

function outputAllGraphsCC(lstBcd)
    nmb = length(lstBcd) 
    for k in 1:nmb
        hvec=lstBcd[k]
        _,  XG, YG = makePolyenPathCC(hvec)
        showGraph2(XG,YG)
    end
end    

function outputAllGraphsHH(lstBcd)
    nmb = length(lstBcd)
    for k in 1:nmb
        hvec=lstBcd[k]
        _, edgHydro, XG, YG, XH,YH = makePolyenPathHH(hvec)
        showGraphHyd(edgHydro,XG,YG, XH,YH)
    end
end     

end