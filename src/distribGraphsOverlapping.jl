module DistribGraphsOverlapping

using ..AllSmallParts
using ..CreateGraphs

export npov, lngDistr, selectIntersect, showAllGraphsOverlap, showSelectGraphsOverlap
export calcDistrAllGraphsOverlap, outputDistrGraphsOverlap



### determining the number of paired overlays in a power k overlapping

function npov(k::Int64)
    if isodd(k) == true
        res = div(k-1, 2) * k
    elseif iseven(k) == true
        res = div(k, 2) * (k-1) 
    end
end          



function lngDistr(n::Int64)
    p = div(n,12); q = rem(n, 12)    
    ndst = (12-q)*npov(p) + q*npov(p+1) + 2   #### новое
    return ndst
end    



function selectIntersect(XG, YG)
    kin = 0    
    q = length(XG)
    for i in 1:q
        fr = i+1
        x1 = abs(XG[i])
        y1 = abs(YG[i])
        for j in fr:q
            x2 = abs(XG[j])
            y2 = abs(YG[j])
            dlx = abs(x1-x2)
            dly = abs(y1-y2)
            if (dlx <= 0.000001) && (dly <= 0.000001)
                kin += 1                
            end 
        end
    end
    return kin
end            


function showAllGraphsOverlap(lstBcd)
    res = 0; nbd = 0 
    global Ns = 0    
    lngh = length(lstBcd)    
    for k in 1:1:lngh
        res = 0        
        hvc = lstBcd[k]                 
        _, XG, YG = makePolyenPathCC(hvc)
        res = selectIntersect(XG, YG)
        if res != 0 
            nbd += 1
            global Ns += 1
            println(" ***** Ns ", Ns, "  k  ", k," res   ", res, "  hvc  ", hvc)
            showGraph2(XG,YG)
        end        
    end
    println(" количество графов с наложениями  ", nbd)
end        



function showSelectGraphsOverlap(lstBcd,npf::Int64)
    res = 0; nbd = 0 
    global Ns = 0    
    lngh = length(lstBcd)    
    for k in 1:1:lngh
        res = 0        
        hvc = lstBcd[k]                 
        _, XG, YG = makePolyenPathCC(hvc)
        res = selectIntersect(XG, YG)
        if res >= npf 
            nbd += 1           
            global Ns += 1
            println(" ***** Ns ", Ns, "  k  ", k," res   ", res, "  hvc  ", hvc)
            showGraph2(XG,YG)
        end        
    end
    println(" кол-во графов ", nbd, "  с наложениями мощностью не менее ", npf)
end        


 function calcDistrAllGraphsOverlap(lstBcd)
    res = 0 
    n = length(lstBcd[1]) + 2 
    lngDno = lngDistr(n) + 2
    distNumOverlap = fill(0,lngDno)        
    lngh = length(lstBcd)    
    for k in 1:1:lngh
        res = 0        
        hvc = lstBcd[k]        
        _, XG, YG = makePolyenPathCC(hvc)
        res = selectIntersect(XG, YG)
        if res >= 0            
            distNumOverlap[res + 1] += 1                                
        end        
    end
    return distNumOverlap
end 



function outputDistrGraphsOverlap(distNumOverlap)
    numNonOver = distNumOverlap[1]; 
    numWithOver = sum(distNumOverlap) - numNonOver
    sumProv = sum(distNumOverlap)
    dnov = numNonOver/sumProv *100.; dwt = numWithOver/sumProv*100.
    println(" всего ", sumProv," без наложений  ", numNonOver, "  с наложениями  ", numWithOver)
    println(" доля графов без наложнений в % ",  dnov, "  доля графов с наложениями в % ", dwt)
    println(" распределение числа графов по кол-ву наложений  ",  distNumOverlap)    
end    

end