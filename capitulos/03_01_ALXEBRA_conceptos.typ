#import("/funcions/texto.typ"): *
#import("/funcions/simbolos.typ"): *

#seccion(
    nome : "Conceptos básicos",
    ancora : "sec:alxebra:conceptos"
)

Imos ver algunhas definicións e resultados básicos que logo imos aplicar a unha
variedade de estruturas alxébricas concretas. Polo xeral estes resultados soen
presentarse a carón das estruturas nas que aparecen por primeira vez, por
exemplo o elemento neutro cos monoides, os elementos inversos aparecen ao
estudar grupos ou as operacións distributivas cos aneis. Eu prefiro aglutinar
os resultados e ideas comúns nesta sección. A maioría destes resultados son
coñecidos, esta sección sirve principalmente como referencia.

Primeiro, dicir que unha operación non é máis que unha aplicación entre uns
conxuntos e outros (véxase a definición @def:conxuntos:funcion). Esquivamos o
xenérico desta definición limitándonos ás operacións binarias e internas.
Binarias#indice("Operación")[binaria] porque parten do produto cartesiano dun
conxunto, como $A times A$; e internas#indice("Operación")[interna], porque
devolven un valor do mesmo conxunto $A$.

#definicion(
    nome : "Operación binaria e interna",
    ancora: "def:alxebra:operacion_bi"
)[
    Unha operación binaria e interna é unha aplicación calquera
    $
        f: A times A & frecha A \
        a,b & mapea f(a,b).
    $
]

[Cap. 2]#cita("rotman_2000") [Cap.4 $section 4.1$]#cita("delgado_2010")

#notacion[
    En xeral na álxebra non se usa a notación _funcional_ cos argumentos entre
    paréntese, senón que preferimos colocar o símbolo da operación entre eles
    (semellante á expresión @exp:contuntos:posicion-simbolos). Ademais, non
    usamos letras para as operacións senón símbolos especiais. É dicir, os
    pasos [Cap.2 ]#cita("rotman_2000")

    $
        f(a,b) stretch(arrow.r)^"símb. entre argumentos"
        a f b stretch(arrow.r)^"símb. especial"
        a plus.o b,
    $ <exp:alxebra:posicion-simbolos>

    onde usei $plus.o$ en lugar de $f$ ao final. Outros símbolos posibles son
    $+ * · dot.o diamond.stroked$ ou o que veña en mente ao escribir.
    A pesar de que existen infinidade de símbolos, úsanse 2 estilos claramente
    diferenciados. Na notación _aditiva_ úsanse símbolos que asemellan os da suma,
    como $+ plus.o$, e as operacións escríbense completas, como $a+b$ ou $a
    plus.o b$. Na notación _multiplicativa_ úsanse símbolos que asemellan a
    multiplicación, como $times * dot$, e a operación pode escribirse con símbolo
    explícito ou sen el, $a * b$, $a b$. Tamén veremos algunha diferencia entre
    ambas notacións máis adiante ao falar de asociatividade. Polo xeral a notación
    multiplicativa é preferible na maioría de libros e apuntes de álxebra, moi
    posiblemente porque omitir o símbolo da operación volve o texto moitísimo máis
    simple e limpo.
]

#definicion(
    nome : "Estrutura Alxébrica",
    ancora : "def:alxebra:estrutura"
)[
    A parella $(A,plus.o)$ formada _polo menos_ por un conxunto arbitrario
    $A$ máis unha operación calquera definida neste $plus.o$ é unha
    estrutura alxébrica. #indice[Estrutura Alxébrica]
]

Nesta definición, digo #quote[polo menos] porque é posible ter máis conxuntos e
máis operacións. Tamén é posible unha estrutura composta á sua vez de
estruturas máis pequenas. Por exemplo, no caso dunha Álxebra de Lie
#nota[
    Para o curioso, a estrutura é $((V,plus.o,[dot,dot]), (KK,+,dot),
    circle.stroked.small)$. Xa presentaremos todo no seu debido tempo
]
, o número ascende a 5 operacións en 2 conxuntos diferentes, que se relacionan
en un grupo, un anel e unha operación aparte.

