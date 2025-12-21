using EnumLinePolyenes
using Test

@testset "Testset analyz Geometry Main" begin
    @test fromBCodeToLstAngles([0, 1, 0, 1],1) |> fromLstAnglesToBCode == [0, 1, 0, 1]
    @test fromBCodeToLstAngles([0, 1, 1, 0],1) |> fromLstAnglesToBCode == [0, 1, 1, 0]
    @test fromBCodeToLstAngles([0, 1, 0, 1, 0, 1],1) |> fromLstAnglesToBCode == [0, 1, 0, 1, 0, 1]
    @test fromBCodeToLstAngles( [0, 1, 0, 1, 1, 0],1) |> fromLstAnglesToBCode ==  [0, 1, 0, 1, 1, 0]
    @test fromBCodeToLstAngles([0, 1, 1, 0, 0, 1],1) |> fromLstAnglesToBCode == [0, 1, 1, 0, 0, 1]
    @test fromBCodeToLstAngles([0, 1, 0, 1, 0, 1, 0, 1],1) |> fromLstAnglesToBCode == [0, 1, 0, 1, 0, 1, 0, 1]

end    

@testset "Testset analyz Geometry Main Hyd" begin
    @test fromBCodeToLstAngles([0, 0, 1, 1],2) |> fromLstAnglesToBCode == [0, 0, 1, 1]
    @test fromBCodeToLstAngles([0, 1, 0, 0],2) |> fromLstAnglesToBCode == [0, 1, 0, 0]
    @test fromBCodeToLstAngles([0, 0, 1, 0, 1, 1],2) |> fromLstAnglesToBCode == [0, 0, 1, 0, 1, 1]
    @test fromBCodeToLstAngles([0, 0, 1, 1, 0, 0],2) |> fromLstAnglesToBCode == [0, 0, 1, 1, 0, 0]
    @test fromBCodeToLstAngles([0, 1, 0, 0, 1, 0],2) |> fromLstAnglesToBCode == [0, 1, 0, 0, 1, 0]
    @test fromBCodeToLstAngles([0, 1, 0, 0, 1, 1],2) |> fromLstAnglesToBCode == [0, 1, 0, 0, 1, 1]

end    