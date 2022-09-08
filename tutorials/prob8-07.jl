### A Pluto.jl notebook ###
# v0.17.2

using Markdown
using InteractiveUtils

# ╔═╡ b34e50b8-491b-4c67-9a4f-e5370a56b489
using CommonMark, Plots, DataFrames, Unitful, UnitfulRecipes

# ╔═╡ 9735a93f-45a7-48ff-ab52-d222ef60dcbf
using Trapz

# ╔═╡ d24179ea-3a62-47f8-84d4-46ad725902b2
md"""
### 8. Conservación por calor

#### Problema 7.

El sr. Barrufet tras un profundo estudio del mercado ha decidido que el futuro de su empresa está en la fabricación de productos dirigidos a deportistas. Para ello en la planta piloto está desarrollando un nuevo producto dirigido a ese mercado. Este producto consiste en una bebida basada en clara de huevo—debido su alto contenido proteico—, en fibra de frutas y una serie de aditivos autorizados: estabilizantes, aromatizantes y colorantes. El sr. Barrufet cree que logrará un buen resultado de ventas basado en una buena campaña publicitaria y en el uso de un ingrediente secreto que marcará la diferencia con el resto de competidores: la musculina. Esta es una hormona extraída de una especie de mono tropical que provoca un aumento exagerado de la masa muscular. Para ser efectiva la musculina debe estar presente en la bebida en una concentración de 15 ppm. La bebida se presentará en botes de 150 g.

El sr. Barrufet te ha contratado como estudiante en prácticas (ya que así le sale más barato) para que diseñes la operación de esterilización térmica de este nuevo producto. Tu nuevo jefe piensa que lo mejor es utilizar los autoclaves discontinuos ya existentes. Estos autoclaves permiten realizar un calentamiento lineal a una velocidad de 8 °C/min, un enfriamiento lineal a -15 °C/min y pueden operar a una temperatura máxima de 127 °C. La temperatura inicial y final de los botes es de 35 °C. También cree que lo mejor es realizar la esterilización a 115 °C o a 127 °C, ya que la musculina es termosensible.

Tras estudiar el problema le dices a tu jefe:

i. el producto es asqueroso (esto, en realidad, no lo dices solo lo piensas)
    
ii. no estás de acuerdo con que lo mejor sea realizar la operación a baja temperatura 
    
iii. lo mejor sería comprar un equipo de esterilización en continuo UHT de las siguientes características:
        
*Calentamiento:*
"""

# ╔═╡ 25267578-4dd5-40d4-9eb6-326822881a71
cal = DataFrame(t=(0:0.1:0.6)*u"s", T=[98, 104, 111, 127, 135, 138, 140]*u"°C")

# ╔═╡ b59cdeab-6899-40b7-965d-69dce91d2f53
md"""
_Enfriamiento:_
"""

# ╔═╡ 3432bc21-497b-4dee-b289-c53af050ce04
enf =  DataFrame(t=(0:0.1:0.4)*u"s", T=[140, 127, 114, 106, 94]*u"°C")

# ╔═╡ 0af42f69-c4e9-45ab-85c6-259df41f9451
cm"""
Una vez realizada ya solo quedaría el realizar un envasado aséptico.

Como consecuencia el sr. Barrufet quiere que le presentes un informe con la respuesta a las siguientes preguntas: 
{type=a}
1. Dar los tiempos de mantenimiento para cada una de los procesos: los propuestos por el sr. Barrufet (esterilizar con los autoclaves a 115 °C o a 127 °C) y el proceso UHT.

2. Justificar, mediante cálculos, cuál es el mejor de los tres procesos para esterilizar el producto en cuestión.

3. ¿Cuánta musculina se debe añadir a la bebida para que tras el procesado—siguiendo el mejor de los procesos propuestos—se  obtenga la concentración deseada?

DATOS:

- El procesado busca lograr 12 reducciones decimales de un microorganismo con _z_ = 8.7 °C y _D₁₂₁_ = 2.3 min.

- La musculina tiene un _D₁₂₁_ = 0.7 min y una _z_ = 50 °C.


"""

# ╔═╡ 15cb0222-b34f-4ba1-b201-66fccd9c0550
md"""
#### Solución

En este problema se plantean tres procesados diferentes, dos procesados en discontinuo (a 115 °C y a 127 °C) y una operación UHT a 140 °C.

El procesado en discontinuo tiene las siguientes velocidades de calentamiento y de enfriamiento:
"""

# ╔═╡ 3a0b44f2-f2d7-4432-901c-4f53e858dfda
fh = 8u"K/minute"

# ╔═╡ 1cf38b6f-3e78-46ed-b170-491e23babe1c
fc = -15u"K/minute"

# ╔═╡ 7dfc1986-05bb-4ccc-a050-2028c60a401c
md"""
Los perfiles de temperatura de los tratamientos en discontinuo son:
"""

# ╔═╡ 4e24ef86-e4c4-40c4-8a1c-57d8a040c9d6
begin
	tcalplot(Ti, Tf, f) = upreferred((Tf-Ti)/f)
	plot()
	function plottrat(Tmax, Δt)
		Ti = 35u"°C"
		Tf = Tmax
		plot!([0u"s", tcalplot(Ti, Tf, fh)], [Ti, Tf], legend=:bottom, xlabel="t", ylabel="T", label="", lw=2)
		plot!([tcalplot(Ti, Tf, fh), tcalplot(Ti, Tf, fh)+Δt], [Tf, Tf], label =Tf, linestyle=:dash, lw=2)
		plot!([tcalplot(Ti, Tf, fh)+Δt, tcalplot(Ti, Tf, fh)+Δt+tcalplot(Tf, Ti, fc)], [Tf, Ti], label ="", lw=2)
	end
	plottrat(115u"°C", 200u"s")
	plottrat(127u"°C", 200u"s")
	
end

# ╔═╡ 5edaea8d-ce34-4aab-86bd-8af0bfce2532
md"""
El perfil de temperaturas del procesado UHT es:"
"""

# ╔═╡ 942ad5bd-2060-4a1d-aa04-ab8a5a0e0f8f
begin
	function plotcont(Δt)
		plot(cal.t, cal.T, xlabel="t", ylabel="T", lw=2, legend=false)
		plot!([last(cal.t), last(cal.t)+Δt], [140u"°C", 140u"°C"], linestyle=:dash, lw=2)
		plot!(enf.t .+(last(cal.t)+Δt), enf.T, lw=2)
	end
	plotcont(0.8u"s")
end

# ╔═╡ 5c125dbb-33ca-4d27-82f2-f0bd9b98146e
md"""
Los datos de termoresistencia del microorganismo objetivo son:
"""

# ╔═╡ 79ddd540-2fb9-4060-861f-76f5b5889343
z = 8.7u"K"

# ╔═╡ 6b449c9b-aa91-488d-a0b6-285197e7bbc4
D₁₂₁ = 2.3u"minute"

