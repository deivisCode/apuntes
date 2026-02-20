#import("/funcions/texto.typ"): *
#import("/funcions/simbolos.typ"): *

#seccion(
    nome : "Espazos Métricos",
    ancora : "sec:topoloxia:espazos-metricos"
)

Distancias: [Def. 6.1]#cita("masa_2019")

#definicion(
    nome : "Métrica",
    ancora : "def:topoloxia:metrica"
)[
    Sexa $X$ un conxunto calquera e

    $
        d: X times X &frecha RR \
        (a,b) &mapea d(a,b).
    $

    unha función que cumpre

    + $d(a,b) gt.eq 0$.
    + $d(a,b) = 0 sse a = b $.
    + $d(a,b) = d(b,a)$.
    + $d(a,c) lt.eq d(a,b) + d(b,c)$. (Desigualdade triangular)

    dise que é unha #indice("Métrica") métrica ou #indice("Distancia")
    distancia en $X$

]

#definicion(
    nome : "Espazo Métrico",
    ancora : "def:topoloxia:espazo-metrico"
)[
    A parella $(X, d)$ onde $X$ é un conxunto calquera e $d$ unha distancia é
    un #indice("Espazo")[Métrico] espazo métrico.
]
