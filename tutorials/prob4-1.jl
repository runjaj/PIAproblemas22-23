### A Pluto.jl notebook ###
# v0.17.1

using Markdown
using InteractiveUtils

# ╔═╡ 13b22d6c-f722-4eb0-9e3d-478461500a3c
using Statistics, CommonMark

# ╔═╡ d4eeb31c-30c9-11ec-1e9f-b1b9964ea491
cm"""
### 4. Mezclado

#### Problema 1

El análisis del contenido de grasa de un chopped cuyo contenido total de grasa es del 15 % ha dado los siguientes resultados expresados en %: 23.4, 10.4, 16.4, 19.6, 30.5, 7.6.
{type=a}
1. Calcular, para esta mezcla los índices de mezclado M₁, M₂ y M₃.

2. Si la mezcla se ha formado a partir de los ingredientes separados iniciales de grasa y carne magra después de 10 min de mezclado, calcular el índice de mezclado M₁ a los 5 min de haberse realizado el proceso. [[Earle](https://www.nzifst.org.nz/resources/unitoperations/mixing6.htm#problems)]
"""

# ╔═╡ 17273131-dfd9-4ab4-8a7f-c8ecc41f8c56
md"""
##### Solución

###### a.

En este tipo de problemas es preferible trabajar en tanto por uno en lugar de en porcentaje:
"""

# ╔═╡ 75aba8e9-ada8-4a99-b62a-22dc628b404b
muestras= [23.4, 10.4, 16.4, 19.6, 30.5, 7.6]/100

# ╔═╡ 8c4379f9-d2aa-4580-84d7-9e9c14c37d71
md"""
El contenido de grasa total, _p_, es:
"""

# ╔═╡ 1552966c-c73e-4d70-9b2a-34e873bf58fd
p = 15/100

# ╔═╡ 4fcb67d5-9c3b-4db2-98a5-108335c9eb40
md"""
A continuación calcularemos el contenido de grasa medio de las muestras y su desviación estándar:
"""

# ╔═╡ 3330a4db-a9d9-486f-b909-74be2e6a921e
x̄ = mean(muestras)

# ╔═╡ 8a3ae5e2-164a-4dbb-b495-9cd5d23c4d88
sₘ = std(muestras)

# ╔═╡ 2a301e40-4979-4056-8550-80f4362a306b
md"""
A tiempo 0:

$$S_0 = \sqrt{p (1-p)}$$
"""

# ╔═╡ 5ddd2df5-cb40-4c91-a3d6-759207f1c123
s₀ = sqrt(p*(1-p))

# ╔═╡ c246be5d-aa72-457a-b806-100e67a866b5
md"""
Como valor de la desviación estandar a tiempo infinito, $s_{\infty}$, tomaremos el valor:
"""

# ╔═╡ b2724a99-14d5-4248-9281-73f6eaeba4ac
s∞ = 0.01

# ╔═╡ 5e238894-13b5-498d-ada4-f6f413a4c2df
md"""
Los índices de mezclado serán:
"""

# ╔═╡ 1d7d15b1-a645-46c2-a33e-262761944197
M₁ = (sₘ - s∞)/(s₀ - s∞)

# ╔═╡ 485b03ad-3d13-4599-a32f-e5ce00475138
M₂ = (log(sₘ) - log(s∞))/(log(s₀) - log(s∞))

# ╔═╡ 55cdaab6-d3a2-4d4a-8346-5dcfd8c0a651
M₃ = (sₘ^2 - s∞^2)/(s₀^2 - s∞^2)

# ╔═╡ 08177899-fa10-475b-97f0-5a536f865d3a
cm"""
!!! Solución

	**M₁**  = $(round(M₁; digits=3))

	**M₂** = $(round(M₂; digits=3))

	**M₃** = $(round(M₃; digits=3))
"""

# ╔═╡ 7db554aa-7b97-483e-843c-bcdd1791a3b8
md"""
##### b.

Supondremos que la cinética de mezclado sigue una cinética de primer orden:

$$\frac{\mathrm{d} M_1}{\mathrm{d}t} = -k M_1$$

Al integrar la ecuación diferencial se obtiene:

$$ln(M_1) = ln(M_{1, 0})-k t$$

donde $M_{1, 0}$ es el índice de mezclado cuando _t_ = 0 y _k_ es una constante cinética que deberemos determinar.

En primer lugar, encontraremos el valor de $M_{1, 0}$:
"""

