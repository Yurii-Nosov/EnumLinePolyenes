using EnumLinePolyenes
using Test

@testset "Testset analyzLengthHydCC Isomers" begin
@test analyzLengthHydCC(genIsoCodeFromZE,6,1.44) == [0, 0]
@test analyzLengthHydCC(genIsoCodeFromZE,8,1.44) == [0, 0, 0] 
@test analyzLengthHydCC(genIsoCodeFromZE,10,1.44) == [0, 0, 0, 0, 0, 0]
@test analyzLengthHydCC(genIsoCodeFromZE,12,1.44) == [0, 0, 0, 0, 0, 0, 0, 0, 0, 0] 
end 

@testset "Testset analyzLengthHydCC ConTransIso" begin
@test analyzLengthHydCC(genConTrnIsoCodeFromZE,6,1.44) == [0, 0]
@test analyzLengthHydCC(genConTrnIsoCodeFromZE,8,1.44) == [0, 0, 0, 0, 0]
@test analyzLengthHydCC(genConTrnIsoCodeFromZE,10,1.44) == [0, 0, 0, 0, 0, 0, 0, 0, 0]
@test analyzLengthHydCC(genConTrnIsoCodeFromZE,12,1.44) == [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
end 

@testset "Testset analyzLengthHydCC ConOtherIso" begin
@test analyzLengthHydCC(genConOtrIsoCodeFromZE,6,1.44) == [0, 0]
@test analyzLengthHydCC(genConOtrIsoCodeFromZE,8,1.44) == [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
@test analyzLengthHydCC(genConOtrIsoCodeFromZE,10,1.44) == [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 0]
@test analyzLengthHydCC(genConOtrIsoCodeFromZE,12,1.44) == [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
end  


@testset "Testset analyzLengthCH Isomers" begin
@test analyzLengthCH(genIsoCodeFromZE,6,1.08) == [0, 0]
@test analyzLengthCH(genIsoCodeFromZE,8,1.08) == [0, 0, 0] 
@test analyzLengthCH(genIsoCodeFromZE,10,1.08) == [0, 0, 0, 0, 0, 0]
@test analyzLengthCH(genIsoCodeFromZE,12,1.08) == [0, 0, 0, 0, 0, 0, 0, 0, 0, 0] 
end 

@testset "Testset analyzLengthCH ConTransIso" begin
@test analyzLengthCH(genConTrnIsoCodeFromZE,6,1.08) == [0, 0]
@test analyzLengthCH(genConTrnIsoCodeFromZE,8,1.08) == [0, 0, 0, 0, 0]
@test analyzLengthCH(genConTrnIsoCodeFromZE,10,1.08) == [0, 0, 0, 0, 0, 0, 0, 0, 0]
@test analyzLengthCH(genConTrnIsoCodeFromZE,12,1.08) == [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
end 

@testset "Testset analyzLengthCH ConOtherIso" begin
@test analyzLengthCH(genConOtrIsoCodeFromZE,6,1.08) == [0, 0]
@test analyzLengthCH(genConOtrIsoCodeFromZE,8,1.08) == [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
@test analyzLengthCH(genConOtrIsoCodeFromZE,10,1.08) == [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 0]
@test analyzLengthCH(genConOtrIsoCodeFromZE,12,1.08) == [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
end  