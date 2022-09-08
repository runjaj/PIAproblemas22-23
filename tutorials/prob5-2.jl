### A Pluto.jl notebook ###
# v0.17.1

using Markdown
using InteractiveUtils

# ╔═╡ 778af6fb-fa89-4070-989a-2db129fe60b4
using Unitful, CommonMark

# ╔═╡ 24c20360-4918-11ec-33d4-af2df15cc868
md"""
### 5. Separaciones físicas

#### Problema 2

Un filtro para clarificar vino permite un caudal de filtrado de 500 l/h al operar con una presión diferencial de 220 kPa. Se quieren filtrar 1200 l de vino con el doble de turbidez, si se desea completar la filtración en un ciclo de 1 h, ¿qué presión se debería aplicar?

##### Solución

En el enunciado se proporcionan datos de una primera filtración con presión conocida y de una seguna operación para la que queremos calcular la presión a la que debemos operar el filtro.

Como la segunda filtración se realiza en una hora, supondremos que la primera tambien se realiza en una hora. Se utiliza el mismo filtro en los dos casos, por los que _A_ toma el mismo valor en ambos casos. Los datos de operación de la primera filtración son:
"""

# ╔═╡ c8bd6de3-c5e9-4acf-8fce-171ac0e7dbaa
t = 1u"hr"

# ╔═╡ bcc01ae8-30b3-4629-8945-62f16537b433
ΔP₁ = 220u"kPa"

# ╔═╡ 4b22bb85-1084-4436-b876-d873be2f475b
V₁ = 500u"l"

# ╔═╡ 042afdc4-af79-44a8-8ff1-0a53c4d2da52
md"""
Para la segunda filtración, la turbidez es el doble que la turbidez de la primera filtración:

 $\rho_2 = 2 \rho_1$

El volumen de filtrado previsto para esta segunda filtración es:
"""

# ╔═╡ 32ae78f0-2572-4e1d-a335-7d506ace2035
V₂ = 1200u"l"

# ╔═╡ d24cd034-49f7-4443-a6a4-1e9c7a109754
md"""
A partir de los datos de la primera filtración podremos caracterizar el funcionamiento del filtro. Como no tenemos datos suficientes supondremos que la resistencia de la torta es despreciable (_Rₘ = 0_):

$$\frac{A}{V}t=\frac{\mu \alpha \rho_0}{2 \Delta P}\frac{V}{A}+\cancel{\frac{\mu R_m}{\Delta P}}$$

Escribimos las ecuaciones para las dos operaciones:

$$\begin{align}
	\frac{A}{V_1}t &=\frac{\mu \alpha \rho_1}{2 \Delta P_1}\frac{V_1}{A}\\
	\frac{A}{V_2}t &=\frac{\mu \alpha \rho_2}{2 \Delta P_2}\frac{V_2}{A}
\end{align}$$

Dividiendo ambas ecuaciones se encuentra:

$$\frac{V_2}{V_1} = \frac{\rho_1 \Delta P_2}{\rho_2 \Delta P_1} \frac{V_1}{V_2}$$

Sustituyendo ρ₂:

$$\frac{V_2}{V_1} = \frac{\Delta P_2}{2 \Delta P_1} \frac{V_1}{V_2}$$

De manera que:
"""

# ╔═╡ 6d54c407-2889-4233-88bf-4c2285d097d9
ΔP₂ = V₂^2/V₁^2*2*ΔP₁

# ╔═╡ 206052ce-c912-4ee9-98f2-d7e66d5b1498
cm"""
!!! Solución
	**ΔP₂ = $(ΔP₂)**
"""

# ╔═╡ 39a4ae68-3a78-4b12-a376-10b960605057
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
# ╟─24c20360-4918-11ec-33d4-af2df15cc868
# ╟─c8bd6de3-c5e9-4acf-8fce-171ac0e7dbaa
# ╟─bcc01ae8-30b3-4629-8945-62f16537b433
# ╟─4b22bb85-1084-4436-b876-d873be2f475b
# ╟─042afdc4-af79-44a8-8ff1-0a53c4d2da52
# ╟─32ae78f0-2572-4e1d-a335-7d506ace2035
# ╟─d24cd034-49f7-4443-a6a4-1e9c7a109754
# ╠═6d54c407-2889-4233-88bf-4c2285d097d9
# ╟─206052ce-c912-4ee9-98f2-d7e66d5b1498
# ╟─39a4ae68-3a78-4b12-a376-10b960605057
# ╠═778af6fb-fa89-4070-989a-2db129fe60b4
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
