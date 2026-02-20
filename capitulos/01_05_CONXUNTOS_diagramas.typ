#import("/funcions/texto.typ"): *
#import("/funcions/simbolos.typ"): *

#seccion(
    nome : "Diagramas",
    ancora : "sec:conxuntos:diagramas"
)

Un recurso gráfico moi útil son os diagramas, que consisten nunha serie de
_vértices_ e de _frechas_ (ou _arestas_). Por exemplo

#imaxe(
    nome : "/.pdf/01_CONXUNTOS_FIG_00_diagrama-conmutativo.pdf",
    pe: [Exemplo de diagrama conmutativo],
)

Dicimos que o diagrama _é conmutativo_ se podemos ir dun vértice a outro por
calquera serie de frechas, sempre e cando respectemos a súa orientación. Na
figura anterior, esto significa que podemos pasar de $A$ a $C$ usando a función
$h$, ou ben indo de $A$ a $B$ con $f$ e logo de $B$ a $C$ con $g$. Visualmente,
esto significa que a composición de traxectorias vermellas é igual á traxectoria
azul:

#imaxe(
    nome : "/.pdf/01_CONXUNTOS_FIG_01_diagrama-conmutativo-cor.pdf",
    pe : [Diagrama anterior separado por cor]
)

É dicir, podemos chegar visualmente á conclusión de que $h = g compose f$

Os diagramas son especialmente útiles cando temos un número relevante de
relacións entre distintos obxectos, e ditas relacións son diferentes. Por
exemplo, as frechas poden denotarse con $->>$ para funcións sobrexectivas, ás
veces son liñas descontinuas para indicar que é unha relación a demostrar, etc.
Unha imaxe vale máis que mil palabras. E un bo diagrama tamén.