#notacion[
    Cando hai varias operacións soe usarse notación aditiva para a primeira e
    multiplicativa para a segunda. No caso de ter nas mans varias estruturas do
    mesmo tipo, gústame a idea de notar as operacións da segunda engadindo
    círculos ás operacións da primeira. É dicir, se teño dúas estruturas sendo
    a primeira $(A,+,dot)$, entón na segunda usarei as operacións $plus.o$ e
    $dot.o$, i.e. $(B,plus.o,dot.o)$. Hai que ter en conta que isto non é unha
    norma, senón un gusto. Un detalle notacional máis, cando unha estrutura é
    coñecida soe abusarse da notación e simplificar todo co nome do seu
    conxunto. De haber varios, é típico que haxa un máis _interesante_ e
    usarase ese. Por exemplo, o grupo $(G, +)$ simplifícase por $G$, e o espazo
    lineal $((V,+),(KK,+,dot),compose)$ por $V$. A medida que aparezan
    estruturas concretas recordarei este detalle. Polo xeral úsase a notación
    simplificada en case toda a bibliografía e eu seguirei esa norma ao rematar
    este capítulo excepto cando o resto de operacións ou conxuntos sexan
    relevantes.
]

#definicion(
    nome : "Cardinalidade",
    ancora : "def:alxebra:cardinalidade"
)[
    Nunha estrutura alxébrica calquera $A$ chamamos cardinalidade, denotada por
    $card(A)$ ou $|A|$, ao número de elementos de $A$ se tal número é finito.
    Se non é finito, entón dicimos que a cardinalidade é a mesma de $NN$ ou
    $RR$ dependendo do caso (véxase [Def. 3.63]#cita("delgado_2010")).
]

#notacion[
    No caso de que a estrutura teña varios conxuntos, como un espazo lineal,
    soe falarse da cardinalidade do conxunto máis relevante, polo que a
    cardinalidade do espazo vectorial $((V,+),(KK,+,dot),compose)$ é
    simplemente $|V|$.
]

A cardinalidade é especialmente importante cando é finita xa que, como veremos
no caso de grupos de pequenas dimensións, é posible obter todo tipo de
resultados traballando simplemente co número $|A|$.

É típico realizar unha operación interna nunha parella de elementos e volver
aplicarlla ao resultado cun novo elemento. Isto non é nada máis estraño que
facer primeiro a suma $9 + 4$ e logo sumarlle $6$. Explicitamente, a operación
combinada é $(9+4)+6$, onde introducimos parénteses para deixar claro que
primeiro hai que realizar a primeira suma. En realidade, neste caso e na
maioría de exemplos que poidamos pensar, non fai falla poñer parénteses. A
necesidade de especificar ou no a preferencia á hora de actuar cunha mesma
operación #nota[Para operacións _distintas_, en cambio, falamos de propiedade
_distributiva_, que veremos máis adiante.] é o concepto fundamental de
_asociatividade_ que presentan a maioría de operacións que coñecemos, pero non
todas, como é o caso do produto de Lie nunha álxebra non asociativa. A
definición de asociatividade é a seguinte.

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

#notacion[
    É común atoparse con situacións como a da
    @ec:alxebra:asociatividade_xeneralizada pero onde a operación se repite no
    mesmo elemento. Podemos simplificar a escritura usando o concepto de
    _potencias_, repetir a mesma operación varias veces. En notación
    multiplicativa #cita("delgado_2010")

    $ underbrace(a * a * a * dots, "n veces") $

    escríbese simplemente como $a^n$, semellante a se fose unha potencia usual de
    números. E en notación aditiva

    $ underbrace(a + a + a + dots, "n veces") $

    simplifícase a $n a$, como se estivésemos a sumar un número varias veces. A
    maiores, en notación multiplicativa $a^n * a^m$ podemos simplificalo por
    $a^(n+m)$, e $(a^(n))^(m)$ é igual a $a^(n m)$, seguindo as nocións usuais de
    potencias de números [Cap.4 $section$2.3 Teo.2]#cita("kostrikin_1983"). En
    notación aditiva temos o análogo $n a+m a = (n+m)a$, e $m(n a) = n m a$.
]

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
independentes. Exemplo dunha operación conmutativa é o produto de números
reais, e de operación non conmutativa o produto de Poisson de funcións nun
espazo de fases.

// W Feit, representation theory of finite groups
// :FACER: elemento idempotente, e² = e
// :FACER: idempotentes ortogonais

Agora imos falar de dous elementos concretos que podemos ter nalgunhas
esturturas que serán de vital importancia no que ven: os elementos neutros e os
inversos. Non todas as estruturas os teñen, ás veces podemos ter un e non o
outro, ambos ou ningún.

