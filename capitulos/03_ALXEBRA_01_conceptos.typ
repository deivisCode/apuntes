#import("/funcions/texto.typ"): *
#import("/funcions/simbolos.typ"): *

#seccion(
    nome : "Conceptos básicos",
    ancora : "sec:alxebra:conceptos"
)

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
    $
        f: A times A & frecha A \
        a,b & mapea f(a,b).
    $

    [Cap. 2]#cita("rotman_2000") [Cap.4 $section 4.1$]#cita("delgado_2010")
]

En xeral non se usa a notación "funcional" cos argumentos entre paréntese,
senón que preferimos colocar o símbolo da operación entre eles (semellante á
expresión @exp:contuntos:posicion-simbolos). Ademais, non usamos letras para as
operacións senón símbolos especiais. É dicir, os pasos
[Cap.2 ]#cita("rotman_2000"):

$
    f(a,b) stretch(arrow.r)^"símb. entre argumentos"
    a f b stretch(arrow.r)^"símb. especial"
    a plus.o b
$ <exp:alxebra:posicion-simbolos>

Onde usei $plus.o$ en lugar de $f$ ao final. Outros símbolos posibles son
$+ * · dot.o diamond.stroked$ ou o que veña en mente ao escribir.

A pesar de que existen infinidade de símbolos, úsanse 2 estilos claramente
diferenciados. Na notación *aditiva* úsanse símbolos que asemellan os da suma,
como $+ plus.o$, e as operacións escríbense completas, como $a+b$ ou $a
plus.o b$. Na notación *multiplicativa* úsanse símbolos que asemellan a
multiplicación, como $times * dot$, e a operación pode escribirse con símbolo
explícito ou sen el, $a * b$, $a b$. Tamén veremos algunha diferencia entre
ambas notacións máis adiante ao falar de asociatividade.

#definicion(
    nome : "Estrutura Alxébrica",
    ancora : "def:alxebra:estrutura"
)[
    A parella $(A,plus.o)$ formada _polo menos_ por un conxunto arbitrario
    $A$ máis unha operación calquera definida neste $plus.o$ é unha
    estrutura alxébrica. #indice[Estrutura Alxébrica]
]

Nesta definición, digo _polo menos_ porque é posible ter máis conxuntos e máis
operacións. Tamén é posible unha estrutura composta á sua vez de estruturas
máis pequenas. Por exemplo, no caso dunha Álxebra de Lie
#nota[
    Para o curioso, a estrutura é $((V,plus.o,[dot,dot]), (KK,+,dot),
    circle.stroked.small)$. Xa presentaremos todo no seu debido tempo
]
, o número ascende a 5 operacións en 2 conxuntos diferentes, que se relacionan
en un grupo, un anel e unha operación aparte. Cando hai varias operacións soe
usarse notación aditiva para a primeira e multiplicativa para a segunda. No
caso de ter nas mans varias estruturas do mesmo tipo, gústame a idea de notar
as operacións da segunda engadindo círculos ás operacións da primeira. É dicir,
se teño dúas estruturas sendo a primeira $(A,+,dot)$, entón na segunda usarei
as operacións $plus.o$ e $dot.o$, i.e. $(B,plus.o,dot.o)$. Hai que ter en conta
que isto non é unha norma, senón un gusto.

Un detalle notacional máis, cando unha estrutura é coñecida soe abusarse da
notación e simplificar todo co nome do seu conxunto. De haber varios, é típico
que haxa un máis _interesante_ e usarase ese. Por exemplo, o grupo $(G, +)$
simplifícase por $G$, e o espazo lineal $((V,+),(KK,+,dot),compose)$ por $V$

#definicion(
    nome : "Cardinalidade",
    ancora : "def:alxebra:cardinalidade"
)[
    Nunha estrutura alxébrica calquera $A$ denotamos por $card(A)$ ao número de
    elementos de $A$ se tal número é finito. Se non é finito, entón falaremos
    do cardinal de $NN$ ou $RR$ dependendo do caso (véxase [Def.
    3.63]#cita("delgado_2010")). No caso de que a estrutura teña varios
    conxunto soe falarse da cardinalidade do conxunto máis relevante.
]

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

$ a * ((b * c) * ((d * e) * f)) = a * b * c * d * e * f. $
#label("ec:alxebra:asociatividade_xeneralizada")

É común atoparse con situacións como a da
@ec:alxebra:asociatividade_xeneralizada pero onde a operación se repite no
mesmo elemento. Podemos simplificar a escritura usando potencias. En notación
multiplicativa #cita("delgado_2010")

$ underbrace(a * a * a * dots, "n veces") $

escríbese simplemente como $a^n$, semellante a se fose unha potencia usual de
números. E en notación aditiva

$ underbrace(a + a + a + dots, "n veces") $

simplifícase a $n a$, como se estivésemos a sumar un número varias veces. A
maiores, se temos (en notación multiplicativa) $a^n * a^m$ podemos simplificalo
por $a^(n+m)$, e $(a^(n))^(m)$ é igual a $a^(n m)$, seguindo as nocións usuais
de potencias de números. Pode verse unha demostración en [Cap.4 $section$2.3
Teo.2]#cita("kostrikin_1983")

#definicion(
    nome : "Conmutatividade",
    ancora : "def:alxebra:conmutatividade"
)[
    Dicimos que unha operación nunha estrutura calquera $(A,*)$ é conmutativa
    #indice("Operación")[conmutativa] se se cumpre que
    $ (forall a,b in A) space.quad a * b = b * a. $
    #cita("delgado_2010")
]

É dicir, podemos operar cunha parella de elementos en calquera orde. É
importante mencionar que asociatividade e conmutatividade son propiedades
independentes.

#definicion(
    nome : "Elemento Neutro",
    ancora : "def:alxebra:neutro"
)[
    Nunha estrutura $(A,*)$, un elemento $e$ que cumpre
    $ (forall a in A) space.quad e * a = a * e = a.  $
    dise que é un elemento neutro.#indice[Elemento Neutro]
]

Un elemento neutro, ás veces chamado _identidade_, pode operarse con calquera
outro elemento sen afectalo de ningún modo. Nunha situación na que teñamos
varios conxuntos $A, B, C, dots$ con neutro, podemos identificalo con
subíndices para poder diferencialos, ousexa $e_A, e_B, e_C, dots$ Ás veces, na
notación aditiva esribimos o neutro como $0$, e na notación multiplicativa como
$1, bb(1)$ ou $I$. Podemos combinar todo e escribir $1_A, bb(1)_B, 0_A$, etc.

#teorema(
    nome : "Elemento neutro é único",
    ancora : "teo:alxebra:neutro_unico"
)[
    Sexa $(A,*)$ unha estrutura alxébrica calquera. Se existe un elemento
    neutro, entón é único.
]

#demostracion(
    ancora : "teo:alxebra:neutro_unico"
)[
    Sexan $e,e'$ dous elementos neutros da operación $*$

    $ e = e * e' = e' $

    Temos que $e = e * e'$ por ser $e'$ neutro (multiplicalo por $e$ non cambia
    $e$). Como $e$ tamén é neutro, entón $e * e' = e'$. Finalmente, $e = e'$,
    polo que realmente, só existe un elemento neutro.
]


#definicion(
    nome : "Elemento Inverso",
    ancora : "def:alxebra:inverso"
)[
    Nunha estrutura $(A,*)$ con $e$ o elemento neutro, un elemento $y$ que
    cumpre

    $
        a * y = y * a = e.
    $

    dise que é o elemento inverso de $a$ #indice[Elemento Inverso], e que o
    elemento $a$ é invertible.
]

O elemento inverso de $a$ denótase como $-a$ na notación aditiva e por $a^(-1)$
na multiplicativa.

#teorema(
    nome : "Elemento inverso é único",
    ancora : "teo:alxebra:inverso_unico"
)[
    Sexa $(A,*)$ unha estrutura alxébrica calquera ca propiedade de que $*$ é
    unha operación asociativa. Se existe un elemento inverso, entón é único.
]

