module AllSmallParts

export zam, invert, IntgDig, func, makeMinFromZE, makeMinFromBcd,checkMinFromZE
export fromCodeZEtoBCode, inZEtoBcd,graphTypeFromZE, graphTypeFromBcd


"""
    zam(x::Int64)
Return 1 if x = 0 and return 0 if x = 1.    
"""
function  zam(x::Int64)
    if x == 1
        return 0
    elseif x == 0
        return 1
    end 
end
 

"""
    invert(bcd)
Return the inverted vector `invBcd` obtained from the original vector `bcd` by replacing 
all zeros with ones and replacing all ones with zeros.
"""  
function invert(bcd)
    invBcd = map(zam,bcd)
    return invBcd
end


"""
    IntgDig(n::Int64,p::Int64)
Return a binary number from the decimal number `n` as a list of length `p`.
The calculation uses the half division method.    
"""
function IntgDig(n::Int64, p::Int64)
    lstBin = Vector{Int64}()
    binDigits = Vector{Int64}()
    ts = 0; res = 0
    while n >= 1
        ts = div(n, 2)
        res = n % 2        
        push!(lstBin, res)
        n = ts
    end       
    lstBin = reverse!(lstBin)    
    lngB = length(lstBin)
    if  p > lngB
        nmb = p - lngB
        rep = fill(0, nmb)
        binDigits = append!(rep, lstBin)
        return binDigits
    else 
        return lstBin
    end
end 

"""
    func(x,y)
"""
function func(x,y)
    #res = 0
    if x != y
        return 0
    elseif  x == y
        return 1
    end    
    #return res
end 

"""
    makeMinFromBcd(bcd)
Return the canonical vertex code `canBcd`` as the lexicographically smallest of the 
source code `bcd`, the reversed code `revBcd`, and the code `invRevBcd`, obtained by
reversing and inverting.
"""
function  makeMinFromBcd(bcd)
    canBcd = Vector{Int64}()
    a1 = bcd[1]; af = bcd[end]
    if a1 ==  0 &&  af == 0
        revBcd = reverse(bcd)
        if bcd < revBcd
            canBcd = bcd
        elseif bcd == revBcd
            canBcd = bcd   
        elseif bcd > revBcd
            canBcd = revBcd
        end    
    elseif a1 ==  0 && af == 1
        revBcd = reverse(bcd)
        invRevBcd = invert(revBcd)
        if bcd < invRevBcd
            canBcd = bcd
        elseif bcd == invRevBcd
            canBcd = bcd    
        elseif bcd > invRevBcd
            canBcd = invRevBcd
        end
    end        
    return canBcd
end

"""
    makeMinFromZE(ZEcode)
Return the canonical edge code `canZEcode`` as the lexicographically smallest
of the original `ZEcode`` and reversed `revZEcode`` codes.
"""
function  makeMinFromZE(ZEcode)
    canZEcode = Vector{Int64}()
    revZEcode = reverse(ZEcode)
    if ZEcode < revZEcode
        canZEcode = ZEcode
    elseif ZEcode == revZEcode
        canZEcode = ZEcode
    elseif  ZEcode > revZEcode   
        canZEcode = revZEcode
    end            
    return canZEcode
end


"""
    checkMinFromZE(bcd)
Return "true" if the edge code `ZEcode`` is canonical and return "false" if the code 
is not canonical. An edge code is canonical if it is lexicographically 
the smallest of the original `ZEcode`` and reversed `revZEcode`` codes.
"""
function  checkMinFromZE(ZEcode)
    #res = false
    revZEcode = reverse(ZEcode)
    if ZEcode < revZEcode
        return true
    elseif ZEcode == revZEcode
        return true
    elseif  ZEcode > revZEcode   
        return false
    end            
    #return res
end

"""
    fromCodeZEtoBCode(ZEcode)
Return the vertex code from the edge code.
"""
function fromCodeZEtoBCode(ZEcode)
    n = length(ZEcode)
    #BCode = [0 for  k  in  1:(n + 1)]
    BCode = fill(0,(n + 1))    
    for  k  in  1:n
        b = ZEcode[k]
        a = BCode[k]
        if a != b
            d = 0
        else
            d = 1
        end    
        BCode[k + 1] = d
    end    
    return BCode
end


"""
    inZEtoBcd(ZEcode)
Return the vertex code from the edge code.
"""
function inZEtoBcd(ZEcode)
    n = length(ZEcode)
    #allCode = [0 for  k  in  1:(n + 1)]
    BCode = fill(0,(n + 1))    
    for  k  in  1:n
        b = ZEcode[k]
        a = BCode[k]
        if a != b
            d = 0
        else
            d = 1
        end    
        BCode[k + 1] = d
    end    
    return BCode
end


"""
    graphTypeFromZE(ZEcode)
    Return the graph class by its edge code.
"""
function graphTypeFromZE(ZEcode)
    nmc = length(ZEcode)
    isoZE = [ZEcode[k]  for k in 2:2:(nmc-1)]
    cnfZE = [ZEcode[k]  for k in 1:2:nmc]
    sumIsoZE = sum(isoZE); sumCnfZE = sum(cnfZE)
    cls = 3
    if sumIsoZE > 0 && sumCnfZE > 0
        cls = 3
    elseif sumIsoZE > 0 && sumCnfZE == 0
        cls = 1
    elseif sumIsoZE == 0 && sumCnfZE == 0
        cls = 1
    elseif sumIsoZE == 0 && sumCnfZE > 0
        cls = 2
    end    
    return cls
end  

"""
    graphTypeFromZE(Bcode)
    Return the graph class by its vertex code
"""
function graphTypeFromBcd(Bcode)
    n =  length(Bcode)
    molCdeZE = [func(Bcode[k],Bcode[k + 1]) for k in 1:1:(n-1)]
    nmc = length(molCdeZE)
    isoZE = [molCdeZE[k]  for k in 2:2:(nmc-1)]
    cnfZE = [molCdeZE[k]  for k in 1:2:nmc]
    sumIsoZE = sum(isoZE); sumCnfZE = sum(cnfZE)
    cls = 3
    if sumIsoZE > 0 && sumCnfZE > 0
        cls = 3
    elseif sumIsoZE > 0 && sumCnfZE == 0
        cls = 1
    elseif sumIsoZE == 0 && sumCnfZE == 0
        cls = 1
    elseif sumIsoZE == 0 && sumCnfZE > 0
        cls = 2
    end    
    return cls
end 

end  ## end of vodule