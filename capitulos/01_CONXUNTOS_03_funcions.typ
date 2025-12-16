#import("/funcions/texto.typ"): *

#seccion(
    nome : "Funcións",
    ancora : "sec:conxuntos:funcions"
)

#definicion(
    nome : "Función",
    ancora : "def:conxuntos:funcion"
)[
    Sexan $A$ e $B$ dous conxuntos calquera. Unha #indice[Función] función
    $f$ de $A$ a $B$ é unha relación entre $A$ e $B$ para a cal un elemento
    de $A$ está relacionado como moito cun so elemento de $B$. É dicir,

    $
        (forall a in A) space.quad exists! b in B "tal que" a f b
    $
]

En realidade usase a notación _funcional_ e escríbese $f(a) = b$. Tamén
podemos escribir $f:A arrow.r B$ ou, máis gráficamente, $ A frecha^f B. $
Pra mostrar que o elemento $a$ pasa ao elemento $b$ a través de $f$ escribimos
$a mapsto b$ ou $a mapsto b=f(a)$.

+ Grafos e tal..?

#definicion(
    nome : "Dominio dunha función",
    ancora : "def:conxuntos:dominio"
)[
    Sexan $A$ e $B$ dous conxuntos calquera, e $f$ unha función $f:A arrow.r
    B$. O conxunto de _partida_ $A$ chámase #indice("Dominio") dominio da
    función $f$, e denótase por $"Dom"(f)$.
]

#definicion(
    nome : "Codominio dunha función",
    ancora : "def:conxuntos:codominio"
)[
    Sexan $A$ e $B$ dous conxuntos calquera, e $f$ unha función $f:A arrow.r
    B$. O conxunto de _chegada_ $B$ chámase #indice("Codominio") codominio da
    función $f$.
]

Nalgúns contextos os nomes de _codominio_ e _rango_ mestúranse, pero eu
manterei esta distinción.

#definicion(
    nome : "Imaxe",
    ancora : "def:conxuntos:imaxe"
)[
    Sexan $A$ e $B$ dous conxuntos calquera, e $f$ unha función $f:A arrow.r
    B$. O conxunto de elementos de $B$ que proveñen da actuación de $f$ en $A$
    chámase #indice("Imaxe") imaxe ou #indice("Rango") rango de $f$, e denótase
    por $f^"IM" (A)$. É dicir, o conxunto

    $
        f^"IM" (A) := { b in B | exists x in A, b = f(a)}.
    $
]

Ademáis, dicimos que $b$ é a _imaxe_ de $a$ a través da función $f$, é dicir,
$b = f(a)$. A imaxe de $A$ tamén se soe chamar $"Im"(A)$ ou $f(A)$.

#definicion(
    nome : "Preimaxe",
    ancora : "def:conxuntos:preimaxe"
)[
    Sexan $A$ e $B$ dous conxuntos calquera, $C subset.eq B$, e $f$ unha
    función $f:A arrow.r B$. O conxunto de elementos de $A$ que pasan a $C$ a
    través de $f$ chámase #indice("Preimaxe") preimaxe ou #indice("Antiimaxe")
    antiimaxe de $C$ e denótase por $f^"PRE" (C)$. É dicir, o conxunto

    $
        f^"PRE" (C) := { a in A | f(a) in C}.
    $
]

Ademais, dicimos que $a$ é a antiimaxe de $b$ a través de $f$, é dicir, $a =
f^(-1) (b)$ onde usamos $f^(-1)$ en lugar de $f^"PRE"$ ao traballar cun valor
individual en lugar de con conxuntos completos. Moitas veces a notación
$f^(-1)$ é a que se usa para as antiimaxes de conxuntos, pero a min non me
gusta.

// :FACER: mirar o de rotman
#definicion(
    nome : "Función sobrexectiva",
    ancora : "def:conxuntos:sobrexectividade"
)[
    Sexan $A$ e $B$ dous conxuntos calquera e $f: A arrow.r B$. Se todos os
    elementos de  $B$ teñen antiimaxe, entón dicimos que $f$ é
    #indice("Función")[Sobrexectiva]. É dicir,

    $
        f "sobrexectiva" \
        :sse \
        (forall b in B) space.quad exists a in A | b = f(a).
    $

    Ou, análogamente, se o codominio é igual á imaxe de $A$,

    $
        B = f^"IM" (A).
    $
]

Ás veces pode enfatizarse que unha función é sobrexectiva usando a frecha
$->>$, ousexa $f:A arrow.r.twohead B$ é sobrexectiva.

#definicion(
    nome : "Función inxectiva",
    ancora : "def:conxuntos:inxectividade"
)[
    Sexan $A$ e $B$ dous conxuntos calquera e $f: A arrow.r B$. Se as imaxes de
    dous elementos distintos de $A$ son sempre distintas, entón dicimos que a
    función $f$ é #indice("Función")[Inxectiva] inxectiva. É dicir,

    $
        f "inxectiva" \
        :sse \
        a_1 eq.not a_2 implica f(a_1) eq.not f(a_2).
    $

    Ou, equivalentemente,

    $
        f "inxectiva" \
        :sse \
        f(a_1) = f(a_2) implica a_1 = a_2.
    $

]

Pode enfatizarse que unha función é inxectiva usando a frecha $arrow.r.hook$,
ousexa función $f:A arrow.r.hook B$ é inxectiva.

#definicion(
    nome : "Función bixectiva",
    ancora : "def:conxuntos:bixectividade"
)[
    Unha función $f$ que é inxectiva e sobrexectiva simultaneamente dise que é
    #indice("Función")[Bixectiva] bixectiva.
]

#definicion(
    nome : "Función identidade",
    ancora : "def:conxuntos:identidade"
)[
    Sexa $A$ un conxunto calquera e $f: A arrow.r A$. Se a imaxe de calquera
    elemento é o propio elemento entón dicimos que $f$ á a aplicación
    identidade, e denotámola por $id$. É dicir,

    $
        id: &A frecha A \
            &a mapea id(a) = a.
    $
]

#definicion(
    nome : "Composición de funcións",
    ancora : "def:conxuntos:composicion"
)[
    Sexan $A,B,C$ conxuntos calquera e as funcións $f:A arrow.r B$ e $f:B
    arrow.r C$. A función $h$ que cumple que

    $
        (forall a in A) space.quad h(a) = g(f(a))
    $

    chámase #indice("Función")[Composta] composición de $f$ e $g$, e polo xeral
    denótase por $g compose f$ #nota[Léase como "gee of eff"]
]
