#import("/funcions.typ"): *

#seccion(
    nome : "Aneis e Campos",
    ancora : "sec:alxebra:aneis"
)

Agora imos dar un cambio radical e presentar varias estruturas con _varias_
operacións.

#definicion(
    nome : "Anel",
    ancora : "def:alxebra:anel"
)[
    Unha terna $(A,+,dot)$ onde as operación cumpren

    - $+$ é unha operación interna e asociativa
    - Existe un elemento neutro da operación $+$
    - Todos os elementos son invertibles respecto de $+$
    - A operación $dot$ é interna
    - A operación $dot$ é distributiva respecto de $+$

    dise que é un #indice("anel")anel. É dicir, unha terna $(A,+,dot)$ onde
    $(A,+)$ é un grupo, $(A,dot)$ é un magma, e as operacións son distributivas.
]

Podemos referirnos simplemente ao anel como $A$. Se a operación $dot$ é
conmutativa dicimos que o anel é conmutativo.

// :FACER: mais exemplos de aneis
// :FACER: nos exemplos usar + ou - nas listas??
#exemplos[
    + Sexa $M_(n times n)$ o conxunto de matrices cadradas de tamaño $n times n$,
    onde temos as operacións de suma $+$ e produto $dot$ usuais de matrices.
    O conxunto $(M_(n times n), +, dot)$ é un anel
]

Ca práctica acumulada presentando diferentes estruturas, non será nada
sorprendente a definición de _subanel_.

#definicion(
    nome : "Subanel",
    ancora : "def:alxebra:subanel"
)[
    Sexa $(A,+,dot)$ un anel e $B subset A$. Entón, $(B,+,dot)$ é un subanel de
    $(A,+,dot)$ se
    $
        (forall b_1, b_2 in B) space.quad b_1 + b_2 in B \
        0 in B "(o neutro da suma)"\
        (forall b in B) space.quad -b in B\
        (forall b_1, b_2 in B) space.quad b_1 dot b_2 in B
    $
    É dicir, $(B,+)$ é un subgrupo de $(A,+)$ e $(B,dot)$ é un submagma de
    $(A,dot)$
]

En realidade poderíamos falar ao final de subsemigrupo [Cap #math.section
4]#cita("kostrikin_1983"), pero prefiro presentar primeiro o caso sen
asociatividade; a extensión é directa. Poden simplifcarse as 3 primeiras
condicións e dicir simplemente que $b_1 - b_2 in B$ e que $b_1 dot b_2 in B$,
onde a primeira condición non é máis que o test de subgrupo do teorema
@teo:alxebra:test_subgrupo con notación aditiva. A diferenza das seccións cunha
soa operación, non me vou molestar en crear unha sección por cada nova
propiedade que presente, inda que a idea é a mesma que nas seccións
@sec:alxebra:magmas ata @sec:alxebra:grupos, por exemplo cas subestruturas,
conmutatividade, etc.

#definicion(
    nome : "Anel Asociativo",
    ancora : "def:alxebra:anel_asociativo"
)[
    Unha terna $(A,+,dot)$ onde as operación cumpren

    - $+$ é unha operación interna e asociativa
    - Existe un elemento neutro da operación $+$
    - Todos os elementos son invertibles respecto de $+$
    - A operación $dot$ é interna, asociativa, e distributiva con $+$

    dise que é un #indice("anel")[Asociativo]anel asociativo. É dicir, unha terna
    $(A,+,dot)$ onde $(A,+)$ é un grupo e $(A,dot)$ é un semigrupo
]

A definición de subanel asociativo é idéntica á definicion
@def:alxebra:subanel, ca única diferenza de que $(B,dot)$ debe ser un
subsemigrupo de $(A,dot)$, en lugar dun submagma.

#definicion(
    nome : "Anel Unitario",
    ancora : "def:alxebra:anel_unitario"
)[
    Unha terna $(A,+,dot)$ onde as operación cumpren

    - $+$ é unha operación interna e asociativa
    - Existe un elemento neutro da operación $+$
    - Todos os elementos son invertibles respecto de $+$
    - A operación $dot$ é interna, asociativa, e distributiva con $+$
    - Existe neutro para a operación $dot$

    dise que é un #indice("anel")[Unitario]anel unitario. É dicir, unha terna
    $(A,+,dot)$ onde $(A,+)$ é un grupo e $(A,dot)$ é un monoide.
]

Para o caso dun subanel unitario, estamos na misma situación que antes: é o
mesmo que na definicion @def:alxebra:subanel pero agora $(B,dot)$ debe ser un
submonoide de $(A,dot)$

