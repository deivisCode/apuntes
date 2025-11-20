#import("/estilo.typ"): *   // funcións de estilo
#import("/funcions.typ"): * // funcións xerais e algúns paquetes

#show: activar_estilo.with(
    titulo  : "APUNTES",
    autoria : ((nome: "David Cotelo Varela"),),
)

#include("/capitulos/01_TOPOLOXIA_00_introducion.typ")
#include("/capitulos/01_TOPOLOXIA_01_espazos-topoloxicos.typ")
#include("/capitulos/01_TOPOLOXIA_99_NOTAS-TEMPORAIS.typ")

// :FACER: ollada ao Dean
// :FACER: ollada ao Jacobson
// :FACER: estandarizar a notación para as operacions, + o * etc
// :FACER: logo de facer o capitulo de conxuntos, mencionar inxectividade, sobrexectividade, etc
#include("/capitulos/02_ALXEBRA_00_introducion.typ")
#include("/capitulos/02_ALXEBRA_01_conceptos.typ")
#include("/capitulos/02_ALXEBRA_02_magmas.typ")
#include("/capitulos/02_ALXEBRA_03_semigrupos.typ")
#include("/capitulos/02_ALXEBRA_04_monoides.typ")
#include("/capitulos/02_ALXEBRA_05_grupos.typ")
#include("/capitulos/02_ALXEBRA_06_aneis.typ")
#include("/capitulos/02_ALXEBRA_07_modulos.typ")
#include("/capitulos/02_ALXEBRA_08_espazos-lineais.typ")
#include("/capitulos/02_ALXEBRA_09_alxebras.typ")
#include("/capitulos/02_ALXEBRA_10_estruturas.typ")

#include("capitulos/03_GRUPOS_00_introducion.typ")
