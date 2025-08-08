#import("/funcions.typ"): *

#seccion(
    nome : "Estruturas",
    ancora : "sec:alxebra:estruturas"
)

#let transparencia = 80%
#let cores = (
    blue.lighten(transparencia),
    green.lighten(transparencia),
    yellow.lighten(transparencia),
    red.lighten(transparencia),
)

#table(
    columns: 4,
    stroke: none,
    align: left,
    column-gutter: 0em,
    row-gutter: 1pt,
    fill: cores,
    inset: 2em,
    [],
    [],
    [
        *Espazo Lineal*, $((G,plus.circle), (KK,+,dot), circle.stroked.small: KK times G arrow G)$ \
        - $(G,plus.circle)$ grupo \
        - $(KK,+,dot)$ corpo \
        - $circle.stroked.small$ operación entre o Grupo e o Corpo
        Alternativamente: $((G,plus.circle), (KK,+,dot), circle.stroked.small: KK arrow "End"(G))$
    ],
    [],
    [
        *Magma* $(X, plus.circle )$
        - $plus.circle$ operación binaria e interna
    ],
    [
        *Anel non asociativo* $(A,plus.circle,dot)$ \
        - $(A,plus.circle)$ grupo \
        - $(A,dot)$ magma
        - $dot$ distributivo respecto de $plus.circle$
            + $(a plus.circle b)dot c = (a dot c) plus.circle (b dot c)$
            + $c dot (a plus.circle b)= (c dot a) plus.circle (c dot b)$
    ],
    [
        *Álxebra sobre un Corpo* $KK$, $((V,plus.circle,times), (KK,+,dot), circle.stroked.small)$\
        - Espazo lineal $((V,plus.circle), (KK,+,dot), circle.stroked.small)$ \
        - Anel non Asociativo $(V,plus.circle,times)$
    ],
    [
        *Álxebra de Lie* \
        - Álxebra sobre un corpo $KK$, $((V,plus.circle,[dot,dot]), (KK,+,dot), circle.stroked.small)$
        Produto do anel $[dot,dot]$ cumpre: \
        - Bilineal
        - Antisimétrica
        - Identidade de Jacobi $[x,[y,z]] + [y,[z,x]] + [z,[x,y]] = 0$
    ],
    [
        *Semigrupo* $(X, plus.circle )$ \
        - Magma + $plus.circle$ asociativa
    ],
    [
        *Anel asociativo* $(A,plus.circle,dot)$ \
        - $(A,plus.circle)$ grupo \
        - $(A,dot)$ semigrupo
        - $dot$ distributivo respecto de $plus.circle$
    ],
    [
        *Álxebra Asociativa* \
        - Espazo lineal $((V,plus.circle), (KK,+,dot), circle.stroked.small)$ \
        - Anel asociativo $(V,plus.circle,times)$
    ],
    [],
    [
        *Monoide* $(X, plus.circle )$ \
        - Semigrupo + $exists$ neutro $e$
    ],
    [
        *Anel Unitario* $(A,plus.circle,dot)$ \
        - $(A,plus.circle)$ grupo
        - $(A,dot)$ monoide
        - $dot$ distributivo respecto de $plus.circle$
    ],
    [
        *Álxebra Asociativa con unidad* \
        - Espazo lineal $((V,plus.circle), (KK,+,dot), circle.stroked.small)$ \
        - Anel asociativo unitario $(V,plus.circle,times)$
    ],
    [],
    [
        *Grupo* $(X, plus.circle )$ \
        - Monoide + $exists$ simétrico $forall x in X$
    ],
    [
        *Corpo* $(A,plus.circle,dot)$ \
        - $(A,plus.circle)$ grupo
        - $(A-{0},dot)$ grupo
        - $dot$ distributivo respecto de $plus.circle$
        Se $dot$ é conmutativa, Campo
    ],
    [],
    []
)
