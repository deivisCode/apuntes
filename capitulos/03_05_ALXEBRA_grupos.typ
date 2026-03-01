#import("/funcions/texto.typ"): *
#import("/funcions/simbolos.typ"): *

// Meter GRUPOS nalgures:
// - Todo o que non metín no capítulo de álxebra.
// - Grupos cíclicos
// - Orde de elementos
// - Lagrange
// - Cayley
// A maiores:
// Onde meto
// - Simples
// - Libres
// - Orde P
// - Divisores, etc

#seccion(
    nome : "Grupos",
    ancora : "sec:alxebra:grupos"
)

Engadimos asociatividade, e logo o neutro. Non é nada raro o que imos engadir
agora.

#definicion(
    nome : "Grupo",
    ancora : "def:alxebra:grupo"
)[
    Unha parella $(A,*)$ onde $A$ é un conxunto arbitrario e
    $*$ é unha operación binaria, interna e asociativa, máis existe
    un elemento neutro $e in A$ e todos os elementos de $A$ teñen inverso
    $a^(-1)$, dise que é un grupo#indice[grupo]. É dicir, un monoide, pero
    todos os elementos son invertibles.
]

Intuitivamente, os grupos son estruturas nas que podes sumar e restar, _ou_
multiplicar e dividir.

#notacion[
    Podemos referirnos simplemente ao grupo como $A$.

    Se a operación é conmutativa, diremos que o grupo é conmutativo, ou
    _abeliano_. #cita("rotman_2000")
    #nota[
        Supoño que as estruturas anteriores tamén se poden chamar _abelianas_
        en lugar de conmutativas, pero eu personalmente non o suelo ver.
    ]
]

#exemplos[
    + Sexa o conxunto ${0,1}$ e a operación $plus.o$ dada pola porta lóxica
      #mono[XOR]. Esta é unha operación lóxica que devolve 1 se, es so se, _un
      so_ dos argumentos é 1. Entón, dito conxunto ca operación $plus.o$ é un
      grupo. O neutro é 0, xa que $0 plus.o 1 = 1$, $1 plus.o 0 = 1$, $0 plus.o
      0 = 0$ e o inverso de cada elemento é el mismo, $0 plus.o 0 = 0$ e $1
      plus.o 1 = 0$

    + Sexa $M_(2 times 2)$ o conxunto de matrices cadradas de tamaño $2 times
      2$ da forma

      $ mat(a,a;a,a;) $ #label("ec:alxebra:matriz_aaaa")

      con $a in RR$. A operación é o produto usual de matrices, que é asociativo.
      Multiplicar calquera parella de matrices $M,M'$ desta forma danos outra que
      pertence ao noso conxunto. Ademáis, o neutro do produto para a matriz
      @ec:alxebra:matriz_aaaa é a matriz

      $ mat(1/(2a), 1/(2a);1/(2a), 1/(2a); ) $

      e o elemento inverso é

      $ mat(1/(4a), 1/(4a);1/(4a), 1/(4a); ). $

    + Sexa $X$ un conxunto calquera e $scr(P)(X)$ o conxunto de todos os
      subconxuntos de $X$. Sexa tamén operación $+$ chamada _diferenza
      simétrica_ de dous subconxuntos $A,B in scr(P)(X)$ dada por $A + B =
      (A-B) union (B-A)$. A parella $(scr(P)(X), +)$ é un grupo. A identidade
      $A in scr(P)(X)$ é $emptyset$ e o inverso de $A$ é $A$.
      #cita("rotman_2000")

    + O conxunto de todas as matrices cadradas, invertibles de tamaño $n times
      n$ e con coeficientes en $RR$ é un grupo ca operación usual de
      multiplicación matricial. A multiplicación de matrices é unha operación
      interna e asociativa. O neutro é a matriz identidade $bb(1) = mat(1, 0;
      0, 1)$. O inverso existe (as matrices inversas dadas pola fórmula usual).
      Este grupo adoita chamarse _Grupo Xeral Lineal_ e denótase por $"GL"(n,
      RR)$. #nota[Veremos que outros moitos grupos de interese son subconxuntos
      deste.]

]

// :FACER: grupo afín?

A diferenza dos monoides, agora temos noción de _elemento inverso_, polo que
aparece unha propiedade importante, a *cancelación*. [Lema
2.18]#cita("rotman_2000") Por un lado
// :FACER: propiedade de cancelación nun teorema?

$
    (forall a,b,c in A) space.quad a * b = a * c implica b = c
$

xa que podemos multiplicar na esquerda por $a^(-1)$. O caso $b * a = c * a$ é
idéntico. Ademáis, para $a,b in A$ dados, a ecuación en $x$

$
    a * x = b
$