# ╔═╡ a3cdd320-ca29-487d-a203-460d3d3273e4
M₁¸₀ = (s₀ - s∞)/(s₀ - s∞)

# ╔═╡ 53305e20-4981-460a-b192-c9848e1aebc7
md"""
En segundo lugar, encontramos _k_ a partir del valor de _M₁_ que hemos encontrado en el apartado anterior que sabemos que se produce cuando _t_ = 10 min:
"""

# ╔═╡ 22568f01-1d15-44bd-8ab7-5b142ddef184
k = -(log(M₁)- log(M₁¸₀))/10

# ╔═╡ 2782737c-94f7-4b38-b1b7-6a9cb71f309c
md"""
El valor a los 5 minutos será:
"""

# ╔═╡ 410c16a3-d8b9-4f47-b6a0-517f8c26dd69
M₁¸₅ = M₁¸₀*exp(-k*5)

# ╔═╡ 5cf15518-b9ee-492f-ac09-005518b32710
cm"""
!!! Solución
	**M<sub>1, 5</sub> = $(round(M₁¸₅; digits=3))**
"""

# ╔═╡ 27ac83ed-2b93-4811-a0ed-989c17e4f877
md"""
---
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
CommonMark = "a80b9123-70ca-4bc0-993e-6e3bcb318db6"
Statistics = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[compat]
CommonMark = "~0.8.3"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[CommonMark]]
deps = ["Crayons", "JSON", "URIs"]
git-tree-sha1 = "393ac9df4eb085c2ab12005fc496dae2e1da344e"
uuid = "a80b9123-70ca-4bc0-993e-6e3bcb318db6"
version = "0.8.3"

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

[[SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[URIs]]
git-tree-sha1 = "97bbe755a53fe859669cd907f2d96aee8d2c1355"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.3.0"

[[Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"
"""

# ╔═╡ Cell order:
# ╠═d4eeb31c-30c9-11ec-1e9f-b1b9964ea491
# ╟─17273131-dfd9-4ab4-8a7f-c8ecc41f8c56
# ╟─75aba8e9-ada8-4a99-b62a-22dc628b404b
# ╟─8c4379f9-d2aa-4580-84d7-9e9c14c37d71
# ╟─1552966c-c73e-4d70-9b2a-34e873bf58fd
# ╟─4fcb67d5-9c3b-4db2-98a5-108335c9eb40
# ╠═3330a4db-a9d9-486f-b909-74be2e6a921e
# ╠═8a3ae5e2-164a-4dbb-b495-9cd5d23c4d88
# ╟─2a301e40-4979-4056-8550-80f4362a306b
# ╟─5ddd2df5-cb40-4c91-a3d6-759207f1c123
# ╟─c246be5d-aa72-457a-b806-100e67a866b5
# ╟─b2724a99-14d5-4248-9281-73f6eaeba4ac
# ╟─5e238894-13b5-498d-ada4-f6f413a4c2df
# ╠═1d7d15b1-a645-46c2-a33e-262761944197
# ╠═485b03ad-3d13-4599-a32f-e5ce00475138
# ╠═55cdaab6-d3a2-4d4a-8346-5dcfd8c0a651
# ╟─08177899-fa10-475b-97f0-5a536f865d3a
# ╟─7db554aa-7b97-483e-843c-bcdd1791a3b8
# ╠═a3cdd320-ca29-487d-a203-460d3d3273e4
# ╟─53305e20-4981-460a-b192-c9848e1aebc7
# ╠═22568f01-1d15-44bd-8ab7-5b142ddef184
# ╟─2782737c-94f7-4b38-b1b7-6a9cb71f309c
# ╠═410c16a3-d8b9-4f47-b6a0-517f8c26dd69
# ╟─5cf15518-b9ee-492f-ac09-005518b32710
# ╟─27ac83ed-2b93-4811-a0ed-989c17e4f877
# ╠═13b22d6c-f722-4eb0-9e3d-478461500a3c
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