#definicion(
    nome : "Elemento Neutro",
    ancora : "def:alxebra:neutro"
)[
    Nunha estrutura $(A,*)$, un elemento $e$ que cumpre
    $ (forall a in A) space.quad e * a = a * e = a.  $
    dise que é un elemento neutro.#indice[Elemento Neutro]
]

Un elemento neutro, ás veces chamado _identidade_, pode operarse con calquera
outro elemento sen afectalo de ningún modo. Esto será importante pola chamada
_regra do camelo_, que se resume en sumar 0 ou multiplicar por 1. Moitas veces
en matemáticas é útil esta conta porque nos permite cambiar a forma das
expresións.

#notacion[
    Nunha situación na que teñamos varios conxuntos $A, B, C, dots$ con
    respectivos neutros, podemos identificalos con subíndices para poder
    diferencialos, ousexa $e_A, e_B, e_C, dots$ Ás veces, na notación aditiva
    esribimos o neutro como $0$, e na notación multiplicativa como $1, bb(1)$
    ou $I$, evidentemente aludindo en ambos casos ao neutro da suma de números
    reais, 0, e ao do produto, 1. Podemos combinar notacións e escribir $1_A,
    bb(1)_B, 0_A dots$ como nos conveña. Cada libro usa seu propio estilo.
]

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
    Sexan $e,e'$ dous elementos neutros da operación $*$, entón

    $
        e = &e * e'      \
            &e * e' = e'.
    $

    É dicir, de ter dous neutros, estes son o mesmo elemento.
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

    dise que é o elemento inverso de $a$#indice[Elemento Inverso], e que o
    elemento $a$ é invertible.
]

#notacion[
    O elemento inverso de $a$ denótase como $-a$ na notación aditiva e por
    $a^(-1)$ na multiplicativa, aludindo, como sempre, aos casos numéricos
    coñecidos.
]

#teorema(
    nome : "Elemento inverso é único",
    ancora : "teo:alxebra:inverso_unico" // :FACER: ancoras con - e non _
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
        a^(-1) &= e*a^(-1) \
               &= (a'^(-1)*a)*a^(-1) \
               &= a'^(-1)*(a*a^(-1)) "(pola asociatividade)" \
               &= a'^(-1)*e \
               &= a'^(-1).
    $
    Ousexa, se temos un elemento inverso $a^(-1)$ entón outro elemento inverso
    $a'^(-1)$ é igual ao propio $a^(-1)$. O inverso é único.
]

O teorema @teo:alxebra:inverso_unico garante que podemos falar de $a^(-1)$,
senón, poderíamos ter varios inversos de $a$ distintos, como $a_1,a_2$ etc.

Podemos probar varios resultados cos novos conceptos de elementos neutros e
inversos.

#teorema(
    nome : "Inverso dun produto",
    ancora : "teo:alxebra:inverso-produto"
)[
    Sexa $(A,*)$ unha estrutura calquera onde $*$ é asociativa, existe neutro
    $e$ máis todos os elementos son invertibles. Entón,

    $
        (a*b)^(-1) = b^(-1)*a^(-1).
    $
]

#demostracion(
    ancora : "teo:alxebra:inverso-produto"
)[
    Pode demostrarse multiplicando $a*b$ pola esquera e pola
    dereita por $a^(-1)*b^(-1)$, o cal nos debe dar o neutro según a definición
    @def:alxebra:inverso.

    Pola esquerda,
    $
        (b^(-1)*a^(-1))*(a*b) = b^(-1)*(a*a^(-1))*b = \
        b^(-1)*e*b = b^(-1)*b = e.
    $

    E pola dereita,
    $
        (a*b)*(b^(-1)*a^(-1)) = a*(b*b^(-1))*a^(-1) = \
        a*e*a^(-1) = a*a^(-1) = e.
    $

    Polo tanto, $(b^(-1)*a^(-1))$ é o inverso de $a*b$,
    $
        (b^(-1)*a^(-1)) = (a*b)^(-1).
    $
]

Este teorema ás veces chámase _teorema de zapatos e calcetíns_ porque para
calzarnos primeiro poñemos os calcetíns e logo os zapatos pero para
descalzarnos quitamos primeiro os zapatos e logo os calcetíns. Para facer
énfase, o resultado @teo:alxebra:inverso-produto depende de que a estrutura que
teñamos nas mans teña unha operación asociativa, con neutro e con todos os
elementos invertibles. Un monoide, por exemplo, non sabe en que orde poñer e
quitar os zapatos e calcetíns, xa que nun monoide non todos os elementos son
invertibles e o resultado non se aplica. Os grupos, en cambio, si se saben calzar.

