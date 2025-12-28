module GenCodeBasicIsoConfV2

using ..AllSmallParts

export makeAllCodeFromZEv2,genIsoCodeFromZEv2,genConTrnIsoCodeFromZEv2,genConOtrIsoCodeFromZEv2
 
#     SECOND VERSION 

#  Generation of vertex codes of non-isomorphic graphs of isomers, conformers of trans isomers 
#   and conformers of other isomers

##   Unlike the first version, here the `checkMinFromZE` function is used to select non-isomorphic graphs.

#=
All functions of the `GenCodeBasicIsoConfV2`` module use:
- the `IntgDig`](@ref) function to create the edge code of a molecular graph;
- the [`checkMinFromZE`](@ref) function to check the code for canonicity based on the edge code;
- the [`graphTypeFromZE`](@ref) function to determine the graph class based on its edge code;
- the [`fromCodeZEtoBCode`](@ref) function to obtain the vertex code of a graph from its edge code.
=#    

"""
    makeAllCodeFromZEv2(n::Int64)

Creates a complete lists of vertex codes for all non-isomorphic molecular graphs of 
order `n` for isomers, conformers of trans isomers, and conformers of other isomers.

See also [`IntgDig`](@ref), [`checkMinFromZE`](@ref), [`fromCodeZEtoBCode`](@ref), 
[`graphTypeFromZE`](@ref).

# Returns
  - `lstBcdIso::Vector{Vector{Int64}}`: A vector containing the vertex codes for molecular graphs of isomers;
  -  `lstBcdConTranIso::Vector{Vector{Int64}}`: A vector containing vertex codes for molecular graphs
    of trans-isomer conformers;
  - `lstBcdConOtrIso::Vector{Vector{Int64}}`: A vector containing the vertex codes for molecular
    graphs of conformers of other isomers.
       
In all of the above vectors, each code is an Int64 integer vector whose elements are either `0` or `1`.
"""
function makeAllCodeFromZEv2(n::Int64)
    m = n - 3      #  m = is the number of edges used
    pmo = 2^m
    setBcdIso = Set()
    setBcdConTI = Set()
    setBcdConBad = Set()      
    for k = 1:pmo  
        bcd = IntgDig(k-1,m)       #  edge code is generated        
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

Creates a complete list of vertex codes for all non-isomorphic molecular graphs of 
order `n` for isomers.

See also [`IntgDig`](@ref), [`checkMinFromZE`](@ref), [`fromCodeZEtoBCode`](@ref), 
[`graphTypeFromZE`](@ref).

Returns a vector of graph codes, where each code is a vector of type `vector(Int64)` 
in which every element is either `0` or `1`.
"""
function genIsoCodeFromZEv2(n::Int64)
    m = n - 3   #  m = is the number of edges used
    pmo = 2^m
    setBcdIso = Set()          
    for k = 1:pmo  
        bcd = IntgDig(k-1,m)  #   edge code is generated        
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

Creates a complete list of vertex codes for all non-isomorphic molecular graphs of order
`n` for conformers of trans isomers.

See also [`IntgDig`](@ref), [`checkMinFromZE`](@ref), [`fromCodeZEtoBCode`](@ref), 
[`graphTypeFromZE`](@ref).

Returns a vector of graph codes, where each code is a vector of type `vector(Int64)` 
in which every element is either `0` or `1`.
"""
function genConTrnIsoCodeFromZEv2(n::Int64)
    m = n - 3         # m = is the number of edges used
    pmo = 2^m
    setBcdConTranIso = Set()          
    for k = 1:pmo  
        bcd = IntgDig(k-1,m)  #   edge code is generated        
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

Creates a complete list  of vertex codes for all non-isomorphic molecular graphs of 
order `n` for conformers of other isomers.

See also [`IntgDig`](@ref), [`checkMinFromZE`](@ref), [`fromCodeZEtoBCode`](@ref), 
[`graphTypeFromZE`](@ref).
 
Returns a vector of graph codes, where each code is a vector of type `vector(Int64)` 
in which every element is either `0` or `1`.
"""
function genConOtrIsoCodeFromZEv2(n::Int64)
    m = n - 3   #  m = is the number of edges used
    pmo = 2^m
    setBcdConOtrIso = Set()          
    for k = 1:pmo  
        bcd = IntgDig(k-1,m)  #  edge code is generated        
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

