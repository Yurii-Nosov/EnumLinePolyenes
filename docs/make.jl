using Documenter
using DocumenterCitations 
using EnumLinePolyenes

bib = CitationBibliography(joinpath(
    @__DIR__, "src", "refs.bib");
    style=:numeric
)


makedocs(sitename="EnumLinePolyenes.jl",
    modules=[EnumLinePolyenes],
    format=Documenter.HTML(),
    pages=[
        "Home" => "index.md",
        "Generation of binary codes of molecular graphs" => "Generation.md",
        "Number of non-isomorphic graphs of isomers and conformers" => "Enumeration.md",
        "Distribution of graphs by symmetry groups" => "SymmetryGroups.md",
        "Molecular graphs with vertex overlays" => "Overlap.md",
        "Source code documentation" => "source.md",
        "bibliography.md",
    ],
    checkdocs = :exports,
    plugins = [bib],
)

deploydocs(
    repo = "github.com/Yurii-Nosov/EnumLinePolyenes.jl.git",
)
