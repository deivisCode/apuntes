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
#let _leading = 0.60em // Espazo entre liñas consecutivas (bottom edge -> top edge)
#let _spacing = 0.65em // Espazo entre parágrafos

// Tamaños para axustar xustificación
#let _tamaños_xustificacion = (
    tracking : ( min: -0.04em, max: 0.02em,), // Entre caracteres
    spacing  : ( min: 66.67% + 0pt, max: 150% + 0pt,) // Entre palabras
)

// Tamaño de letra
#let _pt_letra = 12pt

// TIPOS DE LETRA
// Ollo, para seleccionar unha fonte hai que especificar
// [Familia, Nome, Peso, Estiramento]
// Por exemplo:
// text(font: "Roboto", weight:400, stretch: 75% ) -> Roboto Condensed
// text(font: "Roboto", weight:400, stretch: 100%) -> Roboto Normal
//
// NORMAL      Cochineal  https://ctan.org/pkg/cochineal
// MATES       NewCM      https://github.com/alerque/libertinus
// SANS        Roboto     https://fonts.google.com/specimen/Roboto
// CONDENSADA  Roboto     https://fonts.google.com/specimen/Roboto
// SLAB        RobotoSlab https://fonts.google.com/specimen/Roboto+Slab
// MONO        FiraCodeNF https://github.com/ryanoasis/nerd-fonts/releases/
// SIMBOLOS    SymbolsNF  https://github.com/ryanoasis/nerd-fonts/releases/
//
// Esto son dicionarios que se poden acceder noutras partes do código pa ter a
// info das fontes
#let _norm = ( familia: "Cochineal"              , peso: 400 , estilo: "normal" , estiramento: 100% )
#let _mate = ( familia: "Libertinus Math"        , peso: 400 , estilo: "normal" , estiramento: 100% )
#let _sans = ( familia: "Roboto"                 , peso: 400 , estilo: "normal" , estiramento: 100% )
#let _cond = ( familia: "Roboto"                 , peso: 400 , estilo: "normal" , estiramento: 75%  )
#let _slab = ( familia: "Roboto Slab"            , peso: 200 , estilo: "normal" , estiramento: 100% )
#let _mono = ( familia: "FiraCode Nerd Font"     , peso: 400 , estilo: "normal" , estiramento: 100% )
#let _simb = ( familia: "Symbols Nerd Font Mono" , peso: 400 , estilo: "normal" , estiramento: 100% )

// Varias funcións para activar as distintas fontes directamente
#let normal     = eso => text( fallback : false, font : _norm.familia, weight : _norm.peso, style : _norm.estilo, stretch : _norm.estiramento)[#eso]
#let mates      = eso => text( fallback : false, font : _mate.familia, weight : _mate.peso, style : _mate.estilo, stretch : _mate.estiramento)[#eso]
#let sans       = eso => text( fallback : false, font : _sans.familia, weight : _sans.peso, style : _sans.estilo, stretch : _sans.estiramento)[#eso]
#let condensada = eso => text( fallback : false, font : _cond.familia, weight : _cond.peso, style : _cond.estilo, stretch : _cond.estiramento)[#eso]
#let slab       = eso => text( fallback : false, font : _slab.familia, weight : _slab.peso, style : _slab.estilo, stretch : _slab.estiramento)[#eso]
#let mono       = eso => text( fallback : false, font : _mono.familia, weight : _mono.peso, style : _mono.estilo, stretch : _mono.estiramento)[#eso]
#let simbolos   = eso => text( fallback : false, font : _simb.familia, weight : _simb.peso, style : _simb.estilo, stretch : _simb.estiramento)[#eso]

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

// Cores para partes sutís (bordes, algún título, etc.)
#let _gris_bordos  = luma(90%)
#let _gris_fondos  = luma(96%)
#let _gris_notas   = luma(40%)
#let _gris_textos  = luma(40%)
#let _gris_titulos = luma(40%)

// Grosores dalguns bordes
#let _pt_fino  = 0.6pt // bordes figuras, encabezados
#let _pt_envs  = 2pt   // bordes teoremas, defs, exemplos, etc.

// Espazos para teoremas, defs, exemplos, etc.
#let _in_envs  = ( top: 0.9em, bottom: 0.9em,)
#let _out_envs = ( left: 0.9em, right: 0.9em,)
