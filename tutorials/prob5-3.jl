### A Pluto.jl notebook ###
# v0.17.1

using Markdown
using InteractiveUtils

# ╔═╡ fbb66636-c093-4c0f-bbd1-bc9787b3561c
using Unitful, CommonMark

# ╔═╡ 725b56f2-4925-11ec-3ac8-37df578f724b
md"""
### 5. Separaciones física

#### Problema 3

En una pequeña centrífuga con un radio efectivo de trabajo de 9 cm, se desea una fuerza centrífuga de 6000g. ¿A qué velocidad debería rotar la centrífuga?

Si el bowl de la centrífuga tiene un radio mínimo de 8 cm y un radio máximo de 9 cm, ¿cuál es la razón de la fuerza centrífuga entre el radio mínimo y máximo? [[Earle](https://www.nzifst.org.nz/resources/unitoperations/mechseparation7.htm#problems)]

###### Solución

Datos del problema:
"""

# ╔═╡ 6d87838a-2842-4f32-a1cd-df62eaf2710f
r = 9u"cm"

# ╔═╡ 2ad8640d-41b2-4aef-9796-5346110bcd55
a = 6000u"gn"

# ╔═╡ 614c1788-de68-4fd7-bb28-5f7974be3c52
cm"""
!!! note "Nota"
	```gn``` es la aceleración de la gravedad.
"""

# ╔═╡ 4b51d167-051b-4105-8d20-6989aa8e27cd
md"""
La aceleración de la centrífuga es $a = r \omega$, es decir, la velocidad de rotación de la centrígua es:
"""

# ╔═╡ 4b74136b-d199-4b75-adc7-75694b757b46
ω = uconvert(u"rpm", sqrt(a/r))

# ╔═╡ 80f43d86-e3d9-4376-950c-5fee07c97200
md"""
La fuerza en una centrífuga es:

$$F = m a= m r \omega^2$$

La razón de fuerzas entre el radio mínimo y el máximo será:

$$\frac{F_{min}}{F_{max}} = \frac{m r_{min} \omega^2}{m r_{max} \omega^2}= \frac{r_{min}}{r_{max}} = \frac{8}{9}$$
"""

# ╔═╡ d1c6fb55-2c8e-473a-87d5-e373914f0c41
cm"""
!!! Solución
	``\omega =`` $(round(typeof(ω), ω))

	``\frac{F_{min}}{F_{max}} =\frac{8}{9}``
"""

# ╔═╡ 05f62914-4d90-49a6-9924-8003a389c547
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
# ╟─725b56f2-4925-11ec-3ac8-37df578f724b
# ╟─6d87838a-2842-4f32-a1cd-df62eaf2710f
# ╟─2ad8640d-41b2-4aef-9796-5346110bcd55
# ╟─614c1788-de68-4fd7-bb28-5f7974be3c52
# ╟─4b51d167-051b-4105-8d20-6989aa8e27cd
# ╠═4b74136b-d199-4b75-adc7-75694b757b46
# ╟─80f43d86-e3d9-4376-950c-5fee07c97200
# ╟─d1c6fb55-2c8e-473a-87d5-e373914f0c41
# ╟─05f62914-4d90-49a6-9924-8003a389c547
# ╠═fbb66636-c093-4c0f-bbd1-bc9787b3561c
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
