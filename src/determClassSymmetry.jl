module DetermClassSymmetry

using ..AllSmallParts

export symmetryClassFromZE, symmetryClassFromBcd,calcClassSymFromZE, calcClassSymFromBcd 

function  symmetryClassFromBcdOl(bcd)
    nsym = 3
    revBcd = reverse(bcd)
    if bcd == revBcd
        nsym = 1
    elseif bcd == invert(revBcd)    
        nsym = 2                  
    else
        nsym = 3
    end            
    return nsym
end

"""
    symmetryClassFromBcd(bcd::Vector{Int64})
   Determines the symmetry group of a molecular graph based on its vertex code `bcd`.
# Returns 
- nsym::Int64: the symmetry group code, which can have one of three values:
- `nsym = 1` if the graph has mirror symmetry (symmetry group $C_{2h}$);
- `nsym = 2` if the graph has rotational symmetry (symmetry group $C_{2v}$);
- `nsym = 3` if the graph is not symmetric (symmetry group $C_S$).
"""
function  symmetryClassFromBcd(bcd)
    nsym = 3
    a1 = bcd[1]; af = bcd[end]
    if a1 ==  0 &&  af == 0
        revBcd = reverse(bcd)
        if bcd < revBcd
            nsym = 3
        elseif bcd == revBcd
            nsym = 1   
        elseif bcd > revBcd
            x = 1
        end    
    elseif a1 ==  0 && af == 1
        revBcd = reverse(bcd)
        invRevBcd = invert(revBcd)
        if bcd < invRevBcd
            nsym = 3
        elseif bcd == invRevBcd
            nsym = 2    
        elseif bcd > invRevBcd
            x = 1
        end
    end        
    return nsym
end

"""
    symmetryClassFromZE(ZEcode::Vector{Int64})
   Determines the symmetry group of a molecular graph based on its edge code `ZEcode`.
# Returns 
 `nsym::Int64`: the symmetry group code, which can have one of three values:
- `nsym = 1` if the graph has mirror symmetry (symmetry group $C_{2h}$);
- `nsym = 2` if the graph has rotational symmetry (symmetry group $C_{2v}$);
- `nsym = 3` if the graph is not symmetric (symmetry group $C_S$).
"""
function symmetryClassFromZE(ZEcode)
    nsr = div((length(ZEcode)-1),2) + 1
    if ZEcode != reverse(ZEcode)
        nsym = 3
    else 
        if ZEcode[nsr] == 1
            nsym = 1
        elseif ZEcode[nsr] == 0
            nsym = 2            
        end        
    end
    return nsym
end

function calcClassSymFromZE(n::Int64) 
    m = n - 3  
    pmo = 2^m
    nSymIso = [n,0,0,0,0]; 
    nSymConTrnIso = [n,0,0,0,0]
    nSymConOthIso = [n,0,0,0,0] 
    for k in 1:pmo  
        bcd = IntgDig(k-1,m)  # n изменяется фактически от 0 до pmo - 1
        bcdMin = makeMinFromZE(bcd)        
        if bcdMin == bcd
            nsym = symmetryClassFromZE(bcd)       
            cls = graphTypeFromZE(bcd)
            if cls == 1                
                nSymIso[nsym+1] += 1
                nSymIso[5] += 1
            elseif  cls == 2                
                nSymConTrnIso[nsym+1] += 1
                nSymConTrnIso[5] += 1
            elseif  cls == 3
                nSymConOthIso[nsym+1] += 1
                nSymConOthIso[5] += 1                            
            end                        
        end
    end     
    return  nSymIso, nSymConTrnIso, nSymConOthIso 
end  

    

function calcClassSymFromBcd(n::Int64)
    p = n - 2  
    pmo = 2^(p-1)
    nSymIso = [n,0,0,0,0]; 
    nSymConTrnIso = [n,0,0,0,0]
    nSymConOthIso = [n,0,0,0,0]     
    for k in 1:pmo  
        bcd = IntgDig(k-1,p)  # n изменяется фактически от 0 до pmo - 1
        bcdMin = makeMinFromBcd(bcd)        
        if bcdMin == bcd
            nsym = symmetryClassFromBcd(bcd)  
            cls = graphTypeFromBcd(bcd)
            if cls == 1                
                nSymIso[nsym+1] += 1
                nSymIso[5] += 1
            elseif  cls == 2                
                nSymConTrnIso[nsym+1] += 1
                nSymConTrnIso[5] += 1
            elseif  cls == 3
                nSymConOthIso[nsym+1] += 1
                nSymConOthIso[5] += 1                            
            end                        
        end
    end     
    return  nSymIso, nSymConTrnIso, nSymConOthIso
end  

end
