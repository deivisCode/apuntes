#import("/funcions.typ"): *

#seccion(
    nome : "Espazos Topolóxicos",
    ancora : "sec:topoloxia:espazos-topoloxicos"
)

Un dos conceptos máis básicos na topoloxía é o dunha _topoloxía_ #nota[Sí, a
rama das matemáticas chámase _topoloxía_, e o concepto que mostro agora,
tamén.]. A idea básica é simple, unha _topoloxía_ é un conxunto de conxuntos
abertos. Por exemplo, na recta real $RR$, o conxunto de abertos $(a-1,a+1)$
forma unha topoloxía. Intuitivamente, para calquera punto do noso conxunto,
queremos ter asegurado que temos un aberto que o contén.

En realidade, podemos definir primeiro os conxuntos abertos e logo unha
topoloxía como o conxunto destes (como acabo de facer); ou definir unha
topoloxía, e dicir que os seus elementos son o que chamamos conxuntos abertos.
O segundo caso é o seguinte: #cita("goldberg_1980")

#definicion(
    nome : "Topoloxía",
    ancora : "def:topoloxia:topoloxia"
)[
    Sexa $X$ un conxunto calquera, e $tau subset scr(P)(X)$. Dicimos que $tau$
    é unha #indice("Topoloxía") topoloxía en $X$ se se cumpre:

    $
        &X,emptyset in tau \
        &A,B in tau arrow.r.double A inter B in tau \
        &{A_i | i in I} subset tau arrow.r.double (union_(i in I) A_i) in tau
    $

]

A segunda propiedade dinos que a interescción dun número _finito_ de elementos
da topoloxía tamén pertence a $tau$, e a terceira que a unión _infinita_ tamén
o fai.

Os elementos de $tau$ chámanse #indice("Conxunto")[Aberto] conxuntos abertos,
ou simplemente abertos.

#definicion(
    nome : "Espazo topolóxico",
    ancora : "def:topoloxia:espazo-topoloxic o"
)[
    A parella $(X,tau)$ onde $X$ é un conxunto arbitrario e $tau$ unha
    topoloxía sobre $X$, é un #indice("Espazo")[Topolóxico] espazo topolóxico.
]
