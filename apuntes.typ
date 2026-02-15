#import("/funcions/estilo.typ"): crear_apuntes

// :FACER: TODOS os sf,bold,sc, usando text(features:("smcp")) etc.
// :FACER: unificar <exp:>, <ec:>, etc. Facer tests?

#let documento = {
    include("/capitulos/01_CONXUNTOS_00_introducion.typ")
    include("/capitulos/01_CONXUNTOS_01_conceptos.typ")
    include("/capitulos/01_CONXUNTOS_02_relacions.typ")
    include("/capitulos/01_CONXUNTOS_03_funcions.typ")
    include("/capitulos/01_CONXUNTOS_04_invariantes.typ")
    include("/capitulos/01_CONXUNTOS_05_diagramas.typ")

    include("/capitulos/02_GRAFOS_00_introducion.typ")

    // :FACER: seccion de retículas
    include("/capitulos/02_TOPOLOXIA_00_introducion.typ")
    include("/capitulos/02_TOPOLOXIA_01_espazos-topoloxicos.typ")
    include("/capitulos/02_TOPOLOXIA_99_NOTAS-TEMPORAIS.typ")

    include("/capitulos/03_ALXEBRA_00_introducion.typ")
    include("/capitulos/03_ALXEBRA_01_conceptos.typ")
    include("/capitulos/03_ALXEBRA_02_magmas.typ")
    include("/capitulos/03_ALXEBRA_03_semigrupos.typ")
    include("/capitulos/03_ALXEBRA_04_monoides.typ")
    include("/capitulos/03_ALXEBRA_05_grupos.typ")
    include("/capitulos/03_ALXEBRA_06_aneis.typ")
    include("/capitulos/03_ALXEBRA_07_modulos.typ")
    include("/capitulos/03_ALXEBRA_08_espazos-lineais.typ")
    include("/capitulos/03_ALXEBRA_09_alxebras.typ")
    include("/capitulos/03_ALXEBRA_10_estruturas.typ")
    include("/capitulos/03_ALXEBRA_11_alxebra.typ")

    include("/capitulos/04_SIMETRIA_00_introducion.typ")
    include("/capitulos/04_SIMETRIA_01_transformacions.typ")
    include("/capitulos/04_SIMETRIA_02_accions-grupos.typ")
    include("/capitulos/04_SIMETRIA_03_homoxeneidade.typ")
    include("/capitulos/04_SIMETRIA_04_xeometria.typ")

    include("/capitulos/05_XEOMETRIA-DIFERENCIAL_00_introducion.typ")
    include("/capitulos/05_XEOMETRIA-DIFERENCIAL_01_curvas.typ")

    include("/capitulos/06_MECANICA_00_introducion.typ")
}

#crear_apuntes(
    titulo    : "APUNTES",
    autoria   : ((nome: "David Cotelo Varela"),),
    documento : documento,
)
