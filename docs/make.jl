using Documenter, EnumLinePolyenes

makedocs(sitename="EnumLinePolyenes.jl",
    modules=[EnumLinePolyenes],
    pages=[
        "Home" => "index.md",
        "Generation of binary codes of molecular graphs" => "Generation.md",
        "Number of non-isomorphic graphs of isomers and conformers" => "Enumeration.md",
        "Distribution of graphs by symmetry groups" => "SymmetryGroups.md",
        "Molecular graphs with vertex overlays" => "Overlap.md",
        "Source code documentation" => "source.md",
    ]
)

deploydocs(
    repo = "github.com/Yurii-Nosov/EnumLinePolyenes.jl.git",
)
