#import("/funcions/texto.typ"): *
#import("/funcions/simbolos.typ"): *

#seccion(
    nome : "Álxebra",
    ancora : "sec:alxebra:alxebra"
)

Nas seccións anteriores centrámonos en presentar as nocións xerais que
comparten as distintas estruturas alxébricas e como se constrúen estas. Podería
dicir que eran unha mera introdución á álxebra con resultados comúns.

Agora miraremos en maior detalle varios resultados máis elaborados.

#teorema(
    nome : "Primeiro teorema de isomorfismos de grupos",
    ancora : "teo:alxebra:isomorfismos-primeiro"
)[
    Sexan $A,B$ grupos e $f: A arrow.r B$ un homomorfismo de grupos. Entón,

    $
        A\/ker(f) tilde.equiv f^"IM" (A).
    $

    É dicir, o cociente de $A$ co kérnel de $f$ é isomorfo á imaxe de $f$.
]

#imaxe(
    nome : "/.pdf/03_ALXEBRA_FIG_01_teorema-isomorfismos.pdf",
    pe : [
        Cun diagrama, Polo teorema @teo:alxebra:isomorfismos-primeiro podemos
        dicir que existe a función $phi$ e que é un isomorfismo.
    ]
)

// :FACER: esto está ben?
// :FACER: meter esto en capitulo de álxebra. O actual sería 'intro á alxebra'. Ou tel vez, continuar con seccións logo da de estruturas
#exemplos[

    - Sexa $cal(C)^oo (RR)$ o conxunto de funcións reais, continuas e
      derivables, e sexa $cal(L): cal(C)^oo arrow.r cal(C)^oo$ dada por
      $cal(L)(y) = y'' + y + 1$. O kérnel é $cal(L)(y) = y'' + y + 1 = 0$. Polo
      teorema @teo:alxebra:isomorfismos-primeiro sabemos que $cal(C)^oo \/
      ker(cal(L)) tilde.equiv L^"IM" (cal(C)^oo)$. O cociente na esquerda son
      as clases laterais $y, y^H$,

]
