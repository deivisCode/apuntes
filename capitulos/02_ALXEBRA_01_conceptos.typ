#import("/funcions.typ"): *

#seccion(
    nome : "Conceptos básicos",
    ancora : "sec:alxebra:conceptos"
)

// :FACER: conceptos basicos, faltan explicacións
Esta será posiblemente a sección máis aburrida deste capítulo. Imos ver
algunhas definicións e resultados básicos que logo imos aplicar a unha
variedade de situacións.

Primeiro, dicir que unha operación non é máis que unha aplicación entre uns
conxuntos e outros. Esquivamos o xenérico desta definición limitándonos ás
operacións binarias e internas. Binarias#indice("Operación")[binaria] porque
parten do produto cartesiano dun conxunto, como $A times A$; e
internas#indice("Operación")[interna], porque devolven un valor do
mesmo conxunto $A$.

#definicion(
    nome : "Operación binaria e interna",
    ancora: "def:alxebra:operacion_bi"
)[
    Unha operación binaria e interna é unha aplicación calquera
    // :FACER: variables para frechas típicas
    $
        f: A times A & stretch(arrow.r, size: #300%) A \
        a,b & stretch(mapsto, size: #300%) f(a,b)
    $
]

En xeral non se usa a notación "funcional" cos argumentos entre paréntese,
senón que preferimos colocar o símbolo da operación entre eles. Ademais, non
usamos letras para as operacións senón símbolos especiais. É dicir, os pasos:

$
    f(a,b) stretch(arrow.r, size: #110%)^"símb. entre argumentos"
    a f b stretch(arrow.r, size: #110%)^"símb. especial" a plus.circle b
$

Onde usei $plus.circle$ en lugar de $f$ ao final. Outros símbolos posibles son
$+ * · dot.circle diamond.stroked$ ou o que veña en mente ao escribir.

A pesar de que existen infinidade de símbolos, úsanse 2 estilos claramente
diferenciados. Na notación *aditiva* úsanse símbolos que asemellan os da suma,
como $+ plus.circle$, e as operacións escríbense completas, como $a+b$ ou $a
plus.circle b$. Na notación *multiplicativa* úsanse símbolos que asemellan a
multiplicación, como $times * dot$, e a operación pode escribirse con símbolo
explícito ou sen el, $a * b$, $a b$. Tamén veremos algunha diferencia entre
ambas notacións máis adiante ao falar de asociatividade.


// :FACER: cardinalidade dun conxunto, tal vez aqui ou en topo ? delgado_2010
// :FACER: chamamos como G ao grupo (G,*)
#definicion(
    nome : "Estrutura Alxébrica",
    ancora : "def:alxebra:estrutura"
)[
    A parella $(A,plus.circle)$ formada _polo menos_ por un conxunto arbitrario
    $A$ máis unha operación calquera definida neste $plus.circle$ é unha
    estrutura alxébrica #indice[Estrutura Alxébrica].
]

Nesta definición, digo _polo menos_ porque é posible ter máis conxuntos e máis
operacións. Tamén é posible unha estrutura composta á sua vez de estruturas
máis pequenas. Por exemplo, no caso dunha #underline[Álxebra de Lie] #nota[Para
o curioso, a estrutura é $((V,plus.circle,[dot,dot]), (KK,+,dot),
circle.stroked.small)$. Xa presentaremos todo no seu debido tempo] , o número
ascende a 5 operacións en 2 conxuntos diferentes, que se relacionan en un
grupo, un anel e unha operación aparte. Cando hai varias operacións soe usarse
notación aditiva para a primeira e multiplicativa para a segunda. No caso de
ter nas mans varias estruturas do mesmo tipo, gústame a idea de notar as
operacións da segunda engadindo círculos ás operacións da primeira. É dicir, se
teño dúas estruturas sendo a primeira $(A,+,dot)$, entón na segunda usarei as
operacións $plus.circle$ e $dot.circle$, i.e. $(B,plus.circle,dot.circle)$. Hai
que ter en conta que isto non é unha norma, senón un gusto.

Un detalle notacional máis, cando unha estrutura é coñecida soe abusarse da
notación e simplificar todo co nome do seu conxunto. De haber varios, é típico
que haxa un máis _interesante_ e usarase ese. Por exemplo, o grupo $(G, +)$
simplifícase por $G$, e o espazo lineal $((V,+),(KK,+,dot),compose)$ por $V$

#definicion(
    nome: "Asociatividade",
    ancora : "def:alxebra:asociatividade"
)[
    Dicimos que unha operación nunha estrutura calquera $(A,*)$ é asociativa
    #indice("Operación")[asociativa] se se cumpre que
    $ (forall a,b,c in A) space.quad a * (b * c) = (a * b) * c $
]

Se unha operación é asociativa, non só o é en 3 elementos, senón en xeral. Pode
verse unha demostración en #cita("kostrikin_1983"). Isto significa que a
asociatividade nos permite eliminar completamente os parénteses de calquera
expresión como

$ a * ((b * c) * ((d * e) * f)) = a * b * c * d * e * f $
#label("ec:alxebra:asociatividade_xeneralizada")

É común atoparse con situacións como a da
@ec:alxebra:asociatividade_xeneralizada pero onde a operación se repite no
mesmo elemento. Podemos simplificar a escritura usando *potencias*. En notación
multiplicativa #cita("delgado_2010")

$ underbrace(a * a * a * dots, "n veces") $

escríbese simplemente como $a^n$, semellante a se fose unha potencia usual de
números. E en notación aditiva

$ underbrace(a + a + a + dots, "n veces") $

simplifícase a $n a$, como se estivésemos a sumar un número varias veces.

#definicion(
    nome : "Conmutatividade",
    ancora : "def:alxebra:conmutatividade"
)[
    Dicimos que unha operación nunha estrutura calquera $(A,*)$ é conmutativa
    #indice("Operación")[conmutativa] se se cumpre que
    $ (forall a,b in A) space.quad a * b = b * a $
]

