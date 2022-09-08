### A Pluto.jl notebook ###
# v0.17.1

using Markdown
using InteractiveUtils

# ╔═╡ 850c1048-c386-40c6-84ca-8094172e1a74
using Unitful, CommonMark, DataFrames, Plots

# ╔═╡ 3fe8a52f-6887-4e40-b53f-883a83fbf952
using CurveFit

# ╔═╡ 37b48644-4ea3-11ec-1196-356cf03eaa2a
md"""
### 4. Mezclado

#### Problema 4

Se mezclan 700 g de azúcar con 100 kg de harina. Durante el mezclado se toman 10 muestras de 10 g, a 1, 5 y 10 min y se analiza el porcentaje de azúcar. Los resultados son los siguientes:

Tiempo | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10
-------|---|---|---|---|---|---|---|---|---|----
1 min  |0.21|0.32|0.46|0.17|0.89|1.00|0.98|0.23|0.10|0.14
1.5 min |0.85|0.80|0.62|0.78|0.75|0.39|0.84|0.96|0.58|0.47
10 min |0.72|0.69|0.71|0.70|0.68|0.71|0.70|0.72|0.70|0.70

Calcular:
1. La desviación estándar de la mezcla para cada uno de los tiempos.
2. Seleccionar y calcular uno de los índices de mezclado.
3. Calcular la desviación estándar de la mezcla tras 6 min de operación. En este caso, se considerará una "mezcla perfecta", la que tenga $s_\infty$ = 0.001. [Fellows]
"""

# ╔═╡ 98eb58d9-3254-4ef4-8d4d-fb91770d29b7
md"""
#### Solución

En primer lugar expresamos los datos de los análisis como tanto por uno:
"""

# ╔═╡ 5138d27f-1536-4881-a5dc-bc4a1e58144e
mezcla = DataFrame("1 min" => [0.21, 0.32, 0.46, 0.17, 0.89, 1.00, 0.98, 0.23, 0.10, 0.14]/100, "1.5 min" => [0.85, 0.80, 0.62, 0.78, 0.75, 0.39, 0.84, 0.96, 0.58, 0.47]/100, "10 min" => [0.72, 0.69, 0.71, 0.70, 0.68, 0.71, 0.70, 0.72, 0.70, 0.7]/100)

# ╔═╡ faffbef5-dfdc-4566-bbbb-0d00970e4cdb
md"""
A continuación, calculamos la desviación estándar de cada uno de los tiempos:
"""

# ╔═╡ ca3a2de1-8aea-4bf7-af22-4496a5c06111
begin
	sₘ = describe(mezcla, :std).std
	
	md"""
	 $(names(mezcla)[1]) | $(names(mezcla)[2]) | $(names(mezcla)[3])
	------------------|-------|-------
	$(round(sₘ[1]; sigdigits = 4)) | $(round(sₘ[2]; sigdigits = 4)) | $(round(sₘ[3]; sigdigits = 4))
	"""
end



# ╔═╡ 28b5c50f-c79e-4284-8fe3-d5c6e0b1208a
md"""
El cálculo de _s₀_:
"""

# ╔═╡ 11e5019e-4682-4f8a-b239-293c217ee901
mₐ = 700u"g"

# ╔═╡ 5d02d051-f557-4119-8303-25e664f45bbe
mₕ = 100u"kg"

# ╔═╡ 89d59302-103f-4781-a0f5-f8565f358e35
p = mₐ/(mₕ + mₐ) |> upreferred |> float

# ╔═╡ b0f50633-1015-41f2-b3b7-469d3ca89ac8
s₀ = sqrt(p*(1-p))

# ╔═╡ 5b2a05b2-9659-4f43-bba0-3974ae9e04f7
md"""
El enunciado del problema nos proporciona $s_\infty$:
"""

# ╔═╡ 87eb960b-916c-44c2-aba3-075b0e338106
s∞ = 0.0001

