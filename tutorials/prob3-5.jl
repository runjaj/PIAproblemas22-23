### A Pluto.jl notebook ###
# v0.17.1

using Markdown
using InteractiveUtils

# ╔═╡ 9ee9b0c2-7379-487c-97b1-03861892e8bc
using Unitful, CommonMark

# ╔═╡ 32a60e8c-4862-11ec-1930-eb1947190aa0
md"""
### 3. Reducción de tamaño

#### Problema 5

Se desea reducir la tiempo de separación de la leche en un mínimo de una semana (antes de que la crema ascienda a la superficie), ¿cuál es el diámetro máximo que deben tener los glóbulos de crema tras su homogeneización, según la ley de Stoke, para que esto suceda? Suponer una profundidad de 10 cm.

Datos: Viscosidad de la leche: 3 mPa·s, densidad de la leche desnatada: 1.036 g/cm³, densidad de la crema: 1.008 g/cm³. [[Earle](https://www.nzifst.org.nz/resources/unitoperations/sizereduction3.htm#problems)]

#### Solución

Datos del problema:
"""

# ╔═╡ 10e79161-1fc4-42b2-8392-7afb8879e05a
μ = 3u"mPa*s"

# ╔═╡ 0aba0f10-e15e-43a8-b1b8-c1ea573d1a73
ρf = 1.036u"g/cm^3"

# ╔═╡ 870b8402-99b0-45ea-9a81-fb0cc4c6d9b8
ρₚ = 1.008u"g/cm^3"

# ╔═╡ 68fefb62-7fb5-4f72-8f15-dc7ed04505f8
t = 1u"wk"

# ╔═╡ a646a7aa-53e4-4d89-99fa-28ff5fe50bd6
d = 10u"cm"

# ╔═╡ ce60d564-ae98-4462-9b1b-c41d1753a3cb
g = 9.80665u"m/s^2"

# ╔═╡ e9172784-7378-4657-9c22-f6f8fa180e97
md"""
La ley de Stoke es:

$$v_m = \frac{D^2 g (\rho_p-\rho_f)}{18 \mu}$$

Despejando se encuentra el diámetro de los glóbulos de grasa. que hace que la emulsión sea estable durante el periodo marcado:
"""

# ╔═╡ 8205facd-b156-48bc-8a56-441d7fbd51fc
vₘ = -d/t

# ╔═╡ 5e84279e-a2e7-4fbc-b9a3-bb79256022e0
D = uconvert(u"μm", sqrt(vₘ*18*μ/(g*(ρₚ-ρf))))

# ╔═╡ 45d0dc53-5ce9-47e2-af06-908b48cd5ee5
cm"""
!!! Solución
	**D = $(round(typeof(D), D; digits=2))**
"""

# ╔═╡ e924044c-57a7-41f3-bbac-c81f173c794b
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
# ╟─32a60e8c-4862-11ec-1930-eb1947190aa0
# ╟─10e79161-1fc4-42b2-8392-7afb8879e05a
# ╟─0aba0f10-e15e-43a8-b1b8-c1ea573d1a73
# ╟─870b8402-99b0-45ea-9a81-fb0cc4c6d9b8
# ╟─68fefb62-7fb5-4f72-8f15-dc7ed04505f8
# ╟─a646a7aa-53e4-4d89-99fa-28ff5fe50bd6
# ╟─ce60d564-ae98-4462-9b1b-c41d1753a3cb
# ╟─e9172784-7378-4657-9c22-f6f8fa180e97
# ╠═8205facd-b156-48bc-8a56-441d7fbd51fc
# ╠═5e84279e-a2e7-4fbc-b9a3-bb79256022e0
# ╟─45d0dc53-5ce9-47e2-af06-908b48cd5ee5
# ╟─e924044c-57a7-41f3-bbac-c81f173c794b
# ╠═9ee9b0c2-7379-487c-97b1-03861892e8bc
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
