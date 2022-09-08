### A Pluto.jl notebook ###
# v0.17.1

using Markdown
using InteractiveUtils

# ╔═╡ 778592a0-0082-4c45-accf-dcd32d4fc8a7
using CommonMark, SymPy

# ╔═╡ 63480f60-439a-11ec-1d93-d3c18aafd9e1
cm"""
### 3. Reducción de tamaño

#### Problema 3.2

Calcular los factores de forma λ para los sistemas modelo en los que las partículas son:
{type="a"}
1. cilindros con _L = 2D_,
2. tetraedros con los lados que son triángulos equiláteros
3. Estimar el área superficial específica de un polvo consistente en los dos casos anteriores en los que hay 4·10³ partículas/kg. Los cilindros tienen una densidad de 1330 kg/m³ y los tetraedros una densidad de 1500 kg/m³. [[Earle](https://www.nzifst.org.nz/resources/unitoperations/sizereduction3.htm#problems)]

##### Solución

###### a)

Para calcular el factor de forma λ debemos calcular el area y el volumen de los cilíndros.

El volumen será el área de la base multiplicada por la altura.
"""

# ╔═╡ 15a78062-130e-47b2-916d-43a7d5e417b6
md"""
La altura del cilindro es:
"""

# ╔═╡ fbe79ab4-9989-4fb0-af3b-a5809ae44d67
md"""
El area de la base es:
"""

# ╔═╡ bd042710-b1e2-449c-90c9-b29df7806e37
md"""
Por lo tanto el volumen es:
"""

# ╔═╡ bbc6a887-0fe8-4559-9d4f-6f799e45d554
md"""
El area del cilindro serán la suma del area de la base y de la tapa, que son iguales, más el área lateral, que es el producto de la circunferencia de la base por la altura del cilíndro.

La circunferencia de la base es:
"""

# ╔═╡ 5b8b5b76-1541-483f-a65b-b5a59f7e26a1
md"""
El factor de forma λ es:

$$\lambda = \frac{q}{p}$$

A partir del area y volumen de la partícula podemos encontrar los parámetros $p$ y $p$:

$$\begin{align}
	p &= \frac{V_p}{D_p^3}\\
	q &= \frac{A_p}{6 D_p^2}
\end{align}$$

Operando se encuentra:
"""

# ╔═╡ 61021811-2c4a-4c52-b4ae-90bec21639ff
cm"""
!!! Solución
	``\lambda = \frac{5}{6}``
"""

# ╔═╡ 27ae11de-1e0c-4534-9498-7d845bae8701
md"""
###### b)

Utilizando las fórmulas para el area y volumen de un tetraedro regular (las ´ indican que tratamos con los tetraedros):
"""

# ╔═╡ 4a958e90-f70f-4bfb-8191-af38642524ef
md"""
El factor de forma se puede calcular de la misma manera que en el apartado anterior:
"""

# ╔═╡ cc9654b6-cc92-4148-adf8-a4ce0404f835
cm"""
!!! Solución
	``\lambda = \sqrt{6}``
"""

# ╔═╡ ec056a31-0679-482f-a474-6fab43b62ab7
md"""
###### c)

Los datos del apartado son:
"""

# ╔═╡ eab8d558-bbf3-4635-bab0-cb09e57588c3
ρ = 1330 # kg/m³

# ╔═╡ bcca780e-9746-4ee3-9063-b80a59a052df
ρ´ = 1500 # kg/m³

# ╔═╡ e393dfeb-d1a4-407b-8502-ada2307a6bc9
N = 4000 # partículas/kg

# ╔═╡ 437fe9a7-9609-406d-af56-9952f76d02d1
md"""
El area total para el caso de los cilíndros es:
"""

# ╔═╡ e2ca87ab-cc83-4ae4-ad49-7f27b4700c48
md"""
Sabemos que el area tota es:

$$A_t = \frac{6 \lambda}{\rho D}$$

Por lo que podemos igualar esta ecuación con el valor de $A_t$ encontrado más arriba:
"""

