### A Pluto.jl notebook ###
# v0.17.5

using Markdown
using InteractiveUtils

# ╔═╡ 3beeb976-19fb-44f7-93aa-7484facbc5b9
using Unitful, CommonMark

# ╔═╡ b89c121c-4dc8-11ec-26fe-7772168d67da
cm"""
Se desea procesar térmicamente una leche de vaca con una concentración de _Coxiella burnetii_ de 500 ufc/ml. El tratamiento térmico se realizará a una temperatura constante de 72 °C y tiene como objetivo lograr una concentración final de 10⁻⁸ ufc/ml. Contestar a las siguientes preguntas:

{type=a}
1. Calcular la duración del tratamiento para lograr el objetivo planteado.

2. Se desea conocer el impacto del tratamiento sobre la vitamina A. Calcular el número de reducciones decimales que sufrirá la vitamina tras el tratamiento.

3. Para reducir el impacto del tratamiento sobre la vitamina A, se decide realizar el procesado a 85 °C, con el mismo objetivo de inactivación del microorganismo que en el tratamiento a 72 °C. Calcular _n_ para la vitamina A en este caso

Datos:

- _C. burnetii_: D₆₃ = 3.72 min, z = 4.34 °C

- Vitamina A: D₁₂₂ = 2.4·10⁻³ s, z = 23 °C
"""

# ╔═╡ 3558e102-f817-4f26-91d4-86e41ec9a4ad
md"""
#### Solución

Datos:
"""

# ╔═╡ 2b9facc9-e90a-46bd-b1cd-2d4d3e0c3aed
c₀ = 500u"ml^-1"

# ╔═╡ 05d8e3b0-67fe-4a9f-8128-2a53bba23667
c = 1e-8u"ml^-1"

# ╔═╡ 67e877cf-f8ee-409f-a6c1-1ccaeca3465d
Tₚ = 72u"°C"

# ╔═╡ 74116213-57de-47f2-992b-e999fc83f015
D₆₃ = 3.72u"minute"

# ╔═╡ 671fe745-1ce4-4f07-93de-750ff23cac3c
z = 4.34u"K"

# ╔═╡ 1f645757-6024-4d37-8055-ccdcbe6680cf
Dᴬ₁₂₂ = 2.4e-3u"s"

# ╔═╡ a2bcab82-338d-404f-9da7-20c38070f9c3
zᴬ = 23u"K"

# ╔═╡ b9d5f874-ec79-41d1-a2a5-ac16c2339576
md"""
##### a.

A partir de las concentraciones encontramos _n_:
"""

# ╔═╡ c0b5b5c6-100e-4202-8647-53858341ccd5
n = log10(c₀/c)

# ╔═╡ e052e3fa-8dd0-4071-9e54-aec1e1329d63
md"""
El tiempo de reducción decimal a la temperatura de tratamiento es:
"""

# ╔═╡ 81520c14-fb0a-4026-a213-d4cb1c8c196c
D₇₂ = D₆₃*10^((63u"°C"-Tₚ)/z)

# ╔═╡ 11709e92-fb81-41e3-b471-a7b1b2432e12
md"""
Finalmente, determinamos la duración del tratamiento a temperatura constante:
"""

# ╔═╡ c192c1f5-4df3-444a-b428-fbb0d194e118
F₇₂ = n*D₇₂

# ╔═╡ de834b5a-9c1c-4eb3-b435-f2db3b2cf7c9
md"""
#### b.
"""

# ╔═╡ 3d6080b0-e761-4f88-898b-6fbeebafcf4d
md"""
Para conocer el efecto sobre la vitamina A, necesitamos encontrar su tiempo de reducción decimal a la temperatura a la que se realiza el procesado. Indico los datos y resultados relativos a la vitamina A con una ᴬ:
"""

# ╔═╡ ec34b07a-0222-4b47-875e-306cad9ee313
Dᴬ₇₂ = Dᴬ₁₂₂*10^((122u"°C"-Tₚ)/zᴬ)

# ╔═╡ f99cd3d2-8b5b-4095-aaa7-913be01df247
md"""
Como la duración del tratamiento la conocemos (F₇₂), el cálculo del efecto del tratamiento sobre la vitamina A es directo:
"""

# ╔═╡ 434f4445-acab-4d4c-aebf-215971dba55a
nᴬ = F₇₂/Dᴬ₇₂ |> upreferred

# ╔═╡ a05c0058-7afb-471a-a421-de07da76f9f3
md"""
Comprobamos que la pasteurización destruye prácticamente por completo a la vitamina A.
"""

# ╔═╡ 2244d400-36eb-49a6-b17a-c261906e1fa5
md"""
### c.
"""

# ╔═╡ 12b102fe-a103-4476-b5f2-95fa31367d3a
md"""
En primer lugar, calculamos la duración del tratamiento para lograr la _n_ deseada para el microorganismo objetivo. Básicamente es repetir los dos apartados anteriores pero para una diferente temperatura:
"""

# ╔═╡ 99810e85-3074-47e2-9da4-fb16f1804467
T´ₚ = 85u"°C" 

