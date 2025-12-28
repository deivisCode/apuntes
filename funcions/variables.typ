// Tamaño da páxina
#let _alto_pax  = 841.89pt   // Altura A4 usual
#let _ancho_pax = _alto_pax * ( calc.sqrt(3) / 2 ) // Altura * (sqrt(3)/2) "Turned Hexagon Page", ratio ~1:1.155

// Tamaños de marxes
#let _marxe_sup = _alto_pax  * (1/9)
#let _marxe_inf = _alto_pax  * (1/9)
#let _marxe_int = _ancho_pax * (1.6/9)
#let _marxe_ext = _ancho_pax * (2.6/9)

// Tamaños dalguns espaciados varios
#let _par_ind = 1.5em  // Indentación inicio parágrafo
#let _leading = 0.65em // Espazo entre liñas consecutivas (bottom edge -> top edge)
#let _spacing = 0.65em // Espazo entre parágrafos

// Tamaños para axustar xustificación
#let _tamaños_xustificacion = (
    // Entre caracteres
    tracking : (
        min: -0.04em,
        max: 0.02em,
    ),
    // Entre palabras
    spacing  : (
        min: 66.67% + 0pt,
        max: 150% + 0pt,
    )
)

// Tamaño de letra
#let _pt_letra = 12pt

// Tipos de letra
#let _norm = "New Computer Modern"
#let _sans = "New Computer Modern Sans"
#let _mono = "New Computer Modern Mono"
#let _nerd = "Symbols Nerd Font Mono"
#let _math = "New Computer Modern Math"
#let sf = eso => text(font: _sans)[#eso]
#let tt = eso => text(font: _mono)[#eso]
#let nf = eso => text(font: _nerd)[#eso]
#let nf = eso => text(font: _nerd)[#eso]

#let _sans_math = "New Computer Modern Sans Math"
#let sfm = eso => text(font: _sans_math)[#eso]

// Cores que me gustan
#let _verde  = "#008000"
#let _morado = "#8000CC"
#let _rosa   = "#f000f0"
#let _azul   = "#00b8eb"
#let _roxo   = "#ff0000"

#let verde  = eso => text(fill: rgb(_verde))[#eso]
#let morado = eso => text(fill: rgb(_morado) , weight: "bold", font: _sans)[#eso]
#let rosa   = eso => text(fill: rgb(_rosa)   , weight: "bold", font: _sans)[#eso]
#let azul   = eso => text(fill: rgb(_azul)   , weight: "bold", font: _sans)[#eso]

#let _gris_bordos  = luma(90%)
#let _gris_fondos  = luma(96%)
#let _gris_notas   = luma(40%)
#let _gris_textos  = luma(40%)
#let _gris_titulos = luma(40%)

// Grosores dalguns bordes
#let _pt_fino  = 0.6pt // bordes figuras, encabezados
#let _pt_envs  = 2pt   // bordes teoremas, defs, exemplos, etc.

// Espazos para teoremas, defs, exemplos, etc.
#let _in_envs = (
    top    : 0.9em,
    bottom : 0.9em,
    left   : 0.9em,
    right  : 0.9em,
)
