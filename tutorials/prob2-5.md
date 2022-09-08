~~~
<!-- PlutoStaticHTML.Begin -->
<!--
    # This information is used for caching.
    [PlutoStaticHTML.State]
    input_sha = "42e23abef0e0c623cac957616df850481c64a2f9d3b489151ced60c021317306"
    julia_version = "1.8.0"
-->

<div class="markdown"><h3>2. Preparación de materia prima</h3>
<h4>Problema 5</h4>
<p>Calcular la efectividad de la separación considerando que la centrífuga se alimenta con 100 kg hr^-1 de una mezcla con un 15 &#37; de agua. Las corrientes de salida tienen una composición de un 99 &#37; de aceite y de agua, respectivamente. Todas las composiciones son en peso.</p>
<h4>Solución</h4>
<p>Los datos del problema son:</p>
</div>

<pre class='language-julia'><code class='language-julia'>F = 100u"kg/hr"</code></pre>
<pre id='var-F' class='code-output documenter-example-output'>100 kg hr^-1</pre>

<pre class='language-julia'><code class='language-julia'>xF_agua = 0.15</code></pre>
<pre id='var-xF_agua' class='code-output documenter-example-output'>0.15</pre>

<pre class='language-julia'><code class='language-julia'>xP = 0.99</code></pre>
<pre id='var-xP' class='code-output documenter-example-output'>0.99</pre>

<pre class='language-julia'><code class='language-julia'>xR_agua = 0.99</code></pre>
<pre id='var-xR_agua' class='code-output documenter-example-output'>0.99</pre>


<div class="markdown"><p>Lo que significa que las composiones de las corrientes de alimentación y de salida de agua de la centrífuga tendrán estas fracciones másicas:</p>
</div>

<pre class='language-julia'><code class='language-julia'>xF = 1 - xF_agua</code></pre>
<pre id='var-xF' class='code-output documenter-example-output'>0.85</pre>

<pre class='language-julia'><code class='language-julia'>xR = 1 - xR_agua</code></pre>
<pre id='var-xR' class='code-output documenter-example-output'>0.010000000000000009</pre>


<div class="markdown"><p>Para encontrar los caudales másicos <em>P</em> y <em>R</em> planteamos los balances de materia total y de aceite:</p>
<p class="tex">$$\begin&#123;align&#125;
	F &amp;&#61; P &#43; R\\
	F x_F &amp;&#61; P x_P &#43; R x_R
\end&#123;align&#125;$$</p>
<p>Sustituyendo y despejando se encuentra:</p>
</div>

<pre class='language-julia'><code class='language-julia'>R = F*(xF - xP)/(xR - xP)</code></pre>
<pre id='var-R' class='code-output documenter-example-output'>14.285714285714288 kg hr^-1</pre>

<pre class='language-julia'><code class='language-julia'>P = F - R</code></pre>
<pre id='var-P' class='code-output documenter-example-output'>85.71428571428571 kg hr^-1</pre>


<div class="markdown"><p>Ya solo queda calcular la eficiencia:</p>
</div>

<pre class='language-julia'><code class='language-julia'>Eficiencia = P*xP/(F*xF) * R*(1-xR)/(F*(1-xF))</code></pre>
<pre id='var-Eficiencia' class='code-output documenter-example-output'>0.9412725090036014</pre>

<pre class='language-julia'><code class='language-julia'>cm"""
!!! Solución
    **Eficiencia = $(round(Eficiencia; digits=3))**
"""</code></pre>
<div class="admonition is-Solución">
  <header class="admonition-header">
    Solución
  </header>

  <div class="admonition-body">
    <p><strong>Eficiencia = <span class="julia-value">0.941</span></strong></p>
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