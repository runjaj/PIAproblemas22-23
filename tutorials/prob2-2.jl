### A Pluto.jl notebook ###
# v0.17.1

using Markdown
using InteractiveUtils

# ╔═╡ 4f1239ff-9994-4f24-8bd9-816d37ed7273
using Unitful, CommonMark

# ╔═╡ ca7839c8-bacb-4c2a-aaf1-ed2cdc0813ca
Fenteras = 290u"kg/hr"

# ╔═╡ 84732b55-3209-41e8-961b-c1bcd1075047
Frotas = 110u"kg/hr"

# ╔═╡ 7b22cba1-6d94-4de8-bd99-38c0c4180bfc
Penteras = 240u"kg/hr"

# ╔═╡ 2f10f572-5970-4861-b9ea-dc5828a4657a
Protas = 18u"kg/hr"

# ╔═╡ b9de6b3c-42df-11ec-1452-659a43aaa67e
md"""
### 2. Preparación de materia prima

#### Problema 2.

En una criba plana se están clasificando avellanas enteras y avellanas rotas. El caudal de alimentación de avellanas enteras es de $(Fenteras) y el de avellanas rotas en la alimentación es de $(Frotas). Se obtiene un producto con $(Penteras) de avellanas enteras y $(Protas) de avellanas rotas. ¿Qué efectividad tiene este separador sabiendo que no se acumula nada de producto en el tamiz?

##### Solución

Los datos del problema son:
"""

# ╔═╡ d99baa13-230c-4c22-a61d-aee8aedd461d
md"""
El caudal másico de alimentación ($F$) y su composición ($x_F$) serán:
"""

# ╔═╡ 6ebfd7b9-3551-400e-9919-017e00e3e147
F = Fenteras + Frotas

# ╔═╡ aa82f0e0-12ca-480b-83fd-eb3376bdc488
xF = Fenteras/F

# ╔═╡ d940ed04-e458-4770-82d9-f8e733a74141
md"""
Para la corriente de producto ($P$), el caudal másico y la fracción másica de avellanas enteras ($x_P$) es:
"""

# ╔═╡ e965f8da-5e5f-434b-af3b-bd3e2d79a268
P = Penteras + Protas

# ╔═╡ 860d0345-2cc7-43e7-b0b4-4668c97e4ea1
xP = Penteras/P

# ╔═╡ bb998859-757d-4772-9016-8577d0008789
md"""
A continuación calculamos el caudal de residuo ($R$) utilizando el balance macroscópico de materia total:
"""

# ╔═╡ a443f285-b2bf-4b51-b771-b0c9cfad3f55
R = F - P

# ╔═╡ ae240eaa-2091-4ad2-a1a0-fa831d9f71cd
md"""
Realizando el balance de materia para las avellanas enteras podemos encontrar el caudal de avellanas enteras que sale por la corriente de residuos:
"""

# ╔═╡ dba682eb-dc20-4116-9800-93ff6a8d7bfa
Renteras = Fenteras - Penteras

# ╔═╡ efb60eef-8c1b-4317-9c9b-beea1f477865
md"""
La fracción másica ($x_R$) es:
"""

# ╔═╡ 2b16568b-b381-40f3-af01-2fdae6744325
xR = Renteras/R

# ╔═╡ 2278020c-dc7b-4d8d-8290-bba04b6b4211
md"""
Por lo tanto, la eficiencia es:
"""

# ╔═╡ 33215155-f45f-43b4-8db4-7407ccecdadb
Eficiencia = P*xP/(F*xF) * R*(1-xR)/(F*(1-xF))

# ╔═╡ 9526b7f1-0c11-4291-82f6-29a6c995a877
cm"""
!!! Solución
	**Eficiencia = $(round(Eficiencia; digits=3))**
"""

# ╔═╡ 79744d01-07e1-4e1a-ad84-0769e27cecfc
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
# ╟─b9de6b3c-42df-11ec-1452-659a43aaa67e
# ╟─ca7839c8-bacb-4c2a-aaf1-ed2cdc0813ca
# ╟─84732b55-3209-41e8-961b-c1bcd1075047
# ╟─7b22cba1-6d94-4de8-bd99-38c0c4180bfc
# ╟─2f10f572-5970-4861-b9ea-dc5828a4657a
# ╟─d99baa13-230c-4c22-a61d-aee8aedd461d
# ╠═6ebfd7b9-3551-400e-9919-017e00e3e147
# ╠═aa82f0e0-12ca-480b-83fd-eb3376bdc488
# ╟─d940ed04-e458-4770-82d9-f8e733a74141
# ╠═e965f8da-5e5f-434b-af3b-bd3e2d79a268
# ╠═860d0345-2cc7-43e7-b0b4-4668c97e4ea1
# ╟─bb998859-757d-4772-9016-8577d0008789
# ╠═a443f285-b2bf-4b51-b771-b0c9cfad3f55
# ╟─ae240eaa-2091-4ad2-a1a0-fa831d9f71cd
# ╠═dba682eb-dc20-4116-9800-93ff6a8d7bfa
# ╟─efb60eef-8c1b-4317-9c9b-beea1f477865
# ╠═2b16568b-b381-40f3-af01-2fdae6744325
# ╟─2278020c-dc7b-4d8d-8290-bba04b6b4211
# ╠═33215155-f45f-43b4-8db4-7407ccecdadb
# ╟─9526b7f1-0c11-4291-82f6-29a6c995a877
# ╟─79744d01-07e1-4e1a-ad84-0769e27cecfc
# ╠═4f1239ff-9994-4f24-8bd9-816d37ed7273
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
