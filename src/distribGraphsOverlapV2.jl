module DistribGraphsOverlapV2

using ..AllSmallParts
using ..CreateGraphs

export makeMolGraphAll,makeMolGraphClass,makeMolGraphCOI,checkYeh2,checkYeh,molGraphYeh
export intersect, calcInts, enumerInters


function makeMolGraphAll(n::Int64)
    m = n-3
    kf = 2^m
    xx = (IntgDig(k-1, m) for k in 1:kf)
    y = (x for x in xx if checkMinFromZE(x)== true)
    return y
end

 

function makeMolGraphClass(n::Int64, cls::Int64)
    m = n-3
    kf = 2^m
    xx = (IntgDig(k-1, m) for k in 1:kf)
    yy = (x for x in xx if checkMinFromZE(x)== true)
    z = (inZEtoBcd(y) for y in yy if graphTypeFromZE(y)== cls)
end

 

function makeMolGraphCOI(n::Int64)
    m = n-3
    kf = 2^m
    xx = (IntgDig(k-1, m) for k in 1:kf)
    yy = (x for x in xx if checkMinFromZE(x)== true)
    z = (inZEtoBcd(y) for y in yy if graphTypeFromZE(y)== 3)
end

 

function checkYeh2(bcd)
    res = false
    st51 = string(1,1,1,1,1); st41 = string(1,1,1,1)
    st50 = string(0,0,0,0,0);  st40 = string(0,0,0,0)
    vcstr = map(string, bcd)
    strbcd = join(vcstr)
    if !occursin(st51, strbcd) && !occursin(st50, strbcd)                                   
        #vcstr = map(string, bcd)
        #strbcd = join(vcstr)
        if !occursin(st41, strbcd) && !occursin(st40, strbcd)
            return true
        else
            return false                        
        end
    else 
        return false                    
    end 
end    

 

function checkYeh(bcd)
    st41 = string(1,1,1,1)
    st40 = string(0,0,0,0)
    vcstr = map(string, bcd)
    strbcd = join(vcstr)    
    if !occursin(st41, strbcd) && !occursin(st40, strbcd)
        return true
    else
        return false                        
    end     
end
  
 

function molGraphYeh(n::Int64)
    xx = makeMolGraphCOI(n)
    yy = (y for y in xx if checkYeh(y)== true)
end 



function intersect(bcd)
    _, x, y = makePolyenPathCC(bcd)
    lngX = length(x); lngY = length(y)
    lstNIns = (calcInts(x,y,i,j) for i in 1:lngX  for j in (i+1):lngY)
    numIns = sum(lstNIns)
    return numIns
end 

 

function calcInts(X,Y,i,j)
    x1 =X[i]; y1 = Y[i]
    x2 =X[j]; y2 = Y[j]
    if abs(x1-x2) <= 0.0001 && abs(y1-y2) <= 0.0001
        return   1
    else
        return 0
    end          
end    

 

function  enumerInters(lstGrpYeh,n::Int64)
    #distrNumIntAccm = [0 for k in 1:n]
    distrNumIntAccm = fill(0, n)
    for (i,gy) in enumerate(lstGrpYeh)
        nmi = intersect(gy) 
        distrNumIntAccm[nmi+1] += 1
    end
    sumNIA = sum(distrNumIntAccm)
    prcNiaNul = (distrNumIntAccm[1]/sumNIA)*100
    return  distrNumIntAccm, sumNIA, prcNiaNul
end 


end
 