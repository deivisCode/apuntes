// :FACER: aneis conmutativos
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
sorprendente a definición de _subanel_

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
        (forall b_1, b_2 in B) space.quad b_1 * b_2 in B
    $
    É dicir, $(B,+)$ é un subgrupo de $(A,+)$ e $(B,dot)$ é un submagma de
    $(A,dot)$
]

A diferenza das seccións cunha soa operación, non me vou molestar en crear unha
sección por cada nova propiedade que presente, inda que a idea é a mesma que
nas seccións @sec:alxebra:magmas ata @sec:alxebra:grupos

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
mesmo que a @def:alxebra:subanel pero agora $(B,dot)$ debe ser un submonoide de
$(A,dot)$

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

// :FACER: campo/corpo, conmutativos, ou?
Ás veces a un campo tamén se lle chama #indice("Corpo") _corpo_

// :FACER: sub aneis e ideais, delgado_2010 + kos
+ Homomorfismo de aneis
+ Clases laterais de aneis? Ideais?
