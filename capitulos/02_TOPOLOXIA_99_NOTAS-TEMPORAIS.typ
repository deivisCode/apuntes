#pagebreak()
#import("/funcions/simbolos.typ"): *
#import("/funcions/texto.typ"): *

#seccion(
    nome : "NOTAS",
    ancora : "sec:topoloxia:notas"
)


#rect(
    stroke: 1pt,
    text(
        size: 15pt,
        weight: "bold",
    )[SECCIÓN TEMPORAL PARA ANOTAR UNHAS CUANTAS COUSAS],
)

Tipos de puntos nun conxunto A, supoñendo que temos definida unha distancia

- *Punto interior*. $x_0 in angstrom$ se $exists r > 0$ tal que $B(x_0,r)
  subset A$. É dicir, sempre podemos centrar unha bola en $x_0$ completamente
  contida en A. Por exemplo, en $QQ$, ningún punto pertence ao interior de
  $QQ$, xa que ao colocar unha bola en $x_0$, _sempre_ imos ter puntos $x in.not
  QQ$ para calqueira $r$. Ás veces o interior tamén se denota por $"Int"(A)$

- *Punto aislado*. $x_0 in "Aisl"(A)$ se $exists r > 0$ tal que
  $(B(x_0,r)-{x_0}) inter A = emptyset$. É dicir, o único punto de $A$ nunha
  bola centrada en $x_0$ é o propio punto $x_0$.

- *Punto fronteira*. $x_0 in "Fr"(A)$ se $forall r > 0$ $B(x_0,r) inter A
  eq.not emptyset, B(x_0,r) inter A^c eq.not emptyset$. É dicir, unha bola
  centrada en $x_0$ sempre contén puntos de $A$ e do seu complementario $A^c$.
  Ás veces, o conxunto de puntos da fronteira tamén se denota por $partial A$

- *Punto adherente*. $x_0 in macron(A)$ se $forall r > 0$ $B(x_0,r) inter A
  eq.not emptyset$. É dicir, unha bola centrada en $x_0$ sempre ten puntos de $A$.
  Ás veces a adherencia tamén se denota por $"Cl"(A)$

- *Punto de acumulación*. $x_0 in A'$ se $forall r > 0$ $(B(x_0,r)-{x_0}) inter
  A eq.not emptyset$. É dicir, unha bola centrada en $x_0$ sempre contén algún
  punto de $A$ distinto de $x_0$

Topoloxías distintas da usual. Nestos casos non podemos usar a noción usual de
estar dentro dunha bola. Ditas bolas son simplemente os abertos na topoloxía
usual, pero noutra topoloxía os abertos son distintos. Para saber se un punto
pertence ou no á fronteira, adherencia, etc. hai que comprobar as definicións
anteriores pero cos abertos da topoloxía concreta en lugar de cas bolas
// :FACER: Casos xerais destas topos? e.g. sen RR

- *Usual*: $tau_"U" := {(a,b), (-oo,c), (d, oo)}$. Ousexa, os intervalos
  abertos típicos en $RR$

- *Trivial/Indiscreta*: $tau_"IND" := {emptyset, X}$. Unha topoloxía moi
  simple na cal o único aberto ao que pode pertence un punto é o propio $X$

- *Discreta*: $tau_"DIS" := scr(P)(X) := {A | A subset X}$. Neste caso, un
  conxunto dun so punto da forma ${x}$ é un aberto.

- *Cofinita*: $tau_"COF" := {emptyset} union {A subset X "tal que" X - A
  "é finito"}$. Os abertos son os conxuntos cuxo complementario é finito. Por
  exemplo, $RR - {1,2,3}$ xa que o complementario é $RR - (RR - {1,2,3}) =
  {1,2,3}$

- *Kolomogorov*: $tau_"K" := {emptyset, RR} union {(a,+oo) "con" a in RR}$

- *Sen nome*. $tau_alpha := { [p, q) in RR | p < q, space.quad p,q in QQ}$

Comparación de topoloxías:

Podemos comparar topoloxías comprobando se unha está contida noutra. Sexan
$tau_U$, $tau_("COF")$ e $tau_K$ as topoloxías Usual, Cofinita e Kolmogorov
respectivamente. Entón $tau_K subset tau_U$, $tau_"COF" subset tau_U$, etc.
Dicimos que $tau$ é _mais fina_ ca $beta$, escribimos $tau lt.eq beta$, se $tau
subset beta$ [Def. 7.53]#cita("masa_2019"), e de xeito similar, que $beta$ é
_menos fina_ ca $tau$

