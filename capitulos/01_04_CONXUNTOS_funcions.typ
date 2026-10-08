#import("/funcions/texto.typ"): *
#import("/funcions/simbolos.typ"): *

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

#notacion[
    En realidade usase a notación _funcional_ e escríbese $f(a) = b$. Tamén
    podemos escribir $f:A arrow.r B$ ou, máis gráficamente, $ A frecha^f B. $
    Para mostrar que o elemento $a$ pasa ao elemento $b$ a través de $f$
    escribimos $a mapsto b$ ou $a mapsto b=f(a)$.
]

// :FACER: Grafos e tal..?

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

#notacion[
    _Rango_ é un sinónimo para codominio.
]

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

#notacion[
    Ademáis, dicimos que $b$ é a _imaxe_ de $a$ a través da función $f$, é
    dicir, $b = f(a)$. A imaxe de $A$ tamén se soe chamar $"Im"(A)$ ou $f(A)$,
    que é a notación estándar.
]

Nalgúns contextos os nomes de _codominio_ e _imaxe_  mestúranse, pero eu
manterei esta distinción. Codominio (ou rango) é o conxunto _xeral_ ao que
pasan os elementos do dominio, e a Imaxe da función é o resultado de aplicar
$f$ ao dominio. Polo xeral, $f^"IM"(A) subset.eq "Codominio"$.

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

#notacion[
    Ademais, dicimos que $a$ é a antiimaxe de $b$ a través de $f$, é dicir, $a
    = f^(-1) (b)$ onde usamos $f^(-1)$ en lugar de $f^"PRE"$ ao traballar cun
    valor individual en lugar de con conxuntos completos. Moitas veces a
    notación $f^(-1)$ é a que se usa para as antiimaxes de conxuntos, pero a
    min non me gusta.
]

#definicion(
    nome : "Función sobrexectiva",
    ancora : "def:conxuntos:sobrexectividade"
)[
    Sexan $A$ e $B$ dous conxuntos calquera e $f: A arrow.r B$. Se todos os
    elementos de  $B$ teñen antiimaxe, entón dicimos que $f$ é
    #indice("Función")[Sobrexectiva] sobrexectiva. É dicir,

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

#notacion[
    Ás veces pode enfatizarse que unha función é sobrexectiva usando a frecha
    $->>$, ousexa $f:A arrow.r.twohead B$ é sobrexectiva.
]

A noción de sobrexectividade é algo confusa (polo menos para min). Por exemplo, por que a función
$f:RR->RR$ dada por

$
    f(x) = cases(
        1 "se" x < 1,
        2 "se" x >= 1
    )
$

non é sobrexectiva? Evidentemente, a imaxe de $f$ é simplemente o conxunto
${1,2}$, entón por qué molestarse sequera en definir $f:RR->RR$ (que non é
sobrexectiva) en lugar de $f:RR->>{1,2}$ (que si o é)? Sin embargo,
ao falar do conxunto de partida a notación é máis estricta, e sempre
usamos o espazo exacto. Non se escribe $f:RR->RR$ se a función se define como
$f(x)=sqrt(x)$ xa que só valen $x>=0$, en cambio escribimos o espazo de partida
(dominio) sempre $RR^+$. Resumo, se $f:A->B$, entón $A$ soe ser o espazo exacto
pero $B$ non. Este é un pequeno detalle notacional que ás veces é
confuso (para min foino). En xeral resulta simple saber o conxunto de partida
pero non tanto o conxunto de valores de chegada (a imaxe). Por exemplo, na
función $f:RR arrow.r RR^2$ definida por

$
    f(t) = (a exp(b t) cos(t),a exp(b t) sin(t) ) \
    a > 0, b<0
$

temos claro o dominio pero o mellor que podemos dicir da imaxe é que debe
pertencer a $RR^2$. Coñecer exactamente a imaxe é un exercicio en si mesmo
#nota[Neste caso a imaxe chámase _traza_, e é unha espiral.], polo que en xeral
somos flexibles e non hai que _atinar_ co espazo de chegada.

Inda así, nalgúns textos podemos atoparnos con expresións coma

$
    f: X subset A frecha Y subset B,
$

para deixar claro _de onde a onde vai a función_, concretamente vai de $X$ a
$Y$, e temos o contexto adicional de $A$ e $B$.

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

