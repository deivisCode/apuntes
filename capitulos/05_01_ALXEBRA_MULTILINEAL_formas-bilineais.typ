#import("/funcions/texto.typ"): *
#import("/funcions/simbolos.typ"): *

#seccion(
    nome : "Formas Bilineais",
    ancora : "sec:alxebra-multilineal:formas-bilineais"
)

#definicion(
    nome: "Forma bilineal",
    ancora: "def:alxebra-multilineal:forma-bilineal",
)[
    Sexan $A, B$ dous $KK$-espazos lineais de dimensión finita. Unha función
    $phi: A times B -> KK$ é bilineal se cumpre as seguintes propiedades,
    $forall a, a' in A$, $forall b, b' in B$, $forall lambda in KK$.

    + Linealidade na primeira compoñente:
      $ phi.alt(a + a', b) = phi.alt(a, b) + phi.alt(a', b) $
    + Linealidade na segunda compoñente:
      $ phi.alt(a, b + b') = phi.alt(a, b) + phi.alt(a, b') $
    + Homoxeneidade en ambas compoñentes:
      $ phi.alt(lambda a, b) = phi.alt(a, lambda b) = lambda phi.alt(a, b) $
]

#definicion(
    nome: "Produto escalar",
    ancora: "def:alxebra-multilineal:produto-escalar",
)[
    Sexa $A$ un $KK$-espazo lineal, $phi.alt: E times E -> RR$ unha forma
    bilineal. Dicimos que $phi.alt$ é un produto escalar se cumpre as
    propiedades seguintes.

    + Simetría:
    $ (forall a, a' in A) space.quad phi.alt(a, a') = phi.alt(a', a) $
    + Definida positiva:
    $ (forall a in A) space.quad phi.alt(a, a) > 0 $
]

#definicion(
    nome: "Forma sesquilineal",
    ancora: "def:alxebra-multilineal:forma-sesquilineal",
)[
    // :FACER: decidir sobre a, a_1, a_2, a', a'', in A, B, C, etc.
    Sexa $A$ un $CC$-espazo lineal, e $phi.alt: A times A -> CC$ unha
    aplicación calquera. Dicimos que é _sesquilineal_ se cumpre as seguintes
    propiedades.

    + Linealidade na primeira compoñente:
      $ phi.alt(a + b, c) = phi.alt(a, c) + phi.alt(b, c) $
    + Homoxeneidade conxugada na segunda compoñente:
      $ phi.alt(a, lambda b) = dash(lambda) phi.alt(a, b) $
]

#definicion(
    nome: "Produto Hermítico",
    ancora: "def:alxebra-multilineal:produto-hermitico",
)[
    Sexa $A$ un $CC$-espazo lineal, e $phi.alt: A times A -> CC$ unha forma
    sesquilineal. Dicimos que $phi.alt$ é un produto hermítico se cumpre as
    seguintes propiedades.

    + Hermiticidade (ou _simetría conxugada_):
      $ (forall a, a' in A) space.quad phi.alt(a, a') = dash(phi.alt(a', a)) $
    + Definida positiva:
      $ (forall a in A) space.quad phi.alt(a, a) in RR, phi.alt(a, a) > 0 $

]

#definicion(
    nome: "Produto interno",
    ancora: "def:alxebra-multilineal:produto-interno",
)[
    Sexa $V$ un $KK$-espazo lineal. Unha aplicación $chevron.l dot, dot,
    chevron.r: V times V -> KK$ dise que é un produto interno se cumpre as
    seguintes propiedades.

    + Definida:
      $ (forall a in V) space.quad chevron.l a, a chevron.r = 0 <=> a = 0 $
    + Definida positiva:
      $ (forall a in V) space.quad chevron.l a, a chevron.r >= 0  $
    + Linealidade na primeira compoñente:
      $
          (forall a, b, c in V) space.quad
          phi.alt(a + b, c) = phi.alt(a, c) + phi.alt(b, c)
      $
    + Homoxeneidade na primeira compoñente:
      $ phi.alt(lambda a, b) = lambda phi.alt(a, b) $
    + Hermiticidade:
      $ (forall a, a' in A) space.quad phi.alt(a, a') = dash(phi.alt(a', a)) $

]

Podemos ver que as definicións de produto escalar
@def:alxebra-multilineal:produto-escalar e de produto hermítico
@def:alxebra-multilineal:produto-hermitico son casos concretos da definición de
produto interno @def:alxebra-multilineal:produto-interno. Nesta última
definición, sen $KK = RR$, as propiedades 3 e 5 garanten que é unha forma
bilineal, as 1 e 2 que é definida positiva, e 5 que é simétrica, xa que por ser
un espazo real, $phi.alt(a, a') = dash(phi.alt(a', a)) =^(in RR) phi.alt(a',
a)$. Polo tanto, un produto escalar é un caso concreto de produto interno. Por
outro lado, as propiedades 3,4 e 5 garanten que é unha forma sesquilineal, as
propiedades 1 e 2 que é definida positiva, e a propiedade 5 que é hermítica. É
dicir, un produto hermítico é un caso concreto de produto interno.

#notacion[
    En xeral usaremos a notación $chevron.l dot, dot chevron.r$ para denotar
    un produto interno, sexa escalar ou hermítico. Tamén é posible usar a
    notación punto, $dot$, como en $a dot b$, pero prefiro reservala para casos
    concretos de produtos escalares e hermíticos simples (os produtos usuais).
]

#imaxe(
    nome : "/.pdf/05_ALXEBRA-MULTILINEAL_FIG_01_produtos-e-espazos.pdf",
    pe : [A composición dunha función ca súa inversa é a función identidade.]
)

// :FACER:
- DEFS: espazo euclidiano e hermítico, normas