#demostracion(
    ancora : "teo:alxebra:inverso_unico"
)[

    Sexa $a^(-1)$ o elemento inverso de $a$. Entón, $a*a^(-1) = e = a*a^(-1)$.
    Sexa $a'^(-1)$ outro elemento inverso de $a$, entón temos que $a'^(-1)*a =
    e = a*a'^(-1)$ (por que tamén é inverso). Entón
    $
        a^(-1) = e*a^(-1) = (a'^(-1)*a)*a^(-1) = \
        a'^(-1)*(a*a^(-1)) = a'^(-1)*e = a'^(-1).
    $
    // :FACER: MARGINALIA warning: value of `state("_note_extends_right")` did not converge
    #cita("rotman_2000")
    // #cita("delgado_2010")
    // #cita("kostrikin_1983")
]

O teorema @teo:alxebra:inverso_unico garante que podemos falar de $a^(-1)$,
senón, poderíamos ter varios inversos de $a$ distintos, como $a_1,a_2$ etc.

#teorema(
    nome : "Inverso dun produto",
    ancora : "teo:alxebra:inverso-produto"
)[
    Sexa $(A,*)$ unha estrutura calqueira onde $*$ é asociativa, existe neutro
    $e$ máis todos os elementos son invertibles. Entón, o inverso $(a*b)^(-1) =
    b^(-1)*a^(-1)$.
]

#demostracion(
    ancora : "teo:alxebra:inverso-produto"
)[
    Pode demostrarse multiplicando $a*b$ pola esquera e pola
    dereita por $a^(-1)*b^(-1)$, o cal nos debe dar o neutro según a definición
    @def:alxebra:inverso

    Pola esquerda
    $
        (b^(-1)*a^(-1))*(a*b) = b^(-1)*(a*a^(-1))*b = \
        b^(-1)*e*b = b^(-1)*b = e.
    $

    E pola dereita
    $
        (a*b)*(b^(-1)*a^(-1)) = a*(b*b^(-1))*a^(-1) = \
        a*e*a^(-1) = a*a^(-1) = e.
    $

    Polo tanto, $(b^(-1)*a^(-1))$ é o inverso de $a*b$.
]

Este teorema ás veces chámase _teorema de zapatos e calcetíns_ por que para
calzarnos primeiro poñemos os zapatos e logo os calcetíns. Pero para
descalzarnos quitamos primeiro os calcetíns e logo os zapatos.

#definicion(
    nome : "Operación distributiva",
    ancora : "def:alxebra:distributiva"
)[
    Sexa $(A,dot,*)$ unha estrutura con dúas operacións calquera $dot$ e $*$.
    Dicimos que a operación $dot$ #indice("Operación")[Distributiva] é
    distributiva respecto de $*$ se se cumpre que $(forall a,b,c in A)$

    $
        &a dot (b * c) = a dot b * a dot c \
        &(b * c) dot a = b dot a * c dot a.
    $
]

Ás veces podemos referirnos a distributiva _pola esquerda_ ou _pola dereita_,
no caso de que só se cumpra unha das condicións de
#ref(<def:alxebra:distributiva>). Entón, unha operación é distributiva (a
secas) se o é pola esquera e pola dereita.

// :FACER: esto non é de todo correcto, hai que parafrasealo
#definicion(
    nome : "Sub Estrutura",
    ancora : "def:alxebra:subestrutura"
)[
    Sexa $(A,*)$ unha estrutura alxébrica calquera, co conxunto $A$ máis a
    operación $*$. Sexa tamén un subconxunto arbitrario $B subset A$. A parella
    $(B,*)$ é unha subestrutura da estrutura de $(A,*)$ se se cumpren, en $B$,
    todas as condicións que se pedían para $(A,*)$

    - $(forall a,b in B) space.quad a * b in B$. (A operación $*$ é interna en B)
    - Se a operación $*$ é asociativa en $(A,*)$, tamén o é en $(B,*)$.
    - Se a operación $*$ é conmutativa en $(A,*)$, tamén o é en $(B,*)$.
    - Se existe un elemento neutro $e in (A,*)$, tamén está en $(B,*)$.
    - Se todo elemento ten inverso en $(A,*)$, tamén o ten en $(B,*)$.
    - etc.
]

Cando a operación tamén é interna no subconxunto B soe dicirse que é
#indice("Operación")[Cerrada] _cerrada_ ou que _cerra_ en B, que é o primeiro
punto da definición @def:alxebra:subestrutura.

A definición @def:alxebra:subestrutura dinos que se sabemos as condicións que
satisfai unha estrutura de certo tipo, coma un monoide ou un anel, entón non
temos que aprender nada máis para saber se un subconxunto dos seus elementos é
tamén unha estrutura do mesmo tipo, coma un submonoide ou un subanel. Estes
deben cumprir as mesmas condicións. Nalgúns casos será posible simplificar a
demostración de varias propiedades demostrando unha relación diferente (como no
test de subgrupo), e en xeral, hai propiedades que son totalmente evidentes e
ninguén proba no campo de xogo nunca.

