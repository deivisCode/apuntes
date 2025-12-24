#import("/funcions/texto.typ"): *
#import("/funcions/simbolos.typ"): *

#seccion(
    nome : "Relacións",
    ancora : "sec:conxuntos:relacions"
)

Unha noción de gran interese na teoría de conxuntos e, por extensión, en todas
as matemáticas é a de relación de equivalencia. A grandes trazos é unha maneira
de dicir se dous obxectos son os mesmos baixo algunha restrición concreta. Por
exemplo, podemos inventarnos unha certa relación de equivalencia (máis adiante
veremos que deben satisfacer certas propiedades) entre dous obxectos físicos se
están en equilibrio térmico entre eles. Os obxectos non son iguais, pero
podemos esquecernos e pensar exclusivamente na relación ca que esteamos a
tratar. A igualdade usual, escrita $=$, tamén é unha relación de equivalencia,
polo que dalgún modo estas xeneralizan o que significa que dúas cousas sexan
iguais.

Antes de nada, unha definición preliminar.

#definicion(
    nome : "Relación Binaria",
    ancora : "def:conxuntos:relacion-binaria"
)[
    Sexan $A,B$ conxuntos calquera. Unha #indice("Relación")[Binaria] relación
    binaria (ou simplemente relación) de $A$ a $B$ é un subconxunto calquera $R
    subset A times B$.
]

Se $A = B$ dicimos simplemente que $R$ é unha relación en $A$. Dicimos que dous
elementos $a in A, b in B$ están _relacionados_ pola relación $R$ se $(a, b) in
R$. Se $a$ e $b$ están relacionados, tamén se soe escribir #nota[Faise un truco
notacional parecido na álxebra, véxase a expresión
@exp:alxebra:posicion-simbolos]

$
    (a,b) in R stretch(arrow.r)^"símb. entre elementos"
    a R b stretch(arrow.r)^"símb. especial"
    a rel^R b.
$ <exp:contuntos:posicion-simbolos>

Tamén se soe escribir $a rel_R$ ou simplemente $a rel b$ no caso de
sobreentender cal é a relación $R$. Tamén se pode dicir directamente que $rel$
é o mesmo que $R$.

Existen moitos tipos de relacións, como as de _orde_ que dan lugar ao estudo de
retícular, pero nós centraremos o noso interese (polo de agora) nas de
equivalencia.

#definicion(
    nome : "Relación de equivalencia",
    ancora : "def:conxuntos:relacion-equivalencia"
)[
    Sexan $A$ un conxunto calquera. Unha #indice("Relación")[de Equivalencia]
    relación de equivalencia en $A$ é unha relación $R$ na que se cumpren
    as seguintes propiedades:

    + Reflexividade, (un elemento está sempre relacionado consigo mesmo)
      $ (forall a in A) space.quad a rel a. $
    + Simetría, (se un elemento está relacionado con outro, entón o outro está
      relacionado co un)
      $ (forall a,b in A) space.quad a rel b implica b rel a. $
    + Transitividade,
      $ (forall a,b,c in A) space.quad a rel b, space b rel c implica a rel c. $
]

Usando a notación de conxuntos orixinal, as propiedades anteriores son
+ $(forall a in A) space.quad (a,a) in R$
+ $(forall a,b in A) space.quad (a,b) in R implica (b,a) in R$.
+ $(forall a,b,c in A) space.quad (a,b) in R, (b,c) in R implica (a,c) in R$

Se temos unha relación de equivalencia, podemos falar de _clases de
equivalencia_ que son os conxuntos formados polos elementos que están
relacionados.

#definicion(
    nome : "Clases de equivalencia",
    ancora : "def:conxuntos:clases-equivalencia"
)[
    Sexa $A$ un conxunto calquera, $a in A$, e $rel$ unha relación de
    equivalencia en A. O conxunto de todos os elementos de $A$ que están
    relacionados con $a$ chámase #indice("Clase")[de Equivalencia] clase de
    equivalencia de $a$ e denótase por $[a]$. É dicir, o conxunto

    $
        [a] := {b in A | b rel a}.
    $
]

