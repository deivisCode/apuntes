#import("/funcions/texto.typ"): *
#import("/funcions/simbolos.typ"): *

#seccion(
    nome : "Conceptos básicos",
    ancora : "sec:conxuntos:conceptos"
)

Evidentemente comezamos ca definición de conxunto. En realidade este é un punto
delicado, faría falla entrar máis no tema da lóxica para xustificar ben esta
sección, concretamente a definición @def:conxuntos:conxunto, pero agora mesmo
non o vexo necesario.

#definicion(
    nome : "Conxunto",
    ancora : "def:conxuntos:conxunto"
)[
    // :FACER: axiomas
    Un #indice[Conxunto] conxunto é unha colección arbitraria de obxectos (que
    chamaremos _elementos_) que cumpren unha serie de axiomas (que agora mesmo
    non necesitamos mencionar). Ademais, #nota[Seguramente debería explicar
    isto mellor... pero polo de agora a idea intuitiva é dabondo]

    + Debe existir un criterio claro para determinar se un elemento pertence ou
      no a dito conxunto.
    + Un obxecto non pode ser un conxunto e un elemento do mesmo conxunto.
    + A colección de todos os conxuntos non é un conxunto.
]

*Notación*: En xeral nomeamos un conxunto cunha letra maiúscula e seus
elementos ca mesma letra en minúscula. Dado o conxunto $A$, se un elemento $a$
pertence a $A$ escribimos $a in A$, e $a in.not A$ no caso contrario.

*Vocabulario*: Os conxuntos poden definirse _por extensión_, nomeando todos os
elementos que contén dentro parénteses recurvos (ou chaves),

$
    A = {a_1, a_2, a_3, ...};
$

ou _por comprensión_, se dicimos que propiedades deben ter os seus
elementos,

$
    A = { a_i in U | P_U},
$

que se lee #quote[os elementos $a_i$ de $U$ tales que o predicado $P_U$ é
certo]. #nota[Un predicado é unha propiedade dun conxunto calquera $U$ que pode
volverse verdadeira ou falsa dependendo do valor concreto $u in U$.] Un exemplo
de conxunto por extensión é o conxunto de dous elementos $A = {1, 2}$ ou o
conxunto de números enteiros $ZZ = {dots, -1, 0, 1, 2, dots}$ onde a pesar de
ter infinitos elementos podemos usar unha elipsis (os puntos $dots$) se se
sobreentende o que se quere dicir. Un exemplo de conxunto por compresión son os
números racionais $QQ = { a/b | a,b in ZZ}$. En calquera caso, usamos
parénteses recurvos pra indicar que estamos a construír un conxunto.

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

*Notación*: O símbolo $subset.eq$ indica que $B$ é un subconxunto de $A$, igual
ou non a $A$. Se descartamos a posibilidade de que $A=B$ entón dicimos que $B$
é un subconxunto propio de $A$, e escribimos $B subset.neq A$ ou simplemente $B
subset A$. Por comodidade ás veces úsase $subset$ para ambos casos.

#teorema(
    nome : "Conxuntos iguais contéñense mutuamente",
    ancora : "teo:conxuntos:conxuntos-iguais"
)[
    Dous conxuntos $A,B$ son iguais se $A subset.eq B$ e $B subset.eq A$.
]

#demostracion(
    ancora : "teo:conxuntos:conxuntos-iguais"
)[
    $
        A=B arrow.r.l.double &(forall x in A) space.quad x in B, \
                             &(forall x in B) space.quad x in A, \

            arrow.r.l.double &A subset.eq B \
                             &B subset.eq A \

    $
]

Este teorema é o método típico para probar que dous conxuntos son iguais,
comprobando se se conteñen mutuamente, é dicir, se un certo elemento $x$
pertence a un deles tamén o fai no outro, e viceversa.

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

O conxunto potencia non é máis que todos os subconxuntos posibles. Este
constructo aparece a miúdo en topoloxía onde se van construir conxuntos
concretos apartires del e tamén como exemplo de topoloxías concretas, por
exemplo a topoloxía _discreta_.

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

Ás veces, o conxunto diferenza tamén se indica como $A\\B$, inda que me parece
algo confuso logo cando aparecen os conceptos de _cocientes_ de conxuntos,
grupos, ... que tamén se denotan deste modo.

// :FACER: Union, interseccion arbitrarias
// :FACER: Cartesiano
// :FACER: Cuantificadores
