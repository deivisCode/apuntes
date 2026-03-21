#import("/funcions/texto.typ"): *
#import("/funcions/simbolos.typ"): *

#seccion(
    nome : [$KK$-Módulos],
    ancora : "sec:alxebra:k-modulos"
)

Continuando meu empeño de ordear as estruturas, un $KK$-módulo é idéntico ao
constructo da definición @def:alxebra:g-modulo ca diferencia que agora o
segundo elemento é un anel e non un grupo.

#definicion(
    nome : [$KK$-Módulo],
    ancora : "def:alxebra:k-modulo"
)[
    Sexa $(X,+)$ un grupo, $(A,plus.o,dot)$ un anel, e $circle.stroked.tiny$ unha
    operación $circle.stroked.tiny: A times X arrow.r X$ ca propiedade
    distributiva

    $
        (forall g,x_1,x_2) space.quad
            g circle.stroked.tiny ( x_1 + x_2) =
            g circle.stroked.tiny x_1 + g circle.stroked.tiny x_2.
    $

    A terna formada por ditos tres obxectos é un #indice("K-Módulo") módulo

    $
        ((X,+),(A,plus.o,dot),circle.stroked.tiny).
    $

    É dicir, é dicir, un $G$-módulo pero o segundo elemento é un anel.
]

#notacion[
    En xeral é tipico escribir o conxunto do anel usando unha letra dobre, p.e.
    $KK$ ou $RR$, e non simplemente $A$; de ahí o nome da estrutura. Igual que
    os $G$-módulos, agora definimos un $KK$-módulo pola esquerda, pero poden
    definirse análogamente pola dereita; e se temos ambos casos non fai falla
    especificar o lado. Dependendo do contexto tamén se pode prescindir do
    prefixo e falar simplemente de módulos. No caso dos $KK$-módulos é típico
    facer dito acurtamento e polo xeral, un módulo sempre se refire a un
    $KK$-módulo.
]
