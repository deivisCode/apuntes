#pagebreak()
#import("/funcions.typ"): *

#seccion(
    nome : "NOTAS",
    ancora : "sec:conxuntos:notas"
)


#rect(
    stroke: 1pt,
    text(
        size: 15pt,
        weight: "bold",
    )[SECCIÓN TEMPORAL PARA ANOTAR UNHAS CUANTAS COUSAS],
)

Unha noción de gran interese na teoría de conxuntos e, por extensión, en todas
as matemáticas é a de relación de equivalencia.

DEF. RELACION EQ.

Se temos unha relación de equivalencia, podemos falar de _clases de
equivalencia_ que son os conxuntos formados polos elementos que están
relacionados.

DEF. CLASE EQ.

Propiedades. Particións e tal.

En concreto, ao conxunto de todas as clases de equivalencia chámase _conxunto
cociente_.

DEF. CONXUNTO COCIENTE.

A realidade é que estas definición non son moi naturais así de primeiras. Por
sorte, podemos recurrir á física para obter algunha motivación.

Supoñamos que temos unha serie de sistemas termodinámicos #nota[Agora mesmo non
importa a definición exacta do que é un sistema termodinámico.] calquera que
podemos denotar por comodidade con letras do alfabeto (engadindo máis se fose
preciso) $A, B, C, dots, Z, A A, B B, dots $. Ditos sistemas poden ter
variedade de propiedades termodinámicas como distintas presións, volumes,
molaridades, concentracións, etc. Imos supoñer que de todas elas so nos
interesan as súas temperaturas. Podemos inventarnos unha relación de
equivalencia $~_E$ dicindo que dous sistemas están relacionados se están en
equilibrio térmico entre eles. Evidentemente, un sistema está en equilibrio
consigo mesmo, $A ~_E A$ (simetría); ademáis, Se $A$ está en equilibrio con
$B$, entón $B$ tamén o está con $A$, reflexividade; finalmente, o principio
cero di transitividadesdfasdf REMATAR.

Podemos ter centos ou incluso milleiros de sistemas termodinámicos de todo tipo
de orixes e con moitas outras propiedades físicas, algúns en equilibro entre
eles e outros non. Se estivésemos a facer unha caracterización de 1000 sistemas
e a única noción que nos interesase deles fose _cales están en equilibrio_
entón agruparíamos o milleiro de sistemas naqueles que están en equilibrio
termodinámico, pasando de 1000 sistema a un conxunto de p.e. so 17 grupos de
sistemas en equilibrio caracterizados por unha temperatura concreta #nota[A pesar de que a temperatura é un continuo, os
aparellos de medida están limitados a medir números racionais e por riba, con
poucos díxitos. Inda que tivésemos centos de miles de sistemas, ao final
teríamos _non tantas_ temperaturas distintas medibles]. De feito, é razoable pasar de traballar con 1000 datos a so con 17, se simplemente nos interesan ditas 17 temperaturas.

As agrupacións de sistemas por dita relación son evidentemente as clases de
equivalencia que se mencionaron antes. E o conxunto novo de 17 elementos é o
conxunto cociente. En matemáticas úsase constantemente este truco no cal un
certo conxunto é _demasiado grande_ ou seus elementos teñen _información que
non nos interesa_. Podemos inventarnos unha relación de equivalencia, e
traballar simplemente cas clases. en vez de traballar x y z, traballamos [x]
[y] [z]

MIRAR Rotman tamén
