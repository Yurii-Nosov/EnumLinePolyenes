module CountCodeIsoConf

using ..AllSmallParts

export countCodeFromZE, countCodeFromBcd,countListCodeFromZE, countListCodeFromBcd
export countConfOtherIsoFromZE

#####  ОПРЕДЕЛЕНИЕ количества неизоморфных  РМВП-графов всех 3-х классов по кортежам свойств длиной  q
#####    использует функцию IntgDig, makeMin, checkHVectZE 

function countCodeFromZE(n) 
    m = n - 3;   
    pmo = 2^m
    numIso = 0; 
    numCTI = 0; 
    numConf = 0; numTotal = 0
    #numbOther = 0    
    for k in 1:pmo  
        bcd = IntgDig(k-1,m)  # n изменяется фактически от 0 до pmo - 1
        bcdMin = makeMinFromZE(bcd)        
        if bcd == bcdMin            
            numTotal += 1           
            cls = graphTypeFromZE(bcd)
            if cls == 1                
                numIso += 1
            elseif  cls == 2                
                numCTI += 1
            elseif  cls == 3
                numConf += 1                            
            end                        
        end
    end     
    return  n,numIso, numCTI, numConf, numTotal 
end 


#####  ОПРЕДЕЛЕНИЕ количества неизоморфных  РМВП-графов всех 3-х классов по кортежам свойств длиной  q
#####    использует функцию IntgDig, makeMin, checkHVectZE 

function countCodeFromBcd(n) 
    p = n - 2;   
    pmo = 2^(p-1)
    numIso = 0; 
    numCTI = 0; 
    numConf = 0; numTotal = 0
    #numbOther = 0    
    for k in 1:pmo  
        bcd = IntgDig(k-1,p)  # n изменяется фактически от 0 до pmo - 1
        bcdMin = makeMinFromBcd(bcd)        
        if bcd == bcdMin        
            numTotal += 1           
            cls = graphTypeFromBcd(bcd)
            if cls == 1                
                numIso += 1
            elseif  cls == 2                
                numCTI += 1
            elseif  cls == 3
                numConf += 1                            
            end                        
        end
    end     
    return  n,numIso, numCTI, numConf, numTotal 
end   

function countListCodeFromZE(n1,n2)
    for n in n1:2:n2
        nl,numIsol, numCTIl, numConfl, numTotall = countCodeFromZE(n)
        distNum =[nl,numIsol, numCTIl, numConfl, numTotall]
        println(distNum)
    end    
end    

function countListCodeFromBcd(n1,n2)
    for n in n1:2:n2
        nl,numIsol, numCTIl, numConfl, numTotall = countCodeFromBcd(n)
        distNum =[nl,numIsol, numCTIl, numConfl, numTotall]
        println(distNum)
    end    
end

function countConfOtherIsoFromZE(n::Int64)
    m = n - 3   
    pmo = 2^m; ntype = 3
    #println("  pmo ", pmo)
    numCOI = 0; numCis4p = 0; numNonCis4p = 0  
    numCis3 = 0; numNonCis3 = 0
    st41 = string(1,1,1,1)
    st31 = string(1,1,1)      
    for k in 1:pmo  
        bcd = IntgDig(k-1,m)  # n изменяется фактически от 0 до pmo - 1 
        bcdMin = makeMinFromZE(bcd)
        if  bcdMin == bcd
            cls = graphTypeFromZE(bcd)
            if cls == ntype                
                numCOI += 1
                vcstr = map(string, bcd)
                strbcd = join(vcstr)
                if occursin(st41, strbcd)
                    numCis4p += 1                    
                else
                    numNonCis4p += 1                    
                    #vcstr = map(string, bcd)
                    #strbcd = join(vcstr)
                    if occursin(st31, strbcd) 
                        numCis3 += 1
                    else
                        numNonCis3 += 1                         
                    end 
                end          
            end     
        end        
    end
    return  n,numCOI, numCis4p, numNonCis4p,numCis3, numNonCis3 
end 



end ## end of module
  