É dicir, podemos operar cunha parella de elementos en calquera orde. É
importante mencionar que asociatividade e conmutatividade son propiedades
independentes.

#definicion(
    nome : "Elemento Neutro",
    ancora : "def:alxebra:neutro"
)[
    Nunha estrutura $(A,*)$, un elemento $e$ que cumpre
    $ (forall a in A) space.quad e * a = a * e = a  $
    dise que é un elemento neutro.#indice[Elemento Neutro]
]

Un elemento neutro, ás veces chamado _identidade_, pode operarse con calquera
outro elemento sen afectalo de ningún modo. Nunha situación na que teñamos
varios conxuntos $A, B, C, dots$ con neutro, podemos identificalo con
subíndices para poder diferencialos, ousexa $e_A, e_B, e_C, dots$ Ás veces, na
notación aditiva esribimos o neutro como $0$, e na notación multiplicativa como
$1, bb(1)$ ou $I$.

#teorema(
    nome : "Elemento neutro é único",
    ancora : "teo:alxebra:neutro_unico"
)[
    Sexa $(A,*)$ unha estrutura alxébrica calquera. Se existe un elemento
    neutro, entón é único.

    Sexan $e,e'$ dous elementos neutros da operación $*$

    $ e = e * e' = e' $

    Temos que $e = e * e'$ por ser $e'$ neutro (multiplicalo por $e$ non cambia
    $e$). Como $e$ tamén é neutro, entón $e * e' = e'$. Finalmente, $e = e'$,
    polo que realmente, só existe un elemento neutro
]


#definicion(
    nome : "Elemento Inverso",
    ancora : "def:alxebra:inverso"
)[
    Nunha estrutura $(A,*)$ con $e$ o elemento neutro, un elemento $y$ que
    cumpre

    $
        (forall a in A) space.quad a * y = y * a = e
    $

    dise que é o elemento inverso de $a$ #indice[Elemento Inverso], e que o
    elemento $a$ é invertible.
]

// :FACER: ollo, esto xustifica falar de a^-1, senón non teria sentido. Especificalo no de notacion
// :FACER: esto depende da asociatividade, mencionalo!!
#teorema(
    nome : "Elemento inverso é único",
    ancora : "teo:alxebra:inverso_unico"
)[
    Sexa $(A,*)$ unha estrutura alxébrica calquera. Se existe un elemento
    inverso, entón é único.

    Sexa $a^(-1)$ o elemento neutro de $a$. Entón, $a a^(-1) = e = a a^(-1)$
    Sexa $a'^(-1)$ outro elemento inverso de $a$, entón temos que $a a'^(-1) =
    e = a a'^(-1)$ (por que tamén é inverso). Entón $a'^(-1) = e a'^(-1) =
    (a^(-1) a) a'^(-1) = a^(-1)(a a'^(-1)) = a^(-1)e = a^-1$
]

