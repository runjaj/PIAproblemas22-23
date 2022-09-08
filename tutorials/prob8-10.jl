### A Pluto.jl notebook ###
# v0.17.5

using Markdown
using InteractiveUtils

# ╔═╡ 798732d8-85da-41f8-ba19-64791ad88d3f
using Unitful, CommonMark, PrettyNumbers

# ╔═╡ 14678b9b-8dbf-42a8-bd15-2d99f281be99
cm"""
### 8. Conservación por calor

#### Problema 10

En una conserva se pueden encontrar tres tipos de microorganismos patógenos. Sus datos de termorresistencia son los siguientes:

|Microorganismo | D121 (min) | z (°C)|
|:-------------:|------------|--------|
|A              |    0.2     |5.5|
|B | 0.4 | 6.7|
|C | 0.15 | 4.7|

Con objeto de reducir el riesgo microbiano se esteriliza el producto en envases de 125 ml a 115 °C. La concentración inicial del microorganismo más termorresistente es de 3·10² ufc/ml. El objetivo de la esterilización es lograr 9 reducciones decimales del microorganismo más termorresistente. El tratamiento consiste en un calentamiento lineal (8 °C/min), etapa de mantenimiento a 115 °C y un enfriamiento, también lineal (-14 °C/min).

Responder de manera justificada a las siguientes preguntas:
{type=a}
1. Demostrar mediante cálculos que el microorganismo B es el más resistente a la temperatura de tratamiento en el autoclave (115 °C)

2. ¿Qué tiempo hay que programar en el autoclave para que se cumplan los objetivos de esterilización?

3. Si se decidiese realizar un tratamiento en continuo UHT (etapas de calentamiento y enfriamiento despreciables) a 125 °C, ¿cuál sería el tiempo de tratamiento?

4. A 125°C, ¿el microorganismo B continúa siendo el más termorresistente?

5. ¿Cuál será la concentración de microorganismos tras el tratamiento? Explicar el significado de este dato

"""

# ╔═╡ 880132c4-a213-4341-a684-d32e3894c43e
md"""
##### Solución

Los datos de termoresistencia de los microorganismos son:
"""

# ╔═╡ f8691822-a7ea-4a47-b3b1-5d650fe3fc33
Dᵃ₁₂₁ = 0.2u"minute"

# ╔═╡ bec3489d-5cde-4ced-8289-1a0d4e7152ed
zᵃ = 5.5u"K"

# ╔═╡ 21afb65a-64e3-4078-bd5a-3bfe6a2d3f7d
Dᵇ₁₂₁ = 0.4u"minute"

# ╔═╡ 7032482f-45bc-4348-af62-eeec1dab20b9
zᵇ = 6.7u"K"

# ╔═╡ 31590686-4ba0-4688-b2a3-6f6b0b531020
Dᶜ₁₂₁ = 0.15u"minute"

# ╔═╡ 0c7cb7ca-ffb3-407d-a0a7-7fb129986ad8
zᶜ = 4.7u"K"

# ╔═╡ c917e92f-ea4a-4350-ba5b-7a874bff39b5
DT(T, D121, z) = D121*10^((121u"°C"-T)/z)

# ╔═╡ 009b910c-1c0d-4146-8443-66a61b8a0c98
T = 115u"°C"

# ╔═╡ 5a8c7b32-2cad-4ec5-9a57-8ea3f5c7ba14
md"""
###### a.

Para comprobar que el microorganismo A es el más termoresistente a $(T), podemos calcular la D₁₁₅ para los tres microorganismos y comprobar que tiene el valor más elevado:
"""

# ╔═╡ 955241db-3583-4c0e-86eb-b6a651581fa4
Dᵃ₁₁₅ = DT(T, Dᵃ₁₂₁, zᵃ)

# ╔═╡ 4a6ddaa7-ed09-4406-a898-454f93729e70
Dᵇ₁₁₅ = DT(T, Dᵇ₁₂₁, zᵇ)

# ╔═╡ a568925e-a94b-4544-ad61-5b2153f7a603
Dᶜ₁₁₅ = DT(T, Dᶜ₁₂₁, zᶜ)

# ╔═╡ fac19757-3ec1-428c-bb7c-4b7b8c36592d
cm"""
!!! Solución
	El **microorganismo B** es el más termoresistente ya que tiene el tiempo de reducción decimal más elevado:

	• Dᵃ₁₁₅ = $(round(typeof(Dᵃ₁₁₅), Dᵃ₁₁₅; digits=1))

	• Dᵇ₁₁₅ = $(round(typeof(Dᵇ₁₁₅), Dᵇ₁₁₅; digits=1))

	• Dᶜ₁₁₅ = $(round(typeof(Dᶜ₁₁₅), Dᶜ₁₁₅; digits=1))
"""

