// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//  _____ _   _ _   _  ____ ___ ___  _   _ ____  %
// |  ___| | | | \ | |/ ___|_ _/ _ \| \ | / ___| %
// | |_  | | | |  \| | |    | | | | |  \| \___ \ %
// |  _| | |_| | |\  | |___ | | |_| | |\  |___) |%
// |_|    \___/|_| \_|\____|___\___/|_| \_|____/ %
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//
// Outras funcions que son algo mais pequechas e non teñen que ver co estilo
// xeral

// :FACER: Palabras clave (en comentarios) en cada arquivo. Logo con python ler
//         todo o diretorio e crear un grafo das relacións entre temas. Usar
//         #metadata() ou comentrios especiais. OU typat eval --in apuntes.typ "$(cat queries.typ)"
// :FACER: concordancia https://en.wikipedia.org/wiki/Concordance_(publishing) tal vez con typst eval tamén
// :FACER: notas á marxe a man
#import "@preview/marginalia:0.2.3" as marginalia: note
// :FACER: indice a man
// :FACER: Indice. Debería poder ir á palabra exacta, en vez de só a paxina
// :FACER: Indice. Resaltar a palabra no texto
// :FACER: Indice. non separar alfabeticamente a - á
// :FACER: Indice. como facer 'see ...'
#import "@preview/in-dexter:0.7.2": index as indice, make-index

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

/// Unha nota ao marxe. Depende do paquete 'marginalia'
#let nota(eso) = {
    // :FACER: usar esto aqui fai que me separe o propio texto..?
    // set par(justify: false)
    note.with(
        numbering: none,
        text-style: (
            size: 0.8em,
            fill: _gris_notas,
            font: _sans,
        ),
    )(eso)
}

/// Usado para citar unha referencia. Coloca a cita no texto e outra versión
// completa da cita na marxe. Se a cita xa apareciu algunha vez, entón só a
// engadimos no texto pero NON na marxe
#let lista_citas = state("citas", ())
// :FACER: as citas deben poder usar 'pre/post notes', e.g. [cap.1 Sha90]
// :FACER: pode usarse esto ao facer @kostrikin_1986 ? Tal vez se uso unha show: cite =>
#let cita(nome) = {
    // Primeiro cítase no propio texto
    cite(label(nome))
    context {
        // Comprobo se a chave da cita, e.g. 'goldberg_1980', xa está na lista.
        let repetido = lista_citas.get().contains(str(nome))
        // Se non o está
        if not repetido {
            // :FACER: cambiar idioma para as citas (así fai mellores hífens)?
            // Includo creando un parámetro (por defecto 'en' ou 'es') para
            // controlalo en cada cita. Ou incluso usar a info da cita?. CSL
            // debería ter un valor tipo 'lang'
            // set text(lang: "en")
            //
            // Engadimos o nome a lista
            lista_citas.update(eso => eso + (str(nome),))
            // E engadimos unha nota ao marxe, ca cita completa
            nota(cite(label(nome), form: "full"),)
        }
    }
}

