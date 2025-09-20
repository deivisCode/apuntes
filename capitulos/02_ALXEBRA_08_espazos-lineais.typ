#import("/funcions.typ"): *

#seccion(
    nome : "Espazos Lineais",
    ancora : "sec:alxebra:espazos"
)

Case no final deste camiño presentamos unha das estruturas máis ubicuas, o
espazo lineal (ou _vectorial_). #nota[Persoalmente prefiro falar de espazo
_lineal_ en lugar de _vectorial_. En moitos casos o segundo nome suxire
unha interpretación xeométrica (as típicas _frechas_), o cal só é razoable
en casos moi concretos, polo que prefiro esquivalo.]

#definicion(
    nome : "Espazo Lineal",
    ancora : "def:alxebra:espazo-lineal"
)[
    Sexa $(E,plus.circle)$ un grupo abeliano, $(A,+,dot)$ un campo, e
    $circle.stroked.tiny$ unha operación $circle.stroked.tiny: E times A
    arrow.r E$. A terna formada por ditos tres obxectos é un
    #indice("Espazo")[lineal] espazo lineal ou #indice("Espazo")[Vectorial]
    vectorial:

    $
        ((E,plus.circle),(A,+,dot),circle.stroked.tiny)
    $

    É dicir, un módulo, pero en lugar do anel temos un campo.

    Os elementos de $E$ chamámolos #indice("Vector") vectores e os de $A$
    #indice("Escalar") escalares.
]

// :FACER: k circ v -> v debe ser pola esquerda e pola dereita

No caso xeral soe denotarse ao conxunto do grupo como $V$, en alusión ao
concepto de vector; e ao conxunto do campo usando unha letra dobre, como $KK$.
Ademais, a operación do grupo soe ser $+$ e a primeira do campo $+$ tamén,
abusando da notación (son operacións distintas). A operación
$circle.stroked.tiny$ soe omitirse, polo que $k circle.stroked.tiny v, v in V,
k in KK$ escríbese simplemente como $k v$. Finalmente, referímonos a
$((V,+),(KK,+,dot),circle.stroked.tiny)$ simplemente como o espazo lineal
$(V,KK,+)$, un _$KK$-espazo lineal_ ou un _espazo lineal sobre $KK$_. No límite
de abusar da notación, referirémonos ao espazo lineal só polo nome do grupo,
$V$, ou ás veces dito nome e o campo como subíndice $V_KK$.

Exemplos de espazos lineais:

- O conxunto ${a cos(x), a in RR}$ #nota[$0.3cos(x), 9cos(x), \ pi cos(x),
  -3cos(x), dots, "etc."$] ca suma de funcións usual $3cos(x) + 7cos(x) =
  10cos(x)$ é un grupo. Ademais, $(RR,+,dot)$ é un campo. Se escollemos a
  operación entre vectores e escalares de xeito que $k circle.stroked.tiny
  (a.cos(x)) = (k a)cos(x)$, entón dito conxunto de cosenos, co campo dos
  reais e a operación indicada, é un espazo lineal. Evidentemente este espazo
  non ten unha interpretación "gráfica" ou "visual" evidente, inda así cada
  elemento da forma $3cos(x)$ é un vector.

- O conxunto de ternas $(x,y,z)$ con $x,y,x in RR$ ca operación de suma usual,
  é dicir $(x,y,z) + (a,b,c) = (x+a, y+b, c+z)$ é un grupo. Se temos o campo
  dos reais $RR$, e a operación entre $RR$ e as ternas definida como $k (x,y,z) =
  (k x,k y,k z)$ entón, temos un espazo vectorial
  $((RR^3,+),(KK,+,dot),circle.stroked.tiny)$. Neste caso, os vectores si teñen
  unha interpretación xeométrica evidente.

En ambos exemplo temos vectores, máis so no segundo teñen unha semellanza ca
xeometría (concretamente, frechas en $RR^3$). En física é común facer énfase no
segundo caso, usándoo como exemplo para explicar conceptos en calquera nivel e
situación. Eu, pra evitar confusións, vou seguir *sempre* unha notación
concreta:

+ *Vector* será un elemento dun espazo lineal no sentido presentado.
+ *Vector xeométrico* será o concepto de vector que se usa na física, cunha
  clara compoñente xeométrica.

A distinción será especialmente evidente no caso da álxebra multilineal, onde
aparecerá o concepto de _tensor_, que é un caso concreto dos vectores, pero
xeral dos vectores xeométricos.

// :AQUI:
#definicion(
    nome : "Subespazo lineal",
    ancora : "def:alxebra:subesapazo-lineal"
)[
    Sexa $((V,+),(KK,+,dot),circle.stroked.tiny)$ un espazo lineal calquera, e
    $W subset V$.
]

+ Subespazos
+ Clases laterais
+ Homomorfismos de espazos lineais (aplicacións lineais)
+ Kernel e tal
