### A Pluto.jl notebook ###
# v0.17.1

using Markdown
using InteractiveUtils

# ╔═╡ 6bf1ec86-84b4-443e-8b5b-32122dad5c21
using Unitful, CommonMark

# ╔═╡ 50c813f2-4279-40ce-bcaa-c26cc37f51e7
D = 5u"μm"

# ╔═╡ 70fa6563-4f68-4789-af4e-a23bf1c8d30a
r = 5u"cm"

# ╔═╡ 0c5548fc-666a-442e-814a-47cf512d6424
d = 3u"cm"

# ╔═╡ 92fa8c50-b3f3-46f8-8d5c-390a020b624e
t = 1u"s"

# ╔═╡ 9958fb7f-1e6f-489e-93c6-b4751f382b0e
ρₚ = 900u"kg/m^3"

# ╔═╡ de54265a-4b86-11ec-3195-a9dd90fb10c9
md"""
### 5. Separaciones físicas

#### Problema 4

Se separa una emulsión aceite/agua con glóbulos de $(D) en aceite y agua, ¿qué velocidad (rpm) se necesitaría si el radio de operación de la centrífuga es de $(r)? Asumir que los glóbulos deben desplazarse $(d) y que este movimiento se debe realizar en $(t) para que la centrífuga pueda operar en continuo dadas las condiciones de producción.

Datos: Densidad del aceite: $(ρₚ). [[Earle](https://www.nzifst.org.nz/resources/unitoperations/mechseparation7.htm#problems)]

##### Solución

Los datos del problema son:
"""

# ╔═╡ 8207bc53-cef6-4d3a-9273-f53e4ae6a9d4
ρf = 1000u"kg/m^3"

# ╔═╡ 97e7cfc3-449c-41b5-b78d-2b8f35a60909
μ = 1u"cP"

# ╔═╡ 6a397ae7-4461-4e46-ae4a-ba447b7bf39a
md"""
La velocidad a la que se desplaza un glóbulo en una centrífuga es:

$$v=\frac{D^2 a (\rho_p - \rho_f)}{18 \mu}$$

La velocidad a la que se debe desplazar el glóbulo de aceite es un valor negativo porque al ser el aceite menos denso que el agua se desplaza hacia el interior de la centrífuga:
"""

# ╔═╡ 8cbfe2ae-abe6-450c-9396-0208832d4dc1
v = -d/t

# ╔═╡ 16f10c79-bf7b-47d2-9100-f72040177a17
md"""
Para que se pueda desplazar a esa velocidad, la aceleración a la que debe estar sometido es:
"""

# ╔═╡ a31b34f3-bfc1-4d41-82be-27a4a12393fc
a = upreferred(v*18*μ/(D^2*(ρₚ - ρf)))

# ╔═╡ 3c480b7e-5e93-4eb3-8b2c-4fe09ff0b58c
md"""
A partir de la aceleración, encontramos la velocidad angular expresada en rpm:
"""

# ╔═╡ 92f0ea58-d160-4b6e-9863-43ebcddd57d3
ω = uconvert(u"rpm", sqrt(a/r))

# ╔═╡ 6629f216-a43b-4296-a99f-0060c2a11cf0
cm"""
!!! Solución
	**ω = $(round(Int, ustrip(ω))) rpm**
"""

# ╔═╡ d6f0ac77-4adf-4a99-99b7-d60d156d6b58
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
# ╟─de54265a-4b86-11ec-3195-a9dd90fb10c9
# ╟─50c813f2-4279-40ce-bcaa-c26cc37f51e7
# ╟─70fa6563-4f68-4789-af4e-a23bf1c8d30a
# ╟─0c5548fc-666a-442e-814a-47cf512d6424
# ╟─92fa8c50-b3f3-46f8-8d5c-390a020b624e
# ╟─9958fb7f-1e6f-489e-93c6-b4751f382b0e
# ╟─8207bc53-cef6-4d3a-9273-f53e4ae6a9d4
# ╟─97e7cfc3-449c-41b5-b78d-2b8f35a60909
# ╟─6a397ae7-4461-4e46-ae4a-ba447b7bf39a
# ╟─8cbfe2ae-abe6-450c-9396-0208832d4dc1
# ╟─16f10c79-bf7b-47d2-9100-f72040177a17
# ╠═a31b34f3-bfc1-4d41-82be-27a4a12393fc
# ╟─3c480b7e-5e93-4eb3-8b2c-4fe09ff0b58c
# ╠═92f0ea58-d160-4b6e-9863-43ebcddd57d3
# ╟─6629f216-a43b-4296-a99f-0060c2a11cf0
# ╟─d6f0ac77-4adf-4a99-99b7-d60d156d6b58
# ╠═6bf1ec86-84b4-443e-8b5b-32122dad5c21
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
