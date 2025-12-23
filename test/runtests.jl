using EnumLinePolyenes
using Test

@testset "Package Tests" begin

    @testset "BaseDet Tests" begin
        include("..\\test\\testfiles\\detaills_tests.jl")

    # Write your tests here.
    end

    @testset "countBasicIsoConf Tests" begin
        include("..\\test\\testfiles\\countBasicIsoConf_tests.jl")

    # Write your tests here.
    end

    @testset "GenCodeFromZE Tests" begin
        include("..\\test\\testfiles\\genFromZE_tests.jl")

    # Write your tests here.
    end

    @testset "GenCodeFromBcd Tests" begin
        include("..\\test\\testfiles\\genFromBcd_tests.jl")

    # Write your tests here.
    end

@testset "Calcul Class Sym" begin
        include("..\\test\\testfiles\\calcClassSym_tests.jl")

    # Write your tests here.
    end

@testset "Count Conf Other Isomers" begin
        include("..\\test\\testfiles\\countConOtherIso_tests.jl")

    # Write your tests here.
    end

@testset "Calc Distrib Overlapping" begin
        include("..\\test\\testfiles\\calcDistrOverlap_tests.jl")

    # Write your tests here.
    end

    @testset "Control Geometry" begin
        include("..\\test\\testfiles\\analyzGeometry_tests.jl")
        include("..\\test\\testfiles\\analyzGeomHydro_tests.jl")

    # Write your tests here.
    end

    @testset "Control Geometry Main" begin
        include("..\\test\\testfiles\\analyzGeomMain_tests.jl")
        
    # Write your tests here.
    end


   
end