Ata agora limitámonos a falar dunha soa operación de cada vez, pero en
realidade nas estruturas que nos atopamos na física é normal ter varias
operacións polo que é relevante saber como se combinan. A noción de
_distributividade_ é o que nos permite combinar secuencialmente varias
operacións, en lugar dunha soa como na asociatividade.

#definicion(
    nome : "Operación distributiva",
    ancora : "def:alxebra:distributiva"
)[
    Sexa $(A,dot.o,*)$ unha estrutura con dúas operacións calquera $dot.o$ e $*$.
    Dicimos que a operación $dot.o$ #indice("Operación")[Distributiva] é
    distributiva respecto de $*$ se se cumpre que $(forall a,b,c in A)$

    $
        &a dot.o (b * c) = a dot.o b * a dot.o c \
        &(b * c) dot.o a = b dot.o a * c dot.o a.
    $
]

#notacion[
    Ás veces podemos referirnos a distributiva _pola esquerda_ ou _pola
    dereita_, no caso de que só se cumpra unha das condicións de
    #ref(<def:alxebra:distributiva>). Entón, unha operación é distributiva (a
    secas) se o é pola esquerda e pola dereita.
]

Do mesmo modo que na teoría de conxuntos existe o concepto de subconxunto, en
álxebra temos _subestruturas_. $B$ é un subconxunto de $A$ se calquera elemento
de $B$ está en $A$, pero agora temos $(A,*)$, que é un conxunto cunha operación
$*$ (sexa cal sexa, potencialmente varias), o cal é unha estrutura con
propiedades adicionais, como a asociatividade, existencia de neutro, ou
calquera outra definición desta sección. É natural esixir as mesmas propiedades
ás subestruturas.

#definicion(
    nome : "Sub Estrutura",
    ancora : "def:alxebra:subestrutura"
)[
    Sexa $(A,*)$ unha estrutura alxébrica calquera, co conxunto $A$ máis a
    operación $*$ (no caso xeral podemos ter máis conxuntos aparte de $A$ e
    máis operacións aparte de $*$). Sexa tamén un subconxunto arbitrario $B
    subset A$. A parella $(B,*)$ é unha subestrutura da estrutura de $(A,*)$ se
    se cumpren, en $B$, todas as condicións que se pedían para $(A,*)$

    - $(forall a,b in B) space.quad a * b in B$. (A operación $*$ é interna en B)
    - Se a operación $*$ é asociativa en $(A,*)$, tamén o é en $(B,*)$.
    - Se a operación $*$ é conmutativa en $(A,*)$, tamén o é en $(B,*)$.
    - Se existe un elemento neutro $e in (A,*)$, tamén está en $(B,*)$.
    - Se todo elemento ten inverso en $(A,*)$, tamén o ten en $(B,*)$.
    - etc.
]

#notacion[
    Cando a operación tamén é interna no subconxunto B soe dicirse que é
    #indice("Operación")[Cerrada] _cerrada_ ou que _cerra_ en B, que é o
    primeiro punto da definición @def:alxebra:subestrutura.
]

A definición @def:alxebra:subestrutura dinos que se sabemos as condicións que
satisfai unha estrutura de certo tipo, coma un monoide ou un anel, entón non
temos que aprender nada máis para saber se un subconxunto dos seus elementos é
tamén unha estrutura do mesmo tipo, coma un submonoide ou un subanel. Estes
deben cumprir as mesmas condicións. Nalgúns casos será posible simplificar a
demostración de varias propiedades demostrando unha relación diferente (como no
test de subgrupo @teo:alxebra:test_subgrupo), e en xeral, hai propiedades que
son totalmente evidentes e ninguén proba no campo de xogo nunca (e menos no
ámbito da física).

Logo de presentar multitude de propiedades _estáticas_, podemos pasar
finalmente a falar de aplicacións entre distintas estruturas. En xeral pode
construírse calquera mapa entre dúas estruturas pero son de especial
importancia as que teñen a seguinte propiedade, os chamados _homomorfismos_.

