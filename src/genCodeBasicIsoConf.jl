module GenCodeBasicIsoConf

using ..AllSmallParts

export makeAllCodeFromZE, makeAllCodeFromBcd
export genIsoCodeFromZE, genConTrnIsoCodeFromZE, genConOtrIsoCodeFromZE 
export genIsoCodeFromBcd, genConTrnIsoCodeFromBcd, genConOtrIsoCodeFromBcd

#####  СОЗДАНИЕ ВСЕХ неизоморфных  РМВП-графов всех 3-х классов по кортежам свойств  длиной  n
#####    использует функцию IntgDig, makeMinKirby, checkMolCodeZE

# Functions with source edge code =======================

#=
All functions with source edge code use:
- the `IntgDig`](@ref) function to generate the edge code of the molecular graph;
- the [`makeMinFromZE`](@ref) function to check the code for canonicity based on the edge code;
- the [`graphTypeFromZE`](@ref) function to determine the graph class based on its edge code;
- the [`fromCodeZEtoBCode`](@ref) function to obtain the vertex code of a graph from its edge code.
=#

"""
    makeAllCodeFromZE(n::Int64)

Creates a complete lists of vertex codes for all non-isomorphic molecular graphs of 
order `n` for isomers, conformers of trans isomers, and conformers of other isomers.

See also [`IntgDig`](@ref), [`makeMinFromZE`](@ref),  [`graphTypeFromZE`](@ref),
[`fromCodeZEtoBCode`](@ref).

# Returns
  - `lstBcdIso::Vector{Vector{Int64}}`: A vector containing the vertex codes for molecular 
    graphs of isomers;
    `lstBcdConTranIso::Vector{Vector{Int64}}`: A vector containing vertex codes for 
    molecular graphs of trans-isomer conformers;
  - `lstBcdConOtrIso::Vector{Vector{Int64}}`: A vector containing the vertex codes 
    for molecular graphs of conformers of other isomers.
       
In all of the above vectors, each code is an Int64 integer vector whose elements
are either `0` or `1`.
"""
function makeAllCodeFromZE(n::Int64)
    m = n - 3   #  m - number of edges used
    pmo = 2^m
    setBcdIso = Set()
    setBcdConTranIso = Set()
    setBcdConOtrIso = Set()      
    for k = 1:pmo  
        bcd = IntgDig(k-1,m)           
        res = checkMinFromZE(bcd)        
        if res == true
            hvct = fromCodeZEtoBCode(bcd)           
            cls = graphTypeFromZE(bcd)
            if cls == 1
                push!(setBcdIso, hvct)
            elseif  cls == 2
                push!(setBcdConTranIso, hvct)
            elseif  cls == 3
                push!(setBcdConOtrIso, hvct)                            
            end                        
        end
    end 
    lstBcdIso = sort(collect(setBcdIso)) 
    lstBcdConTranIso = sort(collect(setBcdConTranIso))
    lstBcdConOtrIso = sort(collect(setBcdConOtrIso))    
    return  lstBcdIso, lstBcdConTranIso, lstBcdConOtrIso
end 


"""
    genIsoCodeFromZE(n::Int64)

Creates a complete list of vertex codes for all non-isomorphic molecular graphs of 
order `n` for isomers.

See also [`IntgDig`](@ref), [`makeMinFromZE`](@ref),  [`graphTypeFromZE`](@ref),
[`fromCodeZEtoBCode`](@ref).

Returns a vector of graph codes, where each code is a vector of type `vector(Int64)` 
in which every element is either `0` or `1`.
"""
function genIsoCodeFromZE(n::Int64)
    m = n - 3   #  m - number of edges used
    pmo = 2^m
    setBcdIso = Set()          
    for k in 1:pmo  
        bcd = IntgDig(k-1,m)           
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

Creates a complete list of vertex codes for all non-isomorphic molecular graphs of 
order `n` for conformers of trans isomers.

See also [`IntgDig`](@ref), [`makeMinFromZE`](@ref),  [`graphTypeFromZE`](@ref),
[`fromCodeZEtoBCode`](@ref).