ten solución única sempre, dado que podemos multiplicar pola esquerda polo
inverso (único) de $a$, $a^(-1)$ obtendo $x = a^(-1) * b$

Como fixemos cos magmas, semigrupos e monoides, podemos definir unha
subestrutura.

#definicion(
    nome : "Subgrupo",
    ancora : "def:alxebra:subgrupo"
)[
    Sexa $(A,*)$ un grupo con neutro $e$, e $B subset A$. Entón, $(B,*)$ é un
    subgrupo de $(A,*)$ se
    $
        (forall b_1, b_2 in B) space.quad b_1 * b_2 in B \
        e in B \
        (forall b in B) space.quad b^(-1) in B.
    $
]

#notacion[
    Cando $B$ é un subgrupo de $A$ podemos escribir simplemente que $B subgrupo
    A$.
]

Outra vez, esta definición é análoga á @def:alxebra:subsemigrupo e
@def:alxebra:submonoide. Agora nosa estrutura é algo máis rica e podemos falar
de elementos inversos, polo que tamén é algo que pedimos na subestructura.

A definición @def:alxebra:subgrupo require probar 3 propiedades, pero podemos
reducilo a unha sola co seguinte teorema.

#teorema(
    nome: "Test de Subgrupo",
    ancora : "teo:alxebra:test_subgrupo"
)[
    Sexa $(A,*)$ un grupo con neutro $e$, e $B subset A$. Entón

    $
        B subgrupo A sse (forall b_1,b_2 in B) space.quad b_1*b_2^(-1) in B.
    $
]

#notacion[
    En notación aditiva a condición sería $b_1 - b_2 in B$, é dicir, que un
    elemento de $B$ calqueira, polo inverso doutro, está en $B$.
]

Pode verse unha demostración na proposición 4.14 de #cita("delgado_2010"). O
relevante do teorema @teo:alxebra:test_subgrupo é que nos permite probar se
algo é un subgrupo cun so paso, en lugar de 3 distintos.

#notacion[
    Podemos falar do produto de subconxuntos dun certo grupo. Sexa $G$ un
    grupo, $scr(P)(G)$ o conxunto de todos os subconxuntos de $G$, e $A,B in
    scr(P)(G)$. Entón denotamos por $A B$ ao conxunto dado pola operación (en
    notación multiplicativa)

    $
        A B := {a b | a in A, b in B}
    $

    Un caso concreto deste produto de subconxuntos é cando un dos conxuntos ten
    un so elemento, ousexa ${a}B$ ou $A{b}$. Neste caso, simplificamos a
    notación a $a B$ e $A b$.
]

// :FACER: Onde empezo a simplificar (A, +) por A ?
// :FACER: nalgún sitio lin unha boa motivación de esquerda <-> dereita
#definicion(
    nome : "Clase lateral",
    ancora : "def:alxebra:clase-lateral"
)[
    Sexa $A$ un grupo, $B subgrupo A$, e $a in A$ un elementoo fixo. Ao
    conxunto formado polo produto de $a$ con todos os elementos de $B$, escrito
    $a B$ chámase #indice("Clase")[Lateral] clase lateral pola esquerda de B. É
    dicir, o conxunto

    $
        a B := { a b | b in B}.
    $
]

[Def 3.4.2]#cita("dean_1990") [Páx. 146]#cita("kostrikin_1983")

Pode definirse analogamente unha clase lateral _pola dereita_, $B a$.

#notacion[
    O elemento $a$ chámase _representante_ da clase $a B$.
]

Evidentemente, unha clase lateral non é máis co caso concreto mencionado antes
dun produto de subconxuntos de grupos. En realidade, na definición
@def:alxebra:clase-lateral non estamos a usar ningunha propiedade exclusiva dos
grupos, polo que é posible unha definición análoga para monoides, por exemplo.
O único motivo polo que non presento ese caso é que nos casos dos monoides (e
semigrupos e magmas) nunca xamais lle vin uso ao concepto de clase lateral. Pero
ser, é posible definilo.

#exemplos[
    - Sexa o espazo euclídeo $E^3$, onde os elementos son vectores xeometricos
      usuais que podemos pensar como frechas e denotamos por $arrow(v)$. A
      operación de interese é a suma usual de vectores $+$, que ten como neutro
      o vector $arrow(0)$ e na cal todo elemento $arrow(v)$ ten inverso
      $(-arrow(v))$. Entón, a parella $(E^3, +)$ é un grupo.

      Un subgrupo $W$, gráficamente, non é máis ca un plano que interseca a
      orixe, ousexa un plano que contén o elemento neutro $arrow(0)$. As clases
      laterais $arrow(v) + W$ son ditos planos pero desprazados polo vector
      $arrow(v)$. Evidentemente, ditos planos xa non conteñen a orixe (se
      $arrow(v) eq.not arrow(0)$) polo que non son subgrupos. Tamén é evidente
      que ditos planos ou son disxuntos entre si, e que a unión de todos eles é
      igual ao grupo completo $E$.

      Máis adiante, veremos que esto é análogo ás variedades lineais dun certo
      espazo vectorial.
]

