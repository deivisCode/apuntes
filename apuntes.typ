#import("/funcions/estilo.typ"): crear_apuntes
#import("/funcions/texto.typ"): parte

/* :FACER: lista xeral
- Funcións
    - Notas na marxe a man. Depende de https://github.com/typst/typst/issues/5233
        - Ecuacions/Seccions nas marxes
    - Índice a man
        - Ir á palabra exacta
        - Resaltar a palabra no texto
        - Non diferenciar til e sen til
        - Grupos, 'véxase..'
        - Meter automáticamente cousas de definicións
    - Notación
- Depuración
    - boxes
    - marxes
- Tipografía
    - Acrónimos con 'tracking: 0.05/0.1em'
    - Espacios entre palabras
        - Non Xustificado 'spacing: 0.5em'
        - Justificado '(min: 0.85em, max:1.5em)'
    - Medir 'abcdefghijklmnñopqrstuvwxyx', e axustar longo de liña
    - Números e ecuacións con 'pnum': `show math.equation: set text(font:"New Computer Modern Math", features: (pnum: 1))
    - Leading: e.g. 12/15? (texto 12pt, lead 12+3 pt). Mirar o +3. Á espera de que mellore a API: https://github.com/typst/typst/issues/4224
    - TODAS as liñas en blanco deben ser proporcionales, e.g. en 12/15 unha liña en branco debe medir n*15pt. Á espera de typst#4224
    - Sangrías de 1em
    - Seguir esquema progresión roman lc -> SC/FC/italic lc -> etc
    - Cambiar parámetros un a un. lc -> bold -> bold + size -> bold + size + sans
    - Número de páxinas múltiplo de 16.
    - Midpoint (·) máis a miúdo
- Estrutura
    - Estrutura clara
        + Portada
        + Branco
        + Dereitos
        + Reportada
        + Agradecementos
        + Indice
        + Prefacio
        + Documento
        + Bibliografía
        + Teoremas
        + Definicions
        + Simbolos
        + Indice Alfabético
    - Comezar en 1 no corpo do documento
- Referencias
    - A táboas
    - A ecuacións
    - En xeral, estilos
    - `pageref`, incluso con nomes do teorema `#context { query(<def:alxebra:subestrutura>).first().location().page() }`
    - Citas bibliográficas deben usar pre-post notes
- Fontes
    - Normal     : Cochineal (variante de Crimson).
    - Serif      : Roboto
    - Condensada : Roboto Condensed
    - Slab       : Roboto Slab
    - Mates      : Libertinus Math
    - Símbolos   : Symbols Nerd Font
    - Mono       : FiraCode Nerd Font
    - rematar submódulos, eliminar sobrantes
- Portada
- Contraportada
- Explicacións
    - Cap de decisións
- Esquema
    - Palabras clave ou metadatos
    - Consultas con 'typst eval'
    - Filtrado
    - Graficado
- Seccións e temas
    - sección de símbolos
    - seccion de retículas
*/

#let documento = {
    parte( nome : "Matemáticas",)
    include("/capitulos/01_00_CONXUNTOS_introducion.typ")
    include("/capitulos/01_01_CONXUNTOS_conceptos.typ")
    include("/capitulos/01_02_CONXUNTOS_relacions.typ")
    include("/capitulos/01_03_CONXUNTOS_funcions.typ")
    include("/capitulos/01_04_CONXUNTOS_invariantes.typ")
    include("/capitulos/01_05_CONXUNTOS_diagramas.typ")

    include("/capitulos/02_00_GRAFOS_introducion.typ")

    include("/capitulos/02_00_TOPOLOXIA_introducion.typ")
    include("/capitulos/02_01_TOPOLOXIA_espazos-topoloxicos.typ")
    include("/capitulos/02_02_TOPOLOXIA_continuidade.typ")
    include("/capitulos/02_03_TOPOLOXIA_homeomorfismos.typ")
    include("/capitulos/02_04_TOPOLOXIA_espazos-metricos.typ")

    include("/capitulos/03_00_ALXEBRA_introducion.typ")
    include("/capitulos/03_01_ALXEBRA_conceptos.typ")
    include("/capitulos/03_02_ALXEBRA_magmas.typ")
    include("/capitulos/03_03_ALXEBRA_semigrupos.typ")
    include("/capitulos/03_04_ALXEBRA_monoides.typ")
    include("/capitulos/03_05_ALXEBRA_grupos.typ")
    include("/capitulos/03_06_ALXEBRA_aneis.typ")
    include("/capitulos/03_07_ALXEBRA_g-modulos.typ")
    include("/capitulos/03_08_ALXEBRA_k-modulos.typ")
    include("/capitulos/03_09_ALXEBRA_espazos-lineais.typ")
    include("/capitulos/03_10_ALXEBRA_alxebras.typ")
    include("/capitulos/03_11_ALXEBRA_estruturas.typ")
    include("/capitulos/03_12_ALXEBRA_alxebra.typ")

    include("/capitulos/04_00_SIMETRIA_introducion.typ")
    include("/capitulos/04_01_SIMETRIA_transformacions.typ")
    include("/capitulos/04_02_SIMETRIA_accions-grupos.typ")
    include("/capitulos/04_03_SIMETRIA_homoxeneidade.typ")
    include("/capitulos/04_04_SIMETRIA_xeometria.typ")

    include("/capitulos/05_00_REPRESENTACIONS_introducion.typ")

    include("/capitulos/06_00_XEOMETRIA-DIFERENCIAL_introducion.typ")
    include("/capitulos/06_01_XEOMETRIA-DIFERENCIAL_curvas.typ")

    parte( nome : "Física")
    include("/capitulos/07_00_MECANICA_introducion.typ")
}

#crear_apuntes(
    titulo    : "APUNTES",
    autoria   : ((nome: "David Cotelo Varela"),),
    documento : documento,
)
