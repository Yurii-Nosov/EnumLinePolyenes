using EnumLinePolyenes
using Test

@testset "Testset npov" begin
    @test npov(0) == 0
    @test npov(1) == 0
    @test npov(2) == 1
    @test npov(3) == 3
    @test npov(4) == 6
    @test npov(5) == 10
    @test npov(6) == 15
    @test npov(7) == 21
    @test npov(8) == 28
end 


@testset "Testset lngDistr" begin
    @test lngDistr(6) == 2
    @test lngDistr(8) == 2
    @test lngDistr(10) == 2
    @test lngDistr(12) == 2
    @test lngDistr(14) == 4
    @test lngDistr(16) == 6
    @test lngDistr(18) == 8
    @test lngDistr(20) == 10
    @test lngDistr(22) == 12
    @test lngDistr(24) == 14
    @test lngDistr(26) == 18
    @test lngDistr(28) == 22
    @test lngDistr(30) == 26
    @test lngDistr(32) == 30
    @test lngDistr(34) == 34
end 

@testset "Testset calcDistrAllGraphsOverlap" begin
    @test genCodeNonCis3fromZE(10) |> calcDistrAllGraphsOverlap == [31, 0, 0, 0]
    @test genCodeNonCis3fromZE(12) |> calcDistrAllGraphsOverlap == [118, 0, 0, 0]
    @test genCodeNonCis3fromZE(14) |> calcDistrAllGraphsOverlap == [422, 3, 2, 0, 0, 0]
    @test genCodeNonCis3fromZE(16) |> calcDistrAllGraphsOverlap == [1456, 17, 17, 3, 2, 0, 0, 0]
    @test genCodeNonCis3fromZE(18) |> calcDistrAllGraphsOverlap == [4938, 76, 95, 35, 11, 3, 2, 0, 0, 0]
    @test genCodeNonCis3fromZE(20) |> calcDistrAllGraphsOverlap ==  [16546, 304, 487, 192, 79, 29, 11, 3, 
    2, 0, 0, 0]
    @test genCodeNonCis3fromZE(22) |> calcDistrAllGraphsOverlap == [55061, 1155, 2184, 965, 461, 185, 64, 
    29, 11, 3, 2, 0, 0, 0]
    @test genCodeNonCis3fromZE(24) |> calcDistrAllGraphsOverlap == [182280, 4238, 9267, 4323, 2353, 1046, 
    404, 147, 71, 33, 11, 3, 2, 0, 0, 0]
    @test genCodeNonCis3fromZE(26) |> calcDistrAllGraphsOverlap == [601323, 15155, 37554, 18220, 10892, 
    5447, 2130, 910, 414, 179, 72, 35, 13, 0, 3, 0, 2, 0, 0, 0]    
end 



