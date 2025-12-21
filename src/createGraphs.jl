module CreateGraphs

export makePolyenPathCC, makePolyenPathHH 

## generation volecular graphs depleted  hydrogen atoms

function makePolyenPathCC(hvec)
    global  XG, YG 
    global L, dY, dX 
    L = 1.44 
    dY = L*0.5; dX = L*sqrt(3)/2  
    sedge = Set([[1, 2]])
    oldVer = 2
    lenhv = length(hvec)
    n = lenhv + 2    
    newver = 0    
    XG, YG = initCoordCC(hvec)    
    for i in 1:lenhv        
        newver = oldVer + 1        
        rebroCC = [oldVer,newver]        
        push!(sedge, rebroCC)                
        geometryPCC(i, oldVer,hvec, n)
        oldVer = newver
    end    
    sedge = sort(collect(sedge))
    return sedge,  XG, YG 
end  



function initCoordCC(hvec)
    global L, dY, dX    
    xv1 =  7.1023; yv1 = 3.3107  ## инициализация координат первых двух вершин ат углерода
    xv2 =  xv1 +  dX
    yv2 =  yv1 +  dY    
    dYR = dY; dXR = -dX
    dYL = -L; dXL = 0     
    XG = [xv1,xv2]
    YG = [yv1,yv2]    
    return  XG,YG
end    


function geometryPCC(ist, numVer,hvec, n::Int64)
    global  XG, YG 
    global L, dY, dX     
    XVA = XG[numVer-1];   XVB = XG[numVer]
    YVA = YG[numVer-1];   YVB = YG[numVer]    
    if (XVA < XVB) && (YVA < YVB)  #  VAR 1
        dYR = -dY; dXR = dX 
        dYL = L; dXL = 0       
    elseif (XVA > XVB) && (YVA > YVB) #  VAR 2
        dYR = dY; dXR = -dX 
        dYL = -L; dXL = 0 
    elseif (XVA > XVB) && (YVA < YVB)  #  VAR 3 
        dYR = L; dXR = 0 
        dYL = -dY; dXL = -dX 
    elseif (XVA < XVB) && (YVA > YVB)   #  VAR 4
        dYR = -L; dXR = 0 
        dYL = dY; dXL = dX 
    elseif (XVA == XVB) && (YVA < YVB)  #  VAR 5
        dYR = dY; dXR = dX 
        dYL = dY; dXL = -dX 
    elseif (XVA == XVB) && (YVA > YVB)   #  VAR 6
        dYR = -dY; dXR = -dX 
        dYL = -dY; dXL = dX 
    end
    if numVer < n
        if (hvec[ist] == 0)            
		    x = XVB + dXL; y = YVB + dYL            
        else
            x = XVB + dXR; y = YVB + dYR            		
        end
        push!(XG, x); push!(YG, y)
     end    
end    



## generation volecular graphs wih hydrogen atoms *************************************


function initCoordHH(hvec)
    global L,LH, dY, dX, dYH, dXH    
    xv1 =  7.1023; yv1 = 3.3107  ## инициализация координат первых двух вершин ат углерода
    xv2 =  xv1 +  dX
    yv2 =  yv1 +  dY
    ## инициализация координат первых двух вершин атомов водорода    
    dYR = dY; dXR = -dX
    dYL = -L; dXL = 0   
    if (hvec[1] == 0)
        xh1 = xv1 + 0.75*dXR; yh1 = yv1 + 0.75*dYR
		xh2 = xv1 + 0.75*dXL; yh2 = yv1 + 0.75*dYL        		
    else
        xh1 = xv1 + 0.75*dXL; yh1 = yv1 + 0.75*dYL
        xh2 = xv1 + 0.75*dXR; yh2 = yv1 + 0.75*dYR		       
    end
    XG = [xv1,xv2]
    YG = [yv1,yv2]
    XH = [xh1,xh2]
    YH = [yh1,yh2]
    return  XG,YG, XH,YH
end    



