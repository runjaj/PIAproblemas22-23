~~~
<!-- PlutoStaticHTML.Begin -->
<!--
    # This information is used for caching.
    [PlutoStaticHTML.State]
    input_sha = "69333f3224fde0c334a0f4269342b14a9049d6934f6fcbcb95cc348668d20a9c"
    julia_version = "1.8.0"
-->

<div class="markdown"><h3>2. Preparación de materia prima</h3>
<h4>Problema 4</h4>
<p>En una instalación de producción de aceite de oliva se utiliza una centrífuga para purificar el aceite. Una corriente de agua &#40;w&#41; y aceite &#40;o&#41; de 600 l/h con una composición de un 70 &#37; &#40;v/v&#41; de agua alimenta una centrífuga de la que se obtiene una corriente de aceite y una corriente de agua con un 2&#37; &#40;v/v&#41; de aceite. Calcular la efectividad de la separación.</p>
<p>Datos: Densidad del agua &#61; 1000 kg/m³. Densidad del aceite &#61; 900 kg/m³</p>
<h4>Solución</h4>
<p>Los datos del problema son:</p>
</div>

<pre class='language-julia'><code class='language-julia'>Qf = 600u"l/hr"</code></pre>
<pre id='var-Qf' class='code-output documenter-example-output'>600 L hr^-1</pre>





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