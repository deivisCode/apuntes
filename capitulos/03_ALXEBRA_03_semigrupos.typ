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

Podemos referirnos simplemente ao semigrupo como $A$. Se a operación é
conmutativa, diremos que é un semigrupo conmutativo.

Os semigrupos si aparecen de cando en vez de forma explícita na álxebra.
Veremos esto unhas seccións máis adiante.

#definicion(
    nome : "Subsemigrupo",
    ancora : "def:alxebra:subsemigrupo"
)[
    Sexa $(A,*)$ un semigrupo, e $B subset A$. Entón, $(B,*)$ é un subsemigrupo de
    $(A,*)$ se
    $
        (forall b_1, b_2 in B) space.quad b_1 * b_2 in B
    $
]

Non é necesario falar de asociatividade porque $*$ é asociativa con
calquera parella de elemenos de $A$, e polo tanto, de $B$.

Se temos dous semigrupos $(A,*)$ e $(B,dot)$, podemos definir un morfismo de
semigrupos como o morfismo

$
    f: A frecha B \
    f(a_1 * a_2) = f(a_1) dot f(a_2)
$

Nun semigrupo non temos noción de neutro ou simétrico, polo que non podemos
traballar moito máis cos morfismos neste caso.