Diremos que $a$ é o representante da clase de equivalencia $[a]$.

// :FACER: PROPIEDADES. PARTICIÓNS E TAL.

En concreto, ao conxunto de todas as clases de equivalencia chámase _conxunto
cociente_.

#definicion(
    nome : "Conxunto cociente",
    ancora : "def:conxuntos:conxunto-cociente"
)[
    Sexa $A$ un conxunto calquera e $rel$ unha relación de equivalencia en $A$.
    O conxunto de todas as clases laterais chámase
    #indice("Conxunto")[Cociente] conxunto cociente e denótase por $A\/rel$. É
    dicir, o conxunto

    $
        A\/rel := { [b] | b in A }.
    $
]

A realidade é que estas definicións non son moi naturais así de primeiras. Por
sorte, podemos recorrer á física para obter algunha motivación. Supoñamos que
temos unha serie de sistemas termodinámicos #nota[Agora mesmo non importa a
definición exacta do que é un sistema termodinámico.] calquera que podemos
denotar por comodidade con letras do alfabeto (engadindo máis se fose preciso)
$A, B, C, dots, Z, A A, B B, dots $. Ditos sistemas poden ter variedade de
propiedades termodinámicas como distintas presións, volumes, molaridades,
concentracións, etc. Imos supoñer que de todas elas so nos interesan as súas
temperaturas. Podemos inventarnos unha relación de equivalencia $rel$ dicindo
que dous sistemas están relacionados se están en equilibrio térmico entre eles.
Evidentemente, un sistema está en equilibrio consigo mesmo, $A rel A$
(simetría); ademais, se $A$ está en equilibrio con $B$, entón $B$ tamén o está
con $A$, (reflexividade); finalmente, o principio cero da termodinámica
garántenos que se $A$ está en equilibrio térmico con $B$, e $B$ o está con $C$,
entón $A$ está en equilibrio con $C$, $A rel B, B rel C implica A rel C$
(transitividade). #nota[Si, o principio cero da termodinámica non é máis que
unha de transitividade.] Podemos ter centos ou incluso milleiros de sistemas
termodinámicos de todo tipo con orixes dispares e con moitas outras propiedades
físicas, algúns en equilibro entre eles e outros non. Se estivésemos a facer
unha caracterización de p.e. 1000 sistemas e a única noción que nos interesase
deles fose _cales están en equilibrio_ entón agruparíamos o milleiro de
sistemas naqueles que están en equilibrio termodinámico, pasando de 1000
sistema a un conxunto de p.e. so 17 grupos de sistemas en equilibrio
caracterizados por unha temperatura concreta (supoñendo que no milleiro de
sistemas so diferenciamos 17 temperaturas distintas) #nota[A pesar de que a
temperatura é un continuo, os aparellos de medida están limitados a medir
números racionais e por riba, con poucos díxitos. Inda que tivésemos centos de
miles de sistemas, ao final teríamos _non tantas_ temperaturas distintas
medibles]. De feito, é razoable pasar de traballar con 1000 datos a so con 17,
se simplemente nos interesan ditas 17 temperaturas. As agrupacións de sistemas
pola relación $rel$ son evidentemente as clases de equivalencia que se
mencionaron na definición @def:conxuntos:clases-equivalencia. E o conxunto novo
de 17 elementos é o conxunto cociente.

En matemáticas úsase constantemente este truco no cal un certo conxunto é
_demasiado grande_ ou seus elementos teñen _información que non nos interesa_.
Podemos inventarnos unha relación de equivalencia, e traballar simplemente cas
clases. Ao fin e ao cabo, baixo unha certa relación de equivalencia os
elementos dun conxunto son, dalgún modo, equivalentes, polo que podemos
esquecernos da súa individualidade e tratar cos conxuntos de elementos
equivalentes como se ditos conxuntos fosen elementos en si.

// :FACER: Relacions de orde
// :FACER: mencionar que hai cocientes doutras cousas onde se engaden
//         requisitos adicionais, como no caso dos cocientes de grupos (que se fan
//         sobre subgrupos normais)