O elemento inverso de $a$ denótase como $-a$ na notación aditiva e por $a^(-1)$
na multiplicativa.

#definicion(
    nome : "Operación distributiva",
    ancora : "def:alxebra:distributiva"
)[
    Sexa $(A,dot,*)$ unha estrutura con dúas operacións calquera $dot$ e $*$

    Dicimos que a operación $dot$ #indice("Operación")[Distributiva] é
    distributiva respecto de $*$ se se cumpre que $(forall a,b,c in A)$

    $
        &a dot (b * c) = a dot b * a dot c \
        &(b * c) dot a = b dot a * c dot a
    $
]

Ás veces podemos referirnos a distributiva _pola esquerda_ ou _pola dereita_,
no caso de que só se cumpra unha das condicións de
#ref(<def:alxebra:distributiva>). Entón, unha operación é distributiva (a secas) se o é pola esquera e pola dereita

#definicion(
    nome : "Sub Estrutura",
    ancora : "def:alxebra:subestrutura"
)[
    Sexa $(A,*)$ unha estrutura alxébrica calquera, co conxunto $A$ máis a
    operación $*$. Sexa tamén un subconxunto arbitrario $B in A$. A parella
    $(B,*)$ é unha subestrutura da estrutura de $(A,*)$ se se cumpren, en $B$,
    todas as condicións que se pedían para $(A,*)$

    // :FACER: poñer a nota pero sen que quede o codigo tan afora
    - $(forall a,b in B) space.quad a * b in B $ (a operación $*$ é interna en B) #nota[Cando a operación tamén é interna no subconxunto B soe dicirse que é _cerrada_ ou que _cerra_ en B]
    - Se a operación $*$ é asociativa en $(A,*)$, tamén o é en $(B,*)$
    - Se a operación $*$ é conmutativa en $(A,*)$, tamén o é en $(B,*)$
    - Se existe un elemento neutro $e in (A,*)$, tamén está en $(B,*)$
    - Se todo elemento ten inverso en $(A,*)$, tamén o ten en $(B,*)$
    - etc.
]

A definición @def:alxebra:subestrutura dinos que se sabemos as condicións que
satisfai unha estrutura de certo tipo, coma un monoide ou un anel, entón non
temos que aprender nada máis para saber se un subconxunto dos seus elementos é
tamén unha estrutura do mesmo tipo, coma un submonoide ou un subanel. Estes
deben cumprir as mesmas condicións. Nalgúns casos será posible simplificar a
demostración de varias propiedades demostrando unha relación diferente (como no
test de subgrupo), e en xeral, hai propiedades que son totalmente evidentes e
ninguén proba no campo de xogo nunca.

#definicion(
    nome : "Morfismo",
    ancora : "def:alxebra:morfismo"
)[
    Un #indice("Morfismo") morfismo entre dúas estruturas $(A,*)$ e
    $(B,plus.circle)$ (do mesmo tipo) é unha aplicación calquera $f: A &
    arrow.r B$ que cumpre

    $
        f(a*b) = f(a) plus.circle f(b)
    $

    Onde a operación $a*b$ ocorre en $A$, e logo se lle aplica $f$; e a
    operación $plus.circle$ ocorre en $B$, entre $f(a)$ e $f(b)$
]

Dependendo da estrutura concreta ca que nos topemos, os morfismos ás veces
chámanse _homomorfismos_, entre grupos; _homomorfismos de aneis_, entre aneis;
ou _aplicacións lineais_, en espazos lineais, etc. Veremos cada caso co detalle
que precisemos.

// :FACER: operador para o kernel
#definicion(
    nome : "Núcleo dun morfismo",
    ancora : "def:alxebra:nucleo"
)[
    Sexa $f: A arrow.r B$ un morfismo entre $(A,*)$ e $(B,plus.circle)$. O
    conxunto de elementos de $A$ que pasan ao neutro de $B$ a través de $f$
    chámase #indice("Núcleo") núcleo ou #indice("Kernel") kernel de $f$ e
    denóase por $"ker"(f)$. É dicir, é o conxunto

    $
        "ker"(f) = { a in A | f(a) = e_B }
    $
]

Os núcleos dos morfismos tomarán un papel protagonista de entre os conxuntos
que imos a tratar neste capítulo. O motivo non é obvio de inmediato, pero
espero que o vaia sendo nas seccións seguintes

// :FACER: (ab)^-1 = b^-1 a^-1 (shoe socks theorme)
// :FACER: morfismo, algunha explicación a maiores
