~~~
<!-- PlutoStaticHTML.Begin -->
<!--
    # This information is used for caching.
    [PlutoStaticHTML.State]
    input_sha = "37dbf51fdc3a508dcadc5ba28a1413490d0f40be6808e1eaec03fd2dcdfa4bb2"
    julia_version = "1.8.0"
-->

<div class="markdown"><h3>2. Preparación de materia prima</h3>
<h4>Problema 3</h4>
<p>Un clasificador óptico separa galletas rotas a la salida de un horno continuo. La alimentación al clasificador &#40;<em>F</em>&#41; es de 1200, con un 5 &#37; de las galletas rotas. Sabiendo que la eficiencia del separador es de un 91.4 &#37; y que el caudal del desperdicio es de 80. ¿Cuál es la composición de corriente de producto y de residuo?</p>
<h5>Solución</h5>
<p>Los datos del problema son:</p>
</div>

<pre class='language-julia'><code class='language-julia'>Efectividad = 0.914</code></pre>
<pre id='var-Efectividad' class='code-output documenter-example-output'>0.914</pre>

<pre class='language-julia'><code class='language-julia'>F = 1200 #u"kg/hr"</code></pre>
<pre id='var-F' class='code-output documenter-example-output'>1200</pre>

<pre class='language-julia'><code class='language-julia'>xF_rotas = 0.05</code></pre>
<pre id='var-xF_rotas' class='code-output documenter-example-output'>0.05</pre>

<pre class='language-julia'><code class='language-julia'>R = 80 #u"kg/hr"</code></pre>
<pre id='var-R' class='code-output documenter-example-output'>80</pre>


<div class="markdown"><p>La fracción másica de galletas enteras de la alimentación es:</p>
</div>

<pre class='language-julia'><code class='language-julia'>xF = 1 - xF_rotas</code></pre>
<pre id='var-xF' class='code-output documenter-example-output'>0.95</pre>


<div class="markdown"><p>Realizando el balance de materia podemos encontrar el caudal másico de producto:</p>
</div>

<pre class='language-julia'><code class='language-julia'>P = F - R</code></pre>
<pre id='var-P' class='code-output documenter-example-output'>1120</pre>


<div class="markdown"><p>Realizamos el balance de materia de galletas enteras:</p>
<p class="tex">$$F x_F &#61; P x_P &#43; R x_R$$</p>
<p>para poder encontrar la fracción másica de la corriente de resíduo:</p>
<p class="tex">$$x_F &#61; \frac&#123;P x_P &#43; R x_R&#125;&#123;F&#125;$$</p>
<p>Considerando la definición de efectividad:</p>
<p class="tex">$$\mathrm&#123;Efectividad&#125; &#61; \frac&#123;P x_P&#125;&#123;F x_F&#125; \frac&#123;R &#40;1-x_R&#41;&#125;&#123;F&#40;1-x_F&#41;&#125;$$</p>
<p>encontramos que tenemos un sistema de dos ecuaciones con dos incógnitas, <span class="tex">$x_P$</span> y <span class="tex">$x_R$</span>.</p>
<p>Resolvemos el sistema de ecuaciones:</p>
</div>

<pre class='language-julia'><code class='language-julia'>function g!(G, x)
    xP = x[1]
    xR = x[2]
    G[1] = F-(P*xP+R*xR)/xF
    G[2] = Efectividad-P*xP/(F*xF)*R*(1-xR)/(F*(1-xF))
end</code></pre>
<pre id='var-g!' class='code-output documenter-example-output'>g! (generic function with 1 method)</pre>

<pre class='language-julia'><code class='language-julia'>sol = nlsolve(g!, [0.5, 0.5])</code></pre>
<pre id='var-sol' class='code-output documenter-example-output'>Results of Nonlinear Solver Algorithm
 * Algorithm: Trust-region with dogleg and autoscaling
 * Starting Point: [0.5, 0.5]
 * Zero: [0.9964450269021162, 0.2997696233704036]
 * Inf-norm of residuals: 0.000000
 * Iterations: 3
 * Convergence: true
   * |x - x'| < 0.0e+00: false
   * |f(x)| < 1.0e-08: true
 * Function Calls (f): 4
 * Jacobian Calls (df/dx): 4</pre>

<pre class='language-julia'><code class='language-julia'>cm"""
Se obtienen dos soluciones al resolver el sistema de ecuaciones, pero solo la segunda tiene sentido físico. La primera tiene una fracción másica negativa y la otra con una valor superior a la unidad, ninguna de las dos fracciones tiene sentido. Como consecuencia, elegimos la segunda de las soluciones:

!!! Solución
    ``x_P`` = $(round(sol.zero[1]; digits=3))

    ``x_R`` = $(round(sol.zero[2]; digits=3))
"""</code></pre>
<p>Se obtienen dos soluciones al resolver el sistema de ecuaciones, pero solo la segunda tiene sentido físico. La primera tiene una fracción másica negativa y la otra con una valor superior a la unidad, ninguna de las dos fracciones tiene sentido. Como consecuencia, elegimos la segunda de las soluciones:</p>
<div class="admonition is-Solución">
  <header class="admonition-header">
    Solución
  </header>

  <div class="admonition-body">
    <p><span class="math tex">\(x_P\)</span> = <span class="julia-value">0.996</span></p>
  </div>
<p><span class="math tex">\(x_R\)</span> = <span class="julia-value">0.3</span></p>
</div>


<div class="markdown"><hr />
</div>

<pre class='language-julia'><code class='language-julia'>using CommonMark, NLsolve</code></pre>

<div class='manifest-versions'>
<p>Built with Julia 1.8.0 and</p>
CommonMark 0.8.3<br>
NLsolve 4.5.1
</div>

<!-- PlutoStaticHTML.End -->
~~~