// :FACER: demostracion desto
#teorema(
    nome : "As clases laterais coinciden ou son disxuntas",
    ancora : "teo:alxebra:clases-particion"
)[
    Sexan as clases laterais pola esquerda $a_1 B$ e $a_2 B$. Entón,
    $
        a_1 B inter a_2 B = emptyset "ou" a_1 B = a_2 B.
    $
]

É importante ver que as clases laterais non son, en xeral, subgrupos (nin
grupos de ningún modo). En efecto, sendo $e$ o neutro de $A$, como $e in e B =
B$ entón $e in.not a B$ se $a eq.not e$. É dicir, a única clase lateral de B
que é un subgrupo é o propio B xa que o resto non contén o neutro.


#teorema(
    nome : "Un grupo é a unión de clases laterais",
    ancora : "teo:alxebra:union-clases"
)[
    Sexa $A$ un grupo e $B subgrupo A$. Entón, $A$ é a unión de clases laterais
    pola esquerda de $B$. É dicir,
    $
        A = union.big_(a in A) a B.
    $
]
// :FACER: Pode atoparse unha demostración en [Lema 3.4.4]#cita("dean_1990") ou
// en [Páx. 146]#cita("kostrikin_1983")

#demostracion(
    ancora : "teo:alxebra:union-clases"
)[
    // :FACER: neutros con subindice antes..?
    // :FACER: notacion algo confusa
    A demostración é máis ou menos evidente, pero por aburrimento escribo algo
    máis. Sabemos que $e_A in B$ (por ser $B$ un subgrupo), polo que $a = a e_A
    in a B$. Entón,
    $
        a in A implica a in union.big_(a in A) a B,
    $
    ousexa que $A subset.eq union_(a in A) a B$.

    A maiores, $x in union.big_(a in A) a B$, polo que $exists a in A | x in a
    B$, é dicir, $x = a b implica x in A$.
    $
        a in union.big_(a in A) a B implica a in A,
    $
    ousexa, $union_(a in A) a B subset.eq A$.

    Finalmente, $ A = union.big_(a in A) a B $

]


// :FACER: todo o de clases e grupo cociente nesta sección?
// :FACER: equivalencias, aB=Ba en rotman p.190
// :FACER: citar kostrikin ~p.188, rotman p.103
#definicion(
    nome : "Subgrupo Normal",
    ancora : "def:alxebra:subgrupo-normal"
)[
    Sexa $(A, *)$ un grupo e $(B, *) subgrupo (A,*)$. Dicimos que o $B$ é un
    #indice("Subgrupo")[Normal] subgrupo normal, e escribimos $B lt.tri A$ se

    $
        (forall a in A) space.quad a B = B a
    $
    // Ou, $a B a^(-1) = B$
]

#teorema(
    nome : "Equivalencia subgrupo normal",
    ancora : "teo:alxebra:equivalencia-subgrupo-normal"
)[
    $
        B lt.tri A sse (forall a in A, b in B) space.quad a b a^(-1) in B
    $
]

#demostracion(
    ancora : "teo:alxebra:equivalencia-subgrupo-normal"
)[
    // :FACER: demostración no outro sentido
    Demostración parcial, so do caso

    $
        a b a^(-1) in B implica a B = B a
    $

    Primeiro, demostramos que $a B subset.eq B a$. Escollemos un elemento
    calquera $a b$ de $a B$. Por ser $B$ normal, $a b a^(-1) in B$, polo que $a
    b a^(-1) = b'$ para algún $b' in B$. Reordenando, temos que $a b = b'
    a^(-1) in B a$, polo que o noso elemento $a b in a B$ tamén pertence a $B
    a$, é dicir $a B subset.eq B a$.

    A outra pertenza, $B a subset.eq a B$. Escollemos un elemento calquera $b
    a$ de $B a$. Por ser $B$ normal, $a^(-1) b (a^(-1))^(-1) = a^(-1) b a in
    B$, polo que $a^(-1) b a = b'$ para algún $b' in B$. Reordenando, temos que
    $b a = a b' in a B$, polo que o noso elemento $b a in B a$ tamén pertence a
    $B a$, é dicir $B a subset.eq a B$.

    Finalmente, $a b a^(-1) in B implica a B = B a$

]

#notacion[
    A operación feita sobre $b$ dada por $a b a^(-1)$ ás veces chámase
    _conxugación_, polo que tamén se pode dicir que un subgrupo é normal se
    todos os seus elementos son invariantes baixo conxugación (siguen
    pertencendo a $B$).
]

