using EnumLinePolyenes
using Test


@testset "Testset analyzLengthCC Isomers" begin
@test analyzLengthCC(genIsoCodeFromZE,6,1.44) == [0, 0]
@test analyzLengthCC(genIsoCodeFromZE,8,1.44) == [0, 0, 0] 
@test analyzLengthCC(genIsoCodeFromZE,10,1.44) == [0, 0, 0, 0, 0, 0]
 @test analyzLengthCC(genIsoCodeFromZE,12,1.44) == [0, 0, 0, 0, 0, 0, 0, 0, 0, 0] 
end 

@testset "Testset analyzLengthCC ConTransIso" begin
@test analyzLengthCC(genConTrnIsoCodeFromZE,6,1.44) == [0, 0]
@test analyzLengthCC(genConTrnIsoCodeFromZE,8,1.44) == [0, 0, 0, 0, 0]
@test analyzLengthCC(genConTrnIsoCodeFromZE,10,1.44) == [0, 0, 0, 0, 0, 0, 0, 0, 0]
@test analyzLengthCC(genConTrnIsoCodeFromZE,12,1.44) == [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
end 

@testset "Testset analyzLengthCC ConOtherIso" begin
@test analyzLengthCC(genConOtrIsoCodeFromZE,6,1.44) == [0, 0]
@test analyzLengthCC(genConOtrIsoCodeFromZE,8,1.44) == [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
@test analyzLengthCC(genConOtrIsoCodeFromZE,10,1.44) == [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
 0, 0, 0, 0, 0]
@test analyzLengthCC(genConOtrIsoCodeFromZE,12,1.44) == [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
end 