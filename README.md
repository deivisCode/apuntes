# Uns apuntes persoais en Typst

Uns apuntes persoais do que estiven estudando ultimamente.

## FACER

- [ ] Índice a man
    - [ ] Ir á palabra exacta
    - [ ] Resaltar a palabra no texto
    - [ ] Non diferenciar til e sen til
    - [ ] Grupos, 'véxase..'

- [ ] Depuración
    - [ ] boxes
    - [ ] marxes

- [ ] Notas na marxe a man

- [ ] Esquema
    - [ ] Palabras clave ou metadatos
    - [ ] Consultas con 'typst eval'
    - [ ] Filtrado
    - [ ] Graficado

## Decisións tipográficas e de deseño

- A estrutura é de
    - Portada.
    - Frontmatter (índices, agradecementos, etc.).
    - Mainmatter (contido principal).
    - Backmatter (anexos, bibliografía, outros índices).
    - Contraportada.
  Cada parte ten un estilo completamente independente.
- Separar o contido simplemente en capítulos e estes en seccións. Non fai falla
  unha maior dependencia de contido.
- Títulos de obxectos principais (capítulos, seccións, título dos índices,
  etc.) van con SansSerif.
- Os capítulos comezan sempre na páxina dereita (impar).
- As seccións teñen máis espazados enriba que abaixo (evita en xeral as
  seccións orfas).
- As marxes son especialmente grandes, seguindo lixeiramente o modelo de Tufte,
  pra poder usalas con lapis nunha versión impresa.
- O tamaño do texto e as marxes encaixan pra ter ~65-75 caracteres por liña.
- A tipografía xeral é New Computer Modern. Úsase a variantes estilísticas:
    - `u2205` -> `cv01` (emptyset)
- As notas póñense (na maioría dos casos) na marxe e non no pé de páxina, o que
  interrompe menos a lectura.
- A primeira vez que aparece unha referencia bibliográfica, móstrase tamén na
  marxe en forma completa. As veces consecutivas xa non.
- A separación entre parágrafos móstrase con sangrías exclusivamente.
- Usar `math.equation(block: false)` por defecto. Se a ecuación ocupa unha
  cantidade substancial da liña (p.e. 70% ou máis) ou ten demasiado espazo
  vertical ou un forte contido semántico, entón xa se merece un bloque aparte.
