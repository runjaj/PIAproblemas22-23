### A Pluto.jl notebook ###
# v0.17.1

using Markdown
using InteractiveUtils

# ╔═╡ 6f660129-8ad7-4c7e-9a26-1dd84f544319
using Unitful, CommonMark

# ╔═╡ c40b2924-4852-11ec-1ef5-713123f0f665
md"""
### 3. Reducción de tamaño

#### Problema 4

Se sospecha que para un producto de interés las reacciones de oxidación, que crean olores extraños, son reacciones superficiales que suceden a una velocidad que es uniforme con el tiempo y que la vida útil del producto se relaciona directamente con el porcentaje de aromas extraños producidos. Estimar el porcentaje de reducción de vida útil como consecuencia de las reducciones de tamaño del problema anterior, es decir, de 1 cm a 0.3 cm y de 0.1 cm a 0.01 cm de diámetro, asumiendo λ = 1.5. [[Earle](https://www.nzifst.org.nz/resources/unitoperations/sizereduction3.htm#problems)]

##### Solución

La velocidad de oxidación es proporcional a la superficie, es decir:

$$r_{\mathrm{ox}} = k A$$

donde $k$ es una constante empírica de proporcionalidad y $A$ es el area superficial.

El sólido tiene como factor de forma:
"""

# ╔═╡ c50098f0-8f9e-4e57-bdf2-2f74c245fbd0
λ = 1.5

# ╔═╡ 89a20070-4472-4d92-aeba-1d12ca3dc36b
md"""
Se puede calcular el area total del sólido utilizando:

$$A_t = \frac{6 m \lambda}{\rho_p D_p}$$

Para el diametro incial:

$$A_1 = \frac{6 m \lambda}{\rho_p D_1}$$

Para el diámetro final:

$$A_2 = \frac{6 m \lambda}{\rho_p D_2}$$

Para ver el aumento de velocidad de oxidación al reducir el tamaño de las partículas podemos calcular el cociente:

$$\frac{r_2}{r_1}=\frac{\cancel{k} A_2}{\cancel{k} A_2} = \frac{\frac{6 m \lambda}{\rho_p D_1}}{\frac{6 m \lambda}{\rho_p D_2}}= \frac{D_2}{D_2}$$
"""

# ╔═╡ 5010cd7d-3b55-4135-ba9f-392b92311d6f
md"""
En el primer caso, se plantea una reducción de tamaño de 1 a 0.3 cm:
"""

# ╔═╡ 8b2f8efb-fd4d-43b4-bb4c-a541cc7736e8
md"""
---
"""

# ╔═╡ bcb58c93-2798-4219-94ef-f88eb3abb0bc
const cm = u"cm"

# ╔═╡ f88276d8-fbad-47c4-b28f-b81e61b895dc
D₁ = 1cm

# ╔═╡ 183e41a3-5fbd-4408-99d8-39bb630b1c36
D₂ = 0.3cm

# ╔═╡ b59885d5-77fa-44ed-ada9-006d350b1383
cm"""
Lo que supone que el aumento de velocidad será de un $(round(D₁/D₂;digits=2)). La vida útil se reducirá en la misma proporción que aumenta la velocidad de la vida útil, es decir, 1/$(round(D₁/D₂;digits=2)) = $(round(D₂/D₁;digits=2)).

Para el segundo caso, el aumento de velocidad es de $(0.1cm/0.01cm). En este caso la reducción de vida útil será 1/$(0.1cm/0.01cm) = $(round(0.01cm/0.1cm; digits=2)).
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
# ╟─c40b2924-4852-11ec-1ef5-713123f0f665
# ╟─c50098f0-8f9e-4e57-bdf2-2f74c245fbd0
# ╟─89a20070-4472-4d92-aeba-1d12ca3dc36b
# ╟─5010cd7d-3b55-4135-ba9f-392b92311d6f
# ╟─f88276d8-fbad-47c4-b28f-b81e61b895dc
# ╟─183e41a3-5fbd-4408-99d8-39bb630b1c36
# ╟─b59885d5-77fa-44ed-ada9-006d350b1383
# ╟─8b2f8efb-fd4d-43b4-bb4c-a541cc7736e8
# ╠═6f660129-8ad7-4c7e-9a26-1dd84f544319
# ╠═bcb58c93-2798-4219-94ef-f88eb3abb0bc
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
