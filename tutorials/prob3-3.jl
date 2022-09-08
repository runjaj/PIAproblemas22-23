### A Pluto.jl notebook ###
# v0.17.1

using Markdown
using InteractiveUtils

# ╔═╡ 7dc05451-e8cb-427f-84d1-4bc5da13e714
using CommonMark, Unitful

# ╔═╡ 58ff8788-484d-11ec-0652-8fde8205ffb0
cm"""
### 3. Reducción de tamaño

#### Problema 3

Se determina que la energía requerida para reducir partículas de un diámetro medio de 1 cm a 0.3 cm es de 11 kJ/kg. Estimar los requisitos de energía para reducir las mismas partículas de un diámetro de 0.1 cm a 0.01 cm asumiendo:

{type="a"}
1. la ley de Kick
2. la ley de Rittinger
3. La ecuación de Bond

#### Solución

Datos del problema:

Primera reducción de tamaño:
"""

# ╔═╡ 325cad99-ac36-42e3-bf16-e6d02f8c3e8f
L₁ = 1u"cm"

# ╔═╡ d15bfe4a-c733-4575-92ae-9a3f0087b8ad
L₂ = 0.3u"cm"

# ╔═╡ 0a4c8f4f-d15e-40a5-9f22-06142ebdd9a8
E = 11u"kJ/kg"

# ╔═╡ 3bd732e7-b5d9-4ce5-b008-0469342fe901
md"""
Las ´ indican los datos de la segunda reducción de tamaño:
"""

# ╔═╡ 106ce396-6d2c-42bb-be22-cf356fb2a2f4
L´₁ = 0.1u"cm"

# ╔═╡ 7f8088dd-caf1-4bcf-9aa5-faaec2dea02f
L´₂ = 0.01u"cm"

# ╔═╡ 42317c32-d859-436c-98b4-396d89cbdbcc
md"""
###### a)

La ley de Kick es:

$$E = K_k ln\left(\frac{L_1}{L_2}\right)$$

Con los datos de la primera reducción de tamaño encontramos la constante empírica $K_K$:
"""

# ╔═╡ f5a75937-0d1b-4fff-9be5-20743b891498
Kₖ = E/log(L₁/L₂)

# ╔═╡ 41e9292b-09a8-4ae7-8dc7-c52c64af5149
cm"""
!!! warning "Aviso"
	En este caso `log` indica el logaritmo neperiano. 

Ya podemos calcular el requisito de energía según la ley de Kick:
"""

# ╔═╡ dd312131-71d0-4af5-9a04-7971a5559b22
E´ₖ = Kₖ*log(L´₁/L´₂)

# ╔═╡ 9e71ce1e-9ff2-4744-a165-cfe59e2532ff
md"""
###### b)

Repetimos el proceso pero utilizando la ley de Rittinger:

$$E = K_r \left(\frac{1}{L_2} - \frac{1}{L_1}\right)$$

Primero determinamos la constante empírica:
"""

# ╔═╡ aba16bc1-e573-4139-9eae-cc56d29def8b
Kᵣ = E/(1/L₂ - 1/L₁)

# ╔═╡ 99da7c01-52e1-4899-bdd7-8fa9a574b9e3
md"""
A continuacíon la energía necesaria para poder realizar la segunda reducción de tamaño:
"""

# ╔═╡ d34375b6-d7a0-4194-a4c6-903fa1614e57
E´ᵣ = Kᵣ*(1/L´₂ - 1/L´₁)

# ╔═╡ 7fcb27a9-fe3c-4a6c-9174-747a684cf709
md"""
###### c)

Usando la ley de Bond:

$$E = Eᵢ \left(\frac{100\mathrm{\ \mu m}}{L_2}\right)^\frac{1}{2}
\left(1-\frac{1}{q^\frac{1}{2}}\right)$$

donde $q = \frac{L_1}{L_2}$.

Con los datos de la primera reducción de tamaño encontramos $E_i$:
"""

# ╔═╡ bbf63eb5-5483-48bf-99a7-43bb944155b1
q = L₁/L₂

# ╔═╡ d0c3aa30-517d-4baa-b38e-d5984a3c0217
Eᵢ = uconvert(u"kJ/kg", E/(100u"μm"/L₂)^0.5/(1-1/q^0.5))

# ╔═╡ 570645dc-5ac0-46f8-ab89-d3b622f94044
md"""
Los nuevos requisitos de energía serán:
"""

# ╔═╡ 7e3eda07-8555-49f9-acb6-abee4575c3ba
q´ = L´₁/L´₂

# ╔═╡ f145e83d-b134-4cbb-a020-a5742a7409a0
E´b = uconvert(u"kJ/kg", Eᵢ*(100u"μm"/L´₂)^0.5*(1-1/q´^0.5))

# ╔═╡ 5b859513-6364-4dec-9c9b-f1238754730d
cm"""
!!! Solución
	**a)** ``E_k`` = $(round(typeof(E´ₖ), E´ₖ; digits=2))

	**b)** ``E_r`` = $(round(typeof(E´ᵣ), E´ᵣ; digits=2))

	**c)** ``E_b`` = $(round(typeof(E´b), E´b; digits=2))
"""

# ╔═╡ 67b1656b-b8b7-4a73-a752-49d6b4288627
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
# ╟─58ff8788-484d-11ec-0652-8fde8205ffb0
# ╟─325cad99-ac36-42e3-bf16-e6d02f8c3e8f
# ╟─d15bfe4a-c733-4575-92ae-9a3f0087b8ad
# ╟─0a4c8f4f-d15e-40a5-9f22-06142ebdd9a8
# ╟─3bd732e7-b5d9-4ce5-b008-0469342fe901
# ╟─106ce396-6d2c-42bb-be22-cf356fb2a2f4
# ╟─7f8088dd-caf1-4bcf-9aa5-faaec2dea02f
# ╟─42317c32-d859-436c-98b4-396d89cbdbcc
# ╠═f5a75937-0d1b-4fff-9be5-20743b891498
# ╟─41e9292b-09a8-4ae7-8dc7-c52c64af5149
# ╠═dd312131-71d0-4af5-9a04-7971a5559b22
# ╟─9e71ce1e-9ff2-4744-a165-cfe59e2532ff
# ╠═aba16bc1-e573-4139-9eae-cc56d29def8b
# ╟─99da7c01-52e1-4899-bdd7-8fa9a574b9e3
# ╠═d34375b6-d7a0-4194-a4c6-903fa1614e57
# ╟─7fcb27a9-fe3c-4a6c-9174-747a684cf709
# ╠═bbf63eb5-5483-48bf-99a7-43bb944155b1
# ╠═d0c3aa30-517d-4baa-b38e-d5984a3c0217
# ╟─570645dc-5ac0-46f8-ab89-d3b622f94044
# ╠═7e3eda07-8555-49f9-acb6-abee4575c3ba
# ╠═f145e83d-b134-4cbb-a020-a5742a7409a0
# ╟─5b859513-6364-4dec-9c9b-f1238754730d
# ╟─67b1656b-b8b7-4a73-a752-49d6b4288627
# ╠═7dc05451-e8cb-427f-84d1-4bc5da13e714
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
