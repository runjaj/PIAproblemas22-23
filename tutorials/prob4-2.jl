### A Pluto.jl notebook ###
# v0.17.1

using Markdown
using InteractiveUtils

# ╔═╡ 062fa9dd-e045-4d09-89c9-4988efd371cd
using Unitful, CommonMark

# ╔═╡ 82511090-4e98-11ec-05b7-c3f0009b79cb
cm"""
### 4. Mezclado

#### Problema 2.

Un mezclador de líquidos con un agitador de hélice de 0.3 m de diámetro gira a 300 rpm en un tanque de 0.6 m de diámetro. 
{type=a}
1. Calcular la potencia a la que trabaja el equipo para agitar agua.

2. Calcular la potencia a la que trabaja el equipo para agitar aceite de oliva.

Datos: Viscosidad del agua = 1 mPa.s, densidad del agua = 1000 kg/m³. Viscosidad del aceite = 80 mPa.s, densidad del aceite = 914 kg/m³. [[Earle](https://www.nzifst.org.nz/resources/unitoperations/mixing6.htm#problems)]

##### Solución

Datos del problema:
"""

# ╔═╡ f92c14a5-0e9e-4ac4-8619-07d973065cbc
D = 0.3u"m"

# ╔═╡ 7c5ce7f3-cf79-42ac-a689-808ba1fa738e
N = 300u"minute^-1"

# ╔═╡ 2e06d840-94ab-47d6-8756-0e35025bac8d
μₐ = 1u"mPa*s"

# ╔═╡ 830ae31a-a4d7-4878-b01d-52894f87d415
ρₐ = 1000u"kg/m^3"

# ╔═╡ 19f4ee8b-d115-40c0-9367-a23ef2bd729f
μₒ = 80u"mPa*s"

# ╔═╡ 47059624-4ee7-475d-a5dd-e18e59892f4f
ρₒ = 914u"kg/m^3"

# ╔═╡ c115b12b-5114-4244-bf29-09477350aed2
md"""
###### a.

Calculamos en número de Reynolds:
"""

# ╔═╡ 7cbbe714-18f3-41da-a23b-c1b807062e98
Re = D^2*N*ρₐ/μₐ |> upreferred

# ╔═╡ c8c68a89-f5d9-4b2d-a9d2-fe8164fbb318
md"""
A partir de la figura 4.2 del Fellows encontramos el número de la potencia:
"""

# ╔═╡ 93a0bfcf-abaa-4ee4-9a98-d5c93ad7cd38
Poₐ = 0.3

# ╔═╡ efa7d142-bb47-47bf-a37e-f7d557f784e7
md"""
Finalmente, la potencia del agitador será:
"""

# ╔═╡ 2c1597e6-2925-4c64-9fe1-11e2a84a4d6c
Pₐ = Poₐ*ρₐ*N^3*D^5 |> u"W"

# ╔═╡ 0f2cebbb-593a-4798-b60c-fc641b90d8e1
md"""
###### b.

Repetimos el proceso para el aceite:
"""

# ╔═╡ 165b9036-9562-4893-8a71-fe1cef8329ea
Reₒ = D^2*N*ρₒ/μₒ |> upreferred

# ╔═╡ 04eea293-333d-4ace-a82e-8a4dce1876f0
Poₒ = 0.4

# ╔═╡ 0c7c05e8-0975-42b4-9fd7-7578c4dd9820
Pₒ = Poₒ*ρₒ*N^3*D^5 |> u"W"

# ╔═╡ ce229eb9-c377-4310-bfa1-f5e883f33309
cm"""
!!! Solución
	**a. P = $(round(typeof(Pₐ), Pₐ; digits=1))**

	**b. P = $(round(typeof(Pₒ), Pₒ; digits=1))**
"""

# ╔═╡ 1689eeaf-1cab-4afe-a0d6-316a69ca1aed
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
Unitful = "~1.9.2"
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
git-tree-sha1 = "0992ed0c3ef66b0390e5752fe60054e5ff93b908"
uuid = "1986cc42-f94f-5a68-af5c-568840ba703d"
version = "1.9.2"
"""

# ╔═╡ Cell order:
# ╟─82511090-4e98-11ec-05b7-c3f0009b79cb
# ╟─f92c14a5-0e9e-4ac4-8619-07d973065cbc
# ╟─7c5ce7f3-cf79-42ac-a689-808ba1fa738e
# ╟─2e06d840-94ab-47d6-8756-0e35025bac8d
# ╟─830ae31a-a4d7-4878-b01d-52894f87d415
# ╟─19f4ee8b-d115-40c0-9367-a23ef2bd729f
# ╟─47059624-4ee7-475d-a5dd-e18e59892f4f
# ╟─c115b12b-5114-4244-bf29-09477350aed2
# ╠═7cbbe714-18f3-41da-a23b-c1b807062e98
# ╟─c8c68a89-f5d9-4b2d-a9d2-fe8164fbb318
# ╠═93a0bfcf-abaa-4ee4-9a98-d5c93ad7cd38
# ╟─efa7d142-bb47-47bf-a37e-f7d557f784e7
# ╠═2c1597e6-2925-4c64-9fe1-11e2a84a4d6c
# ╟─0f2cebbb-593a-4798-b60c-fc641b90d8e1
# ╠═165b9036-9562-4893-8a71-fe1cef8329ea
# ╠═04eea293-333d-4ace-a82e-8a4dce1876f0
# ╠═0c7c05e8-0975-42b4-9fd7-7578c4dd9820
# ╟─ce229eb9-c377-4310-bfa1-f5e883f33309
# ╟─1689eeaf-1cab-4afe-a0d6-316a69ca1aed
# ╠═062fa9dd-e045-4d09-89c9-4988efd371cd
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
