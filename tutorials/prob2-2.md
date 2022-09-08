~~~
<!-- PlutoStaticHTML.Begin -->
<!--
    # This information is used for caching.
    [PlutoStaticHTML.State]
    input_sha = "e009e4f96b95ba8bda52dd6092017de5edbbf815de0832a39ca503cf0c99d6f0"
    julia_version = "1.8.0"
-->

<div class="markdown"><h3>2. Preparación de materia prima</h3>
<h4>Problema 2.</h4>
<p>En una criba plana se están clasificando avellanas enteras y avellanas rotas. El caudal de alimentación de avellanas enteras es de 290 kg hr^-1 y el de avellanas rotas en la alimentación es de 110 kg hr^-1. Se obtiene un producto con 240 kg hr^-1 de avellanas enteras y 18 kg hr^-1 de avellanas rotas. ¿Qué efectividad tiene este separador sabiendo que no se acumula nada de producto en el tamiz?</p>
<h5>Solución</h5>
<p>Los datos del problema son:</p>
</div>

<pre class='language-julia'><code class='language-julia'>Fenteras = 290u"kg/hr"</code></pre>
<pre id='var-Fenteras' class='code-output documenter-example-output'>290 kg hr^-1</pre>

<pre class='language-julia'><code class='language-julia'>Frotas = 110u"kg/hr"</code></pre>
<pre id='var-Frotas' class='code-output documenter-example-output'>110 kg hr^-1</pre>

<pre class='language-julia'><code class='language-julia'>Penteras = 240u"kg/hr"</code></pre>
<pre id='var-Penteras' class='code-output documenter-example-output'>240 kg hr^-1</pre>

<pre class='language-julia'><code class='language-julia'>Protas = 18u"kg/hr"</code></pre>
<pre id='var-Protas' class='code-output documenter-example-output'>18 kg hr^-1</pre>


<div class="markdown"><p>El caudal másico de alimentación &#40;<span class="tex">$F$</span>&#41; y su composición &#40;<span class="tex">$x_F$</span>&#41; serán:</p>
</div>

<pre class='language-julia'><code class='language-julia'>F = Fenteras + Frotas</code></pre>
<pre id='var-F' class='code-output documenter-example-output'>400 kg hr^-1</pre>

<pre class='language-julia'><code class='language-julia'>xF = Fenteras/F</code></pre>
<pre id='var-xF' class='code-output documenter-example-output'>0.725</pre>


<div class="markdown"><p>Para la corriente de producto &#40;<span class="tex">$P$</span>&#41;, el caudal másico y la fracción másica de avellanas enteras &#40;<span class="tex">$x_P$</span>&#41; es:</p>
</div>

<pre class='language-julia'><code class='language-julia'>P = Penteras + Protas</code></pre>
<pre id='var-P' class='code-output documenter-example-output'>258 kg hr^-1</pre>

<pre class='language-julia'><code class='language-julia'>xP = Penteras/P</code></pre>
<pre id='var-xP' class='code-output documenter-example-output'>0.9302325581395349</pre>


<div class="markdown"><p>A continuación calculamos el caudal de residuo &#40;<span class="tex">$R$</span>&#41; utilizando el balance macroscópico de materia total:</p>
</div>

<pre class='language-julia'><code class='language-julia'>R = F - P</code></pre>
<pre id='var-R' class='code-output documenter-example-output'>142 kg hr^-1</pre>


<div class="markdown"><p>Realizando el balance de materia para las avellanas enteras podemos encontrar el caudal de avellanas enteras que sale por la corriente de residuos:</p>
</div>

<pre class='language-julia'><code class='language-julia'>Renteras = Fenteras - Penteras</code></pre>
<pre id='var-Renteras' class='code-output documenter-example-output'>50 kg hr^-1</pre>


<div class="markdown"><p>La fracción másica &#40;<span class="tex">$x_R$</span>&#41; es:</p>
</div>

<pre class='language-julia'><code class='language-julia'>xR = Renteras/R</code></pre>
<pre id='var-xR' class='code-output documenter-example-output'>0.352112676056338</pre>


<div class="markdown"><p>Por lo tanto, la eficiencia es:</p>
</div>

<pre class='language-julia'><code class='language-julia'>Eficiencia = P*xP/(F*xF) * R*(1-xR)/(F*(1-xF))</code></pre>
<pre id='var-Eficiencia' class='code-output documenter-example-output'>0.6921630094043887</pre>

<pre class='language-julia'><code class='language-julia'>cm"""
!!! Solución
    **Eficiencia = $(round(Eficiencia; digits=3))**
"""</code></pre>
<div class="admonition is-Solución">
  <header class="admonition-header">
    Solución
  </header>

  <div class="admonition-body">
    <p><strong>Eficiencia = <span class="julia-value">0.692</span></strong></p>
  </div>
</div>


<div class="markdown"><hr />
</div>

<pre class='language-julia'><code class='language-julia'>using Unitful, CommonMark</code></pre>

<div class='manifest-versions'>
<p>Built with Julia 1.8.0 and</p>
CommonMark 0.8.3<br>
Unitful 1.9.1
</div>

<!-- PlutoStaticHTML.End -->
~~~