function geometryPHH(ist, numVer,hvec, n::Int64)
    global  XG, YG, XH,YH 
    global L,LH, dY, dX, dYH, dXH     
    XVA = XG[numVer-1];   XVB = XG[numVer]
    YVA = YG[numVer-1];   YVB = YG[numVer]    
    if (XVA < XVB) && (YVA < YVB)  #  VAR 1
        dYR = -dY; dXR = dX 
        dYL = L; dXL = 0       
    elseif (XVA > XVB) && (YVA > YVB) #  VAR 2
        dYR = dY; dXR = -dX 
        dYL = -L; dXL = 0 
    elseif (XVA > XVB) && (YVA < YVB)  #  VAR 3 
        dYR = L; dXR = 0 
        dYL = -dY; dXL = -dX 
    elseif (XVA < XVB) && (YVA > YVB)   #  VAR 4
        dYR = -L; dXR = 0 
        dYL = dY; dXL = dX 
    elseif (XVA == XVB) && (YVA < YVB)  #  VAR 5
        dYR = dY; dXR = dX 
        dYL = dY; dXL = -dX 
    elseif (XVA == XVB) && (YVA > YVB)   #  VAR 6
        dYR = -dY; dXR = -dX 
        dYL = -dY; dXL = dX 
    end
    if numVer < n
        if (hvec[ist] == 0)            
		    x = XVB + dXL; y = YVB + dYL
            xh = XVB +	0.75*dXR; yh = YVB + 0.75*dYR
        else
            x = XVB + dXR; y = YVB + dYR
            xh = XVB +	0.75*dXL; yh = YVB + 0.75*dYL		
        end
        push!(XG, x); push!(YG, y)
        push!(XH, xh); push!(YH, yh)
    else
        xh1 = XVB +	0.75*dXR; yh1 = YVB + 0.75*dYR
        xh2 = XVB +	0.75*dXL; yh2 = YVB + 0.75*dYL    
        push!(XH, xh1); push!(YH, yh1)
        push!(XH, xh2); push!(YH, yh2)
    end    
end    

#export GeometryFin

function geometryFin(numVer::Int64)
    global  XG, YG, XH,YH 
    global L,LH, dY, dX, dYH, dXH     
    XVA = XG[numVer-1];   XVB = XG[numVer]
    YVA = YG[numVer-1];   YVB = YG[numVer]    
    if (XVA < XVB) && (YVA < YVB)  #  VAR 1
        dYR = -dY; dXR = dX 
        dYL = L; dXL = 0       
    elseif (XVA > XVB) && (YVA > YVB) #  VAR 2
        dYR = dY; dXR = -dX 
        dYL = -L; dXL = 0 
    elseif (XVA > XVB) && (YVA < YVB)  #  VAR 3 
        dYR = L; dXR = 0 
        dYL = -dY; dXL = -dX 
    elseif (XVA < XVB) && (YVA > YVB)   #  VAR 4
        dYR = -L; dXR = 0 
        dYL = dY; dXL = dX 
    elseif (XVA == XVB) && (YVA < YVB)  #  VAR 5
        dYR = dY; dXR = dX 
        dYL = dY; dXL = -dX 
    elseif (XVA == XVB) && (YVA > YVB)   #  VAR 6
        dYR = -dY; dXR = -dX 
        dYL = -dY; dXL = dX 
    end 
    xh1 = XVB +	0.75*dXR; yh1 = YVB + 0.75*dYR
    xh2 = XVB +	0.75*dXL; yh2 = YVB + 0.75*dYL    
    push!(XH, xh1); push!(YH, yh1)
    push!(XH, xh2); push!(YH, yh2)
end    



function makePolyenPathHH(hvec)
    global  XG, YG, XH,YH
    global L,LH, dY, dX, dYH, dXH 	
    L = 1.44; LH = 1.08
    dY = L*0.5; dX = L*sqrt(3)/2
    dYH = LH*0.5; dXH = LH*sqrt(3)/2
    sedge = Set([[1, 2]])
    oldVer = 2
    lenhv = length(hvec)
    n = lenhv + 2
    edgHydro = Set([[1, 1], [1,2]])
    numHid = 2; newver = 0    
    XG, YG, XH,YH = initCoordHH(hvec)    
    for i in 1:lenhv  #   i изменяется от 1 до lenhv        
        newver = oldVer + 1
        numHid += 1
        rebroCC = [oldVer,newver]
        rebroCH = [oldVer,numHid]
        push!(sedge, rebroCC)
        push!(edgHydro, rebroCH)        
        geometryPHH(i, oldVer,hvec, n)
        oldVer = newver
    end
    geometryFin(newver)
    push!(edgHydro, [newver, newver + 1])
    push!(edgHydro, [newver, newver + 2])
    edgHydros = sort(collect(edgHydro))
    sedges = sort(collect(sedge))
    return sedges, edgHydros, XG, YG, XH,YH
end  


end