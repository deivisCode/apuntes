#import("/funcions/texto.typ"): *
#import("/funcions/simbolos.typ"): *

#seccion(
    nome : [$G$-Módulos],
    ancora : "sec:alxebra:g-modulos"
)

Na sección de aneis @sec:alxebra:aneis pasáramos de ter unha operacion coma
nos grupos a ter dúas. Agora engadiremos complexidade engadindo estruturas
unhas a outras. Aparte de definir sendas operacións, veremos que é razoable
engadir unha operación entre ambas.

#definicion(
    nome : [$G$-Módulo],
    ancora : "def:alxebra:g-modulo"
)[
    Sexan $(X,+)$ e $(G,plus.o)$ grupos, e $circle.stroked.tiny$ unha
    operación $circle.stroked.tiny: G times X arrow.r X$ ca propiedade
    distributiva

    $
        (forall g,x_1,x_2) space.quad
            g circle.stroked.tiny ( x_1 + x_2) =
            g circle.stroked.tiny x_1 + g circle.stroked.tiny x_2
    $

    A terna formada por ditos tres obxectos é un #indice("G-Módulo")
    $G$-Módulo, é dicir

    $
        ((X,+),(G,plus.o),circle.stroked.tiny).
    $
]

#notacion[
    En realidade a definición @def:alxebra:g-modulo é a dun $G$-Módulo _pola
    esquerda_, dada a propiedade distributiva por ese lado. O caso pola
    dereita é análogo, e cando un $G$-Módulo é _pola esquerda_ e _pola
    dereita_ simplemente eliminamos ditos apelidos. Dependendo da situación
    pode eliminarse $G$ e falar simplemente de _módulos_.
]

A operación ca forma $circle.stroked.tiny: G times X arrow.r X$ volverá
aparecer no capítulo @cap:simetria onde diremos que $G$ _actúa_ sobre $X$;e
máis adiante, os $G$-módulos permitirannos definir o concepto de
_representación_. Ambos serán conceptos fundamentais no estudo da simetría. É
moi importante que ambos elementos dun $G$-módulo sexan do mesmo tipo (grupo),
xa que será posible engadir algunha propiedade adicional, como que a operación
$circle.stroked.tiny$ sexa un homomorfismo. Iremos vendoo todo paso a paso.
