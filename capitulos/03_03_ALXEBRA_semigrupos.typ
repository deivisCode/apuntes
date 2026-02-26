#import("/funcions/texto.typ"): *
#import("/funcions/simbolos.typ"): *

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

#notacion[
    Podemos referirnos simplemente ao semigrupo como $A$.
    Se a operación é conmutativa, diremos que é un semigrupo conmutativo.
]

Os semigrupos si aparecen de cando en vez de forma explícita na álxebra.
Veremos esto unhas seccións máis adiante ao falar de aneis.

#definicion(
    nome : "Subsemigrupo",
    ancora : "def:alxebra:subsemigrupo"
)[
    Sexa $(A,*)$ un semigrupo, e $B subset A$. Entón, $(B,*)$ é un subsemigrupo de
    $(A,*)$ se
    $
        (forall b_1, b_2 in B) space.quad b_1 * b_2 in B.
    $
]

Non é necesario falar de asociatividade porque $*$ é asociativa con
calquera parella de elemenos de $A$, e polo tanto, de $B$.

Nun semigrupo non temos noción de neutro ou inverso, polo que non podemos
traballar moito máis.
