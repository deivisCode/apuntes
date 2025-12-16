#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import "/funcions/figuras.typ": *
#import "/funcions/texto.typ": *

#show: estilo_figuras.with(
    alto  : 5cm,
    ancho : 5cm
)

#diagram(

    spacing: (2cm, 2cm),
    // debug: 1,

    node((0, 0), $A$, name: "A"),
    node((1, 0), $B$, name: "B"),
    node((1, 1), $C$, name: "C"),

    edge( vertices: ((0, 0), (1, 0)), marks: "->", label: $f$, ),
    edge( vertices: ((1, 0), (1, 1)), marks: "->", label: $g$, label-side: left ),
    edge( vertices: ((0, 0), (1, 1)), marks: "->", label: $h$, bend: -45deg),

)