Distancias: [Def. 6.1]#cita("masa_2019")

#definicion(
    nome : "Métrica",
    ancora : "def:topoloxia:metrica"
)[
    Sexa $X$ un conxunto calquera e

    $
        d: X times X &frecha RR \
        (a,b) &mapea d(a,b).
    $

    unha función que cumpre

    + $d(a,b) gt.eq 0$.
    + $d(a,b) = 0 sse a = b $.
    + $d(a,b) = d(b,a)$.
    + $d(a,c) lt.eq d(a,b) + d(b,c)$. (Desigualdade triangular)

    dise que é unha #indice("Métrica") métrica ou #indice("Distancia")
    distancia en $X$

]

#definicion(
    nome : "Espazo Métrico",
    ancora : "def:topoloxia:espazo-metrico"
)[
    A parella $(X, d)$ onde $X$ é un conxunto calquera e $d$ unha distancia é
    un #indice("Espazo")[Métrico] espazo métrico.
]

#definicion(
    nome : "Funcion Continua",
    ancora : "def:topoloxia:funcion-continua"
)[
    Sexan os espazos topolóxicos $(X,tau_X)$ e $(Y,tau_Y)$ e unha función
    calquera $f : (X,tau_X) arrow.r (Y,tau_Y)$. Dicimos que $f$ é unha
    #indice("Función")[Continua] función continua se

    $
        (forall U in tau_Y) space.quad f^(-1)(U) in tau_X.
    $

    É dicir, a antiimaxe de calquera aberto tamén é aberta
]

Por exemplo, sexa $f: (X,tau_X) arrow.r (Y,tau_Y)$ dada por

$
    f(x) = cases(
        x "se" x lt.eq 0.,
        0 "se" x gt 0.
    )
$

con $tau_X, tau_Y$ a topoloxía cofinita. Entón podemos escoller $U := (-oo,0)
union (0,oo)$ cuxa antiimaxe é $f^(-1)(U) = (-oo,0) in.not tau_"COF"$, polo que
$f$ non é continua.

#definicion(
    nome : "Funcion Aberta",
    ancora : "def:topoloxia:funcion-aberta"
)[
    Sexan os espazos topolóxicos $(X,tau_X)$ e $(Y,tau_Y)$ e unha función
    calquera $f : (X,tau_X) arrow.r (Y,tau_Y)$. Dicimos que $f$ é unha
    #indice("Función")[Aberta] función aberta se

    $
        (forall U in tau_X) space.quad f(U) in tau_Y.
    $

    É dicir, a imaxe de calquera aberto é aberta
]

Ollo! A definición é moi parecida á de función continua
@def:topoloxia:funcion-continua !

#exemplos[
    Sexa a funcion $f(x) = -abs(x)$ e ambos espazos topolóxicos $RR$ ca
    topoloxía usual. Calquera intervalo aberto $U = (a,b) in tau_u$ pasa a outro
    intervalo tamén aberto $f(U) = (f(a), f(b)) in tau_u $, polo que a función é
    aberta. #nota[Esto digoo a ollo, dame reparo probalo]

    A función $f:(RR,tau_K) arrow.r (RR,tau_K)$ definida por

    $
        f(x) = cases(
            -x &"se" x lt 0.,
            2  &"se" x gt.eq 0.
        )
    $

    non é aberta porque os abertos $U = (a, oo) in tau_K$ pasan a

    $
        f(U) = cases(
            (a, oo) union {2} "se" a lt 0.,
                          {2} "se" a gt.eq 0.
        )
    $

    e en ningún caso é aberto.
]

#definicion(
    nome : "Funcion Pechada",
    ancora : "def:topoloxia:funcion-pechada"
)[
    Sexan os espazos topolóxicos $(X,tau_X)$ e $(Y,tau_Y)$ e unha función
    calquera $f : (X,tau_X) arrow.r (Y,tau_Y)$. Dicimos que $f$ é unha
    #indice("Función")[Pechada] función pechada se

    $
        (forall U "pechado") space.quad f(U) "é pechado en" (Y,tau_Y).
    $
]

