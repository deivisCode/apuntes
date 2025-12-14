#import("/funcions.typ"): *

#seccion(
    nome : "Magmas",
    ancora : "sec:alxebra:magmas"
)

Xa é o momento de presentar algunhas estruturas de interese. Moitas delas non
son útiles na física pero, na miña opinión, permiten entender outras que si o
son. Nesta sección mencionamos unha das máis simples posibles.

#definicion(
    nome : "Magma",
    ancora : "def:alxebra:magma"
)[
    Unha parella $(A,*)$ onde $A$ é un conxunto arbitrario e
    $*$ é unha operación binaria e interna dise que é un
    magma#indice[Magma]
]

Podemos referirnos simplemente ao magma como $A$. Adicionalmente, se a
operación é conmutativa, entón é un magma conmutativo.

#definicion(
    nome : "Submagma",
    ancora : "def:alxebra:submagma"
)[
    Sexa $(A,*)$ un magma e $B subset A$. Se se cumpre que

    $
        (forall b_1,b_2 in B) space.quad b_1 * b_2 in B,
    $

    entón dicimos que $(B,*)$ é un submagma de $(A,*)$
]

En realidade non hai nada máis que comentar desta estrutura. Pode parecer que
non lle imos dar ningún uso, pero veredes que se pode usar como comparación
para ver como construír outras estruturas.