Returns a vector of graph codes, where each code is a vector of type `vector(Int64)` in 
which every element is either `0` or `1`.
"""
function genConTrnIsoCodeFromZE(n::Int64)
    m = n - 3   #  m - number of edges used
    pmo = 2^m
    setBcdConTranIso = Set()          
    for k = 1:pmo  
        bcd = IntgDig(k-1,m)           
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
    genConOtrIsoCodeFromZE(n::Int64)

Creates a complete list of vertex codes for all non-isomorphic molecular graphs of 
order `n` for conformers of other isomers.

See also [`IntgDig`](@ref), [`makeMinFromZE`](@ref),  [`graphTypeFromZE`](@ref),
[`fromCodeZEtoBCode`](@ref).
     
Returns a vector of graph codes, where each code is a vector of type `vector(Int64)` in
which every element is either `0` or `1`.
"""    
function genConOtrIsoCodeFromZE(n::Int64)
    m = n - 3   #  m - number of edges used
    pmo = 2^m
    setBcdConOtrIso = Set()          
    for k = 1:pmo  
        bcd = IntgDig(k-1,m)           
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

# Functions with source vertex code ==========================================

#=
All functions with source edge code use:
- the `IntgDig`](@ref) function to generate the edge code of the molecular graph;
- the [`makeMinFromBcd`](@ref) function to check the code for canonicity based on the edge code;
- the [`graphTypeFromBcd`](@ref) function to determine the graph class based on its edge code.
=#

"""
    makeAllCodeFromBcd(n::Int64)

Creates a complete lists of vertex codes for all non-isomorphic molecular graphs of 
order `n` for isomers, conformers of trans isomers, and conformers of other isomers.

See also [`IntgDig`](@ref), [`makeMinFromBcd`](@ref), [`graphTypeFromBcd`](@ref).

Returns    
- `lstBcdIso::Vector{Vector{Int64}}`: A vector containing the vertex codes of the isomer 
graphs. Each code is a vector of integers (Int64), where each element is either `0` or `1`.
- `lstBcdConTranIso::Vector{Vector{Int64}}`: A vector containing the vertex codes of 
the graphs of conformers of trans isomers. Each code is a vector of integers (Int64), 
where each element is either `0` or `1`.
-`lstBcdConOtrIso::Vector{Vector{Int64}`: A vector containing the vertex codes of 
the graphs of conformers of other isomers. Each code is a vector of integers (Int64),
where each element is either `0` or `1`.
"""
function makeAllCodeFromBcd(n::Int64)
    p = n-2                        #   p is the number of vertices used
    pmo = 2^(p-1)
    setBcdIso = Set()
    setBcdConTI = Set()
    setBcdConBad = Set()      
    for k = 1:pmo  
        bcd = IntgDig(k-1,p)         
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
    genIsoCodeFromBcd(n::Int64)
    
Creates a complete list of vertex codes for all non-isomorphic molecular graphs of 
order `n` for isomers.

See also [`IntgDig`](@ref), [`makeMinFromBcd`](@ref), [`graphTypeFromBcd`](@ref).
   
Returns a vector of graph codes, where each code is a vector of type `vector(Int64)` 
in which every element is either `0` or `1`. 
"""    
function genIsoCodeFromBcd(n::Int64)
    p = n - 2              #   p is the number of vertices used
    pmo = 2^(p-1)
    setBcdIso = Set()          
    for k = 1:pmo  
        bcd = IntgDig(k-1,p)           
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

Creates a complete list of vertex codes for all non-isomorphic molecular graphs of 
order `n` for conformers of trans isomers.

See also [`IntgDig`](@ref), [`makeMinFromBcd`](@ref), [`graphTypeFromBcd`](@ref).
     
Returns a vector of graph codes, where each code is a vector of type `vector(Int64)` 
in which every element is either `0` or `1`.
"""
function genConTrnIsoCodeFromBcd(n::Int64)
    p = n - 2                    #   p is the number of vertices used
    pmo = 2^(p-1)
    setBcdConTranIso = Set()          
    for k = 1:pmo  
        bcd = IntgDig(k-1,p)           
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

Creates a complete list of vertex codes for all non-isomorphic molecular graphs of 
order `n` for conformers of other isomers.

See also [`IntgDig`](@ref), [`makeMinFromBcd`](@ref), [`graphTypeFromBcd`](@ref).
     
Returns a vector of graph codes, where each code is a vector of type `vector(Int64)` 
in which every element is either `0` or `1`.
"""
function genConOtrIsoCodeFromBcd(n::Int64)
    p = n - 2                  #   p is the number of vertices used
    pmo = 2^(p-1)
    setBcdConOtrIso = Set()          
    for k = 1:pmo  
        bcd = IntgDig(k-1,p)          
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

