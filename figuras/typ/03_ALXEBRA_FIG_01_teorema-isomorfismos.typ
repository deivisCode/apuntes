#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import "/funcions/texto.typ": *
#import "/funcions/figuras.typ": *

#show: estilo_figuras.with(
    alto  : 5cm,
    ancho : 7cm
)

#diagram(

    spacing: (2cm, 2cm),
    // debug: 1,

    node((0, 0), $A$, name: "A"),
    node((1, 0), $B$, name: "B"),
    node((0, 1), $A\/ker(f)$),
    node((1, 1), $f^"IM" (A) subset.eq B$),

    edge( vertices: ((0, 0), (0, 1)), marks: "->", label: $pi$),
    edge( vertices: ((0, 0), (1, 0)), marks: "->", label: $f$),
    edge( vertices: ((0, 1), (1, 1)), marks: "->", label: $phi$),

)
