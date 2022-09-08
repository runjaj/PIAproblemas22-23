### A Pluto.jl notebook ###
# v0.17.1

using Markdown
using InteractiveUtils

# ╔═╡ 52fe70bb-1b48-4eff-8832-5057be30d157
using Unitful, CommonMark

# ╔═╡ f7bcd326-4b90-11ec-0b3e-c559631bc72e
md"""
### 5. Separaciones físicas

#### Problema 6.

En una planta de ultrafiltración de 7:1 de proteína respecto a lactosa, la capacidad de la planta es de 570 kg m⁻² h⁻¹ de leche desnatada. Calcular la capacidad de la planta en una relación de 2:1. [[Earle](https://www.nzifst.org.nz/resources/unitoperations/conteqseparation13.htm#problems)]

##### Solución

_a. Planta 7:1_
"""

# ╔═╡ 9a6be4d0-4cac-4e25-b3d0-ec4189c00491
Jᵃ = 570u"kg/m^2/hr"

# ╔═╡ 894cd52a-cbb5-4847-8d30-fce6a79da57a
cᵃ₁ = 7

# ╔═╡ 2d09999f-06d3-4b8c-aa8a-f9a3c599064f
cᵃ₂ = 1

# ╔═╡ 4a3e4053-28b7-4ab0-80f3-1cc543c5d6dd
md"""
_b. Planta 2:1_
"""

# ╔═╡ fc6303b2-3219-4e23-a50b-6968f753cfa4
cᵇ₁ = 2

# ╔═╡ e64c2dd2-30d7-4e18-83da-5a8cdad55a86
cᵇ₂ = 1

# ╔═╡ f8c03dd1-47b1-4fcd-ac80-9abf12ff397b
md"""
El caudal para una instalación de ultrafiltración es:

$$J = K A \ln\left(\frac{c_1}{c_2}\right)$$

Con los datos de la planta a (7:1) caracterizamos la instalación:
"""

# ╔═╡ 669c58ce-dcb7-4087-b463-7649a64b7961
KA = Jᵃ/log(cᵃ₁/cᵃ₂)

# ╔═╡ 616f985a-8d30-49a8-8224-442e4f9ccd08
md"""
La capacidad de producción de la la planta b (2:1) es:
"""

# ╔═╡ 020e38c1-72b0-47a5-aae9-05cfd1fa3c21
Jᵇ = KA*log(cᵇ₁/cᵇ₂)

# ╔═╡ 6d9dc3ae-3791-44e6-b523-fdde4d7b3723
cm"""
!!! Solución
	**Capacidad de la planta 2:1 = $(round(typeof(Jᵇ), Jᵇ; digits=1))**
"""

# ╔═╡ 854eb177-493b-4073-a957-cc3581d74de8
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
# ╟─f7bcd326-4b90-11ec-0b3e-c559631bc72e
# ╟─9a6be4d0-4cac-4e25-b3d0-ec4189c00491
# ╟─894cd52a-cbb5-4847-8d30-fce6a79da57a
# ╟─2d09999f-06d3-4b8c-aa8a-f9a3c599064f
# ╟─4a3e4053-28b7-4ab0-80f3-1cc543c5d6dd
# ╟─fc6303b2-3219-4e23-a50b-6968f753cfa4
# ╟─e64c2dd2-30d7-4e18-83da-5a8cdad55a86
# ╟─f8c03dd1-47b1-4fcd-ac80-9abf12ff397b
# ╠═669c58ce-dcb7-4087-b463-7649a64b7961
# ╟─616f985a-8d30-49a8-8224-442e4f9ccd08
# ╠═020e38c1-72b0-47a5-aae9-05cfd1fa3c21
# ╟─6d9dc3ae-3791-44e6-b523-fdde4d7b3723
# ╟─854eb177-493b-4073-a957-cc3581d74de8
# ╠═52fe70bb-1b48-4eff-8832-5057be30d157
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
