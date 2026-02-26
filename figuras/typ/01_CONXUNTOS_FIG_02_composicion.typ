#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import "/funcions/texto.typ": *
#import "/funcions/figuras.typ": *

#show: estilo_figuras.with(
    alto  : 4cm,
    ancho : 9cm
)

#diagram(

    spacing: (2cm, 2cm),
    // debug: 1,

    node((0, 0), $A$, name: "A1"),
    node((1, 0), $B$, name: "B" ),
    node((2, 0), $A$, name: "A2"),

    edge(
        vertices : ((0,0), (1,0)),
        label    : $f$,
        marks    : "->"
    ),

    edge(
        vertices : ((1,0), (2,0)),
        label    : $f^(-1)$,
        marks    : "->"
    ),

    edge(
        vertices : ((0, 0), (2, 0)),
        marks    : "->",
        label    : $f^(-1) compose f = "id"_A$,
        bend     : -35deg,
    ),

)
