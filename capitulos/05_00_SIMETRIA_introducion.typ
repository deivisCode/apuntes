#import("/funcions/texto.typ"): *
#import("/funcions/simbolos.typ"): *

#capitulo(
    nome : "Simetría",
    ancora : "cap:simetria"
)

#seccion(
    nome : "Introdución",
    ancora : "sec:simetria:introduccion"
)

No capítulo @cap:alxebra presentamos variedade de estruturas alxébricas e en
concreto na sección @sec:alxebra:grupos vimos o concepto de grupo. Esto foi
unha presentación pouco motivada e posiblemente abstracta en exceso. Os grupos
son estruturas que aparecen de xeito natural na física, polo que inda que unha
presentación abstracta é útil para coñecer vocabulario e conceptos básicos, ou
para afianzar as ideas para traballar en conceptos máis avanzados no futuro,
dita abstracción elimina case todo o contido físico que a nós nos interesa. Un
grupo é a estrutura que gaña no equilibrio entre potencia e simpleza, non é
máis ca un conxunto cunha operación que se pode facer nun sentido e no oposto.

Historicamente aparecen ao estudar as transformacións de conxuntos. Supoñamos
que temos un obxecto físico calquera máis un conxunto de transformación no
espazo, por exemplo as transformación paralelas. Dalgún modo podemos facer
_actuar_ ditas transformacións sobre noso obxecto: podemos movelo nun sentido,
no oposto, e sempre podemos non movelo (que é igual a movelo nun sentido e
inmediatamente facer o movemento oposto). Ditas transformacións forman un
grupo, e é de interese estudar como se pode actuar con ditas transformación nun
conxunto.

Indo máis alá, un mesmo grupo pode actuar sobre distintos conxuntos escollidos
debidamente, que poden ser espazos ou variedades topolóxicas, espazos lineais,
ou mesmamente conxuntos sen estrutura adicional. A noción abstracta do caítulo
@cap:alxebra sobre os grupos pode concretarse ao _representalos_ actuando sobre
distintos conxuntos. Este é o fundamento da teoría de representacións que
veremos ao final deste capítulo.

Curiosamente outra aplicación dos grupos é a de caracterizar a simetría. Pero
que é a simetría, ou mellor dito, que fai que algo (un obxecto común calquera)
sexa simétrico? Unha primeira definición pode ser que #quote[Un obxecto é
simétrico se ten unhas proporcións harmoniosas]. Con _proporcións_ refírome as
relacións entre áreas, perímetros, anchos, altos, longuras, etc. Un folio
cadrado é simétrico porque ten proporcións perfectas nos lados, todos miden o
mesmo. Pasa igual cas súas diagonais. Un papel típico A4 mide 210 mm (595.28pt)
de ancho e 297mm (841.89pt) de alto#nota[1pt ~ 0.35 mm. Os puntos (pt) son unha
unidade típica no ámbito da tipografía.] polo que as proporcións encaixan algo
peor (pero é un tamaño útil, ao dobrar un papel A4 pola metade obtemos outro
papel cas mesmas proporcións exactamente). Ter unhas proporcións
#quote[harmoniosas] non nos garante que algo sexa simétrico, pero tal vez que
algo é dalgún modo fermoso. Outra posible definición, pode ser #quote[Un
obxecto é simétrico se podes miralo dende distintos puntos de vista e se ve
igual]. Esta definición xa nos permite dicir que un cadrado é máis simétrico ca
un papel A4, xa que o cadrado podemos velo dende moitos puntos de vista e sigue
parecendo igual. Concretamente, hai 8 deses puntos de vista. Podemos miralo do
lado dereito, superior, esquerdo e inferior e vese igual. Podemos _invertilo_
(imaxinade que lle dades a volta a un papel cadrado na mesa, facendo que a
parte posterior pasa a estar agora apuntando cara nós), e volver mirar dende a
dereita, lado superior, lado esquerdo, e lado inferior. Un rectángulo xenérico
non ten tantos puntos de vista posibles. O problema desta definición é que
involucra, dalgún modo, a unha persoa _mirando_ un obxecto _real_. Podemos
abstraer os detalles e dicir que #quote[Un obxecto é simétrico se podemos
actuar sobre el dalgún modo sen modificalo]. O significado concreto de
_modificar_ dependerá do contexto; a idea de _actuar_ é simplemente a de
transformar o noso obxecto. No caso do cadrado, substituímos a idea de mirar
dende distintos ángulos polo de _movelo_, en concreto rotándoo 0º, 90º, 180º e
270º, así como aplicarlle unha inversión, e logo repetir as rotacións. O
resultado de calquera destas accións deixa o cadrado indistinguible do
orixinal. Un obxecto é máis simétrico cantas máis accións lle poidamos aplicar
deixando o obxecto coma o orixinal. A relación da simetría cos grupos é que
ditas accións teñen a estrutura de grupo _sempre_. Podemos combinar as
rotacións de 90º e 180º e obtemos a de 270º; podemos _non rotar_, que é o mesmo
que rotar 0º; e podemos rotar unha cantidade e logo a oposta. Esta era a
definición informal de grupo da sección @sec:alxebra:grupos.
