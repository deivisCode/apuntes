#import("/funcions/estilo.typ"): crear_apuntes

// :FACER: TODOS os sf,bold,sc, usando text(features:("smcp")) etc.
// :FACER: unificar <exp:>, <ec:>, etc. Facer tests?

#let documento = {
    include("/capitulos/01_00_CONXUNTOS_introducion.typ")
    include("/capitulos/01_01_CONXUNTOS_conceptos.typ")
    // :FACER: sección de símbolos
    include("/capitulos/01_02_CONXUNTOS_relacions.typ")
    include("/capitulos/01_03_CONXUNTOS_funcions.typ")
    include("/capitulos/01_04_CONXUNTOS_invariantes.typ")
    include("/capitulos/01_05_CONXUNTOS_diagramas.typ")

    include("/capitulos/02_00_GRAFOS_introducion.typ")

    // :FACER: seccion de retículas
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
    include("/capitulos/03_07_ALXEBRA_espazos-lineais.typ")
    include("/capitulos/03_08_ALXEBRA_alxebras.typ")
    include("/capitulos/03_09_ALXEBRA_estruturas.typ")
    include("/capitulos/03_10_ALXEBRA_alxebra.typ")

    include("/capitulos/04_00_SIMETRIA_introducion.typ")
    include("/capitulos/04_01_SIMETRIA_transformacions.typ")
    include("/capitulos/04_02_SIMETRIA_accions-grupos.typ")
    include("/capitulos/04_03_SIMETRIA_homoxeneidade.typ")
    include("/capitulos/04_04_SIMETRIA_xeometria.typ")

    include("/capitulos/05_00_XEOMETRIA-DIFERENCIAL_introducion.typ")
    include("/capitulos/05_01_XEOMETRIA-DIFERENCIAL_curvas.typ")

    include("/capitulos/06_00_MECANICA_introducion.typ")
}

#crear_apuntes(
    titulo    : "APUNTES",
    autoria   : ((nome: "David Cotelo Varela"),),
    documento : documento,
)
