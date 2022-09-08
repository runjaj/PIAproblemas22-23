### A Pluto.jl notebook ###
# v0.17.2

using Markdown
using InteractiveUtils

# ╔═╡ 06b92f95-57f7-474a-8fbd-6bf8f81b0419
using Unitful, Latexify, UnitfulLatexify

# ╔═╡ 8bedf092-6feb-41f5-b11b-d69db976eb6d
using SymPy

# ╔═╡ bc49437c-46c9-11ec-2835-b9e33ee2a992
md"""
Se dispone de una instalación de filtración con un área de filtro de 0.5 m² en la que se separa una mezcla formada por un sólido y agua (_μ_ = 1 cP) con una concentración ρ₀ = 30 g/L. Para determinar las resistencias del filtro se realizan dos experimentos de 1 hora de duración. En el primero, se aplica un incremento de presión de 250 kPa y se recogen 4500 L de filtrado. En el segundo, se recogen 5000 L de filtrado aplicando un ΔP de 300 kPa. Calcular la resistencia del medio filtrante ($R_ₘ$) y la resistencia específica de la torta ($α$) indicando correctamente sus unidades.

##### Solución

Datos del problema en el SI:
"""

# ╔═╡ af7c0869-37ec-4952-a1da-f2ff24d655ab
A = 0.5u"m^2"

# ╔═╡ 022812b7-c6c2-4a82-8e8b-67f638e2ac83
μ = 1u"cP" |> upreferred |> float

# ╔═╡ fd5e9e97-d054-4a76-81f5-11272cd17b90
ρ₀ = 30u"g/l" |> upreferred

# ╔═╡ 715e90ff-7ed3-431f-97af-3a0636a6faa5
t = 1u"hr" |> upreferred

# ╔═╡ 29de99dc-a169-4939-8865-f617b17b2d29
ΔP₁ = 250u"kPa" |> upreferred

# ╔═╡ d54a2777-6ecc-4a84-9d78-414f95d8fb78
V₁ = 4500u"l" |> upreferred |> float

# ╔═╡ 770f41a9-066f-4ed3-95d1-edd916b746c4
ΔP₂ = 300u"kPa" |> upreferred

# ╔═╡ 232e3358-ecec-4243-8eb4-963cd570ef07
V₂ = 5000u"l" |> upreferred |> float

# ╔═╡ c775ba5d-452f-4ecc-aa84-dd61a66bb280
md"""
La ecuación que describe un filtro que opera a presión constante es:

$$\frac{A}{V}t = \frac{\mu \alpha \rho_0}{2 \Delta P} \frac{V}{A} + \frac{\mu R_m}{\Delta P}$$

"""

# ╔═╡ dfb07619-1007-40f9-ae13-3b9b8b7182d7
md"""
Las ecuaciones que describen las dos situaciones son:
"""

# ╔═╡ 7663b900-98dd-4aad-b622-58ad348040c3
latexify("(A/V₁)*t = μ*α*ρ₀/(2*ΔP₁)*(V₁/A) + μ*Rm/ΔP₁")

# ╔═╡ 3ff194e1-7476-433b-9f1b-b42d75ab710a
latexify("(A/V₂)*t = μ*α*ρ₀/(2*ΔP₂)*(V₂/A) + μ*Rm/ΔP₂")

# ╔═╡ 74636271-26c6-4502-8ec2-457286649e1c
md"""
Conocemos todos los parámetros de estas ecuaciones excepto $\alpha$ y $R_m$. Realizando un análisis dimensional se encuentra que las unidades de $\alpha$ son m/kg y las de $R_m$ son m⁻¹.

Ya solo queda resolver el sistema de ecuaciones. Primero escribimos las ecuaciones y luego resolvemos el sistema:
"""

# ╔═╡ 81d66da6-7d6a-42e8-8ef1-4dc657d39142
md"""
Añadimos las unidades a las soluciones obtenidas:
"""

# ╔═╡ 8ec9b079-f98a-47d7-8f4c-90774943c80c
md"""
---
**Solución**

 $\alpha$ =
"""

# ╔═╡ 8caeca2b-a5d9-4424-9293-649cbcaf77d3
md"""
 $R_m =$
"""

# ╔═╡ 9430aeec-ee7b-40a2-8032-f6c82738464d
md"""
---
---
"""

# ╔═╡ 1b677451-7029-438d-a1bb-f32ff5728e84
@vars α R_m

# ╔═╡ a54118f6-a0af-48c9-96c7-51877c8a4114
filtro1 = Eq(ustrip((A/V₁)*t), ustrip(μ*α*ρ₀/(2*ΔP₁)*(V₁/A)) + ustrip(μ*R_m/ΔP₁))

# ╔═╡ ca36bfb7-9f2a-4c7b-8cad-42969042aca9
filtro2 = Eq(ustrip((A/V₂)*t), ustrip(μ*α*ρ₀/(2*ΔP₂)*(V₂/A)) + ustrip(μ*R_m/ΔP₂))

# ╔═╡ 38df0f62-9ca8-4a20-a0da-4287d9e39964
sol = solve([filtro1, filtro2], [α, R_m])

