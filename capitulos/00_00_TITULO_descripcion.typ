#import("/funcions.typ"): *

#capitulo(
    nome : "Topoloxía",
    ancora : "cap:topoloxia",
    epigrafe : [
        _Imos ter que poñerche puntos_
        #v(1fr)
        A Doutora a min, logo de cortarme unha perna cun cortasetos
    ],
)

#lorem(20)

Esto é unha cita no texto e na marxe #cita(<kostrikin_1983>)

#lorem(20)

#seccion(
    nome : "Teoremas e definicions",
    ancora : "sec:exemplo"
)

Como sabemos polo @cap:topoloxia :

#teorema(
    nome : "Fermat",
    ancora : "teo:fermat"
)[
    $ a^2 + b = 0 => a = 1 $ <ec:fermat1>
    $ a^2 + b = 0 => a = 1 $ <ec:fermat2>
]

#definicion(
    nome: "Espazo topoloxico",
    ancora: "def:espazo_topoloxico"
)[
    Un espazo topolóxico é un par $(X, tau)$ con $X$ un conxunto de puntos e
    $tau subset cal(P)(X)$ unha _topoloxía sobre_ $X$ que cumple as seguintes
    propiedades.

    + $X in tau, emptyset in tau$

    + $G_1, G_2 in tau => G_1 inter G_2 in tau$

    + ${G_alpha | alpha in J} in tau => display(union.big_(alpha in J)) G_alpha in tau$

    #h(1fr) #cita(<goldberg_1980>)
]

Tal e como vemos na @def:espazo_topoloxico e seguindo o @teo:fermat

Esto é unha palabra que vai ao indice, *mirade*!! #indice("Mirar")

E a ec @ec:fermat1
