#import("/funcions/texto.typ"): *
#import("/funcions/simbolos.typ"): *

#seccion(
    nome : "Estruturas",
    ancora : "sec:alxebra:estruturas"
)

As seccións anteriores foron unha presentación ordenada de distintas
estruturas, dende un magma (un conxunto e unha operación), ata unha álxebra
(dous conxuntos, 5 operacións, multitude de propiedades).

Na táboa @tab:alxebra:estruturas presento os resultados principais. Na primeira
columna (rotando a páxina $pi\/2$) partimos dun magma e avanzamos cara abaixo
engadindo propiedades de asociatividade, existencia de neutro e finalmente
existencia de inversos, co cal definimos semigrupo, monoide e grupo. Na segunda
columna, partimos dun grupo e un magma, e imos engadindo estrutura ao magma,
con asociatividade, existencia de neutro e de inversos#nota[No caso dos
inversos está o detalle de que o neutro da primeira operación non ten inverso,
o cal non ocorre no caso anterior (só con unha operación). Pero a idea a
grandes trazos é equivalente]. En cada caso, obtemos un anel asociativo,
unitario e finalmente un corpo. No caso dos módulos e espazos lineais a idea é
semellante, pero xa non nos molestamos nos casos onde non temos asociatividade
ou neutro, por eso as dúas primeiras filas están baleiras. Na cuarta columna,
partimos dunha álxebra asociativa e chegamos ás unitarias, como era esperable,
máis non tocamos o caso de ter inversos, porque nunca o vin en ningunha
referencia. Na columna final está a Álxebra de Lie sen compañía. Esto débese a
que a diferenza cos casos anteriores non é engadir propiedades de
asociatividade, neutro ou inversos, senón outras totalmente diferentes
(bilinealidade e Jacobi).

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

    columns       : 5,
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
            *Magma* $(X, plus.o )$
            #v(5pt)
            $plus.o$ binaria e interna
        ],
    ),

    table.cell(
        x:0, y:1,
        [
            *Semigrupo* $(X, plus.o )$
            #v(5pt)
            Magma, $plus.o$ é asociativa
        ],
    ),

    table.cell(
        x:0, y:2,
        [
            *Monoide* $(X, plus.o )$
            #v(5pt)
            Semigrupo, e existe neutro $e$
        ],
    ),

    table.cell(
        x:0, y:3,
        [
            *Grupo* $(X, plus.o )$
            #v(5pt)
            Monoide, e todos os elementos son invertibles
        ],
    ),

    table.cell(
        x:1, y:0,
        [
            *Anel non \ asociativo* $(A,plus.o,*)$
            #v(5pt)
            $(A,plus.o)$ grupo \
            $(A,*)$ magma \
            $*$ distributivo respecto de $plus.o$ \
        ],
    ),

    table.cell(
        x:1, y:1,
        [
            *Anel \ asociativo* $(A,plus.o,*)$
            #v(5pt)
            $(A,plus.o)$ grupo \
            $(A,*)$ semigrupo \
            $*$ distributivo respecto de $plus.o$ \
        ],
    ),

    table.cell(
        x:1, y:2,
        [
            *Anel \ Unitario* $(A,plus.o,*)$
            #v(5pt)
            $(A,plus.o)$ grupo \
            $(A,*)$ monoide \
            $*$ distributivo respecto de $plus.o$ \
        ],
    ),

    table.cell(
        x:1, y:3,
        [
            *Corpo* $(A,plus.o,*)$
            #v(5pt)
            $(A,plus.o)$ grupo \
            $(A-{0},*)$ grupo \
            $*$ distributivo respecto de $plus.o$ \
            #v(5pt)
            Se $*$ é conmutativa, \ Campo
        ],
    ),

    table.cell(
        x:2, y:2,
        [
            *Módulo* \ $((G,plus.o),(KK,+,*),circle.stroked.small)$
            #v(5pt)
            $(G,plus.o)$ grupo \
            $(KK,+,*)$ anel unitario \
            Operación $circle.stroked.small: KK times G arrow G$
        ],
    ),

    table.cell(
        x:2, y:3,
        [
            *Espazo  Lineal* \ $((G,plus.o), (KK,+,*), circle.stroked.small )$
            #v(5pt)
            $(G,plus.o)$ grupo \
            $(KK,+,*)$ corpo/campo \
            Operación $circle.stroked.small: KK times G arrow G$
            // Alternativamente: $((G,plus.o), (KK,+,*), circle.stroked.small: KK arrow "End"(G))$
        ]
    ),

    table.cell(
        x:3, y:0,
        [
            *Álxebra sobre un Corpo* $KK$ \
            $((V,plus.o,times), (KK,+,*), circle.stroked.small)$\
            #v(5pt)
            Espazo lineal \ $((V,plus.o), (KK,+,*), circle.stroked.small)$ \
            #v(-3pt)
            Anel non Asociativo $(V,plus.o,times)$
        ],
    ),

    table.cell(
        x:3, y:1,
        [
            *Álxebra Asociativa* \ $((V,plus.o,times), (KK,+,*), circle.stroked.small)$\
            #v(5pt)
            Espazo lineal \ $((V,plus.o), (KK,+,*), circle.stroked.small)$ \
            #v(-3pt)
            Anel Asociativo $(V,plus.o,times)$
        ],
    ),

    table.cell(
        x:3, y:2,
        [
            *Álxebra con unidade* \ $((V,plus.o,times), (KK,+,*), circle.stroked.small)$\
            #v(5pt)
            Espazo lineal \ $((V,plus.o), (KK,+,*), circle.stroked.small)$ \
            #v(-3pt)
            Anel Unitario $(V,plus.o,times)$
        ],
    ),

    table.cell(
        x:4, y:0,
        [
            *Álxebra de Lie* \ $((V,plus.o,[dot,dot]), (KK,+,dot), circle.stroked.small)$
            #v(5pt)
            Álxebra \
            $((V,plus.o,[dot,dot]), (KK,+,dot), circle.stroked.small)$
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
