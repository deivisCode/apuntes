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

#let _pt_letra = 12pt

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
