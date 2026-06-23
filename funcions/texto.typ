// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//  _____ _______  _______ ___
// |_   _| ____\ \/ /_   _/ _ \
//   | | |  _|  \  /  | || | | |
//   | | | |___ /  \  | || |_| |
//   |_| |_____/_/\_\ |_| \___/
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//
// Funcións para incluir no texto, como capítulo, seccións, énfases, notas,
// citas, teoremas, etc.

#import("/funcions/variables.typ"): *

/// Unha nota ao marxe.
#let nota(eso) = {}

/// Engadir unha palabra ao índice alfabético
#let indice(..args) = {}

/// Usado para citar unha referencia.
// :FACER: Pode usarse esto ao facer @kostrikin_1986 ? Tal vez se uso unha show: cite =>
// :FACER: Cambiar idioma para as citas (así fai mellores hífens)? Includo
//         creando un parámetro (por defecto 'en' ou 'es') para controlalo en cada
//         cita. Ou incluso usar a info da cita?. CSL debería ter un valor tipo 'lang'
//         set text(lang: "en")
#let cita(nome) = {
    cite(label(nome))
}

/// Un teorema simple, e.g. '#teorema("fermat", "teo:fermat")[$a+b=0$]
#let teorema(
    nome   : " -- SEN NOME -- ",
    ancora : " -- SEN ÁNCORA -- ",
    corpo
) = {
    set par(first-line-indent:0pt)
    block(
        stroke    : (
            left : stroke(
                cap       : "round",
                paint     : rgb(_morado),
                thickness : _pt_envs
            ),
        ),
        fill      : rgb(_morado).lighten(90%),
        below     : 0pt,
        width     : 100%,
        inset     : _in_envs,
        outset    : _out_envs,
        breakable : false,
        sticky    : true,
        [
            #show figure: set align(left)
            #show figure: set block(breakable: false)
            #figure(
                kind:"teorema",
                supplement: nome,
                context {
                    let CAP = counter(heading.where(level: 3)).get().last()
                    let SEC = counter(heading.where(level: 4)).get().last()
                    let NUM = counter(figure.where(kind:"teorema")).get().first()
                    [#slab[*Teorema*] #CAP.#SEC.#NUM: #smallcaps(nome)]
                }
            )
            // Esto é porque o label debe estar dentro dun contido, e así
            // ánclase á figura anterior
            #label(ancora)
        ]
    )
    // O Título do teorema e o corpo son dous bloques, o primero irrompible e o
    // segundo non. O primeiro é 'sticky' para que vaia pegado ao segundo
    block(
        stroke    : (
            left : stroke(
                cap       : "round",
                paint     : rgb(_morado),
                thickness : _pt_envs
            ),
        ),
        fill      : rgb(_morado).lighten(90%),
        width     : 100%,
        inset     : _in_envs,
        outset    : _out_envs,
        breakable : true,
        [#corpo]
    )
}

/// Unha definicion simple, e.g. '#definicion("exemplo","def:algo")[a = 0]'
#let definicion(
    nome   : " -- SEN NOME -- ",
    ancora : " -- SEN ÁNCORA -- ",
    corpo
) = {
    set par(first-line-indent:0pt)
    block(
        stroke    : (
            left : stroke(
                cap       : "round",
                paint     : rgb(_morado),
                thickness : _pt_envs
            ),
        ),
        fill      : rgb(_morado).lighten(90%),
        width     : 100%,
        below     : 0pt,
        inset     : _in_envs,
        outset    : _out_envs,
        breakable : false,
        sticky    : true,
        [
            #show figure: set align(left)
            #show figure: set block(breakable: false)
            #figure(
                kind:"definicion",
                supplement: nome,
                context {
                    let CAP = counter(heading.where(level: 3)).get().last()
                    let SEC = counter(heading.where(level: 4)).get().last()
                    let NUM = counter(figure.where(kind:"definicion")).get().first()
                    [#slab[*Definición*] #CAP.#SEC.#NUM: #smallcaps(nome)]
                }
            )
            #label(ancora)
        ]
    )
    block(
        stroke    : (
            left : stroke(
                cap       : "round",
                paint     : rgb(_morado),
                thickness : _pt_envs
            ),
        ),
        fill      : rgb(_morado).lighten(90%),
        width     : 100%,
        inset     : _in_envs,
        outset    : _out_envs,
        breakable : true,
        [#corpo]
    )
}

// :FACER: cambiar 'ancora' -> 'teorema'?
#let demostracion(
    ancora : " -- SEN ÁNCORA -- ",
    corpo
) = {
    set text(fill: _gris_textos)
    set par(first-line-indent:0pt)
    block(
        // stroke    : ( left : _gris_bordos + _pt_envs ),
        stroke    : (
            left : stroke(
                cap       : "round",
                paint     : _gris_bordos,
                thickness : _pt_envs
            ),
        ),
        width     : 100%,
        below     : 0pt,
        inset     : _in_envs,
        outset    : _out_envs,
        breakable : false,
        sticky    : true,
        [#slab[*Demostración*] #ref(label(ancora)):]
    )
    block(
        stroke    : (
            left : stroke(
                cap       : "round",
                paint     : _gris_bordos,
                thickness : _pt_envs
            ),
        ),
        width     : 100%,
        inset     : _in_envs,
        outset    : _out_envs,
        breakable : true,
        [#corpo #h(1fr) $qed$]
    )
}

#let exemplos(
    corpo
) = {
    set text(fill: _gris_textos)
    set par(first-line-indent:0pt)
    block(
        stroke    : (
            left : stroke(
                cap       : "round",
                paint     : _gris_bordos,
                thickness : _pt_envs
            ),
        ),
        fill      : _gris_fondos,
        width     : 100%,
        above     : 5pt, // :FACER: esto debería ser o interliñado
        below     : 0pt,
        inset     : _in_envs,
        outset    : _out_envs,
        breakable : false,
        sticky    : true,
        slab[*Exemplos:*]
    )
    block(
        stroke    : (
            left : stroke(
                cap       : "round",
                paint     : _gris_bordos,
                thickness : _pt_envs
            ),
        ),
        fill      : _gris_fondos,
        width     : 100%,
        inset     : _in_envs,
        outset    : _out_envs,
        breakable : true,
        [#corpo]
    )
}

#let notacion( corpo ) = {
    block(
        stroke    : (
            left : stroke(
                cap       : "round",
                paint     : _gris_bordos,
                thickness : _pt_envs
            ),
        ),
        radius : 1em,
        inset  : _in_envs,
        outset : _out_envs,
        [#slab[*Notación e Vocabulario*]: #corpo]
    )
}

// :FACER: estilo das partes?
#let parte(
    nome   : " -- SEN NOME -- ",
    ancora : " -- SEN ÁNCORA -- "
) = {
    show heading.where(level: 2): eso => {
        let PARTE = counter(heading.where(level: 2)).at(here()).last()
        set align(center + horizon)
        text(
            size: 4em,
            [
                #slab[Parte #numbering("I",PARTE)]\
                #smallcaps[*#eso.body*]
            ]
        )
    }
    pagebreak(weak: true, to:"odd")
    heading(
        depth : 2,
        numbering : (.., n) => numbering("I", n),
        smallcaps(nome)
    )
}

/// Función para crear un CAPITULO
#let capitulo(
    nome     : " -- SEN NOME -- ",
    ancora   : " -- SEN ÁNCORA -- ",
    epigrafe : " -- SEN EPÍGRAFE -- "
) = {
    // :FACER: simplificar esto. Capitulo, Nome e celdas diferentes do grid, show, set, etc.
    show heading.where(level: 3): eso => {
        set align(left)
        let CAP = counter(heading.where(level: 3)).at(here()).last()
        text(size: 1.2em, fill: _gris_titulos)[#v(0.4em)#condensada[*Capítulo #CAP*]\ ]
        text(size: 3em)[#eso.body]
    }
    pagebreak(to:"odd")
    counter(heading.where(level: 4)).update(0)
    grid(
        columns : (auto,20%,1fr),
        rows    : (5em, 5em),
        align   : (left, center, right + bottom),

        grid.cell(
            x:0, y:0,
            context [
                #let CAP = counter(heading.where(level: 3)).at(here()).last()
                #figure(
                    kind: "capitulo",
                    supplement: [Capítulo],
                    heading(
                        level: 3,
                        // :FACER: por que sumar 1? E ollo, non se actualizan entre partes...
                        numbering: (.., n) => numbering("1", CAP+1),
                        condensada[*#nome*],
                    )
                )
                #label(ancora)
            ],
        ),

        grid.cell(
            x:2, y:1,
            text(size:0.7em)[
                #epigrafe
                #v(1fr)
                #line(length:20%, stroke:_pt_fino)
            ]
        )

    )
    v(2em)
}

#let seccion(
    nome   : " -- SEN NOME -- ",
    ancora : " -- SEN ÁNCORA -- "
) = {
    show figure: set align(right)
    show heading.where(level: 4): eso => {
        // :FACER: limpar esto. Fai falla o show?
        let CAP = counter(heading.where(level: 3)).at(here()).last()
        let SEC = counter(heading.where(level: 4)).at(here()).last()
        set text(size: 1.5em)
        condensada[*$section$ #CAP.#SEC #eso.body*]
    }
    block(
        sticky: true,
        above: 2em,
        below: 1em,
        grid(
            columns: (1em, 1fr),
            // Esta figura ten un 'kind' concreto que logo podo coller con
            // query pa saber que seccións teño nunha certa páxina. O corpo da
            // figura ten un 'metadata' co nome da sección, o cal non ocupa
            // espazo visual algún.
            context {
                figure(
                    kind : "seccions-" + str(here().page()),
                    supplement : "figura_auxiliar_seccions",
                    metadata(nome)
                )
            },
            context [
                #let CAP = counter(heading.where(level: 3)).at(here()).last()
                #figure(
                    kind: "seccion",
                    supplement: [Sección],
                    heading(
                        level: 4,
                        numbering: (.., SEC) => numbering("1.1", CAP, SEC),
                        [#nome],
                    )
                )
                #label(ancora)
            ]
        )
    )
}

// :FACER: áncora para esto
#let imaxe(
    nome   : "/figuras/svg/patata.svg",
    pe     : " -- SEN PÉ -- ",
    ancho  : auto,
    alto   : auto
) = {
    figure(
        rect(
            fill   : _gris_fondos,
            stroke : _gris_bordos + _pt_fino,
            width  : 100%,
            inset  : 0pt,
            outset : _out_envs,
            image(
                height : alto,
                width  : ancho,
                nome,
            )
        ),
        caption : pe,
        kind : "imaxe",
        supplement : "Figura"
    )
}

/// Un bloque que ocupa a marxe grande tamén.
#let bloque_ancho(contido) = {
    context {
        let num = counter(page).get().first()
        if calc.even(num) {
            set align(right)
            block(width: 100% + (_marxe_ext - _marxe_int), contido)
        } else {
            set align(left)
            block(width: 100% + (_marxe_ext - _marxe_int), contido)
        }
    }
}
