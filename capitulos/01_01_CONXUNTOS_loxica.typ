#import("/funcions/texto.typ"): *
#import("/funcions/simbolos.typ"): *

#seccion(
    nome : "Introducción á lóxica matemática",
    ancora : "sec:conxuntos:loxica"
)

Antes de nada é preciso mencionar rápidamente varios conceptos de lóxica
matemática. Non me interesa afondar no tema máis aló das definicións e exemplos
dos conceptos máis importantes, que se usarán logo para as demostracións nas
seguintes seccións e capítulos.

A idea é formalizar enunciados (ou proposicións) usando símbolos (operadores
lóxicos) e traballar cunhas poucas regras para deducir resultados de verdade.
Enunciados como _á miña amiga gústalle comer mangos, polo que lle vou comprar
mangos_ é unha proposición que fala sobre unha causa (á miña amiga gústanlle os
mangos) que provoca un consecuente (eu mércolle mangos). A proposición pode ser
falsa ou verdadeira, o consecuente non tería por que ocorrer. Outros exemplos
de proposicións son "o río Sarela ten un paseo bonito", "un espazo vectorial
finito ten unha base", "2 != 3". Todas estas son _proposicións_, é dicir,
enunciados que se resolven cun valor de verdade, certo ou falso.

En matemáticas queremos simplificar as proposicións cunha linguaxe clara,
usando os chamados operadores lóxicos. Comezamos definindoos: @ariel_2000
- Disxunción: denotada por $or$. Se $P,Q$ son proposicións, a disxunción é
  outra propsición, $P or Q$ que é certa se, e so se, calquera de $P$ ou $Q$ o
  son.
- Conxunción: denotada por $and$. Se $P,Q$ son proposicións, a disxunción é
  outra propsición, $P and Q$ que é certa se, e so se, ambas $P$ e $Q$ o son. 
- Implicación: denotada por $implica$. Se $P,Q$ son dúas proposicións, a
  implicación $P implica Q$ é falsa se, e so se, o antecedente ($P$) é
  verdadeiro e o consecuente ($Q$) é falso.
- Doble implicación: denotada por $arrow.double.l.r$. Se $P,Q$ son dúas
  proposicións, a dobre implicación $P arrow.double.l.r$ é verdadeira se, e so
  se, ambas $P$ e $Q$ son simultaneamente verdadeiras ou falsas.
- Negacion: denotada por $not$. Se $P$ é unha proposición calquera, $not P$ é a
  proposición co valor de verdade oposto.

Con estas operacións podemos construír proposicións compostas a partir doutras
simples.

É posible mostrar o resultado destes operadores simples cunha chamada _táboa de
verdade_, onde mostramos por filas todos os posibles valores das proposicións
simples que compoñen un problema, e por columnas os valores das operacións
resultantes. Por exemplo, na seguinte táboa temos os valores de verdade dos
operadores mencionados onde 0 = verdadeiro e 1 = falso.

#{
    set align(center)
    table(
        columns:6,
        rows:5,
        stroke: none,
        [$P$] , [$Q$] , [$P or Q$] , [$P and Q$] , [$P implica Q$] , [$P arrow.double.l.r Q$] ,
        [1]   , [1]   , [1]        , [1]         , [1]             , [1]                      ,
        [1]   , [0]   , [1]        , [0]         , [0]             , [0]                      ,
        [0]   , [1]   , [1]        , [0]         , [1]             , [0]                      ,
        [0]   , [0]   , [0]        , [0]         , [1]             , [1]                      ,
    )
}

Un caso máis elaborado, para as proposicións $P,Q,R$:
$
    P or ( P and R ) arrow.double.l.r (P or Q) and (P or R)
$

#{
    set align(center)
    block(
        breakable: false,
        table(
            columns:7,
            rows:5,
            stroke: none,
            [$P$] , [$Q$] , [$R$] , [$P or (P and R)$] , [$(P or Q)$] , [$(P or R)$] , [$(P or Q) and (P or R)$] ,
            [0]   , [0]   , [0]   , [0]                , [0]          , [0]          , [0]                        ,
            [0]   , [0]   , [1]   , [0]                , [0]          , [1]          , [0]                        ,
            [0]   , [1]   , [0]   , [0]                , [1]          , [0]          , [0]                        ,
            [0]   , [1]   , [1]   , [0]                , [1]          , [1]          , [1]                        ,
            [1]   , [0]   , [0]   , [1]                , [1]          , [1]          , [1]                        ,
            [1]   , [0]   , [1]   , [1]                , [1]          , [1]          , [1]                        ,
            [1]   , [1]   , [0]   , [1]                , [1]          , [1]          , [1]                        ,
            [1]   , [1]   , [1]   , [1]                , [1]          , [1]          , [1]                        ,
        )
    )
}

Dicimos que unha proposición composta é unha _tautoloxía_ se é certa
independentemente do valor de verdade das propsicións simples que a compoñen.

Temos varios casos importantes de proposicións compostas:
- $P sse Q$ é o mesmo que dicir que, simultaneamente, $P implica Q$ e $Q
  implica P$.
- Discusión de casos. Se temos que
  $
    ((P implica R) and (Q implica R)) implica ((P or Q) implica R),
  $
  podemos tomar tipicamente $P = P, Q = not P$. Exemplo típico, a
  irracionalidade da torre de exponentes, $sqrt(2)^sqrt(2)^sqrt(2)$.
- Engadindo engades:
  $
    ((P implica Q) and P) implica Q.
  $
- Quitando quitas:
  $
    ((P implica Q) and not Q) implica not P.
  $
- Reducción ao absurdo. Probar $P$ demostrando que
  $
    not P implica Q and not Q,
  $
  (tendo en conta que $Q and not Q$ é unha tautoloxía).
  Dito doutro modo,
  $
    (not P implica (Q and not Q)) implica P.
  $
