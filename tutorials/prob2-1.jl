### A Pluto.jl notebook ###
# v0.17.1

using Markdown
using InteractiveUtils

# ╔═╡ c5880e67-a7ca-4670-8e2b-7969369377de
using Unitful, CommonMark

# ╔═╡ 41d507ca-e6ba-4409-aa44-1fe3dea97b34
F = 1500u"kg/hr"

# ╔═╡ a6d223b3-ca92-4ad5-82f8-b86eaf44a8dc
md"""
La fracción másica de avena del caudal de alimentación es:
"""

# ╔═╡ b935f0a3-eb57-4bed-a526-7383475b8019
xF = 0.95

# ╔═╡ 3d6220b8-8fec-406a-8e33-a3f79ff15f53
md"""
Por lo tanto, el caudal másico de avena en la alimentación al separado de discos es:
"""

# ╔═╡ 23f115a9-2c3f-46d3-a2ac-3073ec0e13cf
Favena = F * xF

# ╔═╡ 7096a55b-6669-4203-8b18-76a75da79d31
md"""
El caudal másico de  suciedad que entra en el separador por la corriente de alimentación es:
"""

# ╔═╡ 7b51f294-5e58-49a5-8091-9db1f688b7d2
Fsuciedad = F - Favena

# ╔═╡ e664b323-42ef-4403-9410-fbd1f12cc321
Sretenida = 0.99

# ╔═╡ f0879fa6-0551-436e-b2aa-126faa19cf4c
md"""
El separador de discos retiene el $(floor(Int8,Sretenida*100)) % de la suciedad que entra en el separador, por lo tanto:
"""

# ╔═╡ ea2af6b9-576e-442d-bbeb-cf5d80b35479
Rsuciedad = Fsuciedad * Sretenida

# ╔═╡ 4cb40a3e-43b9-44b9-bcc2-45728331d527
Vsuciedad = 740u"kg"

# ╔═╡ 41fc5e24-42dc-11ec-2ad0-c1009dc5fbfb
md"""
### 2 Preparación de materia prima

#### 1

Un separador de discos se alimenta con una mezcla de avena ($(floor(Int8,(xF*100))) %) y suciedad con un caudal másico de $(F). El separador logra que toda la avena salga por la salida de producto y retienen el $(floor(Int8,Sretenida*100)) % de la suciedad. Durante la operación normal, la suciedad queda retenida en el separador. La capacidad de almacenamiento de suciedad es de $(Vsuciedad), ¿cada cuánto tiempo habrá que limpiar el separador de discos?

##### Solución

El caudal másico de la alimentación es:
"""

# ╔═╡ a6905f89-991d-4682-975e-b0ff23aef565
md"""
El tiempo que debe transcurrir para que se acumulen $(Vsuciedad) en el separador será:
"""

# ╔═╡ 68f53ef2-3243-4380-bf11-ac4fa68040c5
t = Vsuciedad/Rsuciedad

# ╔═╡ b45fe982-78c4-4c7e-a820-9e08854834e4
cm"""
!!! Solución
	**t = $(round(typeof(t), t; digits = 1))**
"""

# ╔═╡ 6c86ecfe-e40a-45d5-b8aa-e9ad15efbc93
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
# ╟─41fc5e24-42dc-11ec-2ad0-c1009dc5fbfb
# ╠═41d507ca-e6ba-4409-aa44-1fe3dea97b34
# ╟─a6d223b3-ca92-4ad5-82f8-b86eaf44a8dc
# ╟─b935f0a3-eb57-4bed-a526-7383475b8019
# ╟─3d6220b8-8fec-406a-8e33-a3f79ff15f53
# ╠═23f115a9-2c3f-46d3-a2ac-3073ec0e13cf
# ╟─7096a55b-6669-4203-8b18-76a75da79d31
# ╠═7b51f294-5e58-49a5-8091-9db1f688b7d2
# ╟─f0879fa6-0551-436e-b2aa-126faa19cf4c
# ╠═e664b323-42ef-4403-9410-fbd1f12cc321
# ╠═ea2af6b9-576e-442d-bbeb-cf5d80b35479
# ╟─a6905f89-991d-4682-975e-b0ff23aef565
# ╠═4cb40a3e-43b9-44b9-bcc2-45728331d527
# ╠═68f53ef2-3243-4380-bf11-ac4fa68040c5
# ╟─b45fe982-78c4-4c7e-a820-9e08854834e4
# ╟─6c86ecfe-e40a-45d5-b8aa-e9ad15efbc93
# ╠═c5880e67-a7ca-4670-8e2b-7969369377de
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
