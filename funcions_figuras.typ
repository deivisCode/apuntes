#let estilo_figuras(
    doc,
    ancho : auto,
    alto  : auto
) = {
    set page(
        height : alto,
        width  : ancho
    )
    set text(
        size     : 13pt,
        lang     : "gl",
        font     : "New Computer Modern",
        weight   : 550,
        fallback : false,
        style    : "normal",
    )

    show math.equation: set math.text(
        font     : "New Computer Modern Math",
        size     : 13pt,
        lang     : "gl",
        weight   : 550,
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
