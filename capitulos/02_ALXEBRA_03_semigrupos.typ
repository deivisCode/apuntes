#import("/funcions.typ"): *

#seccion(
    nome : "Semigrupos",
    ancora : "sec:alxebra:semigrupos"
)

#definicion(
    nome : "Semigrupo",
    ancora : "def:alxebra:semigrupo"
)[
    Unha parella $(A,*)$ onde $A$ é un conxunto arbitrario e
    $*$ é unha operación binaria, interna e asociativa, dise que é un
    semigrupo#indice[semigrupo]. É dicir, un magma, pero onde a operación
    $*$ tamén é asociativa
]

Se a operación é conmutativa, diremos que é un semigrupo conmutativo.

Os semigrupos sí aparecen de cando en vez de forma explícita na álxebra.
Veremos esto unhas seccións máis adiante.

#definicion(
    nome : "Subsemigrupo",
    ancora : "def:alxebra:subsemigrupo"
)[
    Sexa $(A,*)$ un semigrupo, e $B in A$. Entón, $(B,*)$ é un subsemigrupo de
    $(A,*)$ se
    $
        (forall a_1, a_2 in B) space.quad a_1 * a_2 in B
    $
    Non é necesario falar de asociatividade porque $*$ é asociativa con
    calquera parella de elemenos de $A$, e polo tanto, de $B$.
]

Se temos dous semigrupos $(A,*)$ e $(B,dot)$, podemos definir un morfismo de
semigrupos como o morfismo

$
    f: A stretch(arrow.r, size: #300%) B \
    f(a_1 * a_2) = f(a_1) dot f(a_2)
$

Nun semigrupo non temos noción de neutro ou simétrico, asique non podemos
traballar moito máis cos morfismos neste caso.