// :FACER: explicar mellor este detalle
// En realidade, a existencia dun elemento neutro non require a de asociatividade,
// pero prefiro presentar as estruturas con esta medio mentira

Podemos comentar varias propiedades dos aneis. Imos supoñer que tratamos cun
anel $(A,+,dot)$ asociativo e unitario. O neutro da operación $+$ denótoo por 0.
#cita("kostrikin_1983")

+ $(forall a in A) space.quad a dot 0 = 0 dot a = 0$

    $
        &a = a + 0 \
        &implica a dot a = a dot (a + 0) = a^2 + a dot 0 \
        &implica a^2 = a^2 + a dot 0 \
        &implica 0 = a dot 0
    $

    (pode facerse análogo para o caso $0 dot a$)

+ $(forall a, b in A) space.quad a dot (-b) = (-a) dot b = -(a dot b) $

    $
        &0 = a dot 0 = a dot (b - b) = a dot b + a dot (-b) \
        &implica -(a dot b) = a dot (-b)
    $

+ $(forall a, b in A), space.quad (-a) dot (-b) = a dot b$

    $
        (-a) dot (-b) &= (-(-a)) dot b \
                      &= a dot (-(-b)) = a dot b
    $

#definicion(
    nome : "Divisor de Cero",
    ancora : "def:alxebra:divisor_cero"
)[
    Sexa $(A,+,dot)$ un anel calquera e $a_1, a_2 in A$. Se se cumpre que
    $a_1,a_2 eq.not 0$ e que $a dot b = 0$ entón dicimos que $a$ e $b$ son
    divisores de 0.
]

Un exemplo no anel de matrices de tamaño $2 times 2$ son as matrices da forma $
mat(0,a;0,0) $ #label("ec:alxebra:matriz_divisora") Estas matrices non son
cero, pero o produto de dúas delas si o é.

#definicion(
    nome : "Dominio de Integridade",
    ancora : "def:alxebra:dominio_integridade"
)[
    Un anel que non ten divisores do cero dicimos que é un
    #indice("Dominio")[íntegro] dominio íntegro ou dominio de integridade
    #indice("Dominio")[de integridade]
]

Por exemplo, o anel de matrices de tamaño $2 times 2$ non é un dominio de
integridade, xa que existen as matrices da forma @ec:alxebra:matriz_divisora
que son divisores de 0.

Para as últimas estruturas desta sección imos proseguir ca idea de engadir
propiedades á estrutura anterior. Un anel unitario é a terna $(A,+,dot)$ onde
$(A,+)$ é un grupo e $(A,dot)$ é un monoide. Agora sería razonable engadir que
$(A,dot)$ fose un grupo, pero hai un problema: en tal caso todos os elementos
deberían ser invertibles, o cal inclúe o neutro da primera operación (chamémolo
0). Entón, $0^(-1) dot 0 = 1$, pero esto é un absurdo porque sabemos que $a dot
0 = 0$ sempre. Polo tanto, neste caso só pedimos que os elementos distintos de
0 sexan invertibles.

#definicion(
    nome : "Corpo",
    ancora : "def:alxebra:corpo"
)[
    Unha terna $(A,+,dot)$ onde as operación cumpren

    - $+$ é unha operación interna e asociativa
    - Existe un elemento neutro da operación $+$ (chámoo 0)
    - Todos os elementos son invertibles respecto de $+$
    - A operación $dot$ é interna e asociativa, e existe neutro (chámoo 1)
    - Todos os elementos de $A - {0}$ teñen inverso #nota[É dicir, o conxunto $A$ menos o neutro da primeira operación. Nos número enteiros ca suma serían todos os numeros menos o 0.]

    dise que é un #indice("Corpo") corpo. É dicir, unha terna $(A,+,dot)$ onde
    ambos $(A,+)$ e $(A-{0},dot)$ son grupos.
]

Nun corpo non hai divisores do 0. No caso de que a operación $dot$ sexa
conmutativa entón falamos dun #indice("Campo") campo. [Cap.4 #math.section
4]#cita("kostrikin_1983")

Como sempre, podemos falar de morfismos de aneis, e naturalmente de
homomorfismos, que é unha aplicación entre os aneis $(A,+,dot)$ e
$(B,plus.o,dot.o)$

$
    f:A frecha B \
    f(a + b) = f(a) plus.o f(b) \
    f(a dot b) = f(a) dot.o f(b)
$

O núcleo do homomorfismo $f$ é o conxunto

$
    ker(f) = {a in A | f(a) = 0}
$

// :FACER: sub  aneis e ideais, delgado_2010 + kos
// :FACER: Clases laterais de aneis? Ideais?
