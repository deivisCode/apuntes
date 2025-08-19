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
$+ * · dot.circle$ ou o que veña en mente ao escribir.

A pesar de que existen infinidade de símbolos, úsanse 2 estilos claramente
diferenciados. Na notación *aditiva* úsanse símbolos que asemellan os da suma,
como $+ plus.circle$, e as operacións escríbense completas, como $a+b$ ou $a
plus.circle b$. Na notación *multiplicativa* úsanse símbolos que asemellan a
multiplicación, como $times * dot$, e a operación pode escribirse con símbolo
explícito ou sen el, $a * b$, $a b$. Tamén veremos algunha diferencia entre
ambas notacións máis adiante ao falar de asociatividade.


#definicion(
    nome : "Estrutura Alxébrica",
    ancora : "def:alxebra:estrutura"
)[
    A parella $(A,plus.circle)$ formada _polo menos_ por un conxunto arbitrario
    $A$ máis unha operación calquera definida neste $plus.circle$ é unha
    estrutura alxébrica #indice[Estrutura Alxébrica].
]

Nesta definición, digo _polo menos_ porque é posible ter máis conxuntos e máis
operacións. Por exemplo, no caso dunha Álxebra de Lie, o número ascende a
5 operacións en 2 conxuntos diferentes. Nestes casos soe usarse notación
multiplicativa e aditiva en distintas operacións.

#definicion(
    nome: "Asociatividade",
    ancora : "def:alxebra:asociatividade"
)[
    Dicimos que unha operación nunha estrutura calquera $(A,*)$ é asociativa
    #indice("Operación")[asociativa] se se cumpre que
    $a * (b * c) = (a * b) * c$ para calquera $a,b,c in A$
]

Se unha operación é asociativa, non só o é en 3 elementos, senón en xeral. Pode
verse unha demostración en [$section 1.3$]#cita(<kostrikin_1983>). Isto
significa que a asociatividade nos permite eliminar completamente os parénteses
de calquera expresión como

$ a * ((b * c) * ((d * e) * f)) = a * b * c * d * e * f $
#label("ec:alxebra:asociatividade_xeneralizada")

É común atoparse con situacións como a da
@ec:alxebra:asociatividade_xeneralizada pero onde a operación se repite no
mesmo elemento. Podemos simplificar a escritura usando *potencias*. En notación
multiplicativa

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
    $a * b = b * a$ para calquera $a,b in A$.
]

É dicir, podemos operar cunha parella de elementos en calquera orde. É
importante mencionar que asociatividade e conmutatividade son propiedades
independentes.

#definicion(
    nome : "Elemento Neutro",
    ancora : "def:alxebra:neutro"
)[
    Nunha estrutura $(A,*)$, un elemento $e$ que cumpre
    $ e * a = a * e = a, forall a in A $
    dise que é un elemento neutro.#indice[Elemento Neutro]
]

Un elemento neutro, ás veces chamado _identidade_, pode operarse con calquera
outro elemento sen afectalo de ningún modo.

#teorema(
    nome : "Elemento neutro é único",
    ancora : "teo:alxebra:neutro_unico"
)[
    Sexa $(A,*)$ unha estrutura alxébrica calquera. Se existe un elemento
    neutro, entón é único.

    Sexan $e,e'$ dous elementos neutros.

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
    $ a * y = y * a = e $
    dise que é o elemento inverso de $a$ #indice[Elemento Inverso]
]

// :FACER: conceptos básicos, inverso é único
O elemento inverso de $a$ denótase como $-a$ na notación aditiva e por $a^(-1)$
na multiplicativa.

#definicion(
    nome : "Sub Estrutura",
    ancora : "def:alxebra:subestrutura"
)[
    Sexa $(A,*)$ unha estrutura alxébrica calquera, co conxunto $A$ máis a
    operación $*$. Sexa tamén un subconxunto arbitrario $B in A$. A parella
    $(B,*)$ é unha subestrutura da estrutura de $(A,*)$ se se cumpren, en $B$,
    todas as condicións que se pedían para $(A,*)$

    - $a * b in B, forall a,b in B$ (a operación $*$ é interna)
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

// :FACER: morfismo, algunha explicación a maiores
// :FACER: neutro pasa ao neutro, inverso ao inverso, kernel.. ?
