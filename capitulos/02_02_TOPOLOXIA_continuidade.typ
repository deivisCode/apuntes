#import("/funcions/texto.typ"): *
#import("/funcions/simbolos.typ"): *

#seccion(
    nome : "Continuidade",
    ancora : "sec:topoloxia:continuidade"
)

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
