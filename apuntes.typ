#import("/estilo.typ"): *   // funcións de estilo
#import("/funcions.typ"): * // funcións xerais e algúns paquetes

#show: activar_estilo.with(
    titulo  : "APUNTES",
    autoria : ((nome: "David Cotelo Varela"),),
)

// :FACER: decisións de estilo tipo eqs con (), demostracions con tal, etc.
// :FACER: lua visual debug?
// :FACER: outras tipografías? Crimson? default de typst? ver lista maria
// :FACER: funcions encima das frechas
// :FACER: usar arrow.r.tip máis a miudo

#include("/capitulos/01_CONXUNTOS_00_introducion.typ")
#include("/capitulos/01_CONXUNTOS_99_NOTAS-TEMPORAIS.typ")

#include("/capitulos/02_TOPOLOXIA_00_introducion.typ")
#include("/capitulos/02_TOPOLOXIA_01_espazos-topoloxicos.typ")
#include("/capitulos/02_TOPOLOXIA_99_NOTAS-TEMPORAIS.typ")

// :FACER: ollada ao Dean
// :FACER: ollada ao Jacobson
// :FACER: estandarizar a notación para as operacions, + o * etc
// :FACER: logo de facer o capitulo de conxuntos, mencionar inxectividade, sobrexectividade, etc
#include("/capitulos/03_ALXEBRA_00_introducion.typ")
#include("/capitulos/03_ALXEBRA_01_conceptos.typ")
#include("/capitulos/03_ALXEBRA_02_magmas.typ")
#include("/capitulos/03_ALXEBRA_03_semigrupos.typ")
#include("/capitulos/03_ALXEBRA_04_monoides.typ")
#include("/capitulos/03_ALXEBRA_05_grupos.typ")
#include("/capitulos/03_ALXEBRA_06_aneis.typ")
#include("/capitulos/03_ALXEBRA_07_modulos.typ")
#include("/capitulos/03_ALXEBRA_08_espazos-lineais.typ")
#include("/capitulos/03_ALXEBRA_09_alxebras.typ")
#include("/capitulos/03_ALXEBRA_10_estruturas.typ")

#include("/capitulos/04_GRUPOS_00_introducion.typ")

#include("/capitulos/05_MECANICA_00_introducion.typ")
