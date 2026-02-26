#import("/funcions/texto.typ"): *
#import("/funcions/simbolos.typ"): *

#seccion(
    nome : "Accións de grupos en conxuntos",
    ancora : "sec:simetria:accions"
)

Imos ver como formalizar a idea de que un grupo _actua_ sobre un conxunto, que
propiedades podemos pedir, como pode funcionar, e tamén variedade de resultados
engadidos.

Sexan $G$ e $A$ un grupo e un conxunto calquera respectivamente. O resultado de
$G$ _actuando_ sobre $A$ é outro elemento de $A$, polo que é razoable dicir que
unha _acción_ non é mais ca unha aplicación, en concreto motiva a seguinte
definicón. [Cap.11$section$3]@masa_2019 [Cap.16$section$1]@napkin
[Cap.2$section$7]@rotman_2000 [Cap.7$section$2.1]@kostrikin_1983

#definicion(
    nome : "Acción",
    ancora : "def:simetria:accion"
)[
    A acción #indice("Acción") dun grupo $G$ nun conxunto $A$ é unha aplicación
    de dúas variables calquera
    $
        alpha: G times A &frecha A \
                  (g, x) &mapea alpha (g,x)
    $
    que satisfai, con $e_G$ o neutro de $G$, $g,h in G$, $x in A$, e usando a
    notación multiplicativa no grupo G:
    + $alpha (e_G, x) = x$.
    + $alpha (g h, x) = alpha (g, alpha (h,x))$.
]

#notacion[
    Simplificamos a acción nunha parella de elementos calquera $alpha (g, x)$
    simplemente por $g x$. Se o grupo $G$ actúa sobre $A$ podemos escribir $G
    arrow.cw.half A$, e tamén dicimos que $A$ é un $G$-conxunto. A definición
    @def:simetria:accion é a dunha acción _pola esquerda_, dada a orde dos
    argumentos $g, a$. Pode definirse unha acción _pola dereita_ de xeito
    totalmente análogo como $alpha: A times G arrow A$, $(x,g) mapsto alpha
    (x,g)$.
]

// :FACER: explicar mellor esto
Para cada $g in G$ a acción $alpha$ define unha función bixectiva $alpha_g: A
arrow A$ dada por $alpha_g (x) = alpha (g, x)$. Evidentemente, $alpha_g in S(A)$.

Agora podemos dar varias definicións e resultados típicos.
[Cap.7$section$2.1]@kostrikin_1983 [Cap.2.7]@rotman_2000

#definicion(
    nome : "Acción Efectiva",
    ancora : "def:simetria:accion-efectiva"
)[
    Sexan $G$ e $A$ un grupo e un conxunto calquera respectivamente, e $G
    arrow.cw.half A$. A acción é efectiva #indice("Acción")[Efectiva] se dado
    $g in G$

    $
        (forall x in A space.quad g x = x) implica g = e_G.
    $

    É dicir, o único elemento de $G$ cunha acción nula sobre _todo_ $A$ é o
    neutro de $G$.
]

#definicion(
    nome : "Acción libre",
    ancora : "def:simetria:accion-libre"
)[
    Sexan $G$ e $A$ un grupo e un conxunto calquera respectivamente, e $G
    arrow.cw.half A$. A acción é libre #indice("Acción")[Libre] se dado $g in
    G$

    $
        (exists x in A space.quad g x = x) implica g = e_G.
    $

    É dicir, se $g$ deixa fixo un punto calquera, entón $g$ é o neutro de $G$.
]


// [Cap.7$section$2ej3]@kostrikin_1983
// [Cap.2$section$7ej2.136]@rotman_2000
#definicion(
    nome : "Acción transitiva",
    ancora : "def:simetria:accion-transitiva"
)[
    Sexan $G$ e $A$ un grupo e un conxunto calquera respectivamente, e $G
    arrow.cw.half A$. A acción é transitiva #indice("Acción")[transitiva] se

    $
        (forall x in A) space.quad exists x' in A, g in G | x = g x'
    $

    Ousexa, dados $x, x' in A$ existe un $g$ in $G$ tal que $x' = g x$. Dito
    doutro modo, sempre podemos pasar dun elemento a outro calquera pola acción
    dalgún elemento do grupo.
]