# ╔═╡ 6ddfcc53-2e95-4c26-8e5e-b3c392fccd9e
md"""
Solo la primera de las soluciones tiene sentido físico, por lo que las otras dos no se consideran.
"""

# ╔═╡ ad80a805-adb9-48f1-85c2-d5f8a8e85905
md"""
Conocida la longitud característica de la partícula, solo queda sustituir para encontar el area total:
"""

# ╔═╡ 34e177a3-ba34-4008-ba9b-9af99582137d
md"""
Repetimos el mismo cálculo para los tetraedros:
"""

# ╔═╡ c52ddd66-77d1-4cce-96e1-f6bb0fddccfb
md"""
---
"""

# ╔═╡ 9522db6b-f52c-460a-a889-6bf097259d11
md"""
Definición de la variable _D_ para poder realizar los cálculos simbólicos:
"""

# ╔═╡ 3e57f48b-d146-48df-a928-7e4c520a0a01
@vars D D´

# ╔═╡ ecd32227-28b6-476a-adec-9d8693692263
L = 2*D

# ╔═╡ 743f3f6d-5e23-42f0-9938-848fe9ac6d18
A_base = π*(D/2)^2

# ╔═╡ 75a558e8-d825-4020-890c-672a0dd9b368
Vₚ = A_base * L

# ╔═╡ 9b3389d3-9e5e-4dee-a3cb-b4ffe621807d
L_base = π*D

# ╔═╡ d6ef58d7-9fad-4085-96b2-56d3bc4c19c2
Aₚ = 2*A_base + L_base*L

# ╔═╡ ffb37608-0c8f-47f6-a667-cccea1d6b74f
Aₜ = N*Aₚ

# ╔═╡ c1be2caf-715f-49bc-84e3-7d38349b8d6a
p = Vₚ/D^3

# ╔═╡ 948e6b4e-1bed-484f-95c0-a11656d8f7c5
q = Aₚ/6/D^2

# ╔═╡ 9d8bd31d-3370-4c4e-8056-65e843738de7
λ = q/p

# ╔═╡ 61c94da7-f6a7-44d4-820f-a4f76e1b1d83
A´ₚ = sympy.sqrt(3)*D^2

# ╔═╡ 71a89fd4-ded9-4c06-b2c1-722cd191a249
V´ₚ = sympy.sqrt(2)/12 *D^3

# ╔═╡ db5fa9dd-b941-4ccb-99ae-dc2511afca8c
p´ = V´ₚ/D^3

# ╔═╡ 160785f4-7467-4671-8d46-abba8f21c7a8
q´ = A´ₚ/6/D^2

# ╔═╡ 6b330626-66db-49a5-a2b4-596c9fd5e9ae
λ´ = q´/p´

# ╔═╡ bbe8492c-a6eb-43b5-8af4-865e866a8696
sol = solve(Aₜ - 6 * λ/ρ/D, D) # m

# ╔═╡ d269fc92-62c5-4ae4-9ea6-786dd52cbd92
Dₚ = Float64(sol[1]) # m

# ╔═╡ 3149953b-77b8-4d1a-85bf-2c5e5b95d9aa
D´ₚ = Float64(sol[1]) # m

# ╔═╡ b81bd534-6aab-4c61-b09e-2db758bdb735
Aₜc = Float64(subs(Aₜ, D=>Dₚ)) # m^2/kg

# ╔═╡ de9b02dc-6975-4fb0-802f-05d4bebacce9
A´ₜ = subs(N*A´ₚ, D=>D´)

# ╔═╡ 4afad626-f249-4a87-82da-cf1cd891ef98
sol´ = solve(A´ₜ - 6 * λ´/ρ/D´, D´) # m

# ╔═╡ e1fc8d89-c480-4442-b654-11f7c26e1495
Aₜt = Float64(subs(A´ₜ, D´=>D´ₚ)) # m^2/kg

