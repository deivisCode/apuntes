#pagebreak()
#import("/funcions.typ"): *

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

// :FACER: que notacion usaba Saborido??
- *Punto interior*. $x_0 in angstrom$ se $exists r > 0$ tal que $B(x_0,r)
  subset A$. É dicir, sempre podemos centrar unha bola en $x_0$ completamente
  contida en A. Por exemplo, en $QQ$, ningún punto pertence ao interior de
  $QQ$, xa que ao colocar unha bola en $x_0$, _sempre_ imos ter puntos $x in.not
  QQ$ para calqueira $r$.

- *Punto aislado*. $x_0 in "Aisl"(A)$ se $exists r > 0$ tal que
  $(B(x_0,r)-{x_0}) inter A = emptyset$. É dicir, o único punto de $A$ nunha
  bola centrada en $x_0$ é o propio punto $x_0$.

- *Punto fronteira*. $x_0 in "Fr"(A)$ se $forall r > 0$ $B(x_0,r) inter A
  eq.not emptyset, B(x_0,r) inter A^c eq.not emptyset$. É dicir, unha bola
  centrada en $x_0$ sempre contén puntos de $A$ e do seu complementario $A^c$

- *Punto adherente*. $x_0 in macron(A)$ se $forall r > 0$ $B(x_0,r) inter A
  eq.not emptyset$. É dicir, unha bola centrada en $x_0$ sempre ten puntos de $A$

- *Punto de acumulación*. $x_0 in A'$ se $forall r > 0$ $(B(x_0,r)-{x_0}) inter
  A eq.not emptyset$. É dicir, unha bola centrada en $x_0$ sempre contén algún
  punto de $A$ distinto de $x_0$

Topoloxías distintas da usual. Nestos casos non podemos usar a noción usual de
'estar dentro dunha bola'. Ditas bolas son simplemente os abertos na topoloxía
usual, pero noutra topoloxía os abertos son distintos. Para saber se un punto
pertence ou no á fronteira, adherencia, etc. hai que comprobar as definicións
anteriores pero cos abertos da topoloxía concreta en lugar de cas bolas

- *Trivial/Indiscreta*: ${emptyset, cal(X)}$

- *Discreta*: $ scr(P)(X) := {A | A subset cal(X)}$

- *Cofinita*: ${emptyset} union {A subset cal(X) "tal que" X - A "é finito"}$

- *Kolomogorov*: En $RR$ os abertos son ${emptyset, RR} union {(a,+oo) "con" a in RR}$

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
        (a,b) &mapea d(a,b)
    $

    Unha función que cumpre

    + $d(a,b) gt.eq 0$
    + $d(a,b) = 0 sse a = b $
    + $d(a,b) = d(b,a)$
    + $d(a,c) lt.eq d(a,b) + d(b,c)$ (Desigualdade triangular)

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
    calquera $f : (X,tau_X) frecha (Y,tau_Y)$. Dicimos que $f$ é unha
    #indice("Función")[Continua] función continua se

    $
        (forall U in tau_Y), space.quad f^(-1)(U) in tau_X
    $
]

Por exemplo, sexa $f: (X,tau_X) arrow.r (Y,tau_Y)$ dada por

$
    f(x) = cases(
        x "se" x lt.eq 0,
        0 "se" x gt 0
    )
$

con $tau_X, tau_Y$ a topoloxía cofinita. Entón podemos escoller $U := (-oo,0)
union (0,oo)$ cuxa antiimaxe é $f^(-1)(U) = (-oo,0) in.not tau_"COF"$, polo que
$f$ non é continua.