// :FACER: o Sebas di que hai que ter en conta que existen outras
// transformacións que tamén son morfismos pero eu digo que morfismos son só os
// que cumplen f(a+b) = f(a) * f(b) (structure preserving maps)
// :FACER: isomorfismos. homomorfismos con inversa homomorfismo. Ou bixección.
#definicion(
    nome : "Morfismo",
    ancora : "def:alxebra:morfismo"
)[
    Un #indice("Morfismo") morfismo entre dúas estruturas $(A,*)$ e
    $(B,plus.o)$ (do mesmo tipo) é unha aplicación calquera $f: A &
    arrow.r B$ que cumpre

    $
        f(a*b) = f(a) plus.o f(b).
    $

    A operación $a*b$ ocorre en $A$, e logo aplícaselle $f$; e a
    operación $plus.o$ ocorre en $B$, entre $f(a)$ e $f(b)$.
]

Dependendo da estrutura concreta ca que nos topemos, os morfismos ás veces
chámanse _homomorfismos_, entre grupos; _homomorfismos de aneis_, entre aneis;
ou _aplicacións lineais_, en espazos lineais, etc. Veremos cada caso co detalle
que precisemos.

#definicion(
    nome : "Núcleo dun morfismo",
    ancora : "def:alxebra:nucleo"
)[
    Sexa $f: A arrow.r B$ un morfismo entre $(A,*)$ e $(B,plus.o)$, onde a
    segunda estrutura ten un neutro $e$. O conxunto de elementos de $A$ que
    pasan ao neutro de $B$ a través de $f$ chámase #indice("Núcleo") núcleo ou
    #indice("Kernel") kernel de $f$ e denótase por $"ker"(f)$. É dicir, é o
    conxunto

    $
        ker(f) = { a in A | f(a) = e_B }.
    $
]

Recordemos por un momento a noción de inxectividade. Unha función é inxectiva
se se cumpre que $f(a) eq.not f(b) implica a eq.not b$, ou análogamente, $a = b
implica f(a) = f(b)$.

#teorema(
    nome : [$ker(f) = {e_A} sse f "é Inxectiva"$],
    ancora : "teo:alxebra:nucleo-unidade"
)[
    Sexa $f:A arrow.r B$ un morfismo calquera entre as estruturas $(A,+)$ e
    $(B,+)$. #nota[Uso en ambas estruturas a mesma operación + por comodidade.]
    Entón $f$ é inxectiva $sse$ o núcleo de $f$ só contén o neutro de A.
]

#demostracion(
    ancora : "teo:alxebra:nucleo-unidade"
)[

    "$arrow.r.double$" #v(1em) // :FACER: atallo para isto

    Partimos de que $f$ é inxectiva. $f(e_A) = f(a-a) = f(a)-f(a) = e_B$
    $implica f(e_A) = e_B implica e_A in ker(f)$ Pode ser que haxa outro
    elemento $a' in A$ tal que $f(a') = e_B implica a' in ker(f)$, pero como
    $f$ é inxectiva, entón se $f(e_A) = f(a') = e_B implica a' = e_A$. Polo
    tanto, $ker(f) = {e_A}$.

    #v(1em) "$arrow.l.double$" #v(1em)

    Partimos de que $ker(f)={e_A}$. Supoñemos que $f(a) = f(b) implica f(a-b) =
    e_B$ polo que $a-b in ker(f) = {e_B}$. Entón, $a-b = e_B implica a=b$. Polo
    tanto, $f(a)=f(b) implica a=b$, que é a condición de inxectividade.
]

No caso da teoría de conxuntos non se pode presentar tal resultado porque non
teríamos unha noción de _kernel_ ou sequera do que é un elemento neutro. Na
álxebra varios teoremas gañan contido e é posible usar resultados novos que
antes non eran posibles.

Os núcleos dos morfismos tomarán un papel protagonista de entre os conxuntos
que imos a tratar neste capítulo. O motivo non é obvio de inmediato, pero
espero que o vaia sendo nas seccións seguintes