// [Cap.7$section$2.2]@kostrikin_1983
// [Cap.2$section$2.7]@rotman_2000
#definicion(
    nome : "Órbita dun elemento",
    ancora : "def:simetria:orbita"
)[
    Sexan $G$ e $A$ un grupo e un conxunto calquera respectivamente, e $G
    arrow.cw.half A$. A órbita dun elemento $x in A$, denotada $cal(O)(x)$ é o
    conxunto de todos os elementos aos que podes «chegar» dende $x$ pola acción
    dalgún elemento de $G$, é dicir

    $
        cal(O)(x) := {x' in A | exists g in G, x'=g x}.
    $
]

// Demostracion
Seguindo as definición @def:simetria:accion-transitiva e @def:simetria:orbita
vese que unha acción é transitiva se todos os elementos están na mesma órbita,
ousexa

$
    G arrow.cw.half A "é transitiva"
    sse
    exists x in A "tal que" cal(O)(x) = A
$

Podemos inventar unha relación de equivalencia e dicir que dous elementos $x,
x'$ están relacionados se existe algún $g in G$ tal que $x' = g x$.

As clases de equivalencia son os conxuntos

$
    [x] = {x' in A | exists g in G, x' = g x}
$

que non é máis ca definición de órbita, ousexa $[x] = cal(O)(x)$. Esto
asegúranos que o conxunto de órbitas (de clases de equivalencia) é unha
partición de $A$. Se denotamos por $A\/G$ ao conxunto cociente por dita
relación de equivalencia, entón

// [Cap.2.7prop.2.140p198]@rotman_2000
$
    union.big_("orb" in A\/G) "orb" = A.
$

#definicion(
    nome : "Estabilizador",
    ancora : "def:simetria:estabilizador"
)[
    Sexan $G$ e $A$ un grupo e un conxunto calquera respectivamente, $G
    arrow.cw.half A$, e $x in A$. O estabilizador #indice("Estabilizador") de
    $x$, denotado $"St"(x)$ é o conxunto de elementos de $G$ que non cambian
    $x$, é dicir,

    $
        "St"(x) := {g in G | g x = x}
    $
]

// :FACER: thm. orbit stabilizer
// [Cap.2.7prop2.141]@rotman_2000
// [Thm.16.2.5]@napkin
// :FACER: thm. burnside lemma
// [Cap.2.8Thm2.158]@rotman_2000
// [Thm.16.3.1]@napkin

Ollo, dado que
- $g,h in "St"(x) implica g h in G$,
- $e in "St"(x)$,
- $g in "St"(x) implica g^(-1) in "St"(x)$,

entón $"St"(x)$ é un subgrupo de $G$.

// [Cap.7$section$2.2]@kostrikin_1983
#definicion(
    nome : "Subconxunto invariante",
    ancora : "def:simetria:subconxunto-invariante"
)[
    Sexa $B subset.eq A$, un grupo $G$ e $G arrow.cw.half A$. Dicimos que $B$ é
    invariante respecto de $G$ se
    $
        (forall x in B, g in G) space.quad g x in B.
    $
]

// :FACER: demostrar esta afirmación
Un subconxunto invariante é a unión de órbitas

// :FACER: diferenza co centralizador?
// :FACER: esto no tema específico de grupos?
// [Cap.2.5]@rotman_2000
// [Cap.7.$section$2.3]@kostrikin_1983
#definicion(
    nome : "Centro",
    ancora : "def:simetria:centro"
)[
    Sexa $G$ un grupo calqura. O conxunto de elementos de $G$ que conmutan con
    calquera outro, notado como $Z(G)$, denomínase centro #indice("Centro") de
    $G$, é dicir,

    $
        Z(G) = {h in G | (forall g in G) space.quad g h = h g}
    $
]

// :FACER: motivar esto, e revistar N(H) =st(H) ? meter en grupos?
// [Cap.7$section$2.3]@kostrikin_1983
#definicion(
    nome : "Normalizador",
    ancora : "def:simetria:estabilizador"
)[
    $
        N(H) = "St"(H) = {g in G | g H = H g}
    $
]