# ╔═╡ 71a14886-ce5a-436a-aa9c-8efc291ec42a
md"""
###### b.

El procesado consiste en un calentamiento lineal con:
"""

# ╔═╡ f15422ad-9a33-477c-943c-278e59960f48
fh = 8u"K/minute"

# ╔═╡ 4351dabc-94a0-48bb-9531-a67f35014fe7
md"""
una etapa de mantenimiento a $(T) y una etapa final de enfriamiento con:
"""

# ╔═╡ 4fe0fa08-928a-4c66-8984-8068e5a6c2a5
fc = -14u"K/minute"

# ╔═╡ fedd0a35-9c44-4616-8dc9-01cd33de2de1
md"""
El objetivo del tratamiento es:
"""

# ╔═╡ 7004714f-d5d8-4b5c-9aec-f6664f770bc4
n = 9

# ╔═╡ 68c7e83a-424b-4dcf-8a0e-b4f48434e5af
md"""
Tomaremos como temperatura de referencia:
"""

# ╔═╡ 65a36069-08a9-4160-b28b-e8faffd3a058
Tref = 115u"°C"

# ╔═╡ abf03797-cab6-41b2-a2e9-cb43108433b7
md"""
Para encontrar la duración de la etapa de mantenimiento debemos encontrar el valor esterilizante del proceso y las letalidades de la etapa de calentamiento y de enfriamiento:
"""

# ╔═╡ d994c739-41c9-4f35-8bca-e6a7620b2d8c
DTref = DT(Tref, Dᵇ₁₂₁, zᵇ)

# ╔═╡ d9a88cf3-bb54-4c13-bf74-4480f0ac7778
FTref = n*DTref

# ╔═╡ 6b37cdc7-9c98-4013-ad9b-5b8e5318c33c
md"""
Para calcular las letalidades supongo que el producto se encuentra a 30 °C antes y después del procesado:
"""

# ╔═╡ 49f4f52a-aa0f-4f84-b926-22690b174b1f
L₁ = zᵇ/(fh*log(10))*(10^((T-Tref)/zᵇ)- 10^((30u"°C"-Tref)/zᵇ))

# ╔═╡ b46c2e74-7d7b-42cc-ba48-a34809e43b5f
L₃ = zᵇ/(fc*log(10))*(10^((30u"°C"-Tref)/zᵇ)- 10^((T-Tref)/zᵇ))

# ╔═╡ ed4359d2-932d-41f3-bfce-09e53632ed93
md"""
La letalidad de la etapa de mantenimiento será:
"""

# ╔═╡ e978660b-236a-4c00-b5f9-4431f2cd4dbf
L₂ = FTref - L₁ - L₃

# ╔═╡ e10c8300-ce54-450a-bfdd-4962fcf15816
md"""
Lo que supone que la duración de la etapa de manteniento es:
"""

# ╔═╡ 936f7d58-a130-4706-b377-4e6e5efb5f30
Δt₂ = L₂*10^((Tref-T)/zᵇ)

# ╔═╡ abb88dd7-1ae8-45bb-b3eb-53e4715ef908
cm"""
!!! Solución
	La duración de la etapa de mantenimiento es:

	**Δt₂ = $(round(typeof(Δt₂), Δt₂; digits=1))**
"""

# ╔═╡ f870127c-0a47-4b9d-a867-42315934da48
md"""
###### c.

El procesado UHT se realiza a la temperatura:
"""

# ╔═╡ 468f556e-b8b5-4e60-8c22-dc702b574982
Tᵤₕₜ = 125u"°C"

# ╔═╡ e5cada81-0f2d-4f2b-99f7-76fb3ee8036e
DTᵤₕₜ = DT(Tᵤₕₜ, Dᵇ₁₂₁, zᵇ)

# ╔═╡ d9eec29d-80fa-4e2f-bc83-72f644c782a0
FTᵤₕₜ = n*DTᵤₕₜ

# ╔═╡ 196f1ee9-131b-400a-ae85-633e3242785e
cm"""
!!! Solución
	La duración del tratamiento UHT a $(Tᵤₕₜ) es:

	**F<sub>T<sub>UHT</sub></sub> = $(round(typeof(FTᵤₕₜ), FTᵤₕₜ; digits=3)) = $(round(u"s", FTᵤₕₜ; digits=3))**
"""

# ╔═╡ b92b805a-7c4b-44f7-adf4-5797e2ecefb4
md"""
###### d.

Repetimos el apartado a. para los microorganismos A y C pero para $(Tᵤₕₜ):
"""

# ╔═╡ e1a7ee00-f970-4fb5-8972-6ecf10484448
Dᵃ₁₂₅ = DT(Tᵤₕₜ, Dᵃ₁₂₁, zᵃ)

