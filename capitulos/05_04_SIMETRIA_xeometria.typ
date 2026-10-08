#import("/funcions/texto.typ"): *
#import("/funcions/simbolos.typ"): *

#seccion(
    nome : "Xeometría",
    ancora : "sec:simetria:xeometria"
)

// :FACER: Caso transformacións espazo euclidiano
// :FACER: Afín
// :FACER: Proxectivo.
// :FACER: Klein Program. Grupos de transformacións de simetría
// :FACER: Onde comezo con teoría de representacións

NOTAS TEMPORAIS

Podemos falar un momento do plano $RR^2$.

#definicion(
    nome : "Isometría",
    ancora : "def:simetria:isometria"
)[
    Sexan o espazos lineais normados $A,B$ e o conxunto de aplicacións lineais
    entre eles.
    $
        scr(L)(A,B) := {phi : A arrow B}.
    $
    Unha aplicación concreta $phi in scr(L)$ é unha isometría se
    $
        (forall a in A) space.quad norm(phi a) = norm(a).
    $
    É dicir, a función $phi$ preserva a norma.
]

No caso do espazo (normado) Euclídeo, a norma ven dada pola función distancia
usual.

#notacion[
    Algún libro fala de isometrías exclusivamente entre os mesmos espazos, polo
    que na definición anterior sería $A=B$. Persoalmente, sigo ás definicións
    de @axler_2024 onde polo xeral $A eq.not B$ ou $A = B$ dependendo do caso.
    No caso de falar dun so mesmo $A$, podemos referirnos ao conxunto de
    isometrías $phi:A arrow A$ como $"Isom"(A)$.
]

Seguindo estas liñas, o conxunto de isometrías do plano denótase por
$"Isom"(RR^2)$.

Que tipos de isometrías temos no plano?
- Rotacións nun ángulo $phi$ arredor do punto $P$, $R_phi (P)$.
- Reflexións ao longo dunha liña $l$ que pasa polo punto $P$, $F_l (P)$#nota[$F$ do inglés, Flip.].
- Translacións do punto $P$ ao longo do vector $v$, $T_v (P)$.

Estas tres transformacións son isometrías do plano @rotman_2000.

Outras pequenas notas:
- O conxunto de isometrías do plano que deixa invariante un punto chámase grupo ortogonal, $O(RR^2)$. Son rotacións e son aplicacións lineais invertibles.
- O conxunto de isometrías do plano qque deixa invariante unha recta son o conxunto de translacións paralelas a dita recta e de reflexións por dita recta: _glide-reflections_ en inglés.

Como caracterizamos a simetría?

#definicion(
    nome : "Grupo de simetrías",
    ancora : "def:simetria:grupo-simetrias"
)[
    Sexa unha figura calquera do plano $Omega$. O grupo de simetrías $Sigma$ de $Omega$ é o conxunto de isometrías do plano que deixa $Omega$ igual, ousexa
    $
        Sigma (Omega) := {phi in "Isom"(RR^2) | phi (Omega) = Omega}
    $
]

Por exemplo, para a figura $pi_n$ (polígono regular de $n$ lados) o grupo de simetría é o grupo dihédrico $D_(2n)$

Esta definición pode estenderse máis alá do plano $RR^2$

Caracterización da xeometría.

Sexa $G$ un grupo e $P$ unha propiedade de $Omega in RR^2$. Dicimos que $P$ é unha propiedade invariante de $G$ se

$
    (forall g in G) space.quad g Omega "tamén ten a propiedade" P
$

- Invariantes de $"Isom"(RR^2)$: Colinealidade, longura, área, ángulos.
- Invariantes de $"Aff"(RR^2)$ (grupo de transformacións afíns): congruencia de triángulos, colinealidade...
- Invariantes de $P(RR^2)$ (transformacións proxectivas): ...
- Invariantes de $"Hom"(RR^2)$ (transformacións homemomorfas): Abertos, pechados, conexión, compacidade...

Respectivamente obtemos os espazos Euclídeo, Afín, Proxectivo e Topolóxico.
