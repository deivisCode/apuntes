#import("/funcions.typ"): *

#seccion(
    nome : "Conceptos básicos",
    ancora : "sec:conxuntos:conceptos"
)

#definicion(
    nome : "Conxunto",
    ancora : "def:conxuntos:conxunto"
)[
    // :FACER: axiomas
    Un #indice[Conxunto] conxunto é unha colección de elementos.
]

En xeral nomeamos un conxunto cunha letra maiúscula e seus elementos ca mesma
letra en minúscula. Dado o conxunto $A$, dicimos que un elemento $a$ pertence a
$A$ escribindo $a in A$.
// :FACER: parénteses?

Os conxuntos poden definirse _por extensión_, nomeando todos os elementos que
contén,

$
    A = {a_1, a_2, a_3, ...};
$

ou _por comprensión_, se dicimos que propiedades deben ter os seus
elementos,

$
    A = { a_i in U | P_U},
$

o cal significa que os elementos de $A$ son elementos de $U$ que cumpren o
predicado $P_U$. En calquera caso, usamos parénteses recurvos pra indicar que
estamos a construír un conxunto.

#definicion(
    nome : "Conxuntos iguais",
    ancora : "def:conxuntos:conxuntos-iguais"
)[
    Dicimos que os conxuntos $A,B$ son iguais, $A=B$, se conteñen exactamente
    os mesmos elementos. É dicir,

    // :FACER: explicar implicas, sse, etc.
    // :FACER: simbolo :sse
    $
        A = B :sse ( x in A sse x in B ).
    $
]

#definicion(
    nome : "Subconxunto",
    ancora : "def:conxuntos:subconxunto"
)[
    Sexa $A$ un conxunto calquera. Dicimos que $B$ é un #indice[Subconxunto]
    subconxunto de $A$, e escribimos $B subset.eq A$ se calquera elemento de
    $B$ tamén é un elemento de $A$. É dicir,

    $
        B subset.eq A sse (x in B implica x in A)
    $
]

O símbolo $subset.eq$ indica que $B$ é un subconxunto, ou pode ser un conxunto
igual. Se descartamos a posibilidade de que $A=B$ entón dicimos que $B$ é un
subconxunto propio de $A$, e escribimos $B subset.neq A$ ou simplemente $B
subset A$. Por comodidade ás veces úsase $subset$ para ambos casos.

#teorema(
    nome : "Conxuntos iguais contéñense mutuamente",
    ancora : "teo:conxuntos:conxuntos-iguais"
)[
    Dous conxuntos $A,B$ son iguais se $A subset.eq B$ e $B subset.eq A$.
]

Este teorema é o método típico para probar que dous conxuntos son iguais.

#definicion(
    nome : "Conxunto potencia",
    ancora : "def:conxuntos:conxunto-potencia"
)[
    Sexa $A$ un conxunto calquera. O conxunto de todos os subconxuntos de $A$
    chámase #indice("Conxunto")[Potencia] conxunto potencia de $A$, e denótase
    por $scr(P)(A)$. É dicir, o conxunto

    $
        scr(P)(A) := {B | B subset.eq A}.
    $
]

+ union, intersección, distributivas, diferenza
+ Union, interseccion arbitrarias
+ Cartesiano
+ Cuantificadores
