module VerificationGeometry

using ..CreateGraphs

export calcAngles, calcAngles2,scheckValues,calcLengthCC,calcLengthCH,scheckLength
export analyzLengthCC,analyzLengthHydCC,analyzLengthCH, fromLstAnglesToBCode
export fromBCodeToLstAngles, fromLstAnglesToBCode

## Analyz angles

function calcAngles(XG,YG)
    lngX =length(XG)
    lstFid = []; ffi = 0
    for i in 1:1:(lngX - 2)
        x1 = XG[i]; y1 =YG[i]
        x2 = XG[i+1]; y2 =YG[i+1]
        x3 = XG[i+2]; y3 =YG[i+2]
        X1 = x2 - x1; Y1 =y2 - y1
        X2 =x3 - x2; Y2 =y3 - y2
        X3 = X1 + X2; Y3 = Y1 +Y2
        scalProd13 = X1*X3 + Y1*Y3
        skewProd13 = X1*Y3 - X3*Y1
        scalProd23 = X2*X3 + Y2*Y3
        skewProd23 = X2*Y3 - X3*Y2
        ffi13 = angleFromProd(scalProd13, skewProd13)
        ffi23 = angleFromProd(scalProd23, skewProd23)
        #println(" ffi13 " ,ffi13," ffi23   ", ffi23)
        ffi = pi -abs(ffi13) -abs(ffi23)
        if sign(ffi13) > 0 
            fid = -ffi*180/pi
        else 
            fid = ffi*180/pi
        end    
        push!(lstFid, fid)
    end
    return lstFid          
end    

function angleFromProd(scalProd, skewProd)
    if scalProd == 0 && skewProd > 0
        ffi = pi/2
    elseif  scalProd == 0 && skewProd < 0 
        ffi = -pi/2
    elseif  scalProd > 0 
        ffi = atan(skewProd/scalProd)  
    elseif scalProd < 0 && skewProd >= 0 
        ffi = atan(skewProd/scalProd) + pi 
    elseif scalProd < 0 && skewProd < 0
        ffi = atan(skewProd/scalProd) - pi
    end
    return ffi
end    


function calcAngles2(XG,YG)
    lngX =length(XG)
    lstFid = []; ffi = 0; fid = 0
    for i in 1:1:(lngX - 2)
        x1 = XG[i]; y1 =YG[i]
        x2 = XG[i+1]; y2 =YG[i+1]
        x3 = XG[i+2]; y3 =YG[i+2]
        X1 = x2 - x1; Y1 =y2 - y1
        X2 =x3 - x2; Y2 =y3 - y2
        X3 = X1 + X2; Y3 = Y1 + Y2        
        scalProd13 = X1*X3 + Y1*Y3
        scalProd23 = X2*X3 + Y2*Y3
        mdX1 = sqrt(X1^2 +Y1^2)
        mdX2 = sqrt(X2^2 +Y2^2)
        mdX3 = sqrt(X3^2 +Y3^2)
        ffi13 = acos(scalProd13/(mdX1*mdX3))
        ffi23 = acos(scalProd23/(mdX2*mdX3))
        ffi = pi - ffi13 - ffi23
        fid = ffi*180/pi
        push!(lstFid, fid)
    end
    return lstFid          
end


function scheckValues(lstValues, etl)
    lstMtk = []; mtk = 0
    for val in lstValues
        vls = abs(val)    
        if abs(etl - vls) < 0.000001
            mtk = 0
        else 
            mtk = 1
        end
        push!(lstMtk,mtk)  
    end
    sum(lstMtk)
end 

function analyzAngleHydCC(funcGen,n,etl)
    lstBcd = funcGen(n)
    lstMtk = [ ]; lstAngl = []; mtk = 0
    for bcd in lstBcd
        _,_, XG,YG, _,_ = makePolyenPathHH(bcd)
        lstAngl = calcAngles(XG,YG)
        mtk = scheckValues(lstAngl, etl)
        push!(lstMtk, mtk)
    end    
    return lstMtk
end    



function analyzAngleCC(funcGen,n, etl)
    lstBcd = funcGen(n)
    lstMtk = [ ]; lstAngl = []; mtk = 0
    for bcd in lstBcd
        _,XG,YG = makePolyenPathCC(bcd)
        lstAngl = calcAngles(XG,YG)        
        mtk = scheckValues(lstAngl, etl)
        push!(lstMtk, mtk)
    end    
    return lstMtk
end  


##   Analyz length  ********************************


function calcLengthCC(XG,YG)    
    lngX =length(XG)
    lstLng = []; lng = 0
    for i in 1:1:(lngX - 1)
        x1 = XG[i]; y1 = YG[i]
        x2 = XG[i+1]; y2 = YG[i+1]
        lng = sqrt((x2-x1)^2 + (y2 - y1)^2)
        push!(lstLng, lng)
    end
    return lstLng
end



function calcLengthCH(edgHydro,XG,YG, XH,YH)
    lnhdr = length(edgHydro)
    lstLngCH = []
    for j in 1:lnhdr    
        eh = edgHydro[j]
        v1=eh[1]; v2=eh[2]
        x1=XG[v1]; x2=XH[v2]
        y1=YG[v1]; y2=YH[v2]
        LHX =(x2 - x1); LHY = (y2 - y1)
        lngCH = sqrt(LHX^2 + LHY^2)
        push!(lstLngCH, lngCH)
    end
    return lstLngCH 

end


function analyzLengthCC(funcGen,n,etln)
    lstBcd = funcGen(n)
    lstMtk = [ ]; mtk = 0
    for bcd in lstBcd
        _, XG,YG = makePolyenPathCC(bcd)
        lstLng = calcLengthCC(XG,YG)
        #println(" lstLng  \n ",lstLng)
        mtk = scheckValues(lstLng,etln)
        push!(lstMtk, mtk)
    end    
    return lstMtk
end    

function analyzLengthHydCC(funcGen,n,etln)
    lstBcd = funcGen(n)
    lstMtk = [ ]; mtk = 0
    for bcd in lstBcd
        _,_, XG,YG, _,_ = makePolyenPathHH(bcd)
        lstLng = calcLengthCC(XG,YG)
        #println(" lstLng  \n ",lstLng)
        mtk = scheckValues(lstLng,etln)
        push!(lstMtk, mtk)
    end    
    return lstMtk
end    



function analyzLengthCH(funcGen,n,etln)
    lstBcd = funcGen(n)
    lstMtk = [ ]; mtk = 0
    for bcd in lstBcd
        _,edgHydro, XG,YG, XH,YH = makePolyenPathHH(bcd)
        lstLng = calcLengthCH(edgHydro,XG,YG, XH,YH)
        #println(" lstLng  \n ",lstLng)
        mtk = scheckValues(lstLng,etln)
        push!(lstMtk, mtk)
    end    
    return lstMtk
end  

function fromLstAnglesToBCode(lstAngles)
    map(x->sign(x)==1 ? 1 : 0, lstAngles)
end    

function fromBCodeToLstAngles(bcd,type)
    if type == 1
        _,XG,YG = makePolyenPathCC(bcd)
        lstAngl = calcAngles(XG,YG)
    elseif type == 2
        _,_, XG,YG, _,_ = makePolyenPathHH(bcd)
        lstAngl = calcAngles(XG,YG)
    else 
        _,XG,YG = makePolyenPathCC(bcd)
        lstAngl = calcAngles(XG,YG)        
    end
end 

end