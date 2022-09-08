### A Pluto.jl notebook ###
# v0.17.1

using Markdown
using InteractiveUtils

# ╔═╡ 5103d352-6510-49a6-9729-c7c7f7f8b57d
using Unitful, CommonMark

# ╔═╡ 2c4311ee-4300-11ec-2c90-db0cd320fb0d
md"""
### 2. Preparación de materia prima

#### Problema 4

En una instalación de producción de aceite de oliva se utiliza una centrífuga para purificar el aceite. Una corriente de agua (w) y aceite (o) de 600 l/h con una composición de un 70 % (v/v) de agua alimenta una centrífuga de la que se obtiene una corriente de aceite y una corriente de agua con un 2% (v/v) de aceite. Calcular la efectividad de la separación.
    
Datos: Densidad del agua = 1000 kg/m³. Densidad del aceite = 900 kg/m³

#### Solución

Los datos del problema son:
"""

# ╔═╡ 7b701e39-414b-4cef-9551-ed181703877b
Qf = 600u"l/hr"

# ╔═╡ 84d83367-92fd-421e-8eb7-79e135ee5db3


# ╔═╡ 4215367f-206d-4be0-9a64-6cb0d411afd6
md"""
---
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
CommonMark = "a80b9123-70ca-4bc0-993e-6e3bcb318db6"
Unitful = "1986cc42-f94f-5a68-af5c-568840ba703d"

[compat]
CommonMark = "~0.8.3"
Unitful = "~1.9.1"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[CommonMark]]
deps = ["Crayons", "JSON", "URIs"]
git-tree-sha1 = "393ac9df4eb085c2ab12005fc496dae2e1da344e"
uuid = "a80b9123-70ca-4bc0-993e-6e3bcb318db6"
version = "0.8.3"

[[ConstructionBase]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "f74e9d5388b8620b4cee35d4c5a618dd4dc547f4"
uuid = "187b0558-2788-49d3-abe0-74a17ed4e7c9"
version = "1.3.0"

[[Crayons]]
git-tree-sha1 = "3f71217b538d7aaee0b69ab47d9b7724ca8afa0d"
uuid = "a8cc5b0e-0ffa-5ad4-8c14-923d3ee1735f"
version = "4.0.4"

[[Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "8076680b162ada2a031f707ac7b4953e30667a37"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.2"

[[Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[LinearAlgebra]]
deps = ["Libdl"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[Parsers]]
deps = ["Dates"]
git-tree-sha1 = "ae4bbcadb2906ccc085cf52ac286dc1377dceccc"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.1.2"

[[Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[Random]]
deps = ["Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[URIs]]
git-tree-sha1 = "97bbe755a53fe859669cd907f2d96aee8d2c1355"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.3.0"

[[Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[Unitful]]
deps = ["ConstructionBase", "Dates", "LinearAlgebra", "Random"]
git-tree-sha1 = "880f77d2cd4c6948e6bd55425b7b52f34dcd7f4b"
uuid = "1986cc42-f94f-5a68-af5c-568840ba703d"
version = "1.9.1"
"""

# ╔═╡ Cell order:
# ╟─2c4311ee-4300-11ec-2c90-db0cd320fb0d
# ╠═7b701e39-414b-4cef-9551-ed181703877b
# ╠═84d83367-92fd-421e-8eb7-79e135ee5db3
# ╟─4215367f-206d-4be0-9a64-6cb0d411afd6
# ╠═5103d352-6510-49a6-9729-c7c7f7f8b57d
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
