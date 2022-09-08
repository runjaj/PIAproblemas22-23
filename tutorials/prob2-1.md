~~~
<!-- PlutoStaticHTML.Begin -->
<!--
    # This information is used for caching.
    [PlutoStaticHTML.State]
    input_sha = "40a06c792967a6b470a42f9754ab9d1d3195fff5767c70e3dfa8aa9584c5cab1"
    julia_version = "1.8.0"
-->

<div class="markdown"><h3>2. Preparación de materia prima</h3>
<h4>1</h4>
<p>Un separador de discos se alimenta con una mezcla de avena &#40;95 &#37;&#41; y suciedad con un caudal másico de 1500 kg hr^-1. El separador logra que toda la avena salga por la salida de producto y retienen el 99 &#37; de la suciedad. Durante la operación normal, la suciedad queda retenida en el separador. La capacidad de almacenamiento de suciedad es de 740 kg, ¿cada cuánto tiempo habrá que limpiar el separador de discos?</p>
<h5>Solución</h5>
<p>El caudal másico de la alimentación es:</p>
</div>

<pre class='language-julia'><code class='language-julia'>F = 1500u"kg/hr"</code></pre>
<pre id='var-F' class='code-output documenter-example-output'>1500 kg hr^-1</pre>


<div class="markdown"><p>La fracción másica de avena del caudal de alimentación es:</p>
</div>

<pre class='language-julia'><code class='language-julia'>xF = 0.95</code></pre>
<pre id='var-xF' class='code-output documenter-example-output'>0.95</pre>


<div class="markdown"><p>Por lo tanto, el caudal másico de avena en la alimentación al separado de discos es:</p>
</div>

<pre class='language-julia'><code class='language-julia'>Favena = F * xF</code></pre>
<pre id='var-Favena' class='code-output documenter-example-output'>1425.0 kg hr^-1</pre>


<div class="markdown"><p>El caudal másico de  suciedad que entra en el separador por la corriente de alimentación es:</p>
</div>

<pre class='language-julia'><code class='language-julia'>Fsuciedad = F - Favena</code></pre>
<pre id='var-Fsuciedad' class='code-output documenter-example-output'>75.0 kg hr^-1</pre>


<div class="markdown"><p>El separador de discos retiene el 99 &#37; de la suciedad que entra en el separador, por lo tanto:</p>
</div>

<pre class='language-julia'><code class='language-julia'>Sretenida = 0.99</code></pre>
<pre id='var-Sretenida' class='code-output documenter-example-output'>0.99</pre>

<pre class='language-julia'><code class='language-julia'>Rsuciedad = Fsuciedad * Sretenida</code></pre>
<pre id='var-Rsuciedad' class='code-output documenter-example-output'>74.25 kg hr^-1</pre>


<div class="markdown"><p>El tiempo que debe transcurrir para que se acumulen 740 kg en el separador será:</p>
</div>

<pre class='language-julia'><code class='language-julia'>Vsuciedad = 740u"kg"</code></pre>
<pre id='var-Vsuciedad' class='code-output documenter-example-output'>740 kg</pre>

<pre class='language-julia'><code class='language-julia'>t = Vsuciedad/Rsuciedad</code></pre>
<pre id='var-t' class='code-output documenter-example-output'>9.966329966329967 hr</pre>

<pre class='language-julia'><code class='language-julia'>cm"""
!!! Solución
    **t = $(round(typeof(t), t; digits = 1))**
"""</code></pre>
<div class="admonition is-Solución">
  <header class="admonition-header">
    Solución
  </header>

  <div class="admonition-body">
    <p><strong>t = <span class="julia-value">10.0 hr</span></strong></p>
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