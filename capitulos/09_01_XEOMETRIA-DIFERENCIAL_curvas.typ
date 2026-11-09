#import("/funcions/texto.typ"): *
#import("/funcions/simbolos.typ"): *

#seccion(
    nome : "Curvas",
    ancora : "sec:xeometria-diferencial:curvas"
)

O obxecto xeométrico máis simple que nos interesa é unha curva normal e
corrente. Un mero fío sen grosor cunha forma arbitraria. ¿Como podemos definilo
matematicamente? Calquera estudante coñecerá a definición de curva como unha
aplicación dun intervalo compacto $I := [0,1]$ no espazo Euclídeo $RR^2$

$
    alpha: I &frecha RR^2 \
           t &mapea alpha (t).
$

Esto en realidade é unha curva _de Peano_ #indice("Curva")[De Peano], e é unha
doutras posibles definicións. Que haxa varias definición é un indicio de que
algo falla neste caso, e resulta que é certo: esta definición de curva non
basta. Por exemplo, sexan as curvas

$
    alpha (t) = (cos(t), sin(t)) \
    beta (t) = (cos(5t), sin(5t)).
$ <exp:xeometria-diferencial:curvas-iguais>

As funcións $alpha$ e $beta$ son distintas, pero realmente representan o mesmo
obxecto xeométrico, o que nós entendemos por _curva_, os puntos $(x,y) in RR^2$
que forma unha circunferencia de radio $1$. Este conxunto de puntos non é máis
ca imaxe (Def. @def:conxuntos:imaxe) da nosa aplicación de $I$ a $RR^2$, que
neste caso chamaremos _traza_. Entón, ¿podemos ter distintas aplicacións
$alpha$ para representar o mesmo obxecto? É posible. As propiedades xeométricas
son intrínsecas dos puntos da circunferencia, non importa que escolla fagamos
de $alpha$. O relevante é a traza.

// :FACER:
// Explicitar h(0) = 0
// curvas pechadas, h(s1)-> r

A única diferenza entre $alpha$ e $beta$ é que o seu parámetro é distinto,
podemos pasar dunha función á outra cun _cambio de variable_ (máis adiante
falaremos disto en detalle) que non é máis ca unha función $h:I arrow I$
bixectiva e continua. En concreto temos que $beta = alpha(h(t))$ con $h(t) =
5t$.

En xeral dicimos que dúas curvas de Peano son equivalentes,
$alpha rel beta$, se existe o $h$ tal que $beta = alpha compose h$. As clases
de equivalencia, $[alpha]$ desta relación serán todas as aplicacións que teñen
a mesma semellanza cas das ecuacións @exp:xeometria-diferencial:curvas-iguais.
Esto motívanos a dicir que unha curva _é_ a clase de equivalencia $[alpha]$
desta relación, e unha aplicación concreta $alpha$ é un representante
específico. Esto alivia a idea de que o obxecto xeométrico que hai detrás é o
mesmo e non nos importa se pasamos por exemplo de $t mapsto 5t$ como no exemplo
anterior, pero falta un detalle: ¿onde está a suavidade?

- Suavidade
- Curvas pechadas
- Velocidade, lonxitude
- Superficies
