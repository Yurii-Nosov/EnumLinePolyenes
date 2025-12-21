using Documenter, EnumLinePolyenes

makedocs(sitename="EnumLinePolyenes.jl",
    modules=[EnumLinePolyenes],
    pages=[
        "Home" => "index.md",
        "WorldDynamics tutorial" => "Generation.md",
        "World 2 equations, variables, and parameters" => "Enumeration.md",
        "World 3 equations, variables, and parameters" => "SymmetryGroups.md",
        "World 3 equations, variables, and parameters" => "Overlap.md",
        "Source code documentation" => "source.md",
    ]
)

deploydocs(
    repo = "github.com/Yurii-Nosov/EnumLinePolyenes.jl.git",
)
