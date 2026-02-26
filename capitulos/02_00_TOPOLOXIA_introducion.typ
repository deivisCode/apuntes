#import("/funcions/texto.typ"): *
#import("/funcions/simbolos.typ"): *

#capitulo(
    nome : "Topoloxía",
    ancora : "cap:topoloxia",
    epigrafe : [
        _Imos ter que poñerche puntos_
        #v(1fr)
        A Doutora a min, logo de cortarme unha perna cun cortasetos
    ],
)

#seccion(
    nome : "Introdución",
    ancora : "sec:topoloxia:introducion"
)

Calquera obxecto que usemos en física necesita algún tipo de _soporte_ no
sentido máis intuitivo da palabra. Por exemplo, e sen ir máis lexos, podemos
asignar a cada punto do espazo un vector obtendo un campo vectorial. Pero que é
este espazo que usamos de _soporte_? Pode polo xeral é o espazo Euclídeo
$RR^3$, pola contra no campo da gravitación pasamos a traballar cun espazo
$RR^4$ (con algunha propiedade adicional). Cal é o caso xeral? Queremos unha
noción de _espazo_ que sexa simple pero que nos permita falar sobre as nocións
usuais de localidade (estar moi preto dalgures); que nos permita pasar dun
punto a outro (continuidade); que nos permita saber se dito espazo está xunto
ou está separado en partes (conexión); nalgúns casos que nos ofreza unha noción
de distancia; e no caso xeral, que teña as nocións que intuitivamente lle
requeriríamos a un #quote[espazo] no cal podemos _colocar_ outros obxectos.

Unha forma de velo (que entenderemos mellor na sección @sec:simetria:xeometria)
é como o resultado do espazo Euclídeo pero se lle quitamos as propiedades
euclídeas, ousexa $RR^3$ usual pero sen nocións de distancia ou ángulos. O
espazo de interese é un _espazo topolóxico_ que dalgún modo é un espazo
xeométrico usual pero sin nocións de xeometría.

A maiores vannos interesar uns espazos con propiedades engadidas, as chamadas
_variedades topolóxicas_, que son espazos topolóxicos nos cales se pode falar
de que, localmente, o espazo é parecido a $RR^d$, o cal é moi útil porque
$RR^d$ é un espazo co que se pode tratar fácilmente.