// :FACER: isomorfismos. homomorfismos con inversa homomorfismo. Ou bixección.
#definicion(
    nome : "Homomorfismo",
    ancora : "def:alxebra:morfismo"
)[
    Un #indice("Homomorfismo") homomorfismo entre dúas estruturas $(A,*)$ e
    $(B,plus.o)$ (do mesmo tipo) é unha aplicación calquera $f: A &
    arrow.r B$ que cumpre

    $
        f(a*b) = f(a) plus.o f(b).
    $

    A operación $a*b$ ocorre en $A$, e logo aplícaselle $f$; e a
    operación $plus.o$ ocorre en $B$, entre $f(a)$ e $f(b)$.
]

#notacion[
    Dise que a aplicación $f$ é un homomorfismo ou que é unha aplicación
    _homomorfa_. Ás veces poden cambiar algo os nomes dependendo das estruturas
    de traballo. No caso de ter unha parella de grupos ou aneis a un
    homomorfismo engadímoslle o apelido _de grupos_ ou _de aneis_
    respectivamente; no caso de espazos lineais os homomorfismos chámanse
    _aplicacións lineais_. No caso de tratar cun homomorfismo dunha estrutura
    en si mesma, é dicir $f:A arrow.r A$, dicimos que $f$ é un _endomorfismo_.
    En xeral, un homomorfismo sobrexectivo (@def:conxuntos:sobrexectividade)
    chámase _epimorfismo_; se fose inxectivo (@def:conxuntos:inxectividade),
    _monomorfismo_; e se fose ambos (@def:conxuntos:bixectividade),
    _isomorfismo_.
]

Un detalle importante sobre a definición @def:alxebra:morfismo. Supoñamos que
temos unha función $f$ como antes entre as estruturas $(A,*)$ e $(B,plus.o)$

$
    f:A frecha B.
$

Entón, dous elementos $x, y in A$ mapéanse como

$
    x mapea f(x)\
    y mapea f(y).
$

Vendo estas liñas podemos _a ollo_ multiplicalas e dicir que

$
    x*y mapea f(x) plus.o f(y),
$

tendo en conta que $x$ e $y$ se multiplican ca operación $*$ e $f(x)$ e $f(y)$
ca operación $plus.o$. Pero esto non é certo en xeral, xa que en realidade

$
    x*y mapea f(x*y).
$

Un homomorfismo é unha función $f$ onde esta especie de _composición_ (nun
sentido laxo da palabra) é posible. Soe dicirse que un homomorfismo $f$
_preserva a estrutura entre_ $(A,*)$ _e_ $(B,plus.o)$.

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

#teorema(
    nome : [$ker(f) = {e_A} sse f "é Inxectiva"$],
    ancora : "teo:alxebra:nucleo-unidade"
)[
    Sexa $f:A arrow.r B$ un morfismo calquera entre as estruturas $(A,+)$ e
    $(B,+)$, ambas con elemento neutro. #nota[Uso en ambas estruturas a mesma
    operación + por comodidade.] Entón,

    $ f "é inxectiva" sse ker(f) "só contén o neutro de A". $
]

#demostracion(
    ancora : "teo:alxebra:nucleo-unidade"
)[

    "$arrow.r.double$" #v(1em) // :FACER: atallo para isto

    Partimos de que $f$ é inxectiva.

    $
        f(e_A) = f(a-a) = f(a)-f(a) = e_B \
        implica f(e_A) = e_B \
        implica e_A in ker(f)
    $

    Pode ser que haxa outro
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
antes non eran posibles. O teorema @teo:alxebra:nucleo-unidade é unha forma
típica de demostrar se unha certa aplicación homomorfa entre dúas estruturas
con neutro é inxectiva ou non, sen ter que recorrer á definición de
inxectividade @def:conxuntos:inxectividade.

Os núcleos dos morfismos tomarán un papel protagonista entre os conxuntos
que imos a tratar neste capítulo. O motivo non é obvio de inmediato, pero
espero que o vaia sendo nas seccións seguintes.

Finalmente é o momento de falar de estruturas concretas. É típico que un
estudante de física se centre exclusivamente nos grupos, espazos lineais e
álxebras, sendo as últimas dúas definidas con pinceladas algo grandes. Os
espazos lineais son conteñen un grupo e un anel, e as álxebras dous aneis. O
motivo polo que me molesto en presentar un total de 8 estruturas é que as
grandes están compostas das pequenas e penso que tendo a imaxe completa é posible
organizar mellor as ideas. Polo menos para min.