Se temos dous grupos $(A,*)$ e $(B,dot)$, podemos definir un morfismo de
grupos como o morfismo

$
    f: A frecha B \
    f(a_1 * a_2) = f(a_1) dot f(a_2).
$

No caso dos monoides gañábamos a noción de elemento neutro respecto do caso dos
semigrupos, o cal nos permitiría falar do núcleo dun morfismo de monoides.
Agora traballamos cun grupo, polo que existe o concepto de _elemento inverso_
polo que podemos dicir algo máis. En concreto, o neutro transformase como
$f(e_A) = e_B$ #cita("delgado_2010") (usando notación multiplicativa por
comodidade)

$
    f(e_A) &= f(e_A) dot e_B \
           &= f(e_A) dot (f(a) dot f(a)^(-1)) \
           &= (f(e_A) dot f(a)) dot f(a)^(-1) \
           &= f(e_A * a) dot f(a)^(-1) \
           &= f(a) dot f(a)^(-1) \
           &= e_B.
$

Ollo, pode existir algún outro $a$ tal que $f(a) = e_B$, se $f$ non é
inxectiva. Pero sempre ocorre que $f(e_A) = e_B$. Por outro lado , o inverso
$a^(-1)$ transfórmase como $f(a^(-1)) = f(a)^(-1)$

$
    &f(a) dot f(a^(-1)) = f(a * a^(-1)) = f(e_A) = e_B \
    &f(a^(-1)) dot f(a) = f(a^(-1) * a) = f(e_A) = e_B \
    &implica f(a^(-1)) dot f(a) = f(a) dot f(a^(-1)) = e_B \
    &implica f(a^(-1)) "é o inverso de" f(a) \
    &f(a^(-1)) = f(a)^(-1).
$

#teorema(
    nome : "O kérnel dun homomorfismo é un subgrupo normal",
    ancora : "teo:alxebra:kernel-normal"
)[
    Sexan $A, B$ grupos e $f: A arrow.r B$ un homomorfismo. Entón,
    $
        ker(f) lt.tri A
    $
]

#demostracion(
    ancora : "teo:alxebra:kernel-normal"
)[
    Sexa $x in ker(f)$. Entón

    $
        f(a x a^(-1)) &= f(a) f(x) f(a^(-1)) \
                      &= f(a) e_B (f(a))^(-1) \
                      &= f(a) f(a)^(-1) \
                      &= e_B,
    $

    e $a x a^(-1) in ker(f)$, polo que $ker(f) lt.tri A$
]


// :FACER: que operación estou usando?
Agora presentamos unha construción con grupos de suma importancia, o grupo
cociente.

A priori, se $B subgrupo A$ podemos definir o conxunto de todas as clases
laterais como ${a B}$. É posible facer unha estrutura con dito conxunto máis a
mesma operación de grupo que en $A$, ca excepción de que agora o produto de
elementos terá a forma $(a_i B)(a_j B)$, onde uso moitos parénteses para deixar
claro que $a_i B$ e $a_j B$ son elementos concretos. Por desgraza esto non
forma un grupo xa que a operación non é necesariamente interna. Non podemos
asegurar que

$
    a_i B space a_j B = a_k B
$

para algún $a_k$. Sin embargo, se $B$ é un subgrupo normal entón $a B = B a$
polo que na expresión anterior

$
    a_i B space a_j B = a_i (B a_j) B = a_i a_j B B,
$

e chamando $a_k = a_i a_j$, e como $B B = B$, entón a operación si é interna,

$
    a_i B space a_j B = a_k B.
$

A maiores, o neutro do conxunto ${a_i B}$ con esta operación é o elemento $e B
= B$ sendo $e$ o neutro de $A$, xa que

$
    a_i B space e B = (a_i e) B = a_i B
$

(pode facerse igual $B e$). Finalmente, o inverso de $a_i B$ ven dado por
$a^(-1) B$ porque

$
    a^(-1) B space a B = (a^(-1)a) B = e B = B
$

// Está explicado en gowers, rotman 109, kostrik 192
#definicion(
    nome : "Cociente de grupos",
    ancora : "def:alxebra:cociente-grupos"
)[
    Sexan $A,B$ dous grupos, $a in A$ e $f: A arrow.r B$ un homomorfismo de
    grupos. Entón, o conxunto de todas as clases laterais pola esqueda $a B$
    chámase #indice("Grupo")[Cociente] grupo cociente, e escríbese $A\/B$. É
    dicir, o conxunto

    $
        A\/B := { a B | a in A } = {a_1B, a_2B, ...}
    $
]

Nesta definición requírese que $B$ sexa un subgrupo normal precisamente para
que $A\/B$ sexa un grupo ca operación antes descrita $(a_i B)(a_j B)$.