# ╔═╡ faef766d-2c0a-47c6-b8b1-f987a260f124
md"""
Ya solo queda calcular _M₂_:
"""

# ╔═╡ c70a4d80-a254-4936-8b27-68a0ed7d471f
M₂ = @. (log(sₘ)-log(s∞))/(log(s₀)-log(s∞));

# ╔═╡ 54f83b22-f680-4499-9e32-f0d88cf17aad
md"""
	 $(names(mezcla)[1]) | $(names(mezcla)[2]) | $(names(mezcla)[3])
	------------------|-------|-------
	$(round(M₂[1]; sigdigits = 4)) | $(round(M₂[2]; sigdigits = 4)) | $(round(M₂[3]; sigdigits = 4))
	"""

# ╔═╡ fc98e5b9-1674-430d-9fa1-1a606bf74e00
cm"""
A partir de los datos experimentales, realizamos el ajuste a la cinética de primer orden:

``M_2(t) = M_2(0) \exp(-k t)`` 

Ajustamos a una curva del tipo:

``y = a \exp(b x)``

de manera que _a = M₂(0)_ y _b = -k_.

!!! note "Nota"
	También se podrían haber obtenido los parámetros de la cinética mediante regresión lineal ajustando a la recta:

	``\ln(M_2) = M_2(0) - k t``
"""

# ╔═╡ 1766b668-549d-4450-b2a8-03ad15631ae7
t = [1, 1.5, 10]

# ╔═╡ 5d497d61-0525-4596-b377-0fa2e47b5139
ajuste = curve_fit(ExpFit, t, M₂)

# ╔═╡ 3f94dc7e-3dad-40a6-8dc4-a4f807dd190d
md"""
El resultado del ajuste es:

- _M₂(0)_ = $(round(ajuste.coefs[1];digits=3))

- _k_ = $(round(-ajuste.coefs[2]; digits = 3)) min⁻¹
"""

# ╔═╡ cbacf549-0af7-45af-bec1-5954f11caf93
md"""
Comprobamos la calidad del ajuste representado los puntos expermientales y la curva obtenida.
"""

# ╔═╡ 998a8689-3687-4d2a-a3c1-5bb610a1ec0b
begin
	scatter(t, log.(M₂), xlabel="t (min)", ylabel="ln(M2)", legend=false)
	plot!(t, log.(ajuste.(t)))
end

# ╔═╡ 2ee1f47f-764f-484f-8b80-4ecadaa87f95
md"""
Finalmente calculamos el valor de _M₂_ a los 6 minutos, solo hay que sustituir en la ecuación obtenida más arriba:
"""

# ╔═╡ 9bce2aca-22cc-43ae-8648-97b1573ae83d
ajuste(6)

# ╔═╡ 26a9fad4-c7f8-4d80-b3c2-462788a294e2
cm"""
!!! Solución
	_M₂_(6 min) = $(round(ajuste(6); digits=3))
"""

