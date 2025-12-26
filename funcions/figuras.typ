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
        font     : _norm,
        weight   : 550,
        fallback : false,
        style    : "normal",
    )
    // Texto de matemáticas
    show math.equation: set math.text(
        font     : _math,
        size     : 1.1em,
        lang     : "gl",
        fallback : false,
        style    : "normal",
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