# ╔═╡ bf13b3d6-ddf9-4ae9-ad21-b9621c2c7d3e
Dᵇ₁₂₅ = DTᵤₕₜ

# ╔═╡ 89358392-3e08-4719-a84e-bcf2e3a2ac0c
Dᶜ₁₂₅ = DT(Tᵤₕₜ, Dᶜ₁₂₁, zᶜ)

# ╔═╡ 1ba2fc36-2d69-4585-9afb-17e1c3e517b5
cm"""
!!! Solución
	Se comprueba que el microorganismo B continua siendo el más termoresistente:

	• Dᵃ₁₂₅ = $(round(typeof(Dᵃ₁₂₅), Dᵃ₁₂₅; digits=3))

	• Dᵇ₁₂₅ = $(round(typeof(Dᵇ₁₂₅), Dᵇ₁₂₅; digits=3))

	• Dᶜ₁₂₅ = $(round(typeof(Dᶜ₁₂₅), Dᶜ₁₂₅; digits=3))
"""

# ╔═╡ 9cb6724e-00fd-461c-8ff0-fa1a28a1dba4
md"""
###### e.

La concentración inicial de microorganismos es:
"""

# ╔═╡ a43fa805-3af5-452a-958d-f8e32a484738
c₀ = 3e2u"ml^-1"

# ╔═╡ 816a9597-54d7-4438-a27e-2bc3b6786c99
md"""
Los envases tienen un volumen de:
"""

# ╔═╡ a5ee9037-5b78-442c-a013-7bfec688654f
V = 125u"ml"

# ╔═╡ 1b60df12-aa86-416f-bd44-5a9966c2d11a
md"""
Por lo que el número de microorganismos por envase es:
"""

# ╔═╡ c29efaf7-f541-4b15-963f-bcea41708b43
N₀ = c₀*V

# ╔═╡ ee01a70b-a2a7-4e1b-9227-a9b932210bda
md"""
A partir del número de reducciones objetivo podemos encontrar el número de microorganismos por envase tras el tratamiento:
"""

# ╔═╡ e606329c-30e2-47c8-b67d-1f50efc971f2
N = N₀*10.0^-n

# ╔═╡ 573d3e19-4835-4cb4-afb1-4baf7c55ddb3
cm"""
Lo que supone que habrá un microorganismo vivo cada <sup>1</sup>/<sub>N</sub> = <sup>1</sup>/<sub>$(pretty_number(String, round(N;sigdigits=3)))</sub> envases, es decir, hay $(round(Int, (1/N))) envases/ufc.
"""

# ╔═╡ 567a4ee3-0696-4f8e-9db7-277a26822bd0
cm"""
!!! Solución
	Un envase de cada $(round(Int,ceil(1/N))) envases tendrá problemas de conservación.
"""

# ╔═╡ 91af64a8-534d-11ec-17d3-4789d2d4a039
md"""
---
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
CommonMark = "a80b9123-70ca-4bc0-993e-6e3bcb318db6"
PrettyNumbers = "d1bdb62b-d559-469f-b147-fd8a93502a34"
Unitful = "1986cc42-f94f-5a68-af5c-568840ba703d"

[compat]
CommonMark = "~0.8.3"
PrettyNumbers = "~0.2.0"
Unitful = "~1.9.2"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.1"
manifest_format = "2.0"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.CommonMark]]
deps = ["Crayons", "JSON", "URIs"]
git-tree-sha1 = "393ac9df4eb085c2ab12005fc496dae2e1da344e"
uuid = "a80b9123-70ca-4bc0-993e-6e3bcb318db6"
version = "0.8.3"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"

[[deps.ConstructionBase]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "f74e9d5388b8620b4cee35d4c5a618dd4dc547f4"
uuid = "187b0558-2788-49d3-abe0-74a17ed4e7c9"
version = "1.3.0"

[[deps.Crayons]]
git-tree-sha1 = "3f71217b538d7aaee0b69ab47d9b7724ca8afa0d"
uuid = "a8cc5b0e-0ffa-5ad4-8c14-923d3ee1735f"
version = "4.0.4"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "8076680b162ada2a031f707ac7b4953e30667a37"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.2"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"

[[deps.Parsers]]
deps = ["Dates"]
git-tree-sha1 = "ae4bbcadb2906ccc085cf52ac286dc1377dceccc"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.1.2"

[[deps.PrettyNumbers]]
deps = ["Printf"]
git-tree-sha1 = "af25fbe98f14a028614aba30e098dc26db35dd82"
uuid = "d1bdb62b-d559-469f-b147-fd8a93502a34"
version = "0.2.0"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.URIs]]
git-tree-sha1 = "97bbe755a53fe859669cd907f2d96aee8d2c1355"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.3.0"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.Unitful]]
deps = ["ConstructionBase", "Dates", "LinearAlgebra", "Random"]
git-tree-sha1 = "0992ed0c3ef66b0390e5752fe60054e5ff93b908"
uuid = "1986cc42-f94f-5a68-af5c-568840ba703d"
version = "1.9.2"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
"""