# ╔═╡ c0f9a69d-e8d5-48d2-86c5-3db0300b8c1a
md"""
###### a.

En los tres casos el proceso para encontrar el tiempo de la etapa de manteniento será el mismo:

1. Calcularemos F₁₂₁ para lograr 12 reducciones decimales.
2. Calcularemos las letalidades de las etapas de calentamiento (L₁) y de enfriamiento (L₃) tomado como temperatura de referencia 121 °C. 
3. Determinaremos L₂ = F₁₂₁ - L₁ - L₃
4. Encontraremos la duración de la temperatura de tratamiento encontrando el tratamiento equivalente a la temperatura de mantenimiento a partir de L₂.

Para facilitar los cálculos definimos una función que calcula la letalidad de una etapa de calentamiento o enfriamiento lineal:
"""

# ╔═╡ f5dbce29-b341-4261-92d8-19026fb4ba79
md"""
**Calculo de la F₁₂₁**

Este valor será el mismo para los tres tratamientos:
"""

# ╔═╡ 07861df4-84cb-44ec-887b-cfe282193d82
n = 12

# ╔═╡ 3c6b7632-e438-4628-852c-f01d2c18c7e4
F₁₂₁ = n*D₁₂₁

# ╔═╡ aa7d7e4a-9fb4-4b4e-a320-e2da56af83f6
md"""
Para los dos primeros tratamientos en discontinuo, la temperatura de referencia y la de almacenamiento de los botes son constantes:
"""

# ╔═╡ ad29af63-bcb0-4798-9a76-405561413454
Tref = 121u"°C"

# ╔═╡ 056a1de6-e01f-4093-ab2b-6b935c6f2764
# T₁ es la temperatura inicial
# T₂ es la temperatura final
# f es la velociadad de calentamiento (fh) o de enfriamiento (fc)
# z es el valor de z

L(T₁, T₂, f, z) = z/f/log(10)*(10^((T₂-Tref)/z)-10^((T₁-Tref)/z))

# ╔═╡ 01501cb5-3f5d-4656-b665-26035b5a4276
Talm = 35u"°C"

# ╔═╡ 432d78c9-50da-462b-a846-ff69f12681d6
Tmant = 115u"°C"

# ╔═╡ 50de14ae-0e6d-4b63-9985-e1ab1b1cc805
md"""
**Tratamiento en discontinuo a $(Tmant)**

Las letalidades de calentamiento y de enfriamiento para el primero de los tratamientos, con una temperatura de mantenimiento de $(Tmant) son:
"""

# ╔═╡ 045c4cad-3f57-468b-8716-f644768e4ecf
L₁ = L(Talm, Tmant, fh, z)

# ╔═╡ 6aa8cd41-e39e-4bf7-9aae-8e5b124c160f
L₃ = L(Tmant, Talm, fc, z)

# ╔═╡ 91459fe3-146f-46a0-b9fa-c0df88875038
md"""
Calculamos la letalidad de la etapa de mantenimiento:
"""

# ╔═╡ 4eaf6c32-f5fc-42ca-8bb2-079a64b4748b
L₂ = F₁₂₁ - L₁ - L₃

# ╔═╡ b7202ef8-1530-4797-b993-06d5561efdf4
md"""
Finalmente solo queda encontrar el tiempo de duración de la etapa de mantenimiento a $(Tmant) usando la segunda ley de la esterilización térmica:
"""

# ╔═╡ 3cfdd131-7c66-421e-97fb-d915215a502e
Δt = L₂*10^((Tref-Tmant)/z)

# ╔═╡ e22f1c54-dde5-4e2e-8e2d-28854070c6c9
Tmant´ = 127u"°C"

# ╔═╡ ba5bf898-befa-4fe7-9723-620ca75035d6
md"""
**Tratamiento a $(Tmant´)**

Repetimos el proceso anterior. Indicaremos las variables de este proceso con una ´:
"""

# ╔═╡ 8c23f304-05fd-4d0f-a52d-de151f6e9705
L₁´ = L(Talm, Tmant´, fh, z)

# ╔═╡ 0bec931b-4200-4ea2-80a5-eb2980b84749
L₃´ = L(Tmant´, Talm, fc, z)

# ╔═╡ a329e6b0-face-4213-b88d-7ea5b26d883a
L₂´ = F₁₂₁ - L₁´ - L₃´

# ╔═╡ acc20787-fa27-4bd2-bfda-41371dac7b8d
Δt´ = L₂´*10^((Tref-Tmant´)/z)

# ╔═╡ 684595e7-0633-49e2-b55e-4c4fbdb737fd
md"""
**Tratamiento UHT**

En este caso es necesario calcular las letalidades numéricamente, usaremos el método de los trapecios. Para realizar la integral, definimos d_L_:
"""

# ╔═╡ 0790e0ca-49c1-4f98-ab81-d34e7c18b480
# @. es para que la función admita una lista de números (un vector)
dL(T, z) = @. 10^((T-Tref)/z)

# ╔═╡ 596b1967-3f2e-4699-addd-53616b694f63
md"""
Encontramos la letalidad de la etapa de calentamiento integrando d_L_:
"""

# ╔═╡ e2c40f80-a068-4f98-99b2-0238d436cada
L₁´´ = trapz(cal.t, dL(cal.T, z))

# ╔═╡ d381addc-cddf-4c45-b191-f824702ac32d
md"""
Para la etapa de enfriamiento:
"""

# ╔═╡ 7729cd2f-89f9-4327-84f3-ad30c427d26b
L₃´´ = trapz(enf.t, dL(enf.T, z))

# ╔═╡ 7caeab6f-85c4-4236-864a-3e4dce7348c5
md"""
Repitiendo el proceso realizado para los dos procesos anteriores encontramos la duración de la etapa de mantenimiento:
"""

# ╔═╡ 9b2848c1-4236-49e8-897d-8f43cffe7184
L₂´´ = F₁₂₁ - L₁´´  - L₃´´ 

# ╔═╡ 81537501-82f1-4c91-995c-2be628ea8a07
Tmant´´ = 140u"°C"

# ╔═╡ ea973b83-8c37-443e-b349-9c26cdc7530a
Δt´´ = L₂´´*10^((Tref-Tmant´´)/z)

# ╔═╡ 80dce170-ed16-451d-a685-ac1053913a37
cm"""
!!! Solución
	**Duración de la etapa de mantenimiento:**

	_$(Tmant):_ **$(round(typeof(Δt), Δt; digits=1))**

	_$(Tmant´):_ **$(round(typeof(Δt´), Δt´; digits=1))**

	_$(Tmant´´):_ **$(round(typeof(Δt´´), Δt´´; digits=1))**
"""

# ╔═╡ 821068ea-a450-4951-b6a8-ac13a0ebf9ae
md"""
###### b.

Desde el punto de vista de la inactivación del microorganismo los tres tratamientos anteriores son equivalentes, ya que los tres logran _n_ = $(n).

No tendrán el mismo efecto sobre el compuesto nutricional de interés, la musculina. Podemos considerar el mejor proceso el que destruya en menor medida este compuesto termosensible.

Los datos de termoresistencia de la musculina son:
"""

# ╔═╡ f16af97a-3d7e-4059-b40a-4313edb2bbbf
D₁₂₁ᵐ = 0.7u"minute"

# ╔═╡ 8a15d9f9-3737-424f-8aaa-effca8e537fb
zᵐ = 50u"K"

# ╔═╡ ed14be70-b662-47e2-bc27-22bdab3dfa57
md"""
El apartado anterior ya hemos determinado las duraciones de las etapas de mantenimiento. Estos son los tramientos que aplicaremos en los casos del procesado discontinuo:
"""

