#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge
#import fletcher.shapes: brace
#import "/funcions/texto.typ": *
#import "/funcions/figuras.typ": *

#show: estilo_figuras.with(
    alto  : 9cm,
    ancho : 15cm
)

#diagram(

    spacing: (3cm, 3cm),

    node((0,0), [Forma bilineal]),
    node((1,0), [Forma sesquilineal]),
    node((0,1), [Produto escalar]),
    node((1,1), [Produto hermítico]),
    node((0,2), [Espazo Euclidiano]),
    node((1,2), [Espazo Hermítico]),

    node(
        enclose:((0,1), (1,1)),
        shape: brace.with(label: text(fill: luma(60%))[Produtos internos], fill: luma(70%))
    ),

    edge(
        (0,0), (0,1),
        [
            + Simétrica.
            + Definida positiva.
        ],
        "->",
    ),

    edge(
        (1,0), (1,1),
        [
            + Hermítica.
            + Definida positiva.
        ],
        "->",
        label-side: left
    ),

    edge((0,1),(0,2), [Da lugar a], "->"),
    edge((1,1),(1,2), [Da lugar a], "->", label-side: left)

    // node((0, 0), $A$, name: "A"),
    // node((1, 0), $B$, name: "B"),
    // node((0, 1), $A\/ker(f)$),
    //
    // edge( vertices: ((0, 0), (0, 1)), marks: "->", label: $pi$),
    // edge( vertices: ((0, 0), (1, 0)), marks: "->>", label: $f$),
    // edge( vertices: ((0, 1), (1, 0)), marks: "-->", label: $phi$, label-side: right),

)
