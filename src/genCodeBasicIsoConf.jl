module GenCodeBasicIsoConf

using ..AllSmallParts

export makeAllCodeFromZE, makeAllCodeFromBcd
export genIsoCodeFromZE, genConTrnIsoCodeFromZE, genConOtrIsoCodeFromZE 
export genIsoCodeFromBcd, genConTrnIsoCodeFromBcd, genConOtrIsoCodeFromBcd

#####  СОЗДАНИЕ ВСЕХ неизоморфных  РМВП-графов всех 3-х классов по кортежам свойств  длиной  n
#####    использует функцию IntgDig, makeMinKirby, checkMolCodeZE

function makeAllCodeFromZE(n::Int64)
    m = n - 3   #  m  - количество используемых ребер
    pmo = 2^m
    setBcdIso = Set()
    setBcdConTI = Set()
    setBcdConBad = Set()      
    for k = 1:pmo  
        bcd = IntgDig(k-1,m)  # n изменяется фактически от 0 до pmo - 1        
        res = checkMinFromZE(bcd)        
        if res == true
            hvct = fromCodeZEtoBCode(bcd)           
            cls = graphTypeFromZE(bcd)
            if cls == 1
                push!(setBcdIso, hvct)
            elseif  cls == 2
                push!(setBcdConTI, hvct)
            elseif  cls == 3
                push!(setBcdConBad, hvct)                            
            end                        
        end
    end 
    lstBcdIso = sort(collect(setBcdIso)) 
    lstBcdConTI = sort(collect(setBcdConTI))
    lstBcdConBad = sort(collect(setBcdConBad))    
    return  lstBcdIso, lstBcdConTI, lstBcdConBad
end 


function makeAllCodeFromBcd(n::Int64)
    p = n-2   
    pmo = 2^(p-1)
    setBcdIso = Set()
    setBcdConTI = Set()
    setBcdConBad = Set()      
    for k = 1:pmo  
        bcd = IntgDig(k-1,p)  # n изменяется фактически от 0 до pmo - 1        
        bcdMin = makeMinFromBcd(bcd)        
        if bcdMin == bcd            
            cls = graphTypeFromBcd(bcd)
            if cls == 1
                push!(setBcdIso, bcd)
            elseif  cls == 2
                push!(setBcdConTI, bcd)
            elseif  cls == 3
                push!(setBcdConBad, bcd)                            
            end                        
        end
    end 
    lstBcdIso = collect(setBcdIso) 
    lstBcdConTI = collect( setBcdConTI) 
    lstBcdConBad = collect(setBcdConBad)       
    return  lstBcdIso, lstBcdConTI, lstBcdConBad
end 



"""
    genIsoCodeFromZE(n::Int64)
    Generates vertex codes for molecular graphs of order `n` for all non-isomorphic isomers.

    This is done by sequentially generating edge codes, from which vertex codes are obtained 
    using the `fromCodeZEtoBCode` function. Edge codes for non-isomorphic graphs are selected using 
    the `checkMinFromZE` function.
    # Returns
    `lstBcdIso::Vector{Vector{Int64}}`: A vector containing the vertex codes for molecular graphs of isomers. 
"""
function genIsoCodeFromZE(n::Int64)
    m = n - 3   #  m  - количество используемых ребер
    pmo = 2^m
    setBcdIso = Set()          
    for k in 1:pmo  
        bcd = IntgDig(k-1,m)  # n изменяется фактически от 0 до pmo - 1        
        bcdMin = makeMinFromZE(bcd)        
        if bcd == bcdMin
            hvct = fromCodeZEtoBCode(bcd)           
            cls = graphTypeFromZE(bcd)
            if cls == 1
                push!(setBcdIso, hvct)                                          
            end
                                    
        end
    end 
    lstBcdIso = sort(collect(setBcdIso)) 
    return  lstBcdIso
end 


"""
    genConTrnIsoCodeFromZE(n::Int64)
    Generates vertex codes for molecular graphs of order n for all non-isomorphic conformers
    of  trans-isomer.

    This is done by sequentially generating edge codes, from which vertex codes are obtained 
    using the `fromCodeZEtoBCode` function. Edge codes for non-isomorphic graphs are selected using 
    the `checkMinFromZE` function.
    # Returns
    `lstBcdConTranIso::Vector{Vector{Int64}}`: A vector containing vertex codes for molecular graphs
     of trans-isomer conformers. 
    Each code is a vector of integers (Int64), where each element is either 0 or 1.
"""
function genConTrnIsoCodeFromZE(n::Int64)
    m = n - 3   #  m  - количество используемых ребер
    pmo = 2^m
    setBcdConTranIso = Set()          
    for k = 1:pmo  
        bcd = IntgDig(k-1,m)  # n изменяется фактически от 0 до pmo - 1        
        bcdMin = makeMinFromZE(bcd)        
        if bcd == bcdMin
            hvct = fromCodeZEtoBCode(bcd)           
            cls = graphTypeFromZE(bcd)
            if cls == 2
                push!(setBcdConTranIso, hvct)                                          
            end                                    
        end
    end 
    lstBcdConTranIso = sort(collect(setBcdConTranIso)) 
    return  lstBcdConTranIso
end 


