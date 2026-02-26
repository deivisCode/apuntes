#import("/funcions/texto.typ"): *
#import("/funcions/simbolos.typ"): *

#seccion(
    nome : "Homeomorfismos",
    ancora : "sec:topoloxia:homeomorfismos"
)

// :FACER: motivalo
#definicion(
    nome : "Homeomorfismo",
    ancora : "def:topoloxia:homeomorfismo"
)[
    Sexan os espazos topolóxicos $(X,tau_X)$ e $(Y,tau_Y)$ e unha función
    calquera $f : (X,tau_X) arrow.r (Y,tau_Y)$. Dicimos que $f$ é un
    #indice("Homeomorfismo") homeomorfismo se

    + $f$ é bixectiva.
    + $f$ é continua.
    + $f^(-1)$ é continua.
]


#teorema(
    nome : "Definicións equivalentes de Homeomorfismo",
    ancora : "def:topoloxia:equivalencia-homeomorfismo"
)[
    A definición @def:topoloxia:homeomorfismo é equivalente ás seguintes

    Por un lado:
    + $f$ é bixectiva.
    + $f$ é continua.
    + $f^(-1)$ é aberta.

    Por outro:
    + $f$ é bixectiva.
    + $f$ é continua.
    + $f^(-1)$ é pechada.
]

#definicion(
    nome : "Espazos Homeomorfos",
    ancora : "def:topoloxia:espazos-homeomorfos"
)[
    Sexan os espazos topolóxicos $(X,tau_X)$ e $(Y,tau_Y)$. Se existe un
    homeomorfismo $f$ entre ambos espazos entón dicimos que son
    #indice("Espazo")[Homeomorfo] homeomorfos.
]

// :FACER: reescribir baseandose en sec:conxuntos:invariantes
#definicion(
    nome : "Invariante topolóxica",
    ancora : "def:topoloxia:invariante-topoloxica"
)[
    Sexan os espazos topolóxicos homeomorfos $(X,tau_X)$ e $(Y,tau_Y)$. Sexa
    unha certa propiedade $P$ dun espazo topolóxico como a compacidade,
    conexión, Hausdorf, etc. que se cumple en $(X,tau_X)$. Se ao cumplirse $P$
    en $(X,tau_X)$ tamén se cumple $P$ en $(Y,tau_Y)$, entón dicimos que $P$ é
    unha #indice("Invariante")[Topolóxica] invariante topolóxica.
    É dicir, son propiedades dun espazo topolóxico que se preservan entre
    espazos homeomorfos.
]

Podemos usar esta definición á inversa. Se temos dous espazos topolóxicos con
propiedades topolóxicas distintas (e.g. un deles é Hausdorff e outro non) entón
temos asegurado que ditos espazos non son homeomorfos

// :FACER: T0, T1, conexo, convexo (Penn), etc.
#definicion(
    nome : "Espazo de Hausdorff",
    ancora : "def:topoloxia:hausdorff"
)[
    Sexa $(X,tau)$ un espazo topolóxico calquera. Dicimos que é de _Hausdorff_
    #indice("Espazo")[Hausdorff] se se cumpre que

    $
        (forall a,b in tau) "con" a eq.not b, space.quad \
        exists U,V in tau, "onde"
            a in U,
            b in V
        "e" (U inter V) = emptyset.
    $

    É dicir, para calquera parella de puntos, podemos atopar dous abertos que
    conteñen a cada un pero que non se intersecan.

]

#exemplos[
    - $(RR, tau_"U")$ é de Hausdorff. Para calquera parella de puntos $a,b in RR$
      sempre podemos atopar sendas bólas abertas centradas neles e de radios $r =
      |a - b|\/ 3$.

    - $(RR, tau_"IND")$ Non é de Hausdorf, porque os únicos abertos que poden
      conter respectivamente a $a$ e $b$ son $RR$, polo que non hai $U$ e $V$
      disxuntos.

    - $(RR,tau_"K")$ Non é de Hausdorff. Sexan $a in (x, oo) = U$, $b in (y,oo) = V$. Se $x > y$ entón $U
      inter V = (x, oo) eq.not emptyset$

    - $(RR,tau_"DIS")$ Si é de Hausdorff. Sexan $x in {x} = U, y in {y} = V$, entón
      $U inter V = emptyset$.
]

Ser de Hausdorff é unha propiedade topolóxica.