# ╔═╡ 3891a571-afc1-412f-abb1-9871274adecb
md"""
---
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
CommonMark = "a80b9123-70ca-4bc0-993e-6e3bcb318db6"
CurveFit = "5a033b19-8c74-5913-a970-47c3779ef25c"
DataFrames = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
Plots = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
Unitful = "1986cc42-f94f-5a68-af5c-568840ba703d"

[compat]
CommonMark = "~0.8.3"
CurveFit = "~0.3.5"
DataFrames = "~0.21.8"
Plots = "~0.27.1"
Unitful = "~1.9.2"
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

[[BinaryProvider]]
deps = ["Libdl", "Logging", "SHA"]
git-tree-sha1 = "ecdec412a9abc8db54c0efc5548c64dfce072058"
uuid = "b99e7846-7c00-51b0-8f62-c81ae34c0232"
version = "0.5.10"

[[CategoricalArrays]]
deps = ["DataAPI", "Future", "JSON", "Missings", "Printf", "Statistics", "StructTypes", "Unicode"]
git-tree-sha1 = "2ac27f59196a68070e132b25713f9a5bbc5fa0d2"
uuid = "324d7699-5711-5eae-9e2f-1d82baa6b597"
version = "0.8.3"

[[ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "b9de8dc6106e09c79f3f776c27c62360d30e5eb8"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.9.1"

[[Colors]]
deps = ["ColorTypes", "FixedPointNumbers", "InteractiveUtils", "Printf", "Reexport"]
git-tree-sha1 = "177d8b959d3c103a6d57574c38ee79c81059c31b"
uuid = "5ae59095-9a9b-59fe-a467-6f913c188581"
version = "0.11.2"

[[CommonMark]]
deps = ["Crayons", "JSON", "URIs"]
git-tree-sha1 = "393ac9df4eb085c2ab12005fc496dae2e1da344e"
uuid = "a80b9123-70ca-4bc0-993e-6e3bcb318db6"
version = "0.8.3"

[[Compat]]
deps = ["Base64", "Dates", "DelimitedFiles", "Distributed", "InteractiveUtils", "LibGit2", "Libdl", "LinearAlgebra", "Markdown", "Mmap", "Pkg", "Printf", "REPL", "Random", "Serialization", "SharedArrays", "Sockets", "SparseArrays", "Statistics", "Test", "UUIDs", "Unicode"]
git-tree-sha1 = "b0b7e8a0d054fada22b64095b46469627a138943"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "2.2.1"

[[ConstructionBase]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "f74e9d5388b8620b4cee35d4c5a618dd4dc547f4"
uuid = "187b0558-2788-49d3-abe0-74a17ed4e7c9"
version = "1.3.0"

[[Contour]]
deps = ["StaticArrays"]
git-tree-sha1 = "9f02045d934dc030edad45944ea80dbd1f0ebea7"
uuid = "d38c429a-6771-53c6-b99e-75d170b6e991"
version = "0.5.7"

[[Crayons]]
git-tree-sha1 = "3f71217b538d7aaee0b69ab47d9b7724ca8afa0d"
uuid = "a8cc5b0e-0ffa-5ad4-8c14-923d3ee1735f"
version = "4.0.4"

[[CurveFit]]
deps = ["LinearAlgebra", "Polynomials"]
git-tree-sha1 = "eb0e0c7f3c49611223c7ed2d75ad98cfe6a9b18c"
uuid = "5a033b19-8c74-5913-a970-47c3779ef25c"
version = "0.3.5"

[[DataAPI]]
git-tree-sha1 = "cc70b17275652eb47bc9e5f81635981f13cea5c8"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.9.0"

[[DataFrames]]
deps = ["CategoricalArrays", "Compat", "DataAPI", "Future", "InvertedIndices", "IteratorInterfaceExtensions", "Missings", "PooledArrays", "Printf", "REPL", "Reexport", "SortingAlgorithms", "Statistics", "TableTraits", "Tables", "Unicode"]
git-tree-sha1 = "ecd850f3d2b815431104252575e7307256121548"
uuid = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
version = "0.21.8"

[[DataStructures]]
deps = ["InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "88d48e133e6d3dd68183309877eac74393daa7eb"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.17.20"

[[DataValueInterfaces]]
git-tree-sha1 = "bfc1187b79289637fa0ef6d4436ebdfe6905cbd6"
uuid = "e2d170a0-9d28-54be-80f0-106bbe20a464"
version = "1.0.0"

[[Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[DelimitedFiles]]
deps = ["Mmap"]
uuid = "8bb1440f-4735-579b-a4ab-409b98df4dab"

[[Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"

[[Downloads]]
deps = ["ArgTools", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"

[[ExprTools]]
git-tree-sha1 = "b7e3d17636b348f005f11040025ae8c6f645fe92"
uuid = "e2ba6199-217a-4e67-a87a-7c52f15ade04"
version = "0.1.6"

[[FFMPEG]]
deps = ["BinaryProvider", "Libdl"]
git-tree-sha1 = "9143266ba77d3313a4cf61d8333a1970e8c5d8b6"
uuid = "c87230d0-a227-11e9-1b43-d7ebe4e7570a"
version = "0.2.4"

[[FixedPointNumbers]]
git-tree-sha1 = "d14a6fa5890ea3a7e5dcab6811114f132fec2b4b"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.6.1"

[[Future]]
deps = ["Random"]
uuid = "9fa8497b-333b-5362-9e8d-4d0656e87820"

[[GR]]
deps = ["Base64", "DelimitedFiles", "LinearAlgebra", "Printf", "Random", "Serialization", "Sockets", "Test"]
git-tree-sha1 = "c690c2ab22ac9ee323d9966deae61a089362b25c"
uuid = "28b8d3ca-fb5f-59d9-8090-bfdbd6d07a71"
version = "0.44.0"

[[GeometryTypes]]
deps = ["ColorTypes", "FixedPointNumbers", "LinearAlgebra", "StaticArrays"]
git-tree-sha1 = "78f0ce9d01993b637a8f28d84537d75dc0ce8eef"
uuid = "4d00f742-c7ba-57c2-abde-4428a4b178cb"
version = "0.7.10"

[[Grisu]]
git-tree-sha1 = "53bb909d1151e57e2484c3d1b53e19552b887fb2"
uuid = "42e2da0e-8278-4e71-bc24-59509adca0fe"
version = "1.0.2"

[[InlineStrings]]
deps = ["Parsers"]
git-tree-sha1 = "19cb49649f8c41de7fea32d089d37de917b553da"
uuid = "842dd82b-1e85-43dc-bf29-5d0ee9dffc48"
version = "1.0.1"

[[InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[Intervals]]
deps = ["Dates", "Printf", "RecipesBase", "Serialization", "TimeZones"]
git-tree-sha1 = "323a38ed1952d30586d0fe03412cde9399d3618b"
uuid = "d8418881-c3e1-53bb-8760-2df7ec849ed5"
version = "1.5.0"

[[InvertedIndices]]
git-tree-sha1 = "bee5f1ef5bf65df56bdd2e40447590b272a5471f"
uuid = "41ab1584-1d38-5bbf-9106-f11c6c58b48f"
version = "1.1.0"

[[IteratorInterfaceExtensions]]
git-tree-sha1 = "a3f24677c21f5bbe9d2a714f95dcd58337fb2856"
uuid = "82899510-4779-5014-852e-03e436cf321d"
version = "1.0.0"

[[JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "8076680b162ada2a031f707ac7b4953e30667a37"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.2"

[[LazyArtifacts]]
deps = ["Artifacts", "Pkg"]
uuid = "4af54fe1-eca0-43a8-85a7-787d91b784e3"

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

[[Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"

[[Measures]]
git-tree-sha1 = "e498ddeee6f9fdb4551ce855a46f54dbd900245f"
uuid = "442fdcdd-2543-5da2-b0f3-8c86c306513e"
version = "0.3.1"

[[Missings]]
deps = ["DataAPI"]
git-tree-sha1 = "f8c673ccc215eb50fcadb285f522420e29e69e1c"
uuid = "e1d29d7a-bbdc-5cf2-9ac0-f12de2c33e28"
version = "0.4.5"

[[Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[Mocking]]
deps = ["ExprTools"]
git-tree-sha1 = "748f6e1e4de814b101911e64cc12d83a6af66782"
uuid = "78c3b35d-d492-501b-9361-3d52fe80e533"
version = "0.7.2"

[[MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"

[[MutableArithmetics]]
deps = ["LinearAlgebra", "SparseArrays", "Test"]
git-tree-sha1 = "7bb6853d9afec54019c1397c6eb610b9b9a19525"
uuid = "d8a4904e-b15c-11e9-3269-09a3773c0cb0"
version = "0.3.1"

[[NaNMath]]
git-tree-sha1 = "bfe47e760d60b82b66b61d2d44128b62e3a369fb"
uuid = "77ba4419-2d1f-58cd-9bb1-8ffee604a2e3"
version = "0.3.5"

[[NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"

[[OrderedCollections]]
git-tree-sha1 = "85f8e6578bf1f9ee0d11e7bb1b1456435479d47c"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.4.1"

[[Parsers]]
deps = ["Dates"]
git-tree-sha1 = "ae4bbcadb2906ccc085cf52ac286dc1377dceccc"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.1.2"

[[Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"

[[PlotThemes]]
deps = ["PlotUtils", "Requires", "Statistics"]
git-tree-sha1 = "d2f3a41081a72815f5c59eacdc8046237a7cbe12"
uuid = "ccf2f8ad-2431-5c83-bf29-c5338b663b6a"
version = "0.4.0"

[[PlotUtils]]
deps = ["Colors", "Dates", "Printf", "Random", "Reexport"]
git-tree-sha1 = "51e742162c97d35f714f9611619db6975e19384b"
uuid = "995b91a9-d308-5afd-9ec6-746e21dbc043"
version = "0.6.5"

[[Plots]]
deps = ["Base64", "Contour", "Dates", "FFMPEG", "FixedPointNumbers", "GR", "GeometryTypes", "JSON", "LinearAlgebra", "Measures", "NaNMath", "Pkg", "PlotThemes", "PlotUtils", "Printf", "REPL", "Random", "RecipesBase", "Reexport", "Requires", "Showoff", "SparseArrays", "Statistics", "StatsBase", "UUIDs"]
git-tree-sha1 = "11c75a31269c1c64790e7cb910346f64cd4440c1"
uuid = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
version = "0.27.1"

[[Polynomials]]
deps = ["Intervals", "LinearAlgebra", "MutableArithmetics", "RecipesBase"]
git-tree-sha1 = "79bcbb379205f1c62913fa9ebecb413c7a35f8b0"
uuid = "f27b6e38-b328-58d1-80ce-0feddd5e7a45"
version = "2.0.18"

[[PooledArrays]]
deps = ["DataAPI"]
git-tree-sha1 = "b1333d4eced1826e15adbdf01a4ecaccca9d353c"
uuid = "2dfb63ee-cc39-5dd5-95bd-886bf059d720"
version = "0.5.3"

[[Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[Random]]
deps = ["Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[RecipesBase]]
git-tree-sha1 = "7bdce29bc9b2f5660a6e5e64d64d91ec941f6aa2"
uuid = "3cdcf5f2-1ef4-517c-9805-6587b60abb01"
version = "0.7.0"

[[Reexport]]
deps = ["Pkg"]
git-tree-sha1 = "7b1d07f411bc8ddb7977ec7f377b97b158514fe0"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "0.2.0"

[[Requires]]
deps = ["Test"]
git-tree-sha1 = "f6fbf4ba64d295e146e49e021207993b6b48c7d1"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "0.5.2"

[[SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[SharedArrays]]
deps = ["Distributed", "Mmap", "Random", "Serialization"]
uuid = "1a1011a3-84de-559e-8e89-a11a2f7dc383"

[[Showoff]]
deps = ["Dates", "Grisu"]
git-tree-sha1 = "ee010d8f103468309b8afac4abb9be2e18ff1182"
uuid = "992d4aef-0814-514b-bc4d-f2e9a6c4116f"
version = "0.3.2"

[[Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[SortingAlgorithms]]
deps = ["DataStructures", "Random", "Test"]
git-tree-sha1 = "03f5898c9959f8115e30bc7226ada7d0df554ddd"
uuid = "a2af1166-a08f-5f64-846c-94a0d3cef48c"
version = "0.3.1"

[[SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[StaticArrays]]
deps = ["LinearAlgebra", "Random", "Statistics"]
git-tree-sha1 = "da4cf579416c81994afd6322365d00916c79b8ae"
uuid = "90137ffa-7385-5640-81b9-e52037218182"
version = "0.12.5"

[[Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[StatsBase]]
deps = ["DataStructures", "LinearAlgebra", "Missings", "Printf", "Random", "SortingAlgorithms", "SparseArrays", "Statistics"]
git-tree-sha1 = "2b6ca97be7ddfad5d9f16a13fe277d29f3d11c23"
uuid = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"
version = "0.31.0"

[[StructTypes]]
deps = ["Dates", "UUIDs"]
git-tree-sha1 = "d24a825a95a6d98c385001212dc9020d609f2d4f"
uuid = "856f2bd8-1eba-4b0a-8007-ebc267875bd4"
version = "1.8.1"

[[TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"

[[TableTraits]]
deps = ["IteratorInterfaceExtensions"]
git-tree-sha1 = "c06b2f539df1c6efa794486abfb6ed2022561a39"
uuid = "3783bdb8-4a98-5b6b-af9a-565f29a5fe9c"
version = "1.0.1"

[[Tables]]
deps = ["DataAPI", "DataValueInterfaces", "IteratorInterfaceExtensions", "LinearAlgebra", "TableTraits", "Test"]
git-tree-sha1 = "fed34d0e71b91734bf0a7e10eb1bb05296ddbcd0"
uuid = "bd369af6-aec1-5ad0-b16a-f7cc5008161c"
version = "1.6.0"

[[Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"

[[Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[TimeZones]]
deps = ["Dates", "Downloads", "InlineStrings", "LazyArtifacts", "Mocking", "Pkg", "Printf", "RecipesBase", "Serialization", "Unicode"]
git-tree-sha1 = "8de32288505b7db196f36d27d7236464ef50dba1"
uuid = "f269a46b-ccf7-5d73-abea-4c690281aa53"
version = "1.6.2"

[[URIs]]
git-tree-sha1 = "97bbe755a53fe859669cd907f2d96aee8d2c1355"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.3.0"

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
# ╟─37b48644-4ea3-11ec-1196-356cf03eaa2a
# ╟─98eb58d9-3254-4ef4-8d4d-fb91770d29b7
# ╟─5138d27f-1536-4881-a5dc-bc4a1e58144e
# ╟─faffbef5-dfdc-4566-bbbb-0d00970e4cdb
# ╟─ca3a2de1-8aea-4bf7-af22-4496a5c06111
# ╟─28b5c50f-c79e-4284-8fe3-d5c6e0b1208a
# ╟─11e5019e-4682-4f8a-b239-293c217ee901
# ╟─5d02d051-f557-4119-8303-25e664f45bbe
# ╠═89d59302-103f-4781-a0f5-f8565f358e35
# ╠═b0f50633-1015-41f2-b3b7-469d3ca89ac8
# ╟─5b2a05b2-9659-4f43-bba0-3974ae9e04f7
# ╠═87eb960b-916c-44c2-aba3-075b0e338106
# ╟─faef766d-2c0a-47c6-b8b1-f987a260f124
# ╠═c70a4d80-a254-4936-8b27-68a0ed7d471f
# ╟─54f83b22-f680-4499-9e32-f0d88cf17aad
# ╟─fc98e5b9-1674-430d-9fa1-1a606bf74e00
# ╠═1766b668-549d-4450-b2a8-03ad15631ae7
# ╠═5d497d61-0525-4596-b377-0fa2e47b5139
# ╟─3f94dc7e-3dad-40a6-8dc4-a4f807dd190d
# ╟─cbacf549-0af7-45af-bec1-5954f11caf93
# ╟─998a8689-3687-4d2a-a3c1-5bb610a1ec0b
# ╟─2ee1f47f-764f-484f-8b80-4ecadaa87f95
# ╠═9bce2aca-22cc-43ae-8648-97b1573ae83d
# ╟─26a9fad4-c7f8-4d80-b3c2-462788a294e2
# ╟─3891a571-afc1-412f-abb1-9871274adecb
# ╠═850c1048-c386-40c6-84ca-8094172e1a74
# ╠═3fe8a52f-6887-4e40-b53f-883a83fbf952
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
