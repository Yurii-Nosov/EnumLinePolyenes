module GenCodeSubGraphCOI

using ..AllSmallParts

export genCodePartCOIfromBcd, genCodePartCOIfromZE
export genCodeCis4pFromZE, genCodeCis3fromZE, genCodeNonCis3fromZE


function genCodePartCOIfromZE(n::Int64)
    m = n - 3   
    pmo = 2^m; ntype = 3
    #println("  pmo ", pmo)
    setCOI = Set();  setCis4P = Set(); 
    setCis3 = Set(); setNonCis3 = Set()
    lstCOI = [ ]; lstCis4P = []; lstNonCis3 = []; lstCis3 = []
    st41 = string(1,1,1,1)
    st31 = string(1,1,1)      
    for k in 1:pmo  
        bcd = IntgDig(k-1,m)  # n изменяется фактически от 0 до pmo - 1 
        #println("  n", n,  " bcd ", bcd)
        bcdMin = makeMinFromZE(bcd)
        if  bcdMin == bcd            
            cls = graphTypeFromZE(bcd)
            if cls == ntype
                hvct = fromCodeZEtoBCode(bcd)
                push!(setCOI, hvct)
                vcstr = map(string, bcd)
                strbcd = join(vcstr)
                if occursin(st41, strbcd)
                    push!(setCis4P, hvct)                    
                else                    
                    #vcstr = map(string, molCdeZE)
                    #strbcd = join(vcstr)
                    if occursin(st31, strbcd)                                                
                        push!(setCis3, hvct)
                    else
                        push!(setNonCis3, hvct)                            
                    end 

                end          
            end     
        end        
    end
    lstCOI = sort(collect(setCOI))
    lstCis4P = sort(collect(setCis4P))
    lstCis3 = sort(collect(setCis3))
    lstNonCis3 = sort(collect(setNonCis3))          
    return  lstCOI, lstCis4P, lstCis3, lstNonCis3 
end 


function genCodePartCOIfromBcd(n::Int64)
    p = n - 2   
    pmo = 2^(p-1); ntype = 3
    #println("  pmo ", pmo)
    setCOI = Set();  setCis4P = Set(); 
    setCis3 = Set(); setNonCis3 = Set()
    lstCOI = [ ]; lstCis4P = []; lstNonCis3 = []; lstCis3 = []
    st51 = string(1,1,1,1,1); st50 = string(0,0,0,0,0)
    st41 = string(1,1,1,1);  st40 = string(0,0,0,0)     
    for k in 1:pmo  
        bcd = IntgDig(k-1,p)  # n изменяется фактически от 0 до pmo - 1 
        #println("  n", n,  " bcd ", bcd)
        bcdMin = makeMinFromBcd(bcd)
        if  bcdMin == bcd            
            cls = graphTypeFromBcd(bcd)
            if cls == ntype
                push!(setCOI, bcd)
                vcstr = map(string, bcd)
                strbcd = join(vcstr)
                if occursin(st51, strbcd) || occursin(st50, strbcd)
                    push!(setCis4P, hvct)                    
                else                    
                    #vcstr = map(string, molCdeZE)
                    #strbcd = join(vcstr)
                    if occursin(st41, strbcd) || occursin(st40, strbcd)                                               
                        push!(setCis3, hvct)
                    else
                        push!(setNonCis3, hvct)                            
                    end 

                end          
            end     
        end        
    end
    lstCOI = sort(collect(setCOI))
    lstCis4P = sort(collect(setCis4P))
    lstCis3 = sort(collect(setCis3))
    lstNonCis3 = sort(collect(setNonCis3))          
    return  lstCOI, lstCis4P, lstCis3, lstNonCis3 
end 



function genCodeCis4pFromZE(n::Int64)
    m = n - 3   
    pmo = 2^m; ntype = 3
    #println("  pmo ", pmo)
    setCis4p = Set(); lstCis4P = [] 
    st41 = string(1,1,1,1)          
    for k in 1:pmo  
        bcd = IntgDig(k-1,m)  # n изменяется фактически от 0 до pmo - 1 
        #println("  n", n,  " bcd ", bcd)
        bcdMin = makeMinFromZE(bcd)
        if  bcdMin == bcd            
            cls = graphTypeFromZE(bcd)
            if cls == ntype
                vcstr = map(string, bcd)
                strbcd = join(vcstr)
                if occursin(st41, strbcd)
                    push!(setCis4p, hvct)            
                end          
            end     
        end        
    end
    lstCis4P = sort(collect(setCis4P))
end 


function genCodeCis3fromZE(n::Int64)
    m = n - 3   
    pmo = 2^m; ntype = 3     
    setCis3 = Set(); lstCis3 = []
    st41 = string(1,1,1,1); st31 = string(1,1,1)      
    for k in 1:pmo  
        bcd = IntgDig(k-1,m)  # n изменяется фактически от 0 до pmo - 1        
        bcdMin = makeMinFromZE(bcd)
        if  bcdMin == bcd            
            cls = graphTypeFromZE(bcd)
            if cls == ntype                                
                vcstr = map(string, bcd)
                strbcd = join(vcstr)
                if !occursin(st41, strbcd)                    
                    if occursin(st31, strbcd)
                        hvct = fromCodeZEtoBCode(bcd)                                                
                        push!(setCis3, hvct)                                                
                    end
                end          
            end     
        end        
    end
    lstCis3 = sort(collect(setCis3))    
end 


function genCodeNonCis3fromZE(n::Integer)
    m = n - 3   
    pmo = 2^m; ntype = 3     
    setNonCis3 = Set(); lstNonCis3 = []
    st41 = string(1,1,1,1); st31 = string(1,1,1)      
    for k in 1:pmo  
        bcd = IntgDig(k-1,m)  # n изменяется фактически от 0 до pmo - 1        
        bcdMin = makeMinFromZE(bcd)
        if  bcdMin == bcd            
            cls = graphTypeFromZE(bcd)
            if cls == ntype                                
                vcstr = map(string, bcd)
                strbcd = join(vcstr)
                if !occursin(st41, strbcd)                    
                    if !occursin(st31, strbcd)
                        hvct = fromCodeZEtoBCode(bcd)
                        push!(setNonCis3, hvct)                                                
                    end
                end          
            end     
        end        
    end
    lstNonCis3 = sort(collect(setNonCis3))    
end 

end  ##end of module