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
    $(A,+)$ é un grupo e $(A,dot)$ é un magma
]

Ca práctica acumulada presentando diferentes estruturas, non será nada
sorprendente a definición de _sub anel_

#definicion(
    nome : "Subanel",
    ancora : "def:alxebra:subanel"
)[
    Sexa $(A,+,dot)$ un anel e $B in A$. Entón, $(B,*)$ é un subanel de
    $(A,*)$ se
    $
        (forall a_1, a_2 in B) space.quad a_1 * a_2 in B \
        e in B \
        (forall a in A) space.quad a^(-1) in A
    $
]

A diferenza das seccións cunha soa operación, non me vou molestar en crear unha
sección por cada nova propiedade que presente, inda que a idea é a mesma que
nas seccións #ref(<sec:alxebra:magmas>) ata #ref(<sec:alxebra:grupos>)

#definicion(
    nome : "Anel Asociativo",
    ancora : "def:alxebra:anel_asociativo"
)[
    Unha terna $(A,+,dot)$ onde as operación cumpren

    - $+$ é unha operación interna e asociativa
    - Existe un elemento neutro da operación $+$
    - Todos os elementos son invertibles respecto de $+$
    - A operación $dot$ é interna e asociativa

    dise que é un #indice("anel")[Asociativo]anel. É dicir, unha terna
    $(A,+,dot)$ onde $(A,+)$ é un grupo e $(A,dot)$ é un semigrupo
]

#definicion(
    nome : "Anel Unitario",
    ancora : "def:alxebra:anel_unitario"
)[
    Unha terna $(A,+,dot)$ onde as operación cumpren

    - $+$ é unha operación interna e asociativa
    - Existe un elemento neutro da operación $+$
    - Todos os elementos son invertibles respecto de $+$
    - A operación $dot$ é interna e asociativa, e existe neutro

    dise que é un #indice("anel")[Unitario]anel. É dicir, unha terna
    $(A,+,dot)$ onde $(A,+)$ é un grupo e $(A,dot)$ é un monoide.
]

// :FACER: explicar mellor este detalle
// En realidade, a existencia dun elemento neutro non require a de asociatividade,
// pero prefiro presentar as estruturas con esta medio mentira

#definicion(
    nome : "Campo",
    ancora : "def:alxebra:campo"
)[
    Unha terna $(A,+,dot)$ onde as operación cumpren

    - $+$ é unha operación interna e asociativa
    - Existe un elemento neutro da operación $+$
    - Todos os elementos son invertibles respecto de $+$
    - A operación $dot$ é interna e asociativa, e existe neutro
    // :FACER: xustificar por que debe ser A-{0} --> dominios de integridad, etc.
    - Todos os elementos de $A - {e_A}$ teñen inverso #nota[É dicir, o conxunto $A$ menos o seu neutro. Nos número enteiros ca suma serían todos os numeros menos o 0]

    dise que é un #indice("Campo"). É dicir, unha terna $(A,+,dot)$ onde ambos
    $(A,+)$ e $(A-{e_A},dot)$ son grupos.
]

// :FACER: sub aneis e ideais, delgado_2010 + kos
+ Homomorfismo de aneis
+ Clases laterais de aneis? Ideais?
