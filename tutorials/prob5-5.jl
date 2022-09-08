### A Pluto.jl notebook ###
# v0.17.1

using Markdown
using InteractiveUtils

# ╔═╡ f3945ca3-96b8-422c-a9ad-4d17cb3dd430
using Unitful, CommonMark

# ╔═╡ 7a4511bf-4f32-4c63-98b6-67b5a59ffe6f
T = 20u"°C"

# ╔═╡ 640fa033-8ba5-4f22-8371-969ca8a13cd7
conc = 0.20

# ╔═╡ 36c1f1b9-ae45-4531-954f-5eb0732d414f
ρ = 1081u"kg/m^3"

# ╔═╡ 37bff468-810c-45a1-9cfd-d7a04eb71972
Pm = 342.3u"g/mol"

# ╔═╡ 96dbd546-4b8d-11ec-2220-e1d19baf75d2
md"""
### 5. Separaciones físicas

#### Problema 5

Calcular la presión osmótica a $(T) de una solución de sacarosa en agua que contiene un $(Int(100*conc)) % en peso de sacarosa. La densidad de esta solución es de $(ρ). (Peso molecular sacarosa: $(Pm).) [[Earle](https://www.nzifst.org.nz/resources/unitoperations/conteqseparation13.htm#problems)]

##### Solución

Datos del problema:
"""

# ╔═╡ 203e331a-1b0b-4681-8ba4-2894beeca9a9
md"""
La molaridad de la solución es:

$$\frac{0.20\mathrm{\ kg\ sacarosa}}{1\mathrm{\ kg\ solución}} \frac{1081\mathrm{\ kg\ solución}}{1\mathrm{\ m^3\ solución}} \frac{1000\mathrm{\ g\ sacarosa}}{1\mathrm{\ kg\ sacarosa}} \frac{1\mathrm{\ mol}}{342.3\mathrm{\ g\ sacarosa}}$$
"""

# ╔═╡ 045b7267-ba2e-41c7-beeb-c048bb43398d
M = upreferred(conc*ρ/Pm)

# ╔═╡ d682daba-1961-496b-b0de-fff741c0491d
R = 1u"R"

# ╔═╡ 015717e3-a615-439f-a1a6-d25f5391a1ab
Π = uconvert(u"kPa", M*R*uconvert(u"K", T))

# ╔═╡ 1c63cbc4-b9bd-408c-9b87-36f4a2491ea2
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
# ╟─96dbd546-4b8d-11ec-2220-e1d19baf75d2
# ╟─7a4511bf-4f32-4c63-98b6-67b5a59ffe6f
# ╟─640fa033-8ba5-4f22-8371-969ca8a13cd7
# ╟─36c1f1b9-ae45-4531-954f-5eb0732d414f
# ╟─37bff468-810c-45a1-9cfd-d7a04eb71972
# ╟─203e331a-1b0b-4681-8ba4-2894beeca9a9
# ╠═045b7267-ba2e-41c7-beeb-c048bb43398d
# ╟─d682daba-1961-496b-b0de-fff741c0491d
# ╠═015717e3-a615-439f-a1a6-d25f5391a1ab
# ╟─1c63cbc4-b9bd-408c-9b87-36f4a2491ea2
# ╠═f3945ca3-96b8-422c-a9ad-4d17cb3dd430
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
