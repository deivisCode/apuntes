#import("/funcions/texto.typ"): *
#import("/funcions/simbolos.typ"): *

#seccion(
    nome : "Álxebra",
    ancora : "sec:alxebra:alxebra"
)

Nas seccións anteriores centrámonos en presentar as nocións xerais que
comparten as distintas estruturas alxébricas e como se constrúen estas. Podería
dicir que eran unha mera introdución á álxebra con resultados comúns.

Agora miraremos en maior detalle varios resultados máis elaborados.

#teorema(
    nome : "Primeiro teorema de isomorfismos de grupos",
    ancora : "teo:alxebra:isomorfismos-primeiro"
)[
    Sexan $A,B$ grupos e $f: A arrow.r B$ un homomorfismo de grupos. Entón,

    $
        A\/ker(f) tilde.equiv f^"IM" (A).
    $

    É dicir, o cociente de $A$ co kérnel de $f$ é isomorfo á imaxe de $f$.
]

#imaxe(
    nome : "/.pdf/03_ALXEBRA_FIG_01_teorema-isomorfismos.pdf",
    pe : [
        Cun diagrama, Polo teorema @teo:alxebra:isomorfismos-primeiro podemos
        dicir que existe a función $phi$ e que é un isomorfismo.
    ]
)

// :FACER: esto está ben?
// :FACER: meter esto en capitulo de álxebra. O actual sería 'intro á alxebra'. Ou tel vez, continuar con seccións logo da de estruturas
#exemplos[

    - Sexa $cal(C)^oo (RR)$ o conxunto de funcións reais, continuas e
      derivables. Xunto ca operación suma usual de funcións, este conxunto é
      un grupo, onde o neutro é a función $0$, e o inverso dunha función
      calquera $F$ é $-F$. Agora deixo de escribir $(RR)$ para simplificar a
      notación. Sexa $D: cal(C)^oo arrow.r cal(C)^oo$ a aplicación _derivada_
      usual $F mapsto D(F) = f$. Esta aplicación é un homomorfismo de grupos
      porque $D(f + g) = D(f) + D(g)$. Pero non é un isomorfismo, xa que

      $
          D(f) = D(f + C_1) = D(f + C_2) = dots = f,
      $ <ec:alxebra:derivada-noninxectiva>

      onde $C_i$ son constantes, polo que $D$ non é inxectiva e polo tanto non
      é un isomorfismo. Podemos aplicar directamente o teorema
      @teo:alxebra:isomorfismos-primeiro

      $
        cal(C)^oo\/ker(D) tilde.equiv D^"IM" (cal(C)^oo)
      $

      e escribir unha a unha as partes que compoñen a expresión. Os elementos
      da imaxe son

      $
        D^"IM" (cal(C)^oo)
        = {f in cal(C)^oo | exists F in cal(C)^oo, "e" f = D(F)},
      $

      o kérnel é unha función constante calquera

      $
        ker(D) = {F in cal(C)^oo | D(F) = 0} = {C},
      $

      e o cociente é

      $
        cal(C)^oo\/ker(D) = {F + ker(D)} = {F + C}.
      $

      O que nos di o primeiro teorema dos isomorfismos de grupos é que os
      conxuntos $cal(C)^oo\/ker(D)$ e $D^"IM" (cal(C)^oo)$ son isomorfos,
      ousexa que

      $
        { F + C } tilde.equiv { f }.
      $

      Que sexan isomorfos significa que a cada elemento dun dos conxuntos
      correspóndelle un, e so un, elemento do outro. Que curioso, esto non é
      máis que dicir que para calquera función $f$, a súa antiderivada é $F$
      máis unha constante $C$.

]

A idea fundamental do teorema @teo:alxebra:isomorfismos-primeiro é que _sempre_
que teñamos un homomorfismo entre grupos podemos atopar un isomorfismo
nalgures. Pero imos concretar un pouco máis, apoiándonos nos exemplos
anteriores. Sexan $A,B$ grupos calesqueira e $f:A arrow.r B$ un homomorfismo de
grupos pero non un isomorfismo. Os motivos polos que $f$ non é isomorfismo é
que ou ben a función non é sobrexectiva ou non é inxectiva, ou ambos.

A sobrexectividade é fácil de tratar, xa que nos podemos limitar a estudar
outro espazo de chegada razonable, concretamente á imaxe da propia función $f$.
Así, temos que a función $f_2:A ->> f^"IM" (A)$ é sobrexectiva. Ollo, chameille
$f_2$ porque inda que a función pode ser idéntica estamos a cambiar os espazos
de partida e de chegada. É o mesmo que se temos a función $f: RR arrow.r RR$
dada por $f(x) = x^2$ (que non é sobrexectiva), e logo nos limitamos a $f_2: RR
->> RR^+$ dada tamén por $f_2(x) = x^2$ (que si que é sobrexectiva). Volvendo
ao punto, podemos obter sempre unha función sobrexectiva $f_2$ a partir dunha
que non o é limitándonos a un rango igual que a imaxe de $f$.

A inxectividade tamén se pode traballar. Podemos cambiar o espazo de partida
$A$ polo cociente $A\/ker(f) = { a + k, k in ker(f) }$ e usar a función $f_2:
A\/ker(f) -> B$, polo que agora o _novo kérnel_ é

$
    ker(f_2) = { alpha in A\/ker(f) | f_2(alpha) = 0}.
$

Facendo a conta, sabendo que os elementos do cociente son da forma $alpha = a +
k$, con $a in A$ e $k in ker(f)$,

$
    f_2(alpha) = 0 &implica f_2(a + k) = 0 \
                   &implica f_2(a) + f_2(k) = 0 \
                   &implica f_2(a) = 0
$

// :FACER: rematar demostracion
... AQUI FALLA ALGO.

Polo tanto, a función $f_2$ é inxectiva. Para resumir, fixemos os pasos

- $f:A -> B$, nin inxectiva nin sobrexectiva
- $f_2:A ->> f^"IM" (f)$, sobrexectiva pero non inxectiva
- $f_3:A\/ker(f) arrow.r.hook B$, inxectiva pero non sobrexectiva

Combinando todo, temos que a función

$
    f_4 : A\/ker(f) frecha f^"IM" (f)
$

é un isomorfismo, que é o teorema @teo:alxebra:isomorfismos-primeiro. Esto non
é máis que unha forma de atopar un isomorfismo _sempre_ que teñamos un
homomorfismo. Se a función de partida xa é un isomorfirmo, entón non imos obter
moita información nova, como no caso de $f:RR -> RR^+$, $f(x) = e^x$. Sin
embargo, no caso do exemplo ca aplicación derivada, ésta era sobrexectiva pero
non era un isomorfismo xa que había varios elementos que se mapeaban ao mesmo
sitio (ec. @ec:alxebra:derivada-noninxectiva), é dicir, non era inxectiva. Por
reemplazar o espazo de chegada co cociente, obtivemos unha aplicación isomorfa.

Sobra dicir que os isomorfismos son de relevancia _extrema_, xa que dalgún modo
nos permiten dicir que dous conxuntos son iguais, ou polo menos
_suficientemente iguais_. A seguridade para atopar estas funcións que nos da o
teorema @teo:alxebra:isomorfismos-primeiro debería facer feliz a calquera
persona que lea esto.
