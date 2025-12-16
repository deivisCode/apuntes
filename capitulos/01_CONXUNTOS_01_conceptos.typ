#import("/funcions/texto.typ"): *
#import("/funcions/simbolos.typ"): *

#seccion(
    nome : "Conceptos básicos",
    ancora : "sec:conxuntos:conceptos"
)

#definicion(
    nome : "Conxunto",
    ancora : "def:conxuntos:conxunto"
)[
    // :FACER: axiomas
    Un #indice[Conxunto] conxunto é unha colección arbitraria de obxetos (que
    chamaremos _elementos_) que cumplen unha serie de axiomas (que agora mesmo
    non necesitamos mencionar). Ademáis, #nota[Seguramente debería explicar
    esto mellor... pero polo de agora a idea intuitiva é dabondo]

    + Debe existir un criterio claro para determinar se un elemento pertence ou
      no a dito conxunto.
    + Un obxecto non pode ser un conxunto e un elemento do mesmo conxunto.
    + A colección de todos os conxuntos non é un conxunto.
]

En xeral nomeamos un conxunto cunha letra maiúscula e seus elementos ca mesma
letra en minúscula. Dado o conxunto $A$, se un elemento $a$ pertence a $A$
escribimos $a in A$, e $a in.not A$ no caso contrario.

Os conxuntos poden definirse _por extensión_, nomeando todos os elementos que
contén dentro parénteses recurvos (ou chaves),

$
    A = {a_1, a_2, a_3, ...};
$

ou _por comprensión_, se dicimos que propiedades deben ter os seus
elementos,

$
    A = { a_i in U | P_U},
$

o cal significa que os elementos de $A$ son elementos de $U$ que cumpren o
predicado #nota[Un predicado é unha propiedade dun conxunto calquera $U$ que
pode volverse verdadeira ou falsa dependendo do valor concreto $u in U$.]
$P_U$. En calquera caso, usamos parénteses recurvos pra indicar que estamos a
construír un conxunto.

#definicion(
    nome : "Conxunto baleiro",
    ancora : "def:conxuntos:baleiro"
)[
    Ao conxunto que non contén elementos chámaselle
    #indice("Conxunto")[Baleiro] conxunto baleiro e denótase por $emptyset$.
]

O conxunto baleiro pode definirse por extensión como $emptyset := {}$ e por
comprensión usando un predicado que sempre é falso, por exemplo $emptyset := {x
in RR | 0x = 7}$.

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

#definicion(
    nome : "Conxunto complementario",
    ancora : "def:conxuntos:complementario"
)[
    Sexa $A$ un conxunto e $B subset.eq A$. O conxunto complementario,
    $macron(B)$ de $B$ en $A$ son os elementos de $A$ que non están en $B$, é
    dicir,

    $
        macron(B) = {x in A | x in.not B}
    $
]

Ás veces ao conxunto complementario tamén se lle denota por $B^c$.

// :FACER: distributibas Union e Inter
#definicion(
    nome : "Unión de conxuntos",
    ancora : "def:conxuntos:union",
)[
    Sexan $A$ e $B$ dous conxuntos calquera. O #indice("Conxunto")[Unión]
    conxunto unión de $A$ e $B$, denotado por $A union B$, é o conxunto formado
    por todos os elemetos de $A$ e de $B$. É dicir,

    $
        A union B := { x | x in A "ou" x in B}.
    $
]

#definicion(
    nome : "Intersección de conxuntos",
    ancora : "def:conxuntos:inerseccion",
)[
    Sexan $A$ e $B$ dous conxuntos calquera. O
    #indice("Conxunto")[Intersección] conxunto intersección de $A$ e $B$,
    denotado por $A inter B$, é o conxunto formado por todos os elementos
    comúns entre $A$ e $B$. É dicir,

    $
        A inter B := { x | x in A "e" x in B}.
    $
]

#definicion(
    nome : "Diferenza de conxuntos",
    ancora : "def:conxuntos:diferenza"
)[
    Sexan $A$ e $B$ dous conxuntos calquera. O
    #indice("Conxunto")[Diferenza] conxunto diferenza de $A$ menos $B$,
    denotado por $A - B$, é o conxunto formado por todos os elementos
    comúns entre $A$ que non están en $B$. É dicir,

    $
        A - B := {x in A | x in.not B}.
    $
]

Ás veces, o conxunto diferenza tamén se indica como $A\\B$.

+ Union, interseccion arbitrarias
+ Cartesiano
+ Cuantificadores
