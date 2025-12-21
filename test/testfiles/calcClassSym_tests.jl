using EnumLinePolyenes
using Test

@testset "Testset calcClassSym Isomers from ZE" begin
    @test symmetryClassFromZE([0,0,0,0,0]) == 2
    @test symmetryClassFromZE([0,0,0,1,0]) == 3
    @test symmetryClassFromZE([0,1,0,1,0]) == 2
    @test symmetryClassFromZE([0,0,0,0,0,0,0]) == 2
    @test symmetryClassFromZE([0,0,0,0,0,1,0]) == 3
    @test symmetryClassFromZE([0,0,0,1,0,1,0]) == 3
    @test symmetryClassFromZE([0,0,0,1,0,0,0]) == 1
    @test symmetryClassFromZE([0,1,0,1,0,1,0]) == 1
    @test symmetryClassFromZE([0,1,0,0,0,1,0]) == 2
    @test symmetryClassFromZE([0,0,0,1,0,0,0]) == 1
    @test symmetryClassFromZE([0,0,1,0,0,0,0]) == 3
    @test symmetryClassFromZE([1,0,0,0,1,0,0]) == 3
end 


@testset "Testset calcClassSym Conf Trans Isomers from ZE" begin
    @test symmetryClassFromZE([1,0,0,0,1]) == 2
    @test symmetryClassFromZE([1,0,1,0,1]) == 1
    @test symmetryClassFromZE([0,0,1,0,0]) == 1
    @test symmetryClassFromZE([0,0,1,0,1]) == 3
    @test symmetryClassFromZE([0,0,0,0,1]) == 3
    @test symmetryClassFromZE([1,0,0,0,0,0,1]) == 2
    @test symmetryClassFromZE([1,0,0,0,0,1,0]) == 3
    @test symmetryClassFromZE([1,0,1,0,1,0,1]) == 2
    @test symmetryClassFromZE([0,0,1,0,0,0,1]) == 3
    @test symmetryClassFromZE([0,0,1,0,1,0,1]) == 3
    @test symmetryClassFromZE([0,0,1,0,1,0,0]) == 2
    @test symmetryClassFromZE([0,0,0,0,1,0,0]) == 3
    @test symmetryClassFromZE([0,0,0,0,1,0,1]) == 3
    @test symmetryClassFromZE([0,0,0,0,0,0,1]) == 3
end  


@testset "Testset calcClassSym Isomers from BCD" begin
    @test symmetryClassFromBcd([0, 1, 0, 1, 0, 1]) == 2
    @test symmetryClassFromBcd([0, 1, 0, 1, 1, 0]) == 3
    @test symmetryClassFromBcd([0, 1, 1, 0, 0, 1]) == 2
    @test symmetryClassFromBcd([0, 1, 0, 1, 0, 1, 0, 1]) == 2
    @test symmetryClassFromBcd([0, 1, 0, 1, 0, 1, 1, 0]) == 3
    @test symmetryClassFromBcd([0, 1, 0, 1, 1, 0, 0, 1]) == 3
    @test symmetryClassFromBcd([0, 1, 0, 1, 1, 0, 1, 0]) == 1
    @test symmetryClassFromBcd([0, 1, 1, 0, 0, 1, 1, 0]) == 1
    @test symmetryClassFromBcd([0, 1, 1, 0, 1, 0, 0, 1]) == 2    
end


@testset "Testset calcClassSym Conf Trans Isomers from BCD" begin
    @test symmetryClassFromBcd([0, 0, 1, 0, 1, 1]) == 2
    @test symmetryClassFromBcd([0, 0, 1, 1, 0, 0]) == 1
    @test symmetryClassFromBcd([0, 1, 0, 0, 1, 0]) == 1
    @test symmetryClassFromBcd([0, 1, 0, 0, 1, 1]) == 3
    @test symmetryClassFromBcd([0, 1, 0, 1, 0, 0]) == 3
    @test symmetryClassFromBcd([0, 0, 1, 0, 1, 0, 1, 1]) == 2
    @test symmetryClassFromBcd([0, 0, 1, 0, 1, 1, 0, 0]) == 3    
    @test symmetryClassFromBcd([0, 0, 1, 1, 0, 0, 1, 1]) == 2
    @test symmetryClassFromBcd([0, 1, 0, 0, 1, 0, 1, 1]) == 3
    @test symmetryClassFromBcd([0, 1, 0, 0, 1, 1, 0, 0]) == 3
    @test symmetryClassFromBcd([0, 1, 0, 0, 1, 1, 0, 1]) == 2
    @test symmetryClassFromBcd([0, 1, 0, 1, 0, 0, 1, 0]) == 3
    @test symmetryClassFromBcd([0, 1, 0, 1, 0, 0, 1, 1]) == 3
    @test symmetryClassFromBcd( [0, 1, 0, 1, 0, 1, 0, 0]) == 3
end  
