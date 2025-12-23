module DetermClassSymmetry

using ..AllSmallParts

export symmetryClassFromZE, symmetryClassFromBcd,calcClassSymFromZE, calcClassSymFromBcd 

function  symmetryClassFromBcdOl(bcd)
    clsSym = 3
    revBcd = reverse(bcd)
    if bcd == revBcd
        clsSym = 1
    elseif bcd == invert(revBcd)    
        clsSym = 2                  
    else
        clsSym = 3
    end            
    return clsSym
end

function  symmetryClassFromBcd(bcd)
    clsSym = 3
    a1 = bcd[1]; af = bcd[end]
    if a1 ==  0 &&  af == 0
        revBcd = reverse(bcd)
        if bcd < revBcd
            clsSym = 3
        elseif bcd == revBcd
            clsSym = 1   
        elseif bcd > revBcd
            x = 1
        end    
    elseif a1 ==  0 && af == 1
        revBcd = reverse(bcd)
        invRevBcd = invert(revBcd)
        if bcd < invRevBcd
            clsSym = 3
        elseif bcd == invRevBcd
            clsSym = 2    
        elseif bcd > invRevBcd
            x = 1
        end
    end        
    return clsSym
end


function symmetryClassFromZE(bcd)
    nsr = div((length(bcd)-1),2) + 1
    if bcd != reverse(bcd)
        cls = 3
    else 
        if bcd[nsr] == 1
            cls = 1
        elseif bcd[nsr] == 0
            cls = 2 
            
        end        
    end
    return cls
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
            sym = symmetryClassFromZE(bcd)       
            cls = graphTypeFromZE(bcd)
            if cls == 1                
                nSymIso[sym+1] += 1
                nSymIso[5] += 1
            elseif  cls == 2                
                nSymConTrnIso[sym+1] += 1
                nSymConTrnIso[5] += 1
            elseif  cls == 3
                nSymConOthIso[sym+1] += 1
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
            sym = symmetryClassFromBcd(bcd)  
            cls = graphTypeFromBcd(bcd)
            if cls == 1                
                nSymIso[sym+1] += 1
                nSymIso[5] += 1
            elseif  cls == 2                
                nSymConTrnIso[sym+1] += 1
                nSymConTrnIso[5] += 1
            elseif  cls == 3
                nSymConOthIso[sym+1] += 1
                nSymConOthIso[5] += 1                            
            end                        
        end
    end     
    return  nSymIso, nSymConTrnIso, nSymConOthIso
end  

end
