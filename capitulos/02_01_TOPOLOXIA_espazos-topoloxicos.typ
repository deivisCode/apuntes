#import("/funcions/texto.typ"): *
#import("/funcions/simbolos.typ"): *

#seccion(
    nome : "Espazos Topolóxicos",
    ancora : "sec:topoloxia:espazos-topoloxicos"
)

Un dos conceptos máis básicos na topoloxía é o dunha _topoloxía_ #nota[Sí, a
rama das matemáticas chámase _topoloxía_, e o concepto que mostro agora,
tamén.]. A idea básica é simple, unha _topoloxía_ é un conxunto de conxuntos
abertos. Por exemplo, na recta real $RR$, o conxunto de abertos $(a-1,a+1)$
forma unha topoloxía. Intuitivamente, para calquera punto do noso conxunto,
queremos ter asegurado que temos un aberto que o contén, o cal é o primeiro
paso para falar sequera do concepto de _localidade_. Como imos falar de algo
_local_ se non sabemos que ten a seu aredor?

En realidade, podemos definir primeiro os conxuntos abertos e logo unha
topoloxía como o conxunto destes (como acabo de facer); ou definir unha
topoloxía, e dicir que os seus elementos son o que chamamos conxuntos abertos.
O segundo caso é o seguinte: #cita("goldberg_1980")

#definicion(
    nome : "Topoloxía",
    ancora : "def:topoloxia:topoloxia"
)[
    Sexa $X$ un conxunto calquera, e $tau subset scr(P)(X)$. Dicimos que $tau$
    é unha #indice("Topoloxía") topoloxía en $X$ se se cumpre:

    + $X,emptyset in tau$.
    + $A,B in tau arrow.r.double A inter B in tau$.
    + ${A_i | i in I} subset tau arrow.r.double (union_(i in I) A_i) in tau$.

]

Ollo, a intersección é dun número _finito_ de elementos, pero a unión dun
número arbitrario e pode que _infinito_ de elementos. #nota[Non é de todo
relevante para nós a distinción dos casos finito e infinito.] A segunda
propiedade dinos que a interescción dun número _finito_ de elementos da
topoloxía tamén pertence a $tau$, e a terceira que a unión _infinita_ tamén o
fai.

#notacion[
    Os elementos de $tau$ chámanse #indice("Conxunto")[Aberto] conxuntos
    abertos, ou simplemente abertos.
]
// :FACER: como saber cando un conxunto é aberto?

As propiedades da definición @def:topoloxia:topoloxia non son máis co caso
xeral das nocións que xa coñecemos dos conxuntos abertos, pero sen limitarnos a
casos necesariamente xeométricos ou visuais.

#exemplos[
    - *Topoloxía usual*, con $a,b,c,d in RR$,
      $ tau_"U" := {(a,b), (-oo,c), (d, oo)}. $
      Ousexa, os intervalos abertos típicos en $RR$.

    - *Topoloxía Trivial/Indiscreta*, para calquera conxunto $X$,
      $ tau_"IND" := {emptyset, X}. $
      Unha topoloxía moi simple na cal o único aberto ao que pode pertence un
      punto é o propio $X$. Dalgún modo, é unha topoloxía moi _grosa_.

    - *Topoloxía discreta*, para calquera conxunto $X$,
      $ tau_"DIS" := scr(P)(X) := {A | A subset X}. $
      Neste caso, un conxunto dun so punto da forma ${x}$ é un aberto. Dalgún
      modo, é unha topoloxía moi _fina_.

    - *Topoloxía Cofinita*,
      $ tau_"COF" := {emptyset} union {A subset RR "tal que" RR - A "é finito"}. $
      Os abertos son os conxuntos cuxo complementario é finito. Por exemplo,
      $RR - {1,2,3}$ xa que o complementario é $RR - (RR - {1,2,3}) = {1,2,3}$.

    - *Topoloxía Kolomogorov*,
      $ tau_"K" := {emptyset, RR} union {(a,+oo) "con" a in RR}. $

    - *Sen nome*,
      $ tau_alpha := { [p, q) in RR | p < q, space.quad p,q in QQ} $
]

#notacion[
    Seguindo estes exemplos é posible falar de topoloxías máis finas ou máis
    grosas ca outras. Dicimos que $tau$ é _mais fina_ ca $beta$, escribimos
    $tau lt.eq beta$, se $tau subset beta$ [Def. 7.53]#cita("masa_2019"), e de
    xeito similar, que $beta$ é _menos fina_ ca $tau$. Por exemplo, con
    $tau_U$, $tau_("COF")$ e $tau_K$ as topoloxías Usual, Cofinita e Kolmogorov
    respectivamente; entón $tau_K subset tau_U$, $tau_"COF" subset tau_U$, polo
    que $tau_K lt.eq tau_U$, e $tau_"COF" lt.eq tau_U$.
]


#definicion(
    nome : "Espazo topolóxico",
    ancora : "def:topoloxia:espazo-topoloxico"
)[
    A parella $(X,tau)$ onde $X$ é un conxunto arbitrario e $tau$ unha
    topoloxía sobre $X$, é un #indice("Espazo")[Topolóxico] espazo topolóxico.
]

#definicion(
    nome : "Conxuntos pechados",
    ancora : "def:topoloxia:pechados"
)[
    Sexa $X$ un conxunto calquera, e $F subset scr(P)(X)$. Dicimos que $F$
    son conxuntos pechados se

    + $X,emptyset in F$.
    + $A,B in F arrow.r.double A union B in F$.
    + ${A_i | i in I} subset F arrow.r.double (inter_(i in I) A_i) in F$.
]

A definición é idéntica á de topoloxía (conxuntos abertos) pero mudando as
condicións para a unión e a intersección de elementos. Outra condición
equivalente para saber se un conxunto é pechado é que seu complementario sexa
aberto, e viceversa. Un conxunto pode ser aberto, pechado, ambos o nada.


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
    nome : "Topoloxía Inducida",
    ancora : "def:topoloxia:topoloxia-inducida"
)[
    FACER
]

// :FACER:1: Redactar e facer xeral para abertos
Finalmente, podemos clasificar os puntos nun espazo topolóxico.

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