/// Un teorema simple, e.g. '#teorema("fermat", "teo:fermat")[$a+b=0$]
//
// :FACER: meter automaticamente esto no indice? BLOQUEADO por in-dexter, api non me gusta
// :FACER: usar outra palabra en lugar de 'teorema'
// :FACER: explicar que uso a palabra 'teorema' máis laxa que en matemáticas, e.g.delgado_2010
#let teorema(
    nome   : " -- SEN NOME -- ",
    ancora : " -- SEN ÁNCORA -- ",
    corpo
) = {
    set par(first-line-indent:0pt)
    block(
        stroke : (
            left : rgb(_morado) + _pt_envs
        ),
        fill  : rgb(_morado).lighten(90%),
        below : 0pt,
        width : 100%,
        inset : _in_envs,
        outset : ( bottom: 1pt ), // Para eliminar fallo visual entre bloques
        breakable : false,
        sticky : true,
        [
            #show figure: set align(left)
            #show figure: set block(breakable: false)
            #figure(
                kind:"teorema",
                supplement: nome,
                context {
                    let HEA = counter(heading.where(level: 1)).get().first()
                    let SEC = counter(heading.where(level: 2)).get().last()
                    let NUM = counter(figure.where(kind:"teorema")).get().first()
                    [*Teorema* #HEA.#SEC.#NUM: #smallcaps(nome)]
                }
            )
            // Esto é porque o label debe estar dentro dun contido, e así
            // ánclase á figura anterior
            #label(ancora)
        ]
    )
    block(
        stroke : (
            left : rgb(_morado) + _pt_envs
        ),
        fill  : rgb(_morado).lighten(90%),
        width : 100%,
        inset : _in_envs,
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
        stroke : (
            left : rgb(_morado) + _pt_envs
        ),
        fill  : rgb(_morado).lighten(90%),
        width : 100%,
        below : 0pt,
        inset : _in_envs,
        outset : ( bottom: 1pt ),
        breakable : false,
        sticky : true,
        [
            #show figure: set align(left)
            #show figure: set block(breakable: false)
            #figure(
                kind:"definicion",
                supplement: nome,
                context {
                    let HEA = counter(heading.where(level: 1)).get().first()
                    let SEC = counter(heading.where(level: 2)).get().last()
                    let NUM = counter(figure.where(kind:"definicion")).get().first()
                    [*Definición* #HEA.#SEC.#NUM: #smallcaps(nome)]
                }
            )
            #label(ancora)
        ]
    )
    block(
        stroke : (
            left : rgb(_morado) + _pt_envs
        ),
        fill  : rgb(_morado).lighten(90%),
        width : 100%,
        inset : _in_envs,
        breakable : true,
        [#corpo]
    )
}

#let demostracion(
    ancora : " -- SEN ÁNCORA -- ",
    corpo
) = {
    set text(size: 0.9em, fill: _gris_textos, font: _sans)
    set par(first-line-indent:0pt)
    block(
        stroke : (
            left : _gris_bordos + _pt_envs,
        ),
        fill  : _gris_fondos,
        width : 100%,
        above : 0pt,
        inset : _in_envs,
        outset : ( top: 1pt ),
        breakable : true,
        [#underline[Demostración] #ref(label(ancora)): #v(1em) #corpo #h(1fr) $qed$]
    )
}

#let exemplos(
    corpo
) = {
    set text(size: 0.9em, fill: _gris_textos, font: _sans)
    set par(first-line-indent:0pt)
    block(
        stroke : (
            left : _gris_bordos + _pt_envs,
        ),
        fill  : _gris_fondos,
        width : 100%,
        // above : 0pt,
        inset : _in_envs,
        outset : ( top: 1pt ),
        breakable : true,
        [ #underline[Exemplos]: #v(1em) #corpo]
    )
}


/// Función para crear un CAPITULO, o cal é o nivel máis alto de todos.
#let capitulo(
    nome     : " -- SEN NOME -- ",
    ancora   : " -- SEN ÁNCORA -- ",
    epigrafe : " -- SEN EPÍGRAFE -- "
) = {
    show heading.where(level: 1): eso => {
        show text: set text(font: _sans)
        set align(left)
        let CAP = counter(heading.where(level: 1)).at(here()).last()
        text(size: 1.2em, fill: _gris_titulos)[#v(0.4em)Capítulo #CAP\ ]
        text(size: 3em)[#eso.body]
    }
    pagebreak(to:"odd")
    // set page(header: none) // :FACER: encabezado baleiros ao inciar caps
    counter(heading.where(level: 2)).update(0)
    grid(
        columns : (auto,20%,1fr),
        rows    : (5em, 5em),
        align   : (left, center, right + bottom),

        grid.cell(
            x:0, y:0,
            [
                #show text: eso => sf[#eso]
                #figure(
                    kind: "capitulo",
                    supplement: [Capítulo],
                    heading(
                        level: 1,
                        numbering: "1.",
                        [#nome],
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
    show figure: set align(left)
    show heading.where(level: 2): eso => {
        let HEA = counter(heading.where(level: 1)).at(here()).last()
        let SEC = counter(heading.where(level: 2)).at(here()).last()
        set text(size: 1.5em)
        sf[#v(1.5em) #h(1fr) *$section$* #HEA.#SEC #eso.body #v(0.5em)]
    }
    block(
        sticky: true,
        [
            #figure(
                kind: "seccion",
                supplement: [Sección],
                heading(
                    level: 2,
                    numbering: "1.",
                    [#nome],
                )
            )
            #label(ancora)
        ]
    )
}

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
            block(width: 100% + 3cm, contido)
        } else {
            set align(left)
            block(width: 100% + 3cm, contido)
        }
    }
}

// Letras moi reviradas
#let scr(eso) = text(
    features: ("ss01",),
    box($cal(eso)$),
)

#let frecha = text(
    box($stretch(arrow.r, size: #300%)$)
)

#let mapea = text(
    box($stretch(mapsto, size: #300%)$)
)

#let implica = text(
    box($arrow.r.double$)
)

#let sse = math.class(
    "relation",
    box($arrow.r.l.double$)
)

#let subgrupo = text(
    box($lt.eq.slant$)
)

#let card(eso) = text(
    box($"card"(eso)$)
)

#let emptyset = text(
    features: ("cv01",),
    box($emptyset$),
)

#let rel = math.class(
    "large",
    $~$
)