#exemplos[
    A funcion $f:(RR,tau_K) arrow.r (RR,tau_K)$ definida por $f(x) = abs(x)$ non é
    pechada porque o caso concreto $U = (-oo,1] $ pechado ten como imaxe o conxunto
    $f(U) = [0,oo)$ que non é pechado.
]

#definicion(
    nome : "Homeomorfismo",
    ancora : "def:topoloxia:homeomorfismo"
)[
    Sexan os espazos topolóxicos $(X,tau_X)$ e $(Y,tau_Y)$ e unha función
    calquera $f : (X,tau_X) arrow.r (Y,tau_Y)$. Dicimos que $f$ é un
    #indice("Homeomorfismo") homeomorfismo se

    + $f$ é bixectiva.
    + $f$ é continua.
    + $f^(-1)$ é continua.
]


#teorema(
    nome : "Definicións equivalentes de Homeomorfismo",
    ancora : "def:topoloxia:equivalencia-homeomorfismo"
)[
    A definición @def:topoloxia:homeomorfismo é equivalente ás seguintes

    Por un lado:
    + $f$ é bixectiva.
    + $f$ é continua.
    + $f^(-1)$ é aberta.

    Por outro:
    + $f$ é bixectiva.
    + $f$ é continua.
    + $f^(-1)$ é pechada.
]

#definicion(
    nome : "Espazos Homeomorfos",
    ancora : "def:topoloxia:espazos-homeomorfos"
)[
    Sexan os espazos topolóxicos $(X,tau_X)$ e $(Y,tau_Y)$. Se existe un
    homeomorfismo $f$ entre ambos espazos entón dicimos que son
    #indice("Espazo")[Homeomorfo] homeomorfos.
]

#definicion(
    nome : "Invariante topolóxica",
    ancora : "def:topoloxia:invariante-topoloxica"
)[
    Sexan os espazos topolóxicos homeomorfos $(X,tau_X)$ e $(Y,tau_Y)$. Sexa
    unha certa propiedade $P$ dun espazo topolóxico como a compacidade,
    conexión, Hausdorf, etc. que se cumple en $(X,tau_X)$. Se ao cumplirse $P$
    en $(X,tau_X)$ tamén se cumple $P$ en $(Y,tau_Y)$, entón dicimos que $P$ é
    unha #indice("Invariante")[Topolóxica] invariante topolóxica.

    É dicir, son propiedades dun espazo topolóxico que se preservan entre
    espazos homeomorfos.
]

Podemos usar esta definición á inversa. Se temos dous espazos topolóxicos con
propiedades topolóxicas distintas (e.g. un deles é Hausdorff e outro non) entón
temos asegurado que ditos espazos non son homeomorfos

#definicion(
    nome : "Topoloxía produto",
    ancora : "def:topoloxia:topoloxia-produto"
)[
    FACER
]

#definicion(
    nome : "Continuidade na topoloxia produto",
    ancora : "def:topoloxia:continuidade-produto"
)[
    FACER
]

#definicion(
    nome : "Espazo de Hausdorff",
    ancora : "def:topoloxia:hausdorff"
)[
    Sexa $(X,tau)$ un espazo topolóxico calquera. Dicimos que é de _Hausdorff_
    #indice("Espazo")[Hausdorff] se se cumpre que

    $
        (forall a,b in tau) "con" a eq.not b, space.quad \
        exists U,V in tau, "onde"
            a in U,
            b in V
        "e" (U inter V) = emptyset.
    $

    É dicir, para calquera parella de puntos, podemos atopar dous abertos que
    conteñen a cada un pero que non se intersecan.

]

#exemplos[
    - $(RR, tau_"U")$ é de Hausdorff. Para calquera parella de puntos $a,b in RR$
      sempre podemos atopar sendas bólas abertas centradas neles e de radios $r =
      |a - b|\/ 3$.

    - $(RR, tau_"IND")$ Non é de Hausdorf, porque os únicos abertos que poden
      conter respectivamente a $a$ e $b$ son $RR$, polo que non hai $U$ e $V$
      disxuntos.

    - $(RR,tau_"K")$ Non é de Hausdorff. Sexan $a in (x, oo) = U$, $b in (y,oo) = V$. Se $x > y$ entón $U
      inter V = (x, oo) eq.not emptyset$

    - $(RR,tau_"DIS")$ Si é de Hausdorff. Sexan $x in {x} = U, y in {y} = V$, entón
      $U inter V = emptyset$.
]

Ser de Hausdorff é unha propiedade topolóxica.