# ╔═╡ e2b16e19-98f4-4dfc-94d1-82bd3861be7c
begin
	plot()
	plottrat(Tmant, Δt)
	plottrat(Tmant´, Δt´)
end

# ╔═╡ cb830262-b85f-4527-bb2c-c7c6478a8d2c
md"""
El tratamiento a aplicar para el tratamiento en continuo es:
"""

# ╔═╡ e4cf266c-2ae9-454a-8411-7ee4461e2ae9
plotcont(Δt´´)

# ╔═╡ 5c20631b-d1d7-4e3b-b49d-b5186a49bd54
md"""
En los tres casos tendremos que realizar el mismo proceso:

1. Calcular la letalidad de la etapa de calentamiento, de mantenimiento y de enfrimaiento.
2. A partir de la suma de las letalidades encontraremos la F del tratamiento a la temperatura de referencia.
3. Calcularemos los valores de n para los tres tratamiento y seleccionaremos el que tenga un valor menor.

**Proceso en discontinuo a $(Tmant)**
"""

# ╔═╡ 657f315b-87d3-41cf-a497-b1bc67b130d0
L₁ᵐ = L(Talm, Tmant, fh, zᵐ)

# ╔═╡ b1ea7677-bd2b-4e78-b61f-0df7a6da8143
L₃ᵐ = L(Tmant, Talm, fc, zᵐ)

# ╔═╡ fe0c1d15-0f58-4fe5-9633-54405d73c12c
L₂ᵐ = Δt*10^((Tmant-Tref)/zᵐ)

# ╔═╡ 34bd926b-a413-4d19-bc72-7176cb56bb29
F₁₂₁ᵐ = L₁ᵐ + L₂ᵐ + L₃ᵐ

# ╔═╡ 867cb44b-fbc7-472d-a8ea-3b71fa4dd89d
nᵐ = F₁₂₁ᵐ/D₁₂₁ᵐ

# ╔═╡ f0b0fb6e-d62d-4bd9-ad06-74ee4bf6dc03
md"""
**Proceso en discontinuo a $(Tmant´)**
"""

# ╔═╡ bee3efa4-a598-40c2-96de-33fa68b807a9
L₁ᵐ´ = L(Talm, Tmant´, fh, zᵐ)

# ╔═╡ fb4c9684-79d5-4bf9-9ba8-1d8e920e2c20
L₂ᵐ´ = Δt´*10^((Tmant´-Tref)/zᵐ)

# ╔═╡ 2d2525c1-d16f-4031-9209-9b53474d9024
L₃ᵐ´ = L(Tmant´, Talm, fc, zᵐ)

# ╔═╡ 171ab998-49aa-4d0b-ac0a-b849a2209047
F₁₂₁ᵐ´ = L₁ᵐ´ + L₂ᵐ´ + L₃ᵐ´

# ╔═╡ 2f7cc937-27de-4c6a-8e0f-2b24226cb1f7
nᵐ´ = F₁₂₁ᵐ´/D₁₂₁ᵐ

# ╔═╡ 4a0d15c7-f346-4a51-9447-7289d57c7f5b
md"""
**Proceso en continuo UHT**
"""

# ╔═╡ c701dadc-978b-4fc4-a58f-6959b7942626
L₁ᵐ´´ = trapz(cal.t, dL(cal.T, zᵐ))

# ╔═╡ 76ac4637-07bd-4dfe-bd2d-7fa62c44d599
L₃ᵐ´´ = trapz(enf.t, dL(enf.T, zᵐ))

# ╔═╡ f19d2fa3-87cf-45d9-94bf-fb1f9bb44c6f
L₂ᵐ´´ = Δt´´*10^((Tmant´´-Tref)/zᵐ)

# ╔═╡ 680d8228-2f94-412e-bdc3-949a3c57be5a
F₁₂₁ᵐ´´ = L₁ᵐ´´ + L₂ᵐ´´ + L₃ᵐ´´

# ╔═╡ 7a0a8d66-d2e6-479c-8813-11c2ea6daebf
nᵐ´´ = F₁₂₁ᵐ´´/D₁₂₁ᵐ |> upreferred

# ╔═╡ 83e43316-6bc8-4d32-a45e-6b6269dfc86a
cm"""
!!! Solución
	Observando los valores de F₁₂₁ᵐ o de nᵐ se comprueba que el **procesado UHT** es el que tiene un menor impacto sobre el compuesto nutricional de interés.
"""

# ╔═╡ 48725cd5-bf2f-412e-9208-b7d9290c8a87
md"""
###### c.

El objetico es tener una concentración final de:
"""

# ╔═╡ 07bad5da-ee52-42b8-a9a2-e4433de5a7b5
c = 15 #ppm

# ╔═╡ 4e571610-0c86-4403-bbb1-ffade8ec1906
md"""
Como conocemos el efecto del tratamiento sobre la musculina (nᵐ´´), encontrar la concentración inicial es simple:
"""

# ╔═╡ cced5cec-35a8-4028-ac31-f9d5ddbf6510
c₀ = c*10^nᵐ´´

# ╔═╡ 1257c5f8-f824-4513-bd4f-75112200ebb5
cm"""
!!! Solución
	**c₀ = $(round(c₀; digits=1)) ppm**
"""

