#import("/funcions/texto.typ"): *
#import("/funcions/simbolos.typ"): *

#seccion(
    nome : "Homoxeneidade",
    ancora : "sec:simetria:homoxeneidade"
)

A acción $G arrow.cw.half A$ non é máis ca unha aplicación no produto
cartesiano $G times A$ seguindo a definición @def:simetria:accion.

Podemos ter casos nos que tanto $G$ como $A$ teñan estrutura ou propiedades
adicionais.

+ É típico que $A$ sexa un espazo topolóxico, seguindo a definición
  @def:topoloxia:espazo-topoloxico
+ O grupo $G$ tamén pode ser un espazo topolóxico, e podemos pedir a condición
  adicional de que a operación do grupo $dot$ sexa continua,
  [Cap.11.3]@masa_2019 [Cap.4Def4.1]@isham_1999
  $
    dot: G times G &frecha G \
        (g_1, g_2) &mapea g_1 dot g_2,
  $
  e que a función, $i$, que leva un elemento ao seu inverso tamén o sexa
  $
    i: G &frecha G \
       g &mapea g^(-1).
  $
+ A acción pode ser unha función continua de dúas variables, é dicir, ás
  condición da definición @def:simetria:accion engadimos que
  $alpha (g, x) = g x$ é continua

// [Cap.7$section$3.4]@kostrikin_1983
#vocabulario[
    - No caso 2. dicimos que o grupo é _continuo_ #indice("Grupo")[Continuo] ou
      _topolóxico_#indice("Grupo")[Topolóxico].
    - Se temos os casos 1. e 2., e a maiores a acción $G arrow.cw.half A$ é
      transitiva entón dicimos que o conxunto $A$ é un _espazo homoxéneo_
      #indice("Espazo")[Homoxéneo].
    - Se temos os puntos 2. e 3. entón dicimos que $G$ é un _grupo de
      movementos_#indice("Grupo")[De movementos].
]

Anticipándonos aos temas posteriores, se sustituímos a condición 1. (que $A$
sexa un espazo topolóxico) pola versión máis restrictiva de que $A$ sexa unha
variedade diferenciable e en 2. que as funcións $dot$ (a operación do grupo) e
$i$ sexan infinitamente diferenciables.
