#import("/funcions.typ"): *

// :FACER: exemplos de grupos: matrices ((a,a),(a,a)), mais matrices de pauli
// :FACER: a^m a^n = a^(n+m)

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

// :FACER: por qué en grupos é abeliano pero non nas estruturas anteriores?
Podemos referirnos simplemente ao monoide como $A$. Se a operación é
conmutativa, diremos que o grupo é conmutativo, ou _abeliano_.
#nota[
    Supoño que as estruturas anteriores tamén se poden chamar _abelianas_ en
    lugar de conmutativas, pero eu personalmente non o suelo ver.
]

Exemplos de grupos son:

+ Sexa o conxunto ${0,1}$ e a operación $plus.circle$ dada pola porta lóxica
  #tt[XOR]. Esta é unha operación lóxica que devolve 1 se, es so se, _un so_ dos
  argumentos é 1. Entón, dito conxunto ca operación $plus.circle$ é un grupo. O
  neutro é 0, xa que $0 plus.circle 1 = 1$, $1 plus.circle 0 = 1$, $0
  plus.circle 0 = 0$. O inverso de cada elemento é el mismo, $0 plus.circle 0 =
  0$ e $1 plus.circle 1 = 0$

+ Sexa $M_(2 times 2)$ o conxunto de matrices cadradas de tamaño $2 times 2$ da
  forma

    $ mat(a,a;a,a;) $ #label("ec:alxebra:matriz_aaaa")

    con $a in RR$. A operación é o produto usual de matrices, que é asociativo.
    Multiplicar calquera parella de matrices $M,M'$ desta forma danos outra que
    pertence ao noso conxunto. Ademáis, o neutro do produto para a matriz
    @ec:alxebra:matriz_aaaa é a matriz

    $ mat(1/(2a), 1/(2a);1/(2a), 1/(2a); ) $

    E o elemento inverso é

    $ mat(1/(4a), 1/(4a);1/(4a), 1/(4a); ) $


Intuitivamente, os grupos son estruturas nas que podes sumar e restar, _ou_
multiplicar e dividir. Personalmente vou usar notación multiplicativa nesta
sección. A diferenza dos monoides, agora temos noción de _elemento inverso_,
polo que aparece unha propiedade importante, a *cancelación*. Por un lado
// :FACER: propiedade de cancelación nun teorema?

$
    (forall a,b,c in A) space.quad a * b = a * c implica b = c
$

xa que podemos multiplicar na esquerda por $a^(-1)$. O caso $b * a = c * a$ é
idéntico. Ademáis, para $a,b in A$ dados, a ecuación en $x$

$
    a * x = b
$

ten solución única sempre, dado que podemos multiplicar pola esquerda polo
inverso (único) de $a$, $a^(-1)$ obtendo $x = a^(-1) * b$

#definicion(
    nome : "Subgrupo",
    ancora : "def:alxebra:subgrupo"
)[
    Sexa $(A,*)$ un grupo con neutro $e$, e $B subset A$. Entón, $(B,*)$ é un
    subgrupo de $(A,*)$ se
    $
        (forall b_1, b_2 in B) space.quad b_1 * b_2 in B \
        e in B \
        (forall b in B) space.quad b^(-1) in B
    $
]

Cando $B$ é un subgrupo de $A$ podemos escribir simplemente que $B subgrupo A$.

Outra vez, esta definición é análoga á @def:alxebra:subsemigrupo e
@def:alxebra:submonoide. Agora nosa estrutura é algo máis rica e podemos falar
de elementos inversos, polo que tamén é algo que pedimos na subestructura.

A definición @def:alxebra:subgrupo require probar 3 propiedades, pero podemos
reducilo a unha sola co seguinte teorema.

#teorema(
    nome: "Test de Subgrupo",
    ancora : "teo:alxebra:test_subgrupo"
)[
    Sexa $(A,*)$ un grupo con neutro $e$, e $B subset A$. Entón

    $
        B subgrupo A sse (forall b_1,b_2 in B) space.quad b_1*b_2^(-1) in B
    $

    En notación aditiva a condición sería $b_1 - b_2 in B$, é dicir, que un
    elemento de $B$ calqueira, polo inverso doutro, está en $B$.
]

Pode verse unha demostración na proposición 4.14 de #cita("delgado_2010") O
relevante do teorema @teo:alxebra:test_subgrupo é que nos permite probar se
algo é un subgrupo cun so paso, en lugar de 3 distintos.

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
#cita("delgado_2010") (usando notación multiplicativa por comodidade)

$
    f(e_A) &= f(e_A) dot e_B \
           &= f(e_A) dot (f(a) dot f(a)^(-1)) \
           &= (f(e_A) dot f(a)) dot f(a)^(-1) \
           &= f(e_A * a) dot f(a)^(-1) \
           &= f(a) dot f(a)^(-1) \
           &= e_B \
$

Ollo, pode existir algún outro $a$ tal que $f(a) = e_B$, se $f$ non é
inxectiva. Pero sempre ocorre que $f(e_A) = e_B$. Por outro lado , o inverso
$a^(-1)$ transfórmase como $f(a^(-1)) = f(a)^(-1)$

$
    &f(a) dot f(a^(-1)) = f(a * a^(-1)) = f(e_A) = e_B \
    &f(a^(-1)) dot f(a) = f(a^(-1) * a) = f(e_A) = e_B \
    &implica f(a^(-1)) dot f(a) = f(a) dot f(a^(-1)) = e_B \
    &implica f(a^(-1)) "é o inverso de" f(a) \
    &f(a^(-1)) = f(a)^(-1)
$