#notacion[
    Pode enfatizarse que unha función é inxectiva usando a frecha
    $arrow.r.hook$, ousexa función $f:A arrow.r.hook B$ é inxectiva.
]

#definicion(
    nome : "Función bixectiva",
    ancora : "def:conxuntos:bixectividade"
)[
    Unha función $f$ que é inxectiva e sobrexectiva simultaneamente dise que é
    #indice("Función")[Bixectiva] bixectiva.
]

As definicións de sobrexectividade, inxectividade e bixectividade soen
presentarse sempre xuntas (como neste caso), e é típico memorizar que bixectividade
é a suma dasprimeiras. Isto é correcto, pero non ven nada motivado. Como comentara antes
logo da definición @def:conxuntos:sobrexectividade o concepto de
sobrexectividade é unha comodidade notacional xa que é complexo saber
exactamente cal é a imaxe de certa función. Pero sempre podemos facer unha
función sobrexectiva limitando o codomino á imaxe de $f$, e xa estaría. A
inxectividade, en cambio, é algo máis delicada. Pode verse que a definción de
inxectividade @def:conxuntos:inxectividade non é simplemente un apaño
notacional, é algo totalmente distinto a unha función sobrexectiva.

Recordemos que unha función é unha relación que a cada elemento do espazo de
partida lle asigna un, e só un, elemento do espazo de chegada. Por outro lado,
dita función é inxectiva se os elementos do espazo de partida se asocian a
elementos diferentes no de chegada. É dicir, a función é _un a un_
(no sentido intuitivo de relacionar cousas unha a unha),
ou o que é o mesmo, por cada elemento do espazo de partida hai un único no outro. A
sobrexectividade é necesaria por se escribimos un espazo de chegada máis grande
do que debería, para asegurarnos de que non quedan elementos sen preimaxe. Pero
a idea relevante está na propia definición de función e de inxectividade.

Máis adiante, no capítulo @cap:alxebra e concretamente no teorema
@teo:alxebra:isomorfismos-primeiro veremos que sempre que coñezamos unha función de
certo tipo (un homomorfismo de grupos) que non é bixectiva, temos garantizado
que existe outra que si o é, e a idea resúmese en acotar o espazo de chegada á
imaxe para ter sobrexectividade e en _eliminar_ os elementos do dominio que se
van ao mesmo valor para ter inxectividade. A primeira propiedade é inmediata,
e para a segunda veremos que fan falla multitude de conceptos e pasos a maiores.

Unhas últimas definicións.

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
    Sexan $A,B,C$ conxuntos calquera e as funcións $f:A arrow.r B$ e $g:B
    arrow.r C$. A función $h$ que cumple que

    $
        (forall a in A) space.quad h(a) = g(f(a))
    $

    chámase #indice("Función")[Composta] composición de $f$ e $g$, e polo xeral
    denótase por $g compose f$. #nota[Léase como "gee of eff"]
]

#notacion[
    Cando se ten unha composición de funcións como nesta definición, tamén pode
    simplificarse o diagrama escribindo
    $
        A frecha^f B frecha^g C.
    $
]

#definicion(
    nome : "Función Inversa",
    ancora : "def:conxuntos:inversa"
)[
    Sexan $A,B$ conxuntos calquera e $f:A->B$. Unha función $g:B->A$ que cumpre
    $
        g compose f = id_A \
        f compose g = id_B
    $
    dicimos que é a función inversa de $f$, e en xeral escríbese como $f^(-1)$.
]

Ollo, $id_A$ é a identidade $id_A:A->A$ e $id_B$ é a identidade $id_B:B->B$. A
función inversa de $f$, entón, pode compoñerse con $f$ para dar a identidade.

// :FACER: demostración
#teorema(
    nome : "A función inversa é única",
    ancora : "teo:conxuntos:inversa-unica"
)[
    Se a función $f$ ten inversa, $f^(-1)$, entón esta é única.
]

// :FACER: demostración
#teorema(
    nome : "Bixectividade é o mesmo que ter inversa",
    ancora : "teo:conxuntos:bixectividade-invesas"
)[
    $f$ é bixectiva $sse$ $f$ ten inversa.
]

// :FACER: proxección canónica f: A-> B, f_1:A/~ -> im(B)
