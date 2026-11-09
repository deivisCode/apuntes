#import("/funcions/texto.typ"): *
#import("/funcions/simbolos.typ"): *

#capitulo(
    nome : "Álxebra Multilineal",
    ancora : "cap:alxebra-multilineal",
)

#seccion(
    nome : "Introdución",
    ancora : "sec:alxebra-multilineal:introducion"
)

Na álxebra lineal centrámonos en aplicación lineais entre $KK$-espazos lineais

$
    f: A frecha B
$

e en formas lineais de ditos espazos no seu corpo,

$
    omega: A frecha KK.
$

Pero existe (e é común) a situación na cal partimos de parellas (ternas, ou
máis) de espazos lineais, a outro espazo lineal (ou ao seu corpo, no caso de
formas),

$
    F    : A_1 times A_2 times dots A_n frecha B,\
    alpha: A_1 times A_2 times dots A_n frecha KK.
$

Na álxebra lineal temos multitude de resultados: tradución das propiedades das
aplicacións en matrices, existencia de base, teorema espectral, teoremas de
isomorfía, etc. Estamos nun punto no que sería moi cómodo poder traballar no
caso xeral, cun número arbitrario de copias $A_1 times A_2 times dots A_n$ de
partida. Poderíamos analizar os casos individuais (bilineal, trilineal, etc.) e
intentar obter resultados específicos, o cal faremos para o caso bilineal nunha
sección posterior, pero poderíamos construír un obxecto matemático co cal
abarcásemos todos os casos.

Por un lado, a situación xenérica de formas multilineais nun corpo,

$
    F: A_1 times A_2 times dots A_n frecha B.
$ <ec:alxebra-multilineal:exemplo-forma-multilineal>

E por outro, un espazo vectorial novo, que se comporte como un produto de
espazos. Debe terse en conta que o produto cartesiano de espazos é máis unha
asociación ca un produto (por exemplo, a dimensión é a suma e non o produto) e
as aplicación deste noutro conxunto son multilineais, polo que dalgún modo non
combina _correctamente_ distintos espazos nun so.

$
    A_1 times.o A_2 times.o dots A_2
$ <ec:alxebra-multilineal:exemplo-produto-tensorial-espazos>

Veremos que os obxectos @ec:alxebra-multilineal:exemplo-forma-multilineal e
@ec:alxebra-multilineal:exemplo-produto-tensorial-espazos en realidade son
duais, sendo o primeiro a formulación común e introdutoria dos espazos
tensoriais común en física e matemáticas, e a segunda unha definición algo máis
elaborada.


Poderemos traballar cun obxecto $T_p^q (E)$, o cal, dependendo do valor dos
índices $p,q$ será idéntico a un espazo lineal, ao seu corpo, ao dual, ás
formas bilineais, ou estruturas máis complexas. Ademais da comodidade de poder
traballar con distintas construccións simplemente manipulando índices, farémolo
usando resultados _xa coñecidos_ da álxebra lineal. A álxebra multilineal
consiste niso. Simplificar as construccións multilineais para reducilar ao caso
lineal ben coñecido.
