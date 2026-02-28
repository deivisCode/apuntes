#import("/funcions/texto.typ"): *
#import("/funcions/simbolos.typ"): *

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
    dicir, un semigrupo onde tamén existe un neutro.

]

Intuitivamente, os monoides son estruturas nas que podes sumar pero non restar,
_ou_ multiplicar pero non dividir.

#notacion[
    Podemos referirnos simplemente ao monoide como $A$.

    Se a operación é conmutativa, diremos que é un monoide conmutativo.
]

#exemplos[
    - Para un conxunto calquera $X$, podemos denotar por $S(X)$ #nota[A
      elección da letra $S$ non é arbitraria. Máis adiante aparecerá o chamado
      grupo Simétrico, e por certa similitude, denoto igual a este monoide] o
      conxunto de todas as funcións $f: X arrow.r X$, é dicir, as funcións de
      $X$ en sí mesmo. Se $compose$ denota a composición de funcións, e $e$ é a
      función identidade $id: X arrow.r X, id(x) = x$, entón $(S(X),compose)$ é
      un monoide, sendo $id$ o seu neutro.

    - Para un conxunto calquera $X$, denotamos como $scr(P)(X)$ o conxunto de
      todos os subconxuntos de $X$. Se $union$ e $inter$ son a unión e
      intersección de conxuntos, entón $( scr(P)(X), union )$ e $( scr(P)(X),
      inter )$ son monoides. No primerio caso o neutro é $emptyset$, e no
      segundo é $X$.
]

Tal vez comezamos a ver un patrón ao definir as estruturas. Partimos dunha
estrutura sinxela e imos engadindo detalles pouco a pouco construíndo outras
estruturas máis complexas. Algún dos pasos intermedios son intrinsecamente
irrelevantes: a ninguén lle importa o que é un magma ou un semigrupo. Pero imos
ver que os pasos que facemos aquí son os mesmos que ao construír aneis, espazos
lineais, ou álxebras de Lie, que si son de gran interese. Penso que ao coñecer
os pasos é máis sinxelo entender as definicións máis complexas.

#definicion(
    nome : "Submonoide",
    ancora : "def:alxebra:submonoide"
)[
    Sexa $(A,*)$ un monoide con neutro $e$, e $B subset A$. Entón, $(B,*)$ é un
    submonoide de $(A,*)$ se
    $
        (forall b_1, b_2 in B) space.quad b_1 * b_2 in B \
        e in B.
    $
]

A definición desta subestrutura é totalmente análoga á definición
@def:alxebra:subsemigrupo. Antes só tiñamos a noción de operación interna e
asociatividade, polo que pedíamos eso a un subconxunto dun semigrupo para que
fose subsemigrupo. Nos monoides existe un elemento neutro, polo que é un
requisito adicional para un submonoide.

// :FACER: Clases laterais de monoides?
