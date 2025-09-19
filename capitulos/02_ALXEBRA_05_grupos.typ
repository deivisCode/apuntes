#import("/funcions.typ"): *

// :FACER: exemplos de grupos: matrices ((a,a),(a,a)), mais matrices de pauli

#seccion(
    nome : "Grupos",
    ancora : "sec:alxebra:grupos"
)

Engadimos asociatividade, e logo o neutro. Non é nada raro o que imos engadir
agora.

#definicion(
    nome : "Grupo",
    ancora : "def:alxebra:grupo"
)[
    Unha parella $(A,*)$ onde $A$ é un conxunto arbitrario e
    $*$ é unha operación binaria, interna e asociativa, máis existe
    un elemento neutro $e in A$ e todos os elementos de $A$ teñen inverso
    $a^(-1)$, dise que é un grupo#indice[grupo]. É dicir, un monoide, pero
    todos os elementos son invertibles.
]

Se a operación é conmutativa, diremos que o grupo é conmutativo, ou _abeliano_.

Intuitivamente, os grupos son estruturas nas que podes sumar e restar, _ou_
multiplicar e dividir. Personalmente vou usar notación multiplicativa nesta
sección. A diferenza dos monoides, agora temos noción de _elemento inverso_,
polo que aparece unha propiedade importante, a *cancelación*. Por un lado

$
    (forall a,b,c in A) space.quad a * b = a * c implica b = c
$

xa que podemos multiplicar na esquerda por $a^(-1)$. O caso $b * a = c * a$ é
idéntico. Ademáis, para $a,b in A$ dados, a ecuación en $x$

$
    a * x = b
$

ten solución #underline[única]#nota[Esto depende de que o elemento inverso é
único.] sempre, dado que podemos multiplicar pola esquerda por $a^(-1)$
obtendo $x = a^(-1) * b$

#definicion(
    nome : "Subgrupo",
    ancora : "def:alxebra:subgrupo"
)[
    Sexa $(A,*)$ un grupo con neutro $e$, e $B in A$. Entón, $(B,*)$ é un
    subgrupo de $(A,*)$ se
    $
        (forall a_1, a_2 in B) space.quad a_1 * a_2 in B \
        e in B \
        (forall a in A) space.quad a^(-1) in A
    $
]

Outra vez, esta definición é análoga á @def:alxebra:subsemigrupo e
@def:alxebra:submonoide Agora nosa estrutura é algo máis rica e podemos falar
de elementos inversos, polo que tamén é algo que pedimos na subestructura

// :FACER: Test de Subgrupo delgado_2010 4.14
// :FACER: Homomorfismo de grupos
// :FACER: (a b)^-1 = b^-1 a^-1
// :FACER: Clases laterais de grupos?

Se temos dous grupos $(A,*)$ e $(B,dot)$, podemos definir un morfismo de
grupos como o morfismo

$
    f: A frecha B \
    f(a_1 * a_2) = f(a_1) dot f(a_2)
$

Neste caso, chámase #indice("Homomorfismo") homomorfismo. No caso dos monoides
gañábamos a noción de elemento neutro respecto do caso dos semigrupos, o cal
nos permite falar do núcleo dun morfismo de monoides. Agora traballamos cun
grupo, polo que existe o concepto de _elemento inverso_ polo que podemos dicir
algo máis. En concreto, o neutro transformase como $f(e_A) = e_B$
#cita("delgado_2010")

$
    f(e_A) &= f(e_A) dot e_A \
           &= f(e_A) dot (f(a) dot f(a)^(-1)) \
           &= (f(e_A) dot f(a)) dot f(a)^(-1) \
           &= f(e_A * a) dot f(a)^(-1) \
           &= f(a) dot f(a)^(-1) \
           &= e_B \
$

E o inverso $a^(-1)$ transfórmase como $f(a^(-1)) = f(a)^(-1)$

$
    &f(a) dot f(a^(-1)) = f(a * a^(-1)) = f(e_A) = e_B \
    &f(a^(-1)) dot f(a) = f(a^(-1) * a) = f(e_A) = e_B \
    &implica f(a^(-1)) dot f(a) = f(a) dot f(a^(-1)) = e_B \
    &implica f(a^(-1)) "é o inverso de" f(a) \
    &f(a^(-1)) = f(a)^(-1)
$