# ╔═╡ bc2b105c-3562-4a66-9700-4b8675729480
α_sol = sol[α]*u"m/kg"

# ╔═╡ 947a3147-05df-48cc-904c-90fa262f33e9
latexify(round(typeof(α_sol), α_sol; sigdigits=2))

# ╔═╡ 1cd239a3-4847-455a-ad55-fa6ec54451e2
Rm_sol = sol[R_m]*u"m^-1"

# ╔═╡ f310745e-61ab-47c7-b479-89659a7b8a1a
latexify(round(typeof(Rm_sol), Rm_sol; sigdigits=2))

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Latexify = "23fbe1c1-3f47-55db-b15f-69d7ec21a316"
SymPy = "24249f21-da20-56a4-8eb1-6a02cf4ae2e6"
Unitful = "1986cc42-f94f-5a68-af5c-568840ba703d"
UnitfulLatexify = "45397f5d-5981-4c77-b2b3-fc36d6e9b728"

[compat]
Latexify = "~0.15.9"
SymPy = "~1.1.1"
Unitful = "~1.9.2"
UnitfulLatexify = "~1.5.2"
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

[[ConstructionBase]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "f74e9d5388b8620b4cee35d4c5a618dd4dc547f4"
uuid = "187b0558-2788-49d3-abe0-74a17ed4e7c9"
version = "1.3.0"

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
deps = ["Libdl", "libblastrampoline_jll"]
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

[[OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"

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
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[RecipesBase]]
git-tree-sha1 = "6bf3f380ff52ce0832ddd3a2a7b9538ed1bcca7d"
uuid = "3cdcf5f2-1ef4-517c-9805-6587b60abb01"
version = "1.2.1"

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
git-tree-sha1 = "0af3533fd289b1ab00c49801ef3ef6acbd19dc42"
uuid = "24249f21-da20-56a4-8eb1-6a02cf4ae2e6"
version = "1.1.1"

[[TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"

[[Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"

[[Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[Unitful]]
deps = ["ConstructionBase", "Dates", "LinearAlgebra", "Random"]
git-tree-sha1 = "0992ed0c3ef66b0390e5752fe60054e5ff93b908"
uuid = "1986cc42-f94f-5a68-af5c-568840ba703d"
version = "1.9.2"

[[UnitfulLatexify]]
deps = ["LaTeXStrings", "Latexify", "Unitful"]
git-tree-sha1 = "6b7e901f93bd528b8183ef4fa0f37e4c51986614"
uuid = "45397f5d-5981-4c77-b2b3-fc36d6e9b728"
version = "1.5.2"

[[VersionParsing]]
git-tree-sha1 = "e575cf85535c7c3292b4d89d89cc29e8c3098e47"
uuid = "81def892-9a0e-5fdd-b105-ffc91e053289"
version = "1.2.1"

[[Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"

[[libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"

[[nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"

[[p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
"""

# ╔═╡ Cell order:
# ╟─bc49437c-46c9-11ec-2835-b9e33ee2a992
# ╟─af7c0869-37ec-4952-a1da-f2ff24d655ab
# ╟─022812b7-c6c2-4a82-8e8b-67f638e2ac83
# ╟─fd5e9e97-d054-4a76-81f5-11272cd17b90
# ╟─715e90ff-7ed3-431f-97af-3a0636a6faa5
# ╟─29de99dc-a169-4939-8865-f617b17b2d29
# ╟─d54a2777-6ecc-4a84-9d78-414f95d8fb78
# ╟─770f41a9-066f-4ed3-95d1-edd916b746c4
# ╟─232e3358-ecec-4243-8eb4-963cd570ef07
# ╟─c775ba5d-452f-4ecc-aa84-dd61a66bb280
# ╟─dfb07619-1007-40f9-ae13-3b9b8b7182d7
# ╟─7663b900-98dd-4aad-b622-58ad348040c3
# ╟─3ff194e1-7476-433b-9f1b-b42d75ab710a
# ╟─74636271-26c6-4502-8ec2-457286649e1c
# ╠═a54118f6-a0af-48c9-96c7-51877c8a4114
# ╠═ca36bfb7-9f2a-4c7b-8cad-42969042aca9
# ╠═38df0f62-9ca8-4a20-a0da-4287d9e39964
# ╟─81d66da6-7d6a-42e8-8ef1-4dc657d39142
# ╠═bc2b105c-3562-4a66-9700-4b8675729480
# ╠═1cd239a3-4847-455a-ad55-fa6ec54451e2
# ╟─8ec9b079-f98a-47d7-8f4c-90774943c80c
# ╟─947a3147-05df-48cc-904c-90fa262f33e9
# ╟─8caeca2b-a5d9-4424-9293-649cbcaf77d3
# ╟─f310745e-61ab-47c7-b479-89659a7b8a1a
# ╟─9430aeec-ee7b-40a2-8032-f6c82738464d
# ╠═06b92f95-57f7-474a-8fbd-6bf8f81b0419
# ╠═8bedf092-6feb-41f5-b11b-d69db976eb6d
# ╠═1b677451-7029-438d-a1bb-f32ff5728e84
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
