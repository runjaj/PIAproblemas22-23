### A Pluto.jl notebook ###
# v0.17.1

using Markdown
using InteractiveUtils

# ╔═╡ e0f8100f-c518-448d-bfea-e5f08a142f2c
using Unitful, CommonMark

# ╔═╡ f135339c-279b-4cbf-806e-0d37ac836121
F = 100u"kg/hr"

# ╔═╡ fa9f326f-5c30-4224-bdac-f370ab919806
xF_agua = 0.15

# ╔═╡ 10215854-a7d7-48d5-b66d-3e9727e7a854
xP = 0.99

# ╔═╡ 8a34a366-4301-11ec-0cd7-012dd1d94e68
md"""
### 2. Preparación de materia prima

#### Problema 5

Calcular la efectividad de la separación considerando que la centrífuga se alimenta con $(F) de una mezcla con un $(Int8(xF_agua*100)) % de agua. Las corrientes de salida tienen una composición de un $(Int8(xP*100)) % de aceite y de agua, respectivamente. Todas las composiciones son en peso.

#### Solución

Los datos del problema son:
"""

# ╔═╡ 0478da1b-064a-493f-8760-3d711ec2d1ff
xR_agua = 0.99

# ╔═╡ edc4a37c-e1aa-4d64-8bf3-c0ca4f715b23
md"""
Lo que significa que las composiones de las corrientes de alimentación y de salida de agua de la centrífuga tendrán estas fracciones másicas:
"""

# ╔═╡ d009fce2-31e7-4d08-aa73-ee2672d287c9
xF = 1 - xF_agua

# ╔═╡ e3d9335f-e742-4734-8316-574f0ecee318
xR = 1 - xR_agua

# ╔═╡ e395cd00-2aed-480d-9fb1-3e7085241e35
md"""
Para encontrar los caudales másicos _P_ y _R_ planteamos los balances de materia total y de aceite:

$$\begin{align}
	F &= P + R\\
	F x_F &= P x_P + R x_R
\end{align}$$

Sustituyendo y despejando se encuentra:
"""

# ╔═╡ ce7ee943-69c7-4ddf-9478-76da6c2f5890
R = F*(xF - xP)/(xR - xP)

# ╔═╡ 0cfd3df8-fe85-4792-8151-3d758dfe50b3
P = F - R

# ╔═╡ ba413d41-6d5d-4a92-8fa4-f134499c0e5a
md"""
Ya solo queda calcular la eficiencia:
"""

# ╔═╡ cf139bd4-2675-47a9-9359-9db9842e0225
Eficiencia = P*xP/(F*xF) * R*(1-xR)/(F*(1-xF))

# ╔═╡ 34c5056c-096f-42fd-8269-31a0f2352a61
cm"""
!!! Solución
	**Eficiencia = $(round(Eficiencia; digits=3))**
"""

# ╔═╡ e2dcd095-e1e8-4a28-9b44-d9e1421d7143
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
# ╟─8a34a366-4301-11ec-0cd7-012dd1d94e68
# ╠═f135339c-279b-4cbf-806e-0d37ac836121
# ╠═fa9f326f-5c30-4224-bdac-f370ab919806
# ╠═10215854-a7d7-48d5-b66d-3e9727e7a854
# ╠═0478da1b-064a-493f-8760-3d711ec2d1ff
# ╟─edc4a37c-e1aa-4d64-8bf3-c0ca4f715b23
# ╠═d009fce2-31e7-4d08-aa73-ee2672d287c9
# ╠═e3d9335f-e742-4734-8316-574f0ecee318
# ╟─e395cd00-2aed-480d-9fb1-3e7085241e35
# ╠═ce7ee943-69c7-4ddf-9478-76da6c2f5890
# ╠═0cfd3df8-fe85-4792-8151-3d758dfe50b3
# ╟─ba413d41-6d5d-4a92-8fa4-f134499c0e5a
# ╠═cf139bd4-2675-47a9-9359-9db9842e0225
# ╟─34c5056c-096f-42fd-8269-31a0f2352a61
# ╟─e2dcd095-e1e8-4a28-9b44-d9e1421d7143
# ╠═e0f8100f-c518-448d-bfea-e5f08a142f2c
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
