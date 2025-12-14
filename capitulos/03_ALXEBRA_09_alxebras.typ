#import("/funcions.typ"): *

#seccion(
    nome : "Álxebras",
    ancora : "sec:alxebra:alxebras"
)

Chegamos á fin do camiño. A estrutura última que se presenta nestas notas (máis
non nas matemáticas). A estrutura chamada _Álxebra_#nota[Insisto no confuso de
estudar álxebra e que unha estrutura _concreta_ se chame álxebra tamén.].
Aparecen na mecánica clásica no formalismo Hamiltoniano, e permite conectar co
mundo cuántico onde se usa unha estrutura semellante.

#definicion(
    nome : "Álxebra",
    ancora : "def:alxebra:alxebra"
)[
    Sexa $(V,plus.o,*)$ un anel, $(KK,+,dot)$ un campo, e
    $circle.stroked.tiny$ unha operación $circle.stroked.tiny: V times A
    arrow.r V$. A terna formada por ditos tres obxectos é unha
    #indice("Álxebra") álxebra

    $
        ((V,plus.o,*),(A,+,dot),circle.stroked.tiny).
    $

    É dicir, un espazo lineal, pero o primeiro elemento é un anel.
]

#definicion(
    nome : "Álxebra de Lie",
    ancora : "def:alxebra:alxebra-lie"
)[
    Sexa $((V,plus.o,*), (KK,+,dot), circle.stroked.small)$ unha álxebra.

    No caso de que a operación $*$ sexa bilineal, antisimétrica e cumpra a
    identidade de Jacobi, entón falamos dunha #indice("Álxebra")[De Lie]
    álxebra de Lie.
]

En realidade a notación típica para o produto do primeiro anel é o dunha
parella de parénteses, como $[dot,dot]$ ou ${dot, dot}$, é dicir, a operación
entre dous elementos $a,b in V$ escríbese como $[a,b]$ ou ${a,b}$. Os
parénteses soen chamarse _parénteses de Lie_.

Outra forma de ver esta estrutura é como un espazo lineal usual, pero engadimos
a operación $[dot,dot]$ que cumpre as propiedades antes mencionadas. Esta soe
ser a definición na maioría de libros.

// :FACER: Subalxebra
// :FACER: Tipos de operacions, Alxebras asociativas, de Lie
// :FACER: Morfismos de álxebras
