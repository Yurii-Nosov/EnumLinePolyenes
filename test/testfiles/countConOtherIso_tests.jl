using EnumLinePolyenes
using Test

@testset "Testset countConfOtherIsoFromZE" begin
    @test countConfOtherIsoFromZE(6) == (6, 2, 0, 2, 1, 1)
    @test countConfOtherIsoFromZE(8) == (8, 12, 2, 10, 3, 7)
    @test countConfOtherIsoFromZE(10) == (10, 57, 11, 46, 15, 31)
    @test countConfOtherIsoFromZE(12) == (12, 243, 58, 185, 67, 118)
    @test countConfOtherIsoFromZE(14) == (14, 1001, 285, 716, 289, 427)
    @test countConfOtherIsoFromZE(16) == (16, 4053, 1342, 2711, 1216, 1495)
    @test countConfOtherIsoFromZE(18) == (18, 16305, 6131, 10174, 5014, 5160)
    @test countConfOtherIsoFromZE(20) == (20, 65385, 27394, 37991, 20338, 17653)
    @test countConfOtherIsoFromZE(22) == (22, 261857, 120321, 141536, 81416, 60120)
    @test countConfOtherIsoFromZE(24) == (24, 1048017, 521396, 526621, 322443, 204178)
    @test countConfOtherIsoFromZE(26) == (26, 4193217, 2235048, 1958169, 1265820, 692349)
    #@test countConfOtherIsoFromZE(28) == (28, 16775073, 9496478, 7278595, 4933133, 2345462)
    #@test countConfOtherIsoFromZE(30) == (30, 67104641, 40054881, 27049760, 19108459, 7941301)
end