"""
    genConOtrIsoCodeFromZEv2(n::Int64)
    Generates vertex codes for molecular graphs of order n for all non-isomorphic conformers
    of other isomers.

    This is done by sequentially generating edge codes, from which vertex codes are obtained 
    using the `fromCodeZEtoBCode` function. Edge codes for non-isomorphic graphs are selected using 
    the `checkMinFromZE` function.
    # Returns
    `lstBcdConOtrIso::Vector{Vector{Int64}}`: A vector containing the vertex codes for molecular
     graphs of conformers of other isomers. 
    Each code is a vector of integers (Int64), where each element is either 0 or 1.
"""    
function genConOtrIsoCodeFromZE(n::Int64)
    m = n - 3   #  m  - количество используемых ребер
    pmo = 2^m
    setBcdConOtrIso = Set()          
    for k = 1:pmo  
        bcd = IntgDig(k-1,m)  # n изменяется фактически от 0 до pmo - 1        
        bcdMin = makeMinFromZE(bcd)        
        if bcd == bcdMin
            hvct = fromCodeZEtoBCode(bcd)           
            cls = graphTypeFromZE(bcd)
            if cls == 3
                push!(setBcdConOtrIso, hvct)                                          
            end
                                    
        end
    end 
    lstBcdConOtrIso = sort(collect(setBcdConOtrIso)) 
    return  lstBcdConOtrIso
end 



"""
    genIsoCodeFromBcd(n::Int64)
    
    Generates vertex codes for all non-isomorphic molecular graphs of order `n` for conformers of other isomers.

   Code generation is performed using the [`IntgDig`](@ref) function. Codes are checked for canonicity using 
   the [`makeMinFromBcd`](@ref) function. Graph codes of a given class are selected using 
   the [`graphTypeFromBcd`](@ref) function.
   # Returns
   `lstBcdIso::Vector{Vector{Int64}}`: A vector containing the vertex codes of the graphs of isomers. 
   Each code is a vector of integers (Int64), where each element is either 0 or 1. 
"""    
function genIsoCodeFromBcd(n::Int64)
    p = n - 2   #  m  - количество используемых ребер
    pmo = 2^(p-1)
    setBcdIso = Set()          
    for k = 1:pmo  
        bcd = IntgDig(k-1,p)  # n изменяется фактически от 0 до pmo - 1        
        bcdMin = makeMinFromBcd(bcd)        
        if bcd == bcdMin                       
            cls = graphTypeFromBcd(bcd)
            if cls == 1
                push!(setBcdIso, bcd)                                          
            end                                    
        end
    end 
    lstBcdIso = sort(collect(setBcdIso)) 
    return  lstBcdIso
end 


"""
    genConTrnIsoCodeFromBcd(n::Int64)

    Generates vertex codes for all non-isomorphic molecular graphs of order `n` for conformers of trans isomers.

    Code generation is performed using the [`IntgDig`](@ref) function. Code canonicality is checked using 
    the [`makeMinFromBcd`](@ref) function. Graph codes of a given class are selected using 
    the [`graphTypeFromBcd`](@ref) function.
    # Returns
    `lstBcdConTranIso::Vector{Vector{Int64}}`: A vector containing vertex codes for graphs of conformers 
    of trans isomers. Each code is a vector of integers (Int64), where each element is either 0 or 1.
"""
function genConTrnIsoCodeFromBcd(n::Int64)
    p = n - 2   #  m  - количество используемых ребер
    pmo = 2^(p-1)
    setBcdConTranIso = Set()          
    for k = 1:pmo  
        bcd = IntgDig(k-1,p)  # n изменяется фактически от 0 до pmo - 1        
        bcdMin = makeMinFromBcd(bcd)        
        if bcd == bcdMin                       
            cls = graphTypeFromBcd(bcd)
            if cls == 2
                push!(setBcdConTranIso, bcd)                                          
            end                                    
        end
    end 
    lstBcdConTranIso = sort(collect(setBcdConTranIso)) 
    return  lstBcdConTranIso
end 

"""
    genConOtrIsoCodeFromBcd(n::Int64)
    Generates vertex codes of all non-isomorphic molecular graphs of order `n` of conformers of other isomers.

    This is done by sequentially generating edge codes, from which vertex codes are obtained 
    using the `fromCodeZEtoBCode` function. Edge codes for non-isomorphic graphs are selected using 
    the `checkMinFromZE` function.
    # Returns
    `lstBcdConOtrIso::Vector{Vector{Int64}}`: A vector containing the vertex codes for molecular
     graphs of conformers of other isomers. 
    Each code is a vector of integers (Int64), where each element is either 0 or 1.
"""
function genConOtrIsoCodeFromBcd(n::Int64)
    p = n - 2   #  m  - количество используемых ребер
    pmo = 2^(p-1)
    setBcdConOtrIso = Set()          
    for k = 1:pmo  
        bcd = IntgDig(k-1,p)  # n изменяется фактически от 0 до pmo - 1        
        bcdMin = makeMinFromBcd(bcd)        
        if bcd == bcdMin                       
            cls = graphTypeFromBcd(bcd)
            if cls == 3
                push!(setBcdConOtrIso, bcd)                                          
            end                                    
        end
    end 
    lstBcdConOtrIso = sort(collect(setBcdConOtrIso)) 
    return  lstBcdConOtrIso
end 

end  ## end of module