# ╔═╡ deaf4dbb-cc37-43d8-be43-cac964d097b4
D₈₅ = D₆₃*10^((63u"°C"-T´ₚ)/z)

# ╔═╡ 7f6549a3-b5ef-4714-88da-9081ac58bee6
F₈₅ = n*D₈₅

# ╔═╡ 7b3a2498-a9d3-4ef1-acf3-8184abb31a26
md"""
El efecto sobre la vitamina A será:
"""

# ╔═╡ 58e5ccf6-607e-4ad1-b459-191e4638cf6d
Dᴬ₈₅ = Dᴬ₁₂₂*10^((122u"°C"-T´ₚ)/zᴬ)

# ╔═╡ 750c2c88-92cf-48e0-b4c5-88d45b99825f
nᴬ₈₅ = F₈₅/Dᴬ₈₅ |> upreferred

# ╔═╡ d539e6ef-27ba-4fc5-9c45-a3c26f7f6a10
md"""
Se comprueba como el aumento de $(ustrip(T´ₚ - Tₚ)) °C supone un cambio extraordinario en el impacto sobre la vitamina A. A $(T´ₚ) el efecto es mínimo comprado con el efecto a $(Tₚ).
"""

# ╔═╡ 9b947791-3eda-444f-9de8-b6d025b8685f
cm"""
!!! Solución
	**a.** _F₇₂_ = $(round(typeof(F₇₂), F₇₂; digits=3)) = $(round(u"s", (F₇₂ |> u"s"); digits=1))

	**b.** _n_ = $(round(nᴬ; digits=1)) (a $(Tₚ))

	**c.** _n_ = $(round(nᴬ₈₅; digits=2)) (a $(T´ₚ))
"""

# ╔═╡ 51788aa8-155c-447a-8aa0-51b29cab454c
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

[[Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[CommonMark]]
deps = ["Crayons", "JSON", "URIs"]
git-tree-sha1 = "393ac9df4eb085c2ab12005fc496dae2e1da344e"
uuid = "a80b9123-70ca-4bc0-993e-6e3bcb318db6"
version = "0.8.3"

[[CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"

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
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"

[[Parsers]]
deps = ["Dates"]
git-tree-sha1 = "ae4bbcadb2906ccc085cf52ac286dc1377dceccc"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.1.2"

[[Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

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

[[libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
"""

# ╔═╡ Cell order:
# ╟─b89c121c-4dc8-11ec-26fe-7772168d67da
# ╟─3558e102-f817-4f26-91d4-86e41ec9a4ad
# ╟─2b9facc9-e90a-46bd-b1cd-2d4d3e0c3aed
# ╟─05d8e3b0-67fe-4a9f-8128-2a53bba23667
# ╟─67e877cf-f8ee-409f-a6c1-1ccaeca3465d
# ╟─74116213-57de-47f2-992b-e999fc83f015
# ╟─671fe745-1ce4-4f07-93de-750ff23cac3c
# ╟─1f645757-6024-4d37-8055-ccdcbe6680cf
# ╟─a2bcab82-338d-404f-9da7-20c38070f9c3
# ╟─b9d5f874-ec79-41d1-a2a5-ac16c2339576
# ╠═c0b5b5c6-100e-4202-8647-53858341ccd5
# ╟─e052e3fa-8dd0-4071-9e54-aec1e1329d63
# ╠═81520c14-fb0a-4026-a213-d4cb1c8c196c
# ╟─11709e92-fb81-41e3-b471-a7b1b2432e12
# ╠═c192c1f5-4df3-444a-b428-fbb0d194e118
# ╟─de834b5a-9c1c-4eb3-b435-f2db3b2cf7c9
# ╟─3d6080b0-e761-4f88-898b-6fbeebafcf4d
# ╠═ec34b07a-0222-4b47-875e-306cad9ee313
# ╟─f99cd3d2-8b5b-4095-aaa7-913be01df247
# ╠═434f4445-acab-4d4c-aebf-215971dba55a
# ╟─a05c0058-7afb-471a-a421-de07da76f9f3
# ╟─2244d400-36eb-49a6-b17a-c261906e1fa5
# ╟─12b102fe-a103-4476-b5f2-95fa31367d3a
# ╠═99810e85-3074-47e2-9da4-fb16f1804467
# ╠═deaf4dbb-cc37-43d8-be43-cac964d097b4
# ╠═7f6549a3-b5ef-4714-88da-9081ac58bee6
# ╟─7b3a2498-a9d3-4ef1-acf3-8184abb31a26
# ╠═58e5ccf6-607e-4ad1-b459-191e4638cf6d
# ╠═750c2c88-92cf-48e0-b4c5-88d45b99825f
# ╟─d539e6ef-27ba-4fc5-9c45-a3c26f7f6a10
# ╟─9b947791-3eda-444f-9de8-b6d025b8685f
# ╟─51788aa8-155c-447a-8aa0-51b29cab454c
# ╠═3beeb976-19fb-44f7-93aa-7484facbc5b9
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
