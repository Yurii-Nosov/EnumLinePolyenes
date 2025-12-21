using EnumLinePolyenes
using Test

@testset "Testset zam" begin
@test zam(1) == 0
@test zam(0) == 1
end

@testset "Testset invert" begin
    @test invert([0,0,0,0,0]) == [1,1,1,1,1]
    @test invert([1,1,1,1,1]) == [0,0,0,0,0]
    @test invert([0,1,0,1,0]) == [1,0,1,0,1]
end

@testset "Testset func" begin
    @test func(0,0) == 1
    @test func(1,1) == 1
    @test func(0,1) == 0
    @test func(1,0) == 0
end

@testset "Testset checkMinFromZE" begin
    @test checkMinFromZE([0,0,0,0,0]) == true
    @test checkMinFromZE([1,1,1,1,1]) == true
    @test checkMinFromZE([0,0,1,0,0]) == true
    @test checkMinFromZE([1,1,0,1,1]) == true
    @test checkMinFromZE([0,1,0,1,0]) == true
    @test checkMinFromZE([1,1,0,1,0]) == false
    @test checkMinFromZE([1,1,1,1,0]) == false
    @test checkMinFromZE([0,1,0,1,1]) == true 
    @test checkMinFromZE([0,1,1,1,1]) == true
end

@testset "Testset makeMinFromZE" begin
    @test makeMinFromZE([0,0,0,0,0]) == [0,0,0,0,0]
    @test makeMinFromZE([1,1,1,1,1]) == [1,1,1,1,1]
    @test makeMinFromZE([0,0,1,0,0]) == [0,0,1,0,0]
    @test makeMinFromZE([1,1,0,1,1]) == [1,1,0,1,1]
    @test makeMinFromZE([0,1,0,1,0]) == [0,1,0,1,0]
    @test makeMinFromZE([1,1,0,1,0]) == [0,1,0,1,1]
    @test makeMinFromZE([1,1,1,1,0]) == [0,1,1,1,1]
end

@testset "Testset makeMinFromBcd" begin
    @test makeMinFromZE([0,0,0,0,0]) == [0,0,0,0,0]
    @test makeMinFromZE([1,1,1,1,1]) == [1,1,1,1,1]
    @test makeMinFromZE([0,0,1,0,0]) == [0,0,1,0,0]
    @test makeMinFromZE([1,1,0,1,1]) == [1,1,0,1,1]
    @test makeMinFromZE([0,1,0,1,0]) == [0,1,0,1,0]
    @test makeMinFromZE([1,1,0,1,0]) == [0,1,0,1,1]
    @test makeMinFromZE([1,1,1,1,0]) == [0,1,1,1,1]
end



@testset "Testset graphTypeFromZE" begin
    @test graphTypeFromZE([0, 0, 0, 0, 0])== 1
    @test graphTypeFromZE([0, 1, 0, 1, 0])== 1
    @test graphTypeFromZE([1, 0, 0, 0, 1]) == 2
    @test graphTypeFromZE([1, 0, 1, 0, 1]) == 2
    @test graphTypeFromZE([0, 0, 1, 0, 0]) == 2
    @test graphTypeFromZE([1, 1, 1, 1, 1]) == 3
    @test graphTypeFromZE([1, 1, 0, 1, 1]) == 3
     @test graphTypeFromZE([0, 1, 1, 1, 0]) == 3
end


@testset "Testset graphTypeFromBcd" begin
    @test graphTypeFromBcd([0, 1, 0, 1, 0, 1])== 1
    @test graphTypeFromBcd([0, 1, 1, 0, 0, 1])== 1
    @test graphTypeFromBcd([0, 0, 1, 0, 1, 1]) == 2
    @test graphTypeFromBcd([0, 0, 1, 1, 0, 0]) == 2
    @test graphTypeFromBcd([0, 1, 0, 0, 1, 0]) == 2
    @test graphTypeFromBcd([0, 0, 0, 0, 0, 0]) == 3
    @test graphTypeFromBcd([0, 0, 0, 1, 1, 1]) == 3
    @test graphTypeFromBcd([0, 1, 1, 1, 1, 0]) == 3
end