# ╔═╡ c9eff1e0-5292-11ec-2438-4374dc430545
md"""
---
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
CommonMark = "a80b9123-70ca-4bc0-993e-6e3bcb318db6"
DataFrames = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
Plots = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
Trapz = "592b5752-818d-11e9-1e9a-2b8ca4a44cd1"
Unitful = "1986cc42-f94f-5a68-af5c-568840ba703d"
UnitfulRecipes = "42071c24-d89e-48dd-8a24-8a12d9b8861f"

[compat]
CommonMark = "~0.8.3"
DataFrames = "~1.2.2"
Plots = "~1.24.3"
Trapz = "~2.0.3"
Unitful = "~1.9.2"
UnitfulRecipes = "~1.5.3"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[Adapt]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "84918055d15b3114ede17ac6a7182f68870c16f7"
uuid = "79e6a3ab-5dfb-504d-930d-738a2a938a0e"
version = "3.3.1"

[[ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"

[[Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[Bzip2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "19a35467a82e236ff51bc17a3a44b69ef35185a2"
uuid = "6e34b625-4abd-537c-b88f-471c36dfa7a0"
version = "1.0.8+0"

[[Cairo_jll]]
deps = ["Artifacts", "Bzip2_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "JLLWrappers", "LZO_jll", "Libdl", "Pixman_jll", "Pkg", "Xorg_libXext_jll", "Xorg_libXrender_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "f2202b55d816427cd385a9a4f3ffb226bee80f99"
uuid = "83423d85-b0ee-5818-9007-b63ccbeb887a"
version = "1.16.1+0"

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

[[ColorSchemes]]
deps = ["ColorTypes", "Colors", "FixedPointNumbers", "Random"]
git-tree-sha1 = "a851fec56cb73cfdf43762999ec72eff5b86882a"
uuid = "35d6a980-a343-548e-a6ea-1d62b119f2f4"
version = "3.15.0"

[[ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "024fe24d83e4a5bf5fc80501a314ce0d1aa35597"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.0"

[[Colors]]
deps = ["ColorTypes", "FixedPointNumbers", "Reexport"]
git-tree-sha1 = "417b0ed7b8b838aa6ca0a87aadf1bb9eb111ce40"
uuid = "5ae59095-9a9b-59fe-a467-6f913c188581"
version = "0.12.8"

[[CommonMark]]
deps = ["Crayons", "JSON", "URIs"]
git-tree-sha1 = "393ac9df4eb085c2ab12005fc496dae2e1da344e"
uuid = "a80b9123-70ca-4bc0-993e-6e3bcb318db6"
version = "0.8.3"

[[Compat]]
deps = ["Base64", "Dates", "DelimitedFiles", "Distributed", "InteractiveUtils", "LibGit2", "Libdl", "LinearAlgebra", "Markdown", "Mmap", "Pkg", "Printf", "REPL", "Random", "SHA", "Serialization", "SharedArrays", "Sockets", "SparseArrays", "Statistics", "Test", "UUIDs", "Unicode"]
git-tree-sha1 = "dce3e3fea680869eaa0b774b2e8343e9ff442313"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "3.40.0"

[[CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"

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

[[DataAPI]]
git-tree-sha1 = "cc70b17275652eb47bc9e5f81635981f13cea5c8"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.9.0"

[[DataFrames]]
deps = ["Compat", "DataAPI", "Future", "InvertedIndices", "IteratorInterfaceExtensions", "LinearAlgebra", "Markdown", "Missings", "PooledArrays", "PrettyTables", "Printf", "REPL", "Reexport", "SortingAlgorithms", "Statistics", "TableTraits", "Tables", "Unicode"]
git-tree-sha1 = "d785f42445b63fc86caa08bb9a9351008be9b765"
uuid = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
version = "1.2.2"

[[DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "7d9d316f04214f7efdbb6398d545446e246eff02"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.10"

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

[[DocStringExtensions]]
deps = ["LibGit2"]
git-tree-sha1 = "b19534d1895d702889b219c382a6e18010797f0b"
uuid = "ffbed154-4ef7-542d-bbb7-c09d3a79fcae"
version = "0.8.6"

[[Downloads]]
deps = ["ArgTools", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"

[[EarCut_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "3f3a2501fa7236e9b911e0f7a588c657e822bb6d"
uuid = "5ae413db-bbd1-5e63-b57d-d24a61df00f5"
version = "2.2.3+0"

[[Expat_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "b3bfd02e98aedfa5cf885665493c5598c350cd2f"
uuid = "2e619515-83b5-522b-bb60-26c02a35a201"
version = "2.2.10+0"

[[FFMPEG]]
deps = ["FFMPEG_jll"]
git-tree-sha1 = "b57e3acbe22f8484b4b5ff66a7499717fe1a9cc8"
uuid = "c87230d0-a227-11e9-1b43-d7ebe4e7570a"
version = "0.4.1"

[[FFMPEG_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "JLLWrappers", "LAME_jll", "Libdl", "Ogg_jll", "OpenSSL_jll", "Opus_jll", "Pkg", "Zlib_jll", "libass_jll", "libfdk_aac_jll", "libvorbis_jll", "x264_jll", "x265_jll"]
git-tree-sha1 = "d8a578692e3077ac998b50c0217dfd67f21d1e5f"
uuid = "b22a6f82-2f65-5046-a5b2-351ab43fb4e5"
version = "4.4.0+0"

[[FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[Fontconfig_jll]]
deps = ["Artifacts", "Bzip2_jll", "Expat_jll", "FreeType2_jll", "JLLWrappers", "Libdl", "Libuuid_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "21efd19106a55620a188615da6d3d06cd7f6ee03"
uuid = "a3f928ae-7b40-5064-980b-68af3947d34b"
version = "2.13.93+0"

[[Formatting]]
deps = ["Printf"]
git-tree-sha1 = "8339d61043228fdd3eb658d86c926cb282ae72a8"
uuid = "59287772-0a20-5a39-b81b-1366585eb4c0"
version = "0.4.2"

[[FreeType2_jll]]
deps = ["Artifacts", "Bzip2_jll", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "87eb71354d8ec1a96d4a7636bd57a7347dde3ef9"
uuid = "d7e528f0-a631-5988-bf34-fe36492bcfd7"
version = "2.10.4+0"

[[FriBidi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "aa31987c2ba8704e23c6c8ba8a4f769d5d7e4f91"
uuid = "559328eb-81f9-559d-9380-de523a88c83c"
version = "1.0.10+0"

[[Future]]
deps = ["Random"]
uuid = "9fa8497b-333b-5362-9e8d-4d0656e87820"

[[GLFW_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libglvnd_jll", "Pkg", "Xorg_libXcursor_jll", "Xorg_libXi_jll", "Xorg_libXinerama_jll", "Xorg_libXrandr_jll"]
git-tree-sha1 = "0c603255764a1fa0b61752d2bec14cfbd18f7fe8"
uuid = "0656b61e-2033-5cc2-a64a-77c0f6c09b89"
version = "3.3.5+1"

[[GR]]
deps = ["Base64", "DelimitedFiles", "GR_jll", "HTTP", "JSON", "Libdl", "LinearAlgebra", "Pkg", "Printf", "Random", "Serialization", "Sockets", "Test", "UUIDs"]
git-tree-sha1 = "30f2b340c2fff8410d89bfcdc9c0a6dd661ac5f7"
uuid = "28b8d3ca-fb5f-59d9-8090-bfdbd6d07a71"
version = "0.62.1"

[[GR_jll]]
deps = ["Artifacts", "Bzip2_jll", "Cairo_jll", "FFMPEG_jll", "Fontconfig_jll", "GLFW_jll", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Libtiff_jll", "Pixman_jll", "Pkg", "Qt5Base_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "fd75fa3a2080109a2c0ec9864a6e14c60cca3866"
uuid = "d2c73de3-f751-5644-a686-071e5b155ba9"
version = "0.62.0+0"

[[GeometryBasics]]
deps = ["EarCut_jll", "IterTools", "LinearAlgebra", "StaticArrays", "StructArrays", "Tables"]
git-tree-sha1 = "58bcdf5ebc057b085e58d95c138725628dd7453c"
uuid = "5c1252a2-5f33-56bf-86c9-59e7332b4326"
version = "0.4.1"

[[Gettext_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Libiconv_jll", "Pkg", "XML2_jll"]
git-tree-sha1 = "9b02998aba7bf074d14de89f9d37ca24a1a0b046"
uuid = "78b55507-aeef-58d4-861c-77aaff3498b1"
version = "0.21.0+0"

[[Glib_jll]]
deps = ["Artifacts", "Gettext_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Libiconv_jll", "Libmount_jll", "PCRE_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "7bf67e9a481712b3dbe9cb3dac852dc4b1162e02"
uuid = "7746bdde-850d-59dc-9ae8-88ece973131d"
version = "2.68.3+0"

[[Graphite2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "344bf40dcab1073aca04aa0df4fb092f920e4011"
uuid = "3b182d85-2403-5c21-9c21-1e1f0cc25472"
version = "1.3.14+0"

[[Grisu]]
git-tree-sha1 = "53bb909d1151e57e2484c3d1b53e19552b887fb2"
uuid = "42e2da0e-8278-4e71-bc24-59509adca0fe"
version = "1.0.2"

[[HTTP]]
deps = ["Base64", "Dates", "IniFile", "Logging", "MbedTLS", "NetworkOptions", "Sockets", "URIs"]
git-tree-sha1 = "0fa77022fe4b511826b39c894c90daf5fce3334a"
uuid = "cd3eb016-35fb-5094-929b-558a96fad6f3"
version = "0.9.17"

[[HarfBuzz_jll]]
deps = ["Artifacts", "Cairo_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "Graphite2_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Pkg"]
git-tree-sha1 = "8a954fed8ac097d5be04921d595f741115c1b2ad"
uuid = "2e76f6c2-a576-52d4-95c1-20adfe4de566"
version = "2.8.1+0"

[[IniFile]]
deps = ["Test"]
git-tree-sha1 = "098e4d2c533924c921f9f9847274f2ad89e018b8"
uuid = "83e8ac13-25f8-5344-8a64-a9f2b223428f"
version = "0.5.0"

[[InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[InverseFunctions]]
deps = ["Test"]
git-tree-sha1 = "a7254c0acd8e62f1ac75ad24d5db43f5f19f3c65"
uuid = "3587e190-3f89-42d0-90ee-14403ec27112"
version = "0.1.2"

[[InvertedIndices]]
git-tree-sha1 = "bee5f1ef5bf65df56bdd2e40447590b272a5471f"
uuid = "41ab1584-1d38-5bbf-9106-f11c6c58b48f"
version = "1.1.0"

[[IrrationalConstants]]
git-tree-sha1 = "7fd44fd4ff43fc60815f8e764c0f352b83c49151"
uuid = "92d709cd-6900-40b7-9082-c6be49f344b6"
version = "0.1.1"

[[IterTools]]
git-tree-sha1 = "05110a2ab1fc5f932622ffea2a003221f4782c18"
uuid = "c8e1da08-722c-5040-9ed9-7db0dc04731e"
version = "1.3.0"

[[IteratorInterfaceExtensions]]
git-tree-sha1 = "a3f24677c21f5bbe9d2a714f95dcd58337fb2856"
uuid = "82899510-4779-5014-852e-03e436cf321d"
version = "1.0.0"

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

[[JpegTurbo_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "d735490ac75c5cb9f1b00d8b5509c11984dc6943"
uuid = "aacddb02-875f-59d6-b918-886e6ef4fbf8"
version = "2.1.0+0"

[[LAME_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "f6250b16881adf048549549fba48b1161acdac8c"
uuid = "c1c5ebd0-6772-5130-a774-d5fcae4a789d"
version = "3.100.1+0"

[[LZO_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "e5b909bcf985c5e2605737d2ce278ed791b89be6"
uuid = "dd4b983a-f0e5-5f8d-a1b7-129d4a5fb1ac"
version = "2.10.1+0"

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

[[Libffi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "0b4a5d71f3e5200a7dff793393e09dfc2d874290"
uuid = "e9f186c6-92d2-5b65-8a66-fee21dc1b490"
version = "3.2.2+1"

[[Libgcrypt_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libgpg_error_jll", "Pkg"]
git-tree-sha1 = "64613c82a59c120435c067c2b809fc61cf5166ae"
uuid = "d4300ac3-e22c-5743-9152-c294e39db1e4"
version = "1.8.7+0"

[[Libglvnd_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll", "Xorg_libXext_jll"]
git-tree-sha1 = "7739f837d6447403596a75d19ed01fd08d6f56bf"
uuid = "7e76a0d4-f3c7-5321-8279-8d96eeed0f29"
version = "1.3.0+3"

[[Libgpg_error_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "c333716e46366857753e273ce6a69ee0945a6db9"
uuid = "7add5ba3-2f88-524e-9cd5-f83b8a55f7b8"
version = "1.42.0+0"

[[Libiconv_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "42b62845d70a619f063a7da093d995ec8e15e778"
uuid = "94ce4f54-9a6c-5748-9c1c-f9c7231a4531"
version = "1.16.1+1"

[[Libmount_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "9c30530bf0effd46e15e0fdcf2b8636e78cbbd73"
uuid = "4b2f31a3-9ecc-558c-b454-b3730dcb73e9"
version = "2.35.0+0"

[[Libtiff_jll]]
deps = ["Artifacts", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Pkg", "Zlib_jll", "Zstd_jll"]
git-tree-sha1 = "340e257aada13f95f98ee352d316c3bed37c8ab9"
uuid = "89763e89-9b03-5906-acba-b20f662cd828"
version = "4.3.0+0"

[[Libuuid_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "7f3efec06033682db852f8b3bc3c1d2b0a0ab066"
uuid = "38a345b3-de98-5d2b-a5d3-14cd9215e700"
version = "2.36.0+0"

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

[[MbedTLS]]
deps = ["Dates", "MbedTLS_jll", "Random", "Sockets"]
git-tree-sha1 = "1c38e51c3d08ef2278062ebceade0e46cefc96fe"
uuid = "739be429-bea8-5141-9913-cc70e7f3736d"
version = "1.0.3"

[[MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"

[[Measures]]
git-tree-sha1 = "e498ddeee6f9fdb4551ce855a46f54dbd900245f"
uuid = "442fdcdd-2543-5da2-b0f3-8c86c306513e"
version = "0.3.1"

[[Missings]]
deps = ["DataAPI"]
git-tree-sha1 = "bf210ce90b6c9eed32d25dbcae1ebc565df2687f"
uuid = "e1d29d7a-bbdc-5cf2-9ac0-f12de2c33e28"
version = "1.0.2"

[[Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"

[[NaNMath]]
git-tree-sha1 = "bfe47e760d60b82b66b61d2d44128b62e3a369fb"
uuid = "77ba4419-2d1f-58cd-9bb1-8ffee604a2e3"
version = "0.3.5"

[[NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"

[[Ogg_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "7937eda4681660b4d6aeeecc2f7e1c81c8ee4e2f"
uuid = "e7412a2a-1a6e-54c0-be00-318e2571c051"
version = "1.3.5+0"

[[OpenSSL_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "15003dcb7d8db3c6c857fda14891a539a8f2705a"
uuid = "458c3c95-2e84-50aa-8efc-19380b2a3a95"
version = "1.1.10+0"

[[Opus_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "51a08fb14ec28da2ec7a927c4337e4332c2a4720"
uuid = "91d4177d-7536-5919-b921-800302f37372"
version = "1.3.2+0"

[[OrderedCollections]]
git-tree-sha1 = "85f8e6578bf1f9ee0d11e7bb1b1456435479d47c"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.4.1"

[[PCRE_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "b2a7af664e098055a7529ad1a900ded962bca488"
uuid = "2f80f16e-611a-54ab-bc61-aa92de5b98fc"
version = "8.44.0+0"

[[Parsers]]
deps = ["Dates"]
git-tree-sha1 = "ae4bbcadb2906ccc085cf52ac286dc1377dceccc"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.1.2"

[[Pixman_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "b4f5d02549a10e20780a24fce72bea96b6329e29"
uuid = "30392449-352a-5448-841d-b1acce4e97dc"
version = "0.40.1+0"

[[Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"

[[PlotThemes]]
deps = ["PlotUtils", "Requires", "Statistics"]
git-tree-sha1 = "a3a964ce9dc7898193536002a6dd892b1b5a6f1d"
uuid = "ccf2f8ad-2431-5c83-bf29-c5338b663b6a"
version = "2.0.1"

[[PlotUtils]]
deps = ["ColorSchemes", "Colors", "Dates", "Printf", "Random", "Reexport", "Statistics"]
git-tree-sha1 = "b084324b4af5a438cd63619fd006614b3b20b87b"
uuid = "995b91a9-d308-5afd-9ec6-746e21dbc043"
version = "1.0.15"

[[Plots]]
deps = ["Base64", "Contour", "Dates", "Downloads", "FFMPEG", "FixedPointNumbers", "GR", "GeometryBasics", "JSON", "Latexify", "LinearAlgebra", "Measures", "NaNMath", "PlotThemes", "PlotUtils", "Printf", "REPL", "Random", "RecipesBase", "RecipesPipeline", "Reexport", "Requires", "Scratch", "Showoff", "SparseArrays", "Statistics", "StatsBase", "UUIDs", "UnicodeFun"]
git-tree-sha1 = "d73736030a094e8d24fdf3629ae980217bf1d59d"
uuid = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
version = "1.24.3"

[[PooledArrays]]
deps = ["DataAPI", "Future"]
git-tree-sha1 = "db3a23166af8aebf4db5ef87ac5b00d36eb771e2"
uuid = "2dfb63ee-cc39-5dd5-95bd-886bf059d720"
version = "1.4.0"

[[Preferences]]
deps = ["TOML"]
git-tree-sha1 = "00cfd92944ca9c760982747e9a1d0d5d86ab1e5a"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.2.2"

[[PrettyTables]]
deps = ["Crayons", "Formatting", "Markdown", "Reexport", "Tables"]
git-tree-sha1 = "d940010be611ee9d67064fe559edbb305f8cc0eb"
uuid = "08abe8d2-0d0c-5749-adfa-8a2ac140af0d"
version = "1.2.3"

[[Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[Qt5Base_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Fontconfig_jll", "Glib_jll", "JLLWrappers", "Libdl", "Libglvnd_jll", "OpenSSL_jll", "Pkg", "Xorg_libXext_jll", "Xorg_libxcb_jll", "Xorg_xcb_util_image_jll", "Xorg_xcb_util_keysyms_jll", "Xorg_xcb_util_renderutil_jll", "Xorg_xcb_util_wm_jll", "Zlib_jll", "xkbcommon_jll"]
git-tree-sha1 = "ad368663a5e20dbb8d6dc2fddeefe4dae0781ae8"
uuid = "ea2cea3b-5b76-57ae-a6ef-0a8af62496e1"
version = "5.15.3+0"

[[REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[Random]]
deps = ["Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[RecipesBase]]
git-tree-sha1 = "6bf3f380ff52ce0832ddd3a2a7b9538ed1bcca7d"
uuid = "3cdcf5f2-1ef4-517c-9805-6587b60abb01"
version = "1.2.1"

[[RecipesPipeline]]
deps = ["Dates", "NaNMath", "PlotUtils", "RecipesBase"]
git-tree-sha1 = "7ad0dfa8d03b7bcf8c597f59f5292801730c55b8"
uuid = "01d81517-befc-4cb6-b9ec-a95719d0359c"
version = "0.4.1"

[[Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "4036a3bd08ac7e968e27c203d45f5fff15020621"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.1.3"

[[SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[Scratch]]
deps = ["Dates"]
git-tree-sha1 = "0b4b7f1393cff97c33891da2a0bf69c6ed241fda"
uuid = "6c6a2e73-6563-6170-7368-637461726353"
version = "1.1.0"

[[Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[SharedArrays]]
deps = ["Distributed", "Mmap", "Random", "Serialization"]
uuid = "1a1011a3-84de-559e-8e89-a11a2f7dc383"

[[Showoff]]
deps = ["Dates", "Grisu"]
git-tree-sha1 = "91eddf657aca81df9ae6ceb20b959ae5653ad1de"
uuid = "992d4aef-0814-514b-bc4d-f2e9a6c4116f"
version = "1.0.3"

[[Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[SortingAlgorithms]]
deps = ["DataStructures"]
git-tree-sha1 = "b3363d7460f7d098ca0912c69b082f75625d7508"
uuid = "a2af1166-a08f-5f64-846c-94a0d3cef48c"
version = "1.0.1"

[[SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[StaticArrays]]
deps = ["LinearAlgebra", "Random", "Statistics"]
git-tree-sha1 = "3c76dde64d03699e074ac02eb2e8ba8254d428da"
uuid = "90137ffa-7385-5640-81b9-e52037218182"
version = "1.2.13"

[[Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[StatsAPI]]
git-tree-sha1 = "0f2aa8e32d511f758a2ce49208181f7733a0936a"
uuid = "82ae8749-77ed-4fe6-ae5f-f523153014b0"
version = "1.1.0"

[[StatsBase]]
deps = ["DataAPI", "DataStructures", "LinearAlgebra", "LogExpFunctions", "Missings", "Printf", "Random", "SortingAlgorithms", "SparseArrays", "Statistics", "StatsAPI"]
git-tree-sha1 = "2bb0cb32026a66037360606510fca5984ccc6b75"
uuid = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"
version = "0.33.13"

[[StructArrays]]
deps = ["Adapt", "DataAPI", "StaticArrays", "Tables"]
git-tree-sha1 = "2ce41e0d042c60ecd131e9fb7154a3bfadbf50d3"
uuid = "09ab397b-f2b6-538f-b94a-2f83cf4a842a"
version = "0.6.3"

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

[[Trapz]]
git-tree-sha1 = "79eb0ed763084a3e7de81fe1838379ac6a23b6a0"
uuid = "592b5752-818d-11e9-1e9a-2b8ca4a44cd1"
version = "2.0.3"

[[URIs]]
git-tree-sha1 = "97bbe755a53fe859669cd907f2d96aee8d2c1355"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.3.0"

[[UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[UnicodeFun]]
deps = ["REPL"]
git-tree-sha1 = "53915e50200959667e78a92a418594b428dffddf"
uuid = "1cfade01-22cf-5700-b092-accc4b62d6e1"
version = "0.4.1"

[[Unitful]]
deps = ["ConstructionBase", "Dates", "LinearAlgebra", "Random"]
git-tree-sha1 = "0992ed0c3ef66b0390e5752fe60054e5ff93b908"
uuid = "1986cc42-f94f-5a68-af5c-568840ba703d"
version = "1.9.2"

[[UnitfulRecipes]]
deps = ["RecipesBase", "Unitful"]
git-tree-sha1 = "2f61bddb66a5a563b5e67c336577f1af1e650f7b"
uuid = "42071c24-d89e-48dd-8a24-8a12d9b8861f"
version = "1.5.3"

[[Wayland_jll]]
deps = ["Artifacts", "Expat_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Pkg", "XML2_jll"]
git-tree-sha1 = "3e61f0b86f90dacb0bc0e73a0c5a83f6a8636e23"
uuid = "a2964d1f-97da-50d4-b82a-358c7fce9d89"
version = "1.19.0+0"

[[Wayland_protocols_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "66d72dc6fcc86352f01676e8f0f698562e60510f"
uuid = "2381bf8a-dfd0-557d-9999-79630e7b1b91"
version = "1.23.0+0"

[[XML2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libiconv_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "1acf5bdf07aa0907e0a37d3718bb88d4b687b74a"
uuid = "02c8fc9c-b97f-50b9-bbe4-9be30ff0a78a"
version = "2.9.12+0"

[[XSLT_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libgcrypt_jll", "Libgpg_error_jll", "Libiconv_jll", "Pkg", "XML2_jll", "Zlib_jll"]
git-tree-sha1 = "91844873c4085240b95e795f692c4cec4d805f8a"
uuid = "aed1982a-8fda-507f-9586-7b0439959a61"
version = "1.1.34+0"

[[Xorg_libX11_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libxcb_jll", "Xorg_xtrans_jll"]
git-tree-sha1 = "5be649d550f3f4b95308bf0183b82e2582876527"
uuid = "4f6342f7-b3d2-589e-9d20-edeb45f2b2bc"
version = "1.6.9+4"

[[Xorg_libXau_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4e490d5c960c314f33885790ed410ff3a94ce67e"
uuid = "0c0b7dd1-d40b-584c-a123-a41640f87eec"
version = "1.0.9+4"

[[Xorg_libXcursor_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXfixes_jll", "Xorg_libXrender_jll"]
git-tree-sha1 = "12e0eb3bc634fa2080c1c37fccf56f7c22989afd"
uuid = "935fb764-8cf2-53bf-bb30-45bb1f8bf724"
version = "1.2.0+4"

[[Xorg_libXdmcp_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4fe47bd2247248125c428978740e18a681372dd4"
uuid = "a3789734-cfe1-5b06-b2d0-1dd0d9d62d05"
version = "1.1.3+4"

[[Xorg_libXext_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "b7c0aa8c376b31e4852b360222848637f481f8c3"
uuid = "1082639a-0dae-5f34-9b06-72781eeb8cb3"
version = "1.3.4+4"

[[Xorg_libXfixes_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "0e0dc7431e7a0587559f9294aeec269471c991a4"
uuid = "d091e8ba-531a-589c-9de9-94069b037ed8"
version = "5.0.3+4"

[[Xorg_libXi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll", "Xorg_libXfixes_jll"]
git-tree-sha1 = "89b52bc2160aadc84d707093930ef0bffa641246"
uuid = "a51aa0fd-4e3c-5386-b890-e753decda492"
version = "1.7.10+4"

[[Xorg_libXinerama_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll"]
git-tree-sha1 = "26be8b1c342929259317d8b9f7b53bf2bb73b123"
uuid = "d1454406-59df-5ea1-beac-c340f2130bc3"
version = "1.1.4+4"

[[Xorg_libXrandr_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll", "Xorg_libXrender_jll"]
git-tree-sha1 = "34cea83cb726fb58f325887bf0612c6b3fb17631"
uuid = "ec84b674-ba8e-5d96-8ba1-2a689ba10484"
version = "1.5.2+4"

[[Xorg_libXrender_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "19560f30fd49f4d4efbe7002a1037f8c43d43b96"
uuid = "ea2f1a96-1ddc-540d-b46f-429655e07cfa"
version = "0.9.10+4"

[[Xorg_libpthread_stubs_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "6783737e45d3c59a4a4c4091f5f88cdcf0908cbb"
uuid = "14d82f49-176c-5ed1-bb49-ad3f5cbd8c74"
version = "0.1.0+3"

[[Xorg_libxcb_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "XSLT_jll", "Xorg_libXau_jll", "Xorg_libXdmcp_jll", "Xorg_libpthread_stubs_jll"]
git-tree-sha1 = "daf17f441228e7a3833846cd048892861cff16d6"
uuid = "c7cfdc94-dc32-55de-ac96-5a1b8d977c5b"
version = "1.13.0+3"

[[Xorg_libxkbfile_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "926af861744212db0eb001d9e40b5d16292080b2"
uuid = "cc61e674-0454-545c-8b26-ed2c68acab7a"
version = "1.1.0+4"

[[Xorg_xcb_util_image_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "0fab0a40349ba1cba2c1da699243396ff8e94b97"
uuid = "12413925-8142-5f55-bb0e-6d7ca50bb09b"
version = "0.4.0+1"

[[Xorg_xcb_util_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libxcb_jll"]
git-tree-sha1 = "e7fd7b2881fa2eaa72717420894d3938177862d1"
uuid = "2def613f-5ad1-5310-b15b-b15d46f528f5"
version = "0.4.0+1"

[[Xorg_xcb_util_keysyms_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "d1151e2c45a544f32441a567d1690e701ec89b00"
uuid = "975044d2-76e6-5fbe-bf08-97ce7c6574c7"
version = "0.4.0+1"

[[Xorg_xcb_util_renderutil_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "dfd7a8f38d4613b6a575253b3174dd991ca6183e"
uuid = "0d47668e-0667-5a69-a72c-f761630bfb7e"
version = "0.3.9+1"

[[Xorg_xcb_util_wm_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "e78d10aab01a4a154142c5006ed44fd9e8e31b67"
uuid = "c22f9ab0-d5fe-5066-847c-f4bb1cd4e361"
version = "0.4.1+1"

[[Xorg_xkbcomp_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libxkbfile_jll"]
git-tree-sha1 = "4bcbf660f6c2e714f87e960a171b119d06ee163b"
uuid = "35661453-b289-5fab-8a00-3d9160c6a3a4"
version = "1.4.2+4"

[[Xorg_xkeyboard_config_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xkbcomp_jll"]
git-tree-sha1 = "5c8424f8a67c3f2209646d4425f3d415fee5931d"
uuid = "33bec58e-1273-512f-9401-5d533626f822"
version = "2.27.0+4"

[[Xorg_xtrans_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "79c31e7844f6ecf779705fbc12146eb190b7d845"
uuid = "c5fb5394-a638-5e4d-96e5-b29de1b5cf10"
version = "1.4.0+3"

[[Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"

[[Zstd_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "cc4bf3fdde8b7e3e9fa0351bdeedba1cf3b7f6e6"
uuid = "3161d3a3-bdf6-5164-811a-617609db77b4"
version = "1.5.0+0"

[[libass_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "HarfBuzz_jll", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "5982a94fcba20f02f42ace44b9894ee2b140fe47"
uuid = "0ac62f75-1d6f-5e53-bd7c-93b484bb37c0"
version = "0.15.1+0"

[[libfdk_aac_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "daacc84a041563f965be61859a36e17c4e4fcd55"
uuid = "f638f0a6-7fb0-5443-88ba-1cc74229b280"
version = "2.0.2+0"

[[libpng_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "94d180a6d2b5e55e447e2d27a29ed04fe79eb30c"
uuid = "b53b4c65-9356-5827-b1ea-8c7a1a84506f"
version = "1.6.38+0"

[[libvorbis_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Ogg_jll", "Pkg"]
git-tree-sha1 = "c45f4e40e7aafe9d086379e5578947ec8b95a8fb"
uuid = "f27f6e37-5d2b-51aa-960f-b287f2bc3b7a"
version = "1.3.7+0"

[[nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"

[[p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"

[[x264_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4fea590b89e6ec504593146bf8b988b2c00922b2"
uuid = "1270edf5-f2f9-52d2-97e9-ab00b5d0237a"
version = "2021.5.5+0"

[[x265_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "ee567a171cce03570d77ad3a43e90218e38937a9"
uuid = "dfaa095f-4041-5dcd-9319-2fabd8486b76"
version = "3.5.0+0"

[[xkbcommon_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Wayland_jll", "Wayland_protocols_jll", "Xorg_libxcb_jll", "Xorg_xkeyboard_config_jll"]
git-tree-sha1 = "ece2350174195bb31de1a63bea3a41ae1aa593b6"
uuid = "d8fb68d0-12a3-5cfd-a85a-d49703b185fd"
version = "0.9.1+5"
"""

# ╔═╡ Cell order:
# ╟─d24179ea-3a62-47f8-84d4-46ad725902b2
# ╟─25267578-4dd5-40d4-9eb6-326822881a71
# ╟─b59cdeab-6899-40b7-965d-69dce91d2f53
# ╟─3432bc21-497b-4dee-b289-c53af050ce04
# ╟─0af42f69-c4e9-45ab-85c6-259df41f9451
# ╟─15cb0222-b34f-4ba1-b201-66fccd9c0550
# ╟─3a0b44f2-f2d7-4432-901c-4f53e858dfda
# ╟─1cf38b6f-3e78-46ed-b170-491e23babe1c
# ╟─7dfc1986-05bb-4ccc-a050-2028c60a401c
# ╟─4e24ef86-e4c4-40c4-8a1c-57d8a040c9d6
# ╟─5edaea8d-ce34-4aab-86bd-8af0bfce2532
# ╟─942ad5bd-2060-4a1d-aa04-ab8a5a0e0f8f
# ╟─5c125dbb-33ca-4d27-82f2-f0bd9b98146e
# ╟─79ddd540-2fb9-4060-861f-76f5b5889343
# ╟─6b449c9b-aa91-488d-a0b6-285197e7bbc4
# ╟─c0f9a69d-e8d5-48d2-86c5-3db0300b8c1a
# ╠═056a1de6-e01f-4093-ab2b-6b935c6f2764
# ╟─f5dbce29-b341-4261-92d8-19026fb4ba79
# ╟─07861df4-84cb-44ec-887b-cfe282193d82
# ╟─3c6b7632-e438-4628-852c-f01d2c18c7e4
# ╟─aa7d7e4a-9fb4-4b4e-a320-e2da56af83f6
# ╟─ad29af63-bcb0-4798-9a76-405561413454
# ╟─01501cb5-3f5d-4656-b665-26035b5a4276
# ╟─50de14ae-0e6d-4b63-9985-e1ab1b1cc805
# ╟─432d78c9-50da-462b-a846-ff69f12681d6
# ╠═045c4cad-3f57-468b-8716-f644768e4ecf
# ╠═6aa8cd41-e39e-4bf7-9aae-8e5b124c160f
# ╟─91459fe3-146f-46a0-b9fa-c0df88875038
# ╠═4eaf6c32-f5fc-42ca-8bb2-079a64b4748b
# ╟─b7202ef8-1530-4797-b993-06d5561efdf4
# ╠═3cfdd131-7c66-421e-97fb-d915215a502e
# ╟─ba5bf898-befa-4fe7-9723-620ca75035d6
# ╠═e22f1c54-dde5-4e2e-8e2d-28854070c6c9
# ╠═8c23f304-05fd-4d0f-a52d-de151f6e9705
# ╠═0bec931b-4200-4ea2-80a5-eb2980b84749
# ╠═a329e6b0-face-4213-b88d-7ea5b26d883a
# ╠═acc20787-fa27-4bd2-bfda-41371dac7b8d
# ╟─684595e7-0633-49e2-b55e-4c4fbdb737fd
# ╠═0790e0ca-49c1-4f98-ab81-d34e7c18b480
# ╟─596b1967-3f2e-4699-addd-53616b694f63
# ╠═e2c40f80-a068-4f98-99b2-0238d436cada
# ╟─d381addc-cddf-4c45-b191-f824702ac32d
# ╠═7729cd2f-89f9-4327-84f3-ad30c427d26b
# ╟─7caeab6f-85c4-4236-864a-3e4dce7348c5
# ╠═9b2848c1-4236-49e8-897d-8f43cffe7184
# ╠═81537501-82f1-4c91-995c-2be628ea8a07
# ╠═ea973b83-8c37-443e-b349-9c26cdc7530a
# ╟─80dce170-ed16-451d-a685-ac1053913a37
# ╟─821068ea-a450-4951-b6a8-ac13a0ebf9ae
# ╟─f16af97a-3d7e-4059-b40a-4313edb2bbbf
# ╟─8a15d9f9-3737-424f-8aaa-effca8e537fb
# ╟─ed14be70-b662-47e2-bc27-22bdab3dfa57
# ╟─e2b16e19-98f4-4dfc-94d1-82bd3861be7c
# ╟─cb830262-b85f-4527-bb2c-c7c6478a8d2c
# ╟─e4cf266c-2ae9-454a-8411-7ee4461e2ae9
# ╟─5c20631b-d1d7-4e3b-b49d-b5186a49bd54
# ╠═657f315b-87d3-41cf-a497-b1bc67b130d0
# ╠═b1ea7677-bd2b-4e78-b61f-0df7a6da8143
# ╠═fe0c1d15-0f58-4fe5-9633-54405d73c12c
# ╠═34bd926b-a413-4d19-bc72-7176cb56bb29
# ╠═867cb44b-fbc7-472d-a8ea-3b71fa4dd89d
# ╟─f0b0fb6e-d62d-4bd9-ad06-74ee4bf6dc03
# ╠═bee3efa4-a598-40c2-96de-33fa68b807a9
# ╠═fb4c9684-79d5-4bf9-9ba8-1d8e920e2c20
# ╠═2d2525c1-d16f-4031-9209-9b53474d9024
# ╠═171ab998-49aa-4d0b-ac0a-b849a2209047
# ╠═2f7cc937-27de-4c6a-8e0f-2b24226cb1f7
# ╟─4a0d15c7-f346-4a51-9447-7289d57c7f5b
# ╠═c701dadc-978b-4fc4-a58f-6959b7942626
# ╠═76ac4637-07bd-4dfe-bd2d-7fa62c44d599
# ╠═f19d2fa3-87cf-45d9-94bf-fb1f9bb44c6f
# ╠═680d8228-2f94-412e-bdc3-949a3c57be5a
# ╠═7a0a8d66-d2e6-479c-8813-11c2ea6daebf
# ╟─83e43316-6bc8-4d32-a45e-6b6269dfc86a
# ╟─48725cd5-bf2f-412e-9208-b7d9290c8a87
# ╠═07bad5da-ee52-42b8-a9a2-e4433de5a7b5
# ╟─4e571610-0c86-4403-bbb1-ffade8ec1906
# ╠═cced5cec-35a8-4028-ac31-f9d5ddbf6510
# ╟─1257c5f8-f824-4513-bd4f-75112200ebb5
# ╟─c9eff1e0-5292-11ec-2438-4374dc430545
# ╠═b34e50b8-491b-4c67-9a4f-e5370a56b489
# ╠═9735a93f-45a7-48ff-ab52-d222ef60dcbf
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002