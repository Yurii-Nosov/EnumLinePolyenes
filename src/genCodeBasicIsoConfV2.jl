module GenCodeBasicIsoConfV2

using ..AllSmallParts

export makeAllCodeFromZEv2,genIsoCodeFromZEv2,genConTrnIsoCodeFromZEv2,genConOtrIsoCodeFromZEv2
 
#     SECOND VERSION 

#  Generation of vertex codes of non-isomorphic graphs of isomers, conformers of trans isomers 
#   and conformers of other isomers

##   Unlike the first version, here the `checkMinFromZE` function is used to select non-isomorphic graphs.

"""
    makeAllCodeFromZEv2(n::Int64)
    Generates vertex codes for molecular graphs of order `n` for all non-isomorphic isomers.

    This is done by sequentially generating edge codes, from which vertex codes are obtained 
    using the `fromCodeZEtoBCode` function. Edge codes for non-isomorphic graphs are selected using 
    the `checkMinFromZE` function.
    # Returns
    - `lstBcdIso::Vector{Vector{Int64}}`: A vector containing the vertex codes for molecular graphs of isomers;
    - `lstBcdConTranIso::Vector{Vector{Int64}}`: A vector containing vertex codes for molecular graphs
       of trans-isomer conformers;
    - `lstBcdConOtrIso::Vector{Vector{Int64}}`: A vector containing the vertex codes for molecular
       graphs of conformers of other isomers.
"""
function makeAllCodeFromZEv2(n::Int64)
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
    lstBcdIso = sort(collect(setBcdIso)); 
    lstBcdConTI = sort(collect(setBcdConTI))
    lstBcdConBad = sort(collect(setBcdConBad))    
    return  lstBcdIso, lstBcdConTI, lstBcdConBad
end 

"""
    genIsoCodeFromZEv2(n::Int64)
    Generates vertex codes for molecular graphs of order `n` for all non-isomorphic isomers.

    This is done by sequentially generating edge codes, from which vertex codes are obtained 
    using the `fromCodeZEtoBCode` function. Edge codes for non-isomorphic graphs are selected using 
    the `checkMinFromZE` function.
    # Returns
    `lstBcdIso::Vector{Vector{Int64}}`: A vector containing the vertex codes for molecular graphs of isomers. 
"""
function genIsoCodeFromZEv2(n::Int64)
    m = n - 3   #  m  - количество используемых ребер
    pmo = 2^m
    setBcdIso = Set()          
    for k = 1:pmo  
        bcd = IntgDig(k-1,m)  # n изменяется фактически от 0 до pmo - 1        
        res = checkMinFromZE(bcd)        
        if res == true
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
    genConTrnIsoCodeFromZEv2(n::Int64)
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
function genConTrnIsoCodeFromZEv2(n::Int64)
    m = n - 3   #  m  - количество используемых ребер
    pmo = 2^m
    setBcdConTranIso = Set()          
    for k = 1:pmo  
        bcd = IntgDig(k-1,m)  # n изменяется фактически от 0 до pmo - 1        
        res = checkMinFromZE(bcd)        
        if res == true
            hvct = fromCodeZEtoBCode(bcd)           
            cls = graphTypeFromZE(bcd)
            if cls == 2
                push!(setBcdConTranIso, hvct)                                          
            end
                                    
        end
    end 
    lstBcdConTranIso = sort(collect(setBcdConTranIso)); 
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
function genConOtrIsoCodeFromZEv2(n::Int64)
    m = n - 3   #  m  - количество используемых ребер
    pmo = 2^m
    setBcdConOtrIso = Set()          
    for k = 1:pmo  
        bcd = IntgDig(k-1,m)  # n изменяется фактически от 0 до pmo - 1        
        res = checkMinFromZE(bcd)        
        if res == true
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

end

