### A Pluto.jl notebook ###
# v0.17.1

using Markdown
using InteractiveUtils

# ╔═╡ 89cc9845-adaa-4ff7-9b81-7d472bcd3a1a
using Unitful, CommonMark

# ╔═╡ 76e65292-4913-11ec-301c-25dfa0ef468f
md"""
### 5. Separaciones físicas

#### Problema 1

Se realiza un ensayo con un filtro para vino y se encuentra que el caudal del filtrado es de 450 kg/h para una diferencia de presión constante de 350 kPa. El filtro tiene un área total de 0.82 m². Asumir que la resistencia del filtro no se ve afectada por la cantidad de torta. Se añade otro filtro de 6.5 m², ¿qué presión se requeriría para obtener 500 hl en un turno de 8 horas de la planta combinada? Determinar primero _R_, la resistencia y, a continuación, la presión diferencial. Asumir que la densidad del vino es 1000 kg/m³. [[Earle](https://www.nzifst.org.nz/resources/unitoperations/mechseparation7.htm#problems)]

#### Solución

Datos del problema:
"""

# ╔═╡ 0209b021-9dcf-42fe-b1e9-7c22a75c8f19
ρ = 1000u"kg/m^3"

# ╔═╡ ee4e53ab-02cf-48fd-bd7b-e45d07172b76
md"""
_Ensayo inicial:_
"""

# ╔═╡ 967a0206-d78a-4b42-a796-250d6d212add
W = 450u"kg/hr"

# ╔═╡ 1eefe73c-28da-4765-8a79-b67e6de4ca93
ΔP = 350u"kPa"

# ╔═╡ 41c6795d-e8c0-4592-ad26-e41aadb94620
A = 0.82u"m^2"

# ╔═╡ acf0c5be-9644-4dd6-ade6-ed8b5fb730ff
md"""
_2º filtro:_
"""

# ╔═╡ 28f07f84-13db-432a-90f2-e8edce714c82
A₂ = 6.5u"m^2"

# ╔═╡ dc44cef2-0415-4f87-a579-f23146e536ea
md"""
_Operación combinada:_
"""

# ╔═╡ c80d8880-3d85-4445-b81d-b1f256b7c754
Ac = A + A₂

# ╔═╡ bfa783cd-3c29-41a4-a3b7-37c77c22c24c
Vc = 500u"hl"

# ╔═╡ 29f43a3a-a654-437f-8225-a0f969162fcf
tc = 8u"hr"

# ╔═╡ 473b4b12-9d6a-4405-a6ad-0bf6f08ccadd
md"""
En primer lugar determinaremos la resistencia el filtro a partir de los datos del primer ensayo. Como la operación del filtro es a presión constante, usaremos la fórmula:

$$\frac{A}{V}t=\frac{\mu \alpha \rho_0}{2 \Delta P}\frac{V}{A}+\frac{\mu R_m}{\Delta P}$$

El enunciado del problema dice que se puede considerar despreciable la resistencia debida a la torta. Además como no conocemos la viscosidad del vino, encontraremos un valor de resistencia que será $R = \mu R_m$. La ecuación quedará como:

$$\frac{A}{V}t=\cancel{\frac{\mu \alpha \rho_0}{2 \Delta P}\frac{V}{A}}+\frac{\cancelto{R}{\mu R_m}}{\Delta P} = \frac{R}{\Delta P}$$

En el ensayo tenemos el cuadal másico, pero se puede transformar en el caudal volumétrico (_Q = V/t_) con la densidad:
"""

# ╔═╡ 55ec72ab-6845-480b-8166-0bccaaecb995
Q = W/ρ

# ╔═╡ 5f1fca16-cd1a-4c89-96f9-c1507ee65e7d
md"""
La resistencia del filtro será:
"""

# ╔═╡ b798a97a-9335-4558-8787-fe0c2fb2e556
R = A/Q*ΔP

# ╔═╡ 18b1554a-90de-4ebd-8e9a-3c9ed32a0096
md"""
Una vez conocida la resistencia del filtro ya podemos calcular a que presión debe operar el filtro de la operación combinada:
"""

# ╔═╡ 0571c890-49d2-4bf9-887c-8458d1dff419
ΔPc = uconvert(u"kPa", R*Vc/(tc*Ac))

# ╔═╡ a2de6d3e-a5f7-4eb2-ada0-edb2621af79e
cm"""
!!! Solución
	``R =`` $(round(typeof(R), R; digits=1))

	``\Delta P_c =`` $(round(typeof(ΔPc), ΔPc; digits=1))
"""

# ╔═╡ a973ea14-e72a-4198-9197-d211dd3f809f
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
# ╟─76e65292-4913-11ec-301c-25dfa0ef468f
# ╟─0209b021-9dcf-42fe-b1e9-7c22a75c8f19
# ╟─ee4e53ab-02cf-48fd-bd7b-e45d07172b76
# ╟─967a0206-d78a-4b42-a796-250d6d212add
# ╟─1eefe73c-28da-4765-8a79-b67e6de4ca93
# ╟─41c6795d-e8c0-4592-ad26-e41aadb94620
# ╟─acf0c5be-9644-4dd6-ade6-ed8b5fb730ff
# ╟─28f07f84-13db-432a-90f2-e8edce714c82
# ╟─dc44cef2-0415-4f87-a579-f23146e536ea
# ╠═c80d8880-3d85-4445-b81d-b1f256b7c754
# ╟─bfa783cd-3c29-41a4-a3b7-37c77c22c24c
# ╟─29f43a3a-a654-437f-8225-a0f969162fcf
# ╟─473b4b12-9d6a-4405-a6ad-0bf6f08ccadd
# ╠═55ec72ab-6845-480b-8166-0bccaaecb995
# ╟─5f1fca16-cd1a-4c89-96f9-c1507ee65e7d
# ╠═b798a97a-9335-4558-8787-fe0c2fb2e556
# ╟─18b1554a-90de-4ebd-8e9a-3c9ed32a0096
# ╠═0571c890-49d2-4bf9-887c-8458d1dff419
# ╟─a2de6d3e-a5f7-4eb2-ada0-edb2621af79e
# ╟─a973ea14-e72a-4198-9197-d211dd3f809f
# ╠═89cc9845-adaa-4ff7-9b81-7d472bcd3a1a
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
