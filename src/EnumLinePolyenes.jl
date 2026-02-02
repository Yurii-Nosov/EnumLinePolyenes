module EnumLinePolyenes



include("allSmallParts.jl")
include("countCodeIsoConf.jl")
include("createGraphs.jl")
include("outputGraphs.jl")
include("determClassSymmetry.jl")
include("distribGraphsOverlapping.jl")
include("genCodeBasicIsoConf.jl")
include("genCodeBasicIsoConfV2.jl")
include("genCodeSubGraphCOI.jl")
include("distribGraphsOverlapV2.jl")
include("verificationGeometry.jl")

#if false
#    include("../test/runtests.jl")
#end
#include("outputGraph.jl")

using .AllSmallParts
using .CountCodeIsoConf
using .GenCodeBasicIsoConf
using .GenCodeBasicIsoConfV2
using .GenCodeSubGraphCOI
using .CreateGraphs
using .OutputGraphs
using .DistribGraphsOverlapping
using .DistribGraphsOverlapV2
using .VerificationGeometry




using .AllSmallParts: 
    zam, invert, IntgDig, func, makeMinFromZE, makeMinFromBcd,checkMinFromZE,
    fromCodeZEtoBCode, inZEtoBcd,graphTypeFromZE, graphTypeFromBcd
export  zam, invert, IntgDig, zamena,func, makeMinFromZE, makeMinFromBcd,checkMinFromZE,
    fromCodeZEtoBCode, inZEtoBcd,graphTypeFromZE, graphTypeFromBcd   

using .CountCodeIsoConf:   
    countCodeFromZE, countCodeFromBcd,countListCodeFromZE, countListCodeFromBcd
export countCodeFromZE, countCodeFromBcd,countListCodeFromZE, countListCodeFromBcd,
    countConfOtherIsoFromZE 

using .GenCodeBasicIsoConf: makeAllCodeFromZE, makeAllCodeFromBcd,
    genIsoCodeFromZE, genConTrnIsoCodeFromZE, genConOtrIsoCodeFromZE,
    genIsoCodeFromBcd, genConTrnIsoCodeFromBcd, genConOtrIsoCodeFromBcd
export  makeAllCodeFromZE, makeAllCodeFromBcd, genIsoCodeFromZE, genConTrnIsoCodeFromZE, 
    genConOtrIsoCodeFromZE, genIsoCodeFromBcd, genConTrnIsoCodeFromBcd, genConOtrIsoCodeFromBcd  

using .GenCodeBasicIsoConfV2: makeAllCodeFromZEv2,genIsoCodeFromZEv2,
    genConTrnIsoCodeFromZEv2,genConOtrIsoCodeFromZEv2 
export makeAllCodeFromZEv2,genIsoCodeFromZEv2,genConTrnIsoCodeFromZEv2,genConOtrIsoCodeFromZEv2

using .GenCodeSubGraphCOI: genCodePartCOIfromBcd, genCodePartCOIfromZE,
    genCodeCis4pFromZE, genCodeCis3fromZE, genCodeNonCis3fromZE
export genCodePartCOIfromBcd, genCodePartCOIfromZE,
    genCodeCis4pFromZE, genCodeCis3fromZE, genCodeNonCis3fromZE

using .CreateGraphs: makePolyenPathCC, makePolyenPathHH
export makePolyenPathCC, makePolyenPathHH

using .OutputGraphs: 
    showGraph2, showGraphHyd, showGraph2Wait, outputAllGraphsCC, outputAllGraphsHH
export showGraph2, showGraphHyd, showGraph2Wait, outputAllGraphsCC, outputAllGraphsHH

using .DetermClassSymmetry: symmetryClassFromZE, symmetryClassFromBcd,calcClassSymFromZE, 
    calcClassSymFromBcd
export symmetryClassFromZE, symmetryClassFromBcd,calcClassSymFromZE, calcClassSymFromBcd

using .DistribGraphsOverlapping: npov, lngDistr, selectIntersect, showAllGraphsOverlap, 
    showSelectGraphsOverlap, calcDistrAllGraphsOverlap, outputDistrGraphsOverlap
export npov, lngDistr, selectIntersect, showAllGraphsOverlap, showSelectGraphsOverlap,
    calcDistrAllGraphsOverlap, outputDistrGraphsOverlap

using .DistribGraphsOverlapV2:  makeMolGraphAll,makeMolGraphClass,makeMolGraphCOI,
    checkYeh2,checkYeh,molGraphYeh, intersect, calcInts, enumerInters
export makeMolGraphAll,makeMolGraphClass,makeMolGraphCOI,checkYeh2,checkYeh,molGraphYeh,
    intersect, calcInts, enumerInters

using .VerificationGeometry: calcAngles, calcAngles2,scheckValues,calcLengthCC,
    calcLengthCH, analyzLengthCC,analyzLengthHydCC,analyzLengthCH, 
    fromLstAnglesToBCode, fromBCodeToLstAngles, fromLstAnglesToBCode
export calcAngles, calcAngles2,scheckValues,calcLengthCC,calcLengthCH,
     analyzLengthCC,analyzLengthHydCC,analyzLengthCH, fromLstAnglesToBCode,
    fromBCodeToLstAngles, fromLstAnglesToBCode

end