# ╔═╡ 156bbdb1-50d8-4af2-a6be-3f08dc0594fe
cm"""
!!! Solución
	**Cilíndros:** ``A_t = `` $(round(Aₜc; digits=2)) m²/kg

	**Tetraedros:** ``A_t = `` $(round(Aₜt; digits=2)) m²/kg
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
CommonMark = "a80b9123-70ca-4bc0-993e-6e3bcb318db6"
SymPy = "24249f21-da20-56a4-8eb1-6a02cf4ae2e6"

[compat]
CommonMark = "~0.8.3"
SymPy = "~1.1.0"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"

[[Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[ChainRulesCore]]
deps = ["Compat", "LinearAlgebra", "SparseArrays"]
git-tree-sha1 = "f885e7e7c124f8c92650d61b9477b9ac2ee607dd"
uuid = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
version = "1.11.1"

[[ChangesOfVariables]]
deps = ["LinearAlgebra", "Test"]
git-tree-sha1 = "9a1d594397670492219635b35a3d830b04730d62"
uuid = "9e997f8a-9a97-42d5-a9f1-ce6bfc15e2c0"
version = "0.1.1"

[[CommonEq]]
git-tree-sha1 = "d1beba82ceee6dc0fce8cb6b80bf600bbde66381"
uuid = "3709ef60-1bee-4518-9f2f-acd86f176c50"
version = "0.2.0"

[[CommonMark]]
deps = ["Crayons", "JSON", "URIs"]
git-tree-sha1 = "393ac9df4eb085c2ab12005fc496dae2e1da344e"
uuid = "a80b9123-70ca-4bc0-993e-6e3bcb318db6"
version = "0.8.3"

[[CommonSolve]]
git-tree-sha1 = "68a0743f578349ada8bc911a5cbd5a2ef6ed6d1f"
uuid = "38540f10-b2f7-11e9-35d8-d573e4eb0ff2"
version = "0.2.0"

[[Compat]]
deps = ["Base64", "Dates", "DelimitedFiles", "Distributed", "InteractiveUtils", "LibGit2", "Libdl", "LinearAlgebra", "Markdown", "Mmap", "Pkg", "Printf", "REPL", "Random", "SHA", "Serialization", "SharedArrays", "Sockets", "SparseArrays", "Statistics", "Test", "UUIDs", "Unicode"]
git-tree-sha1 = "dce3e3fea680869eaa0b774b2e8343e9ff442313"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "3.40.0"

[[CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"

[[Conda]]
deps = ["JSON", "VersionParsing"]
git-tree-sha1 = "299304989a5e6473d985212c28928899c74e9421"
uuid = "8f4d0f93-b110-5947-807f-2305c1781a2d"
version = "1.5.2"

[[Crayons]]
git-tree-sha1 = "3f71217b538d7aaee0b69ab47d9b7724ca8afa0d"
uuid = "a8cc5b0e-0ffa-5ad4-8c14-923d3ee1735f"
version = "4.0.4"

[[Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[DelimitedFiles]]
deps = ["Mmap"]
uuid = "8bb1440f-4735-579b-a4ab-409b98df4dab"

[[Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"

[[DocStringExtensions]]
deps = ["LibGit2"]
git-tree-sha1 = "b19534d1895d702889b219c382a6e18010797f0b"
uuid = "ffbed154-4ef7-542d-bbb7-c09d3a79fcae"
version = "0.8.6"

[[Downloads]]
deps = ["ArgTools", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"

[[Formatting]]
deps = ["Printf"]
git-tree-sha1 = "8339d61043228fdd3eb658d86c926cb282ae72a8"
uuid = "59287772-0a20-5a39-b81b-1366585eb4c0"
version = "0.4.2"

[[InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[InverseFunctions]]
deps = ["Test"]
git-tree-sha1 = "a7254c0acd8e62f1ac75ad24d5db43f5f19f3c65"
uuid = "3587e190-3f89-42d0-90ee-14403ec27112"
version = "0.1.2"

[[IrrationalConstants]]
git-tree-sha1 = "7fd44fd4ff43fc60815f8e764c0f352b83c49151"
uuid = "92d709cd-6900-40b7-9082-c6be49f344b6"
version = "0.1.1"

[[JLLWrappers]]
deps = ["Preferences"]
git-tree-sha1 = "642a199af8b68253517b80bd3bfd17eb4e84df6e"
uuid = "692b3bcd-3c85-4b1f-b108-f13ce0eb3210"
version = "1.3.0"

[[JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "8076680b162ada2a031f707ac7b4953e30667a37"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.2"

[[LaTeXStrings]]
git-tree-sha1 = "f2355693d6778a178ade15952b7ac47a4ff97996"
uuid = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
version = "1.3.0"

[[Latexify]]
deps = ["Formatting", "InteractiveUtils", "LaTeXStrings", "MacroTools", "Markdown", "Printf", "Requires"]
git-tree-sha1 = "a8f4f279b6fa3c3c4f1adadd78a621b13a506bce"
uuid = "23fbe1c1-3f47-55db-b15f-69d7ec21a316"
version = "0.15.9"

[[LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"

[[LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"

[[LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"

[[Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[LinearAlgebra]]
deps = ["Libdl"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[LogExpFunctions]]
deps = ["ChainRulesCore", "ChangesOfVariables", "DocStringExtensions", "InverseFunctions", "IrrationalConstants", "LinearAlgebra"]
git-tree-sha1 = "be9eef9f9d78cecb6f262f3c10da151a6c5ab827"
uuid = "2ab3a3ac-af41-5b50-aa03-7779005ae688"
version = "0.3.5"

[[Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[MacroTools]]
deps = ["Markdown", "Random"]
git-tree-sha1 = "3d3e902b31198a27340d0bf00d6ac452866021cf"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.9"

[[Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"

[[Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"

[[NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"

[[OpenLibm_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "05823500-19ac-5b8b-9628-191a04bc5112"

[[OpenSpecFun_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "13652491f6856acfd2db29360e1bbcd4565d04f1"
uuid = "efe28fd5-8261-553b-a9e1-b2916fc3738e"
version = "0.5.5+0"

[[Parsers]]
deps = ["Dates"]
git-tree-sha1 = "ae4bbcadb2906ccc085cf52ac286dc1377dceccc"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.1.2"

[[Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"

[[Preferences]]
deps = ["TOML"]
git-tree-sha1 = "00cfd92944ca9c760982747e9a1d0d5d86ab1e5a"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.2.2"

[[Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[PyCall]]
deps = ["Conda", "Dates", "Libdl", "LinearAlgebra", "MacroTools", "Serialization", "VersionParsing"]
git-tree-sha1 = "4ba3651d33ef76e24fef6a598b63ffd1c5e1cd17"
uuid = "438e738f-606a-5dbb-bf0a-cddfbfd45ab0"
version = "1.92.5"

[[REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[Random]]
deps = ["Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[RecipesBase]]
git-tree-sha1 = "44a75aa7a527910ee3d1751d1f0e4148698add9e"
uuid = "3cdcf5f2-1ef4-517c-9805-6587b60abb01"
version = "1.1.2"

[[Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "4036a3bd08ac7e968e27c203d45f5fff15020621"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.1.3"

[[SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[SharedArrays]]
deps = ["Distributed", "Mmap", "Random", "Serialization"]
uuid = "1a1011a3-84de-559e-8e89-a11a2f7dc383"

[[Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[SpecialFunctions]]
deps = ["ChainRulesCore", "IrrationalConstants", "LogExpFunctions", "OpenLibm_jll", "OpenSpecFun_jll"]
git-tree-sha1 = "f0bccf98e16759818ffc5d97ac3ebf87eb950150"
uuid = "276daf66-3868-5448-9aa4-cd146d93841b"
version = "1.8.1"

[[Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[SymPy]]
deps = ["CommonEq", "CommonSolve", "Latexify", "LinearAlgebra", "Markdown", "PyCall", "RecipesBase", "SpecialFunctions"]
git-tree-sha1 = "ac560c36cd1c5b836d5aa677ece82bc364b2fa2a"
uuid = "24249f21-da20-56a4-8eb1-6a02cf4ae2e6"
version = "1.1.0"

[[TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"

[[Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"

[[Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[URIs]]
git-tree-sha1 = "97bbe755a53fe859669cd907f2d96aee8d2c1355"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.3.0"

[[UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[VersionParsing]]
git-tree-sha1 = "e575cf85535c7c3292b4d89d89cc29e8c3098e47"
uuid = "81def892-9a0e-5fdd-b105-ffc91e053289"
version = "1.2.1"

[[Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"

[[nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"

[[p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
"""

