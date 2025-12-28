# Uns apuntes persoais en Typst

Uns apuntes persoais do que estiven estudando ultimamente.

## FACER

- [ ] Funcións
    - [ ] Notas na marxe a man. Depende de https://github.com/typst/typst/issues/5233
    - [ ] Índice a man
        - [ ] Ir á palabra exacta
        - [ ] Resaltar a palabra no texto
        - [ ] Non diferenciar til e sen til
        - [ ] Grupos, 'véxase..'
        - [ ] Meter automáticamente cousas de definicións
    - [ ] Notación
- [ ] Depuración
    - [ ] boxes
    - [ ] marxes
- [ ] Tipografía
    - [ ] Acrónimos con 'tracking: 0.05/0.1em'
    - [ ] Espacios entre palabras
        - [ ] Non Xustificado 'spacing: 0.5em'
        - [ ] Justificado '(min: 0.85em, max:1.5em)'
    - [x] Medir 'abcdefghijklmnñopqrstuvwxyx', e axustar longo de liña
    - [ ] Números e ecuacións con 'pnum': `show math.equation: set text(font:"New Computer Modern Math", features: (pnum: 1))
    - [ ] Leading: e.g. 12/15? (texto 12pt, lead 12+3 pt). Mirar o +3
    - [ ] TODAS as liñas en blanco deben ser proporcionales, e.g. en 12/15 unha liña en branco debe medir n*15pt
    - [ ] Sangrías de 1em
    - [ ] Seguir esquema progresión roman lc -> SC/FC/italic lc -> etc
    - [ ] Cambiar parámetros un a un. lc -> bold -> bold + size -> bold + size + sans
    - [ ] Número de páxinas múltiplo de 16.
    - [ ] Midpoint (·) máis a miúdo
- [ ] Estrutura
    - [ ] Comezar en 1 no corpo do documento
- [ ] Referencias
    - [ ] A táboas
    - [ ] A ecuacións
    - [ ] En xeral, estilos
    - [ ] `pageref`, incluso con nomes do teorema `#context { query(<def:alxebra:subestrutura>).first().location().page() }`
    - [ ] Citas bibliográficas deben usar pre-post notes
- [ ] Fontes
    - [ ] Remirar a lista, facer comparativa de PDFs
        - NewCM        : https://download.gnu.org.ua/release/newcm/
        - Caslon       : https://github.com/impallari/Libre-Caslon-Text
        - Baskervville : https://fonts.google.com/specimen/Baskervville
        - Bembo        : https://www.ctan.org/tex-archive/fonts/fbb/
        - Garamond     : https://fonts.google.com/specimen/EB+Garamond
        - Crimson      : https://www.ctan.org/pkg/crimsonpro
                       : https://www.ctan.org/pkg/crimson
                       : https://fonts.google.com/specimen/Crimson+Text
- [ ] Portada
- [ ] Contraportada
- [ ] Explicacións
    - [ ] Cap de decisións
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