# ╔═╡ Cell order:
# ╟─14678b9b-8dbf-42a8-bd15-2d99f281be99
# ╟─880132c4-a213-4341-a684-d32e3894c43e
# ╟─f8691822-a7ea-4a47-b3b1-5d650fe3fc33
# ╟─bec3489d-5cde-4ced-8289-1a0d4e7152ed
# ╟─21afb65a-64e3-4078-bd5a-3bfe6a2d3f7d
# ╟─7032482f-45bc-4348-af62-eeec1dab20b9
# ╟─31590686-4ba0-4688-b2a3-6f6b0b531020
# ╟─0c7cb7ca-ffb3-407d-a0a7-7fb129986ad8
# ╟─5a8c7b32-2cad-4ec5-9a57-8ea3f5c7ba14
# ╠═c917e92f-ea4a-4350-ba5b-7a874bff39b5
# ╟─009b910c-1c0d-4146-8443-66a61b8a0c98
# ╠═955241db-3583-4c0e-86eb-b6a651581fa4
# ╠═4a6ddaa7-ed09-4406-a898-454f93729e70
# ╠═a568925e-a94b-4544-ad61-5b2153f7a603
# ╟─fac19757-3ec1-428c-bb7c-4b7b8c36592d
# ╟─71a14886-ce5a-436a-aa9c-8efc291ec42a
# ╟─f15422ad-9a33-477c-943c-278e59960f48
# ╟─4351dabc-94a0-48bb-9531-a67f35014fe7
# ╟─4fe0fa08-928a-4c66-8984-8068e5a6c2a5
# ╟─fedd0a35-9c44-4616-8dc9-01cd33de2de1
# ╟─7004714f-d5d8-4b5c-9aec-f6664f770bc4
# ╟─68c7e83a-424b-4dcf-8a0e-b4f48434e5af
# ╠═65a36069-08a9-4160-b28b-e8faffd3a058
# ╟─abf03797-cab6-41b2-a2e9-cb43108433b7
# ╠═d994c739-41c9-4f35-8bca-e6a7620b2d8c
# ╠═d9a88cf3-bb54-4c13-bf74-4480f0ac7778
# ╟─6b37cdc7-9c98-4013-ad9b-5b8e5318c33c
# ╠═49f4f52a-aa0f-4f84-b926-22690b174b1f
# ╠═b46c2e74-7d7b-42cc-ba48-a34809e43b5f
# ╟─ed4359d2-932d-41f3-bfce-09e53632ed93
# ╠═e978660b-236a-4c00-b5f9-4431f2cd4dbf
# ╟─e10c8300-ce54-450a-bfdd-4962fcf15816
# ╠═936f7d58-a130-4706-b377-4e6e5efb5f30
# ╟─abb88dd7-1ae8-45bb-b3eb-53e4715ef908
# ╟─f870127c-0a47-4b9d-a867-42315934da48
# ╟─468f556e-b8b5-4e60-8c22-dc702b574982
# ╠═e5cada81-0f2d-4f2b-99f7-76fb3ee8036e
# ╠═d9eec29d-80fa-4e2f-bc83-72f644c782a0
# ╟─196f1ee9-131b-400a-ae85-633e3242785e
# ╟─b92b805a-7c4b-44f7-adf4-5797e2ecefb4
# ╠═e1a7ee00-f970-4fb5-8972-6ecf10484448
# ╠═bf13b3d6-ddf9-4ae9-ad21-b9621c2c7d3e
# ╠═89358392-3e08-4719-a84e-bcf2e3a2ac0c
# ╟─1ba2fc36-2d69-4585-9afb-17e1c3e517b5
# ╟─9cb6724e-00fd-461c-8ff0-fa1a28a1dba4
# ╟─a43fa805-3af5-452a-958d-f8e32a484738
# ╟─816a9597-54d7-4438-a27e-2bc3b6786c99
# ╟─a5ee9037-5b78-442c-a013-7bfec688654f
# ╟─1b60df12-aa86-416f-bd44-5a9966c2d11a
# ╟─c29efaf7-f541-4b15-963f-bcea41708b43
# ╟─ee01a70b-a2a7-4e1b-9227-a9b932210bda
# ╠═e606329c-30e2-47c8-b67d-1f50efc971f2
# ╟─573d3e19-4835-4cb4-afb1-4baf7c55ddb3
# ╟─567a4ee3-0696-4f8e-9db7-277a26822bd0
# ╟─91af64a8-534d-11ec-17d3-4789d2d4a039
# ╠═798732d8-85da-41f8-ba19-64791ad88d3f
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
