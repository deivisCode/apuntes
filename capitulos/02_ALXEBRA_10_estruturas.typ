#import("/funcions.typ"): *

#seccion(
    nome : "Estruturas",
    ancora : "sec:alxebra:estruturas"
)

// Teño que facer o texto máis pequeno ou non colle
#set text(size: 9pt)
#set par(first-line-indent:0pt)

#let transparencia = 80%
#let cores = (
    purple.lighten(transparencia),
    blue.lighten(transparencia),
    green.lighten(transparencia),
    yellow.lighten(transparencia),
    red.lighten(transparencia),
)

#let taboa = table(

    columns: 5,
    rows          : (24.5%,24.5%,24.5%,24.5%),
    stroke        : 0.3pt + luma(85%),
    align         : left,
    column-gutter : 0.2em,
    row-gutter    : 0.2em,
    fill          : cores,
    inset         : 0.5em,

    // {{{
    table.cell(
        x:0, y:0,
        [
            *Magma* $(X, plus.circle )$
            #v(5pt)
            $plus.circle$ binaria e interna
        ],
    ),

    table.cell(
        x:0, y:1,
        [
            *Semigrupo* $(X, plus.circle )$
            #v(5pt)
            Magma, $plus.circle$ é asociativa
        ],
    ),

    table.cell(
        x:0, y:2,
        [
            *Monoide* $(X, plus.circle )$
            #v(5pt)
            Semigrupo, e existe neutro $e$
        ],
    ),

    table.cell(
        x:0, y:3,
        [
            *Grupo* $(X, plus.circle )$
            #v(5pt)
            Monoide, e todos os elementos son invertibles
        ],
    ),

    table.cell(
        x:1, y:0,
        [
            *Anel non \ asociativo* $(A,plus.circle,*)$
            #v(5pt)
            $(A,plus.circle)$ grupo \
            $(A,*)$ magma \
            $*$ distributivo respecto de $plus.circle$ \
        ],
    ),

    table.cell(
        x:1, y:1,
        [
            *Anel \ asociativo* $(A,plus.circle,*)$
            #v(5pt)
            $(A,plus.circle)$ grupo \
            $(A,*)$ semigrupo \
            $*$ distributivo respecto de $plus.circle$ \
        ],
    ),

    table.cell(
        x:1, y:2,
        [
            *Anel \ Unitario* $(A,plus.circle,*)$
            #v(5pt)
            $(A,plus.circle)$ grupo \
            $(A,*)$ monoide \
            $*$ distributivo respecto de $plus.circle$ \
        ],
    ),

    table.cell(
        x:1, y:3,
        [
            *Corpo* $(A,plus.circle,*)$
            #v(5pt)
            $(A,plus.circle)$ grupo \
            $(A-{0},*)$ grupo \
            $*$ distributivo respecto de $plus.circle$ \
            #v(5pt)
            Se $*$ é conmutativa, \ Campo
        ],
    ),

    table.cell(
        x:2, y:2,
        [
            *Módulo* \ $((G,plus.circle),(KK,+,*),circle.stroked.small)$
            #v(5pt)
            $(G,plus.circle)$ grupo \
            $(KK,+,*)$ anel unitario \
            Operación $circle.stroked.small: KK times G arrow G$
        ],
    ),

    table.cell(
        x:2, y:3,
        [
            *Espazo  Lineal* \ $((G,plus.circle), (KK,+,*), circle.stroked.small )$
            #v(5pt)
            $(G,plus.circle)$ grupo \
            $(KK,+,*)$ corpo/campo \
            Operación $circle.stroked.small: KK times G arrow G$
            // Alternativamente: $((G,plus.circle), (KK,+,*), circle.stroked.small: KK arrow "End"(G))$
        ]
    ),

    table.cell(
        x:3, y:0,
        [
            *Álxebra sobre un Corpo* $KK$ \
            $((V,plus.circle,times), (KK,+,*), circle.stroked.small)$\
            #v(5pt)
            Espazo lineal \ $((V,plus.circle), (KK,+,*), circle.stroked.small)$ \
            #v(-3pt)
            Anel non Asociativo $(V,plus.circle,times)$
        ],
    ),

    table.cell(
        x:3, y:1,
        [
            *Álxebra Asociativa* \ $((V,plus.circle,times), (KK,+,*), circle.stroked.small)$\
            #v(5pt)
            Espazo lineal \ $((V,plus.circle), (KK,+,*), circle.stroked.small)$ \
            #v(-3pt)
            Anel Asociativo $(V,plus.circle,times)$
        ],
    ),

    table.cell(
        x:3, y:2,
        [
            *Álxebra con unidade* \ $((V,plus.circle,times), (KK,+,*), circle.stroked.small)$\
            #v(5pt)
            Espazo lineal \ $((V,plus.circle), (KK,+,*), circle.stroked.small)$ \
            #v(-3pt)
            Anel Unitario $(V,plus.circle,times)$
        ],
    ),

    table.cell(
        x:4, y:0,
        [
            *Álxebra de Lie* \ $((V,plus.circle,[dot,dot]), (KK,+,dot), circle.stroked.small)$
            #v(5pt)
            Álxebra \
            $((V,plus.circle,[dot,dot]), (KK,+,dot), circle.stroked.small)$
            #v(-3pt)
            Operación $[dot,dot]$ Bilineal, Antisimétrica, cumpre a identidade de Jacobi
        ],
    ),

// }}}

)

#pagebreak()

#bloque_ancho[
    #rotate(
        90deg,
        reflow: true,
        [
            #figure(
                caption: [A mellor táboa que vas ver na vida],
                taboa,
            ) #label("tab:alxebra:estruturas")
        ]
    )
]
