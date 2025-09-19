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

- *Cofinita*: (REMIRAR)

- *Kolomogorov*: (REMIRAR)

// :AQUI:
