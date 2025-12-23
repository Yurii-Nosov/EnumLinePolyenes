module GenCodeBasicIsoConfV2

using ..AllSmallParts

export makeAllCodeFromZEv2,genIsoCodeFromZEv2,genConTrnIsoCodeFromZEv2,genConOtrIsoCodeFromZEv2
 

#####  СОЗДАНИЕ ВСЕХ неизоморфных  РМВП-графов всех 3-х классов по кортежам свойств  длиной  q
#####    использует функцию IntgDig, makeMinKirby, checkMolCodeZE

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