# ╔═╡ Cell order:
# ╟─63480f60-439a-11ec-1d93-d3c18aafd9e1
# ╟─15a78062-130e-47b2-916d-43a7d5e417b6
# ╠═ecd32227-28b6-476a-adec-9d8693692263
# ╟─fbe79ab4-9989-4fb0-af3b-a5809ae44d67
# ╠═743f3f6d-5e23-42f0-9938-848fe9ac6d18
# ╟─bd042710-b1e2-449c-90c9-b29df7806e37
# ╠═75a558e8-d825-4020-890c-672a0dd9b368
# ╟─bbc6a887-0fe8-4559-9d4f-6f799e45d554
# ╠═9b3389d3-9e5e-4dee-a3cb-b4ffe621807d
# ╠═d6ef58d7-9fad-4085-96b2-56d3bc4c19c2
# ╟─5b8b5b76-1541-483f-a65b-b5a59f7e26a1
# ╠═c1be2caf-715f-49bc-84e3-7d38349b8d6a
# ╠═948e6b4e-1bed-484f-95c0-a11656d8f7c5
# ╠═9d8bd31d-3370-4c4e-8056-65e843738de7
# ╟─61021811-2c4a-4c52-b4ae-90bec21639ff
# ╟─27ae11de-1e0c-4534-9498-7d845bae8701
# ╟─61c94da7-f6a7-44d4-820f-a4f76e1b1d83
# ╟─71a89fd4-ded9-4c06-b2c1-722cd191a249
# ╟─4a958e90-f70f-4bfb-8191-af38642524ef
# ╠═db5fa9dd-b941-4ccb-99ae-dc2511afca8c
# ╠═160785f4-7467-4671-8d46-abba8f21c7a8
# ╠═6b330626-66db-49a5-a2b4-596c9fd5e9ae
# ╟─cc9654b6-cc92-4148-adf8-a4ce0404f835
# ╟─ec056a31-0679-482f-a474-6fab43b62ab7
# ╠═eab8d558-bbf3-4635-bab0-cb09e57588c3
# ╠═bcca780e-9746-4ee3-9063-b80a59a052df
# ╠═e393dfeb-d1a4-407b-8502-ada2307a6bc9
# ╟─437fe9a7-9609-406d-af56-9952f76d02d1
# ╠═ffb37608-0c8f-47f6-a667-cccea1d6b74f
# ╟─e2ca87ab-cc83-4ae4-ad49-7f27b4700c48
# ╠═bbe8492c-a6eb-43b5-8af4-865e866a8696
# ╟─6ddfcc53-2e95-4c26-8e5e-b3c392fccd9e
# ╟─d269fc92-62c5-4ae4-9ea6-786dd52cbd92
# ╟─ad80a805-adb9-48f1-85c2-d5f8a8e85905
# ╠═b81bd534-6aab-4c61-b09e-2db758bdb735
# ╟─34e177a3-ba34-4008-ba9b-9af99582137d
# ╠═de9b02dc-6975-4fb0-802f-05d4bebacce9
# ╠═4afad626-f249-4a87-82da-cf1cd891ef98
# ╠═3149953b-77b8-4d1a-85bf-2c5e5b95d9aa
# ╠═e1fc8d89-c480-4442-b654-11f7c26e1495
# ╟─156bbdb1-50d8-4af2-a6be-3f08dc0594fe
# ╟─c52ddd66-77d1-4cce-96e1-f6bb0fddccfb
# ╠═778592a0-0082-4c45-accf-dcd32d4fc8a7
# ╟─9522db6b-f52c-460a-a889-6bf097259d11
# ╠═3e57f48b-d146-48df-a928-7e4c520a0a01
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
