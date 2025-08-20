#import("/funcions.typ"): *

#seccion(
    nome : "Monoides",
    ancora : "sec:alxebra:monoides"
)

#definicion(
    nome : "Monoide",
    ancora : "def:alxebra:monoide"
)[
    Unha parella $(A,*)$ onde $A$ é un conxunto arbitrario e
    $*$ é unha operación binaria, interna e asociativa, máis existe
    un elemento neutro $e in A$, dise que é un monoide#indice[monoide]. É
    dicir, un semigrupo, pero tamén existe un neutro.
]

Tal vez comezamos a ver un patrón. Partimos dunha estrutura sinxela (un magma)
e imos engadindo detalles pouco a pouco construíndo outras estruturas máis
complexas. Algún dos pasos intermedios son intrinsecamente irrelevantes. A
ninguén lle importa o que é un semigrupo. Pero imos ver que os pasos que
facemos aquí son os mesmos que ao construír aneis, espazos lineais, ou álxebras
de Lie. Penso que ao coñecer os pasos é máis sinxelo entender as definicións
máis complexas.

// :FACER: exemplo con conxuntos, unión, intersección
// :FACER: Submonoide
// :FACER: Homomorfismo de monoides
// :FACER: Clases laterais de monoides?
