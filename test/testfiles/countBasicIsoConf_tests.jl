using EnumLinePolyenes
using Test

@testset "Testset countCodeFromZE" begin
    @test countCodeFromZE(6) == (6, 2, 2, 2, 6)
    @test countCodeFromZE(8) == (8, 3, 5, 12, 20)
    @test countCodeFromZE(10) == (10, 6, 9, 57, 72)
    @test countCodeFromZE(12) == (12, 10, 19, 243, 272)
    @test countCodeFromZE(14) == (14, 20, 35, 1001, 1056)
    @test countCodeFromZE(16) == (16, 36, 71, 4053, 4160)
    @test countCodeFromZE(18) == (18, 72, 135, 16305, 16512)
    @test countCodeFromZE(20) == (20, 136, 271, 65385, 65792)
    @test countCodeFromZE(22) == (22, 272, 527, 261857, 262656)
    @test countCodeFromZE(24) == (24, 528, 1055, 1048017, 1049600)
    @test countCodeFromZE(26) == (26, 1056, 2079, 4193217, 4196352)    
end 

@testset "Testset countCodeFromBcd" begin
    @test countCodeFromBcd(6) == (6, 2, 2, 2, 6)
    @test countCodeFromBcd(8) == (8, 3, 5, 12, 20)
    @test countCodeFromBcd(10) == (10, 6, 9, 57, 72)
    @test countCodeFromBcd(12) == (12, 10, 19, 243, 272)
    @test countCodeFromBcd(14) == (14, 20, 35, 1001, 1056)
    @test countCodeFromBcd(16) == (16, 36, 71, 4053, 4160)
    @test countCodeFromBcd(18) == (18, 72, 135, 16305, 16512)
    @test countCodeFromBcd(20) == (20, 136, 271, 65385, 65792)
    @test countCodeFromBcd(22) == (22, 272, 527, 261857, 262656)
    @test countCodeFromBcd(24) == (24, 528, 1055, 1048017, 1049600)
    @test countCodeFromBcd(26) == (26, 1056, 2079, 4193217, 4196352 ) 
end 