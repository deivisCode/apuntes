// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//  _____ ___ ____ _   _ ____      _    ____
// |  ___|_ _/ ___| | | |  _ \    / \  / ___|
// | |_   | | |  _| | | | |_) |  / _ \ \___ \
// |  _|  | | |_| | |_| |  _ <  / ___ \ ___) |
// |_|   |___\____|\___/|_| \_\/_/   \_\____/
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//
// Aqui vai a configuracion para compilar as figuras de CeTZ

#import("/funcions/variables.typ"): *

#let estilo_figuras(
    doc,
    ancho : auto,
    alto  : auto
) = {
    set page(
        height : alto,
        width  : ancho
    )
    // Texto xeral
    set text(
        size     : 1.1em,
        lang     : "gl",
        font     : _norm.familia,
        weight   : _norm.peso,
        style    : _norm.estilo,
        stretch  : _norm.estiramento,
        fallback : false,
    )
    // Texto de matemáticas
    show math.equation: set math.text(
        font     : _mate.familia,
        weight   : _mate.peso,
        style    : _mate.estilo,
        stretch  : _mate.estiramento,
        size     : 1.1em,
        lang     : "gl",
        fallback : false,
    )
    set par(
        justify           : true,
        first-line-indent : 1.5em,
        spacing           : 0.65em,
        leading           : 0.65em,
        linebreaks        : "optimized"
    )
    set align(center + horizon)
    doc
}
