// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//  _____ ____ _____ ___ _     ___
// | ____/ ___|_   _|_ _| |   / _ \
// |  _| \___ \ | |  | || |  | | | |
// | |___ ___) || |  | || |__| |_| |
// |_____|____/ |_| |___|_____\___/
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//
// Este é o arquivo cas funcións e estilos de todos os apuntes.
//
// Defínense:
//
// - Funcións para crear distintas partes do documento:
//     crear_portada()
//     crear_indice_contidos()
//     crear_encabezado()
//     crear_bibliografia()
//     crear_indice_alfabetico()
//     crear_indice_teoremas()
//     crear_indice_definicions()
//     crear_contraportada()
// - Funcións para aplicar estilos concretos, as cales aceptan contido:
//     estilo_xeral()
//     estilo_portada()
//     estilo_frontmatter()
//     estilo_mainmatter()
//     estilo_backmatter()
//     estilo_contraportada()

#import("/funcions/texto.typ"): *
#import("/funcions/variables.typ"): *

/// Funcion para crear a portada
#let crear_portada() = {
    set align(center)
    v(3em)
    text(size:3em, weight:"bold", title() )
    v(1em)
    smallcaps( context {document.author.join("\n")} )
    v(1em)
    set text(font: _mono)
    link("https://github.com/deivisCode/apuntes")
    v(1em)
    grid(
        align: left,
        rows: (5em, 5em),
        [
            RAMA #nf[] #sys.inputs.at("rama") \
            HASH #nf[] #sys.inputs.at("hash") \
            DIRT #sys.inputs.at("dirt")
        ],
        [
            #let inicio = datetime(year:2025, month:8, day:1)
            #let actual = datetime.today()
            INIC #inicio.display() \
            ACTU #datetime.today().display() \
            DURA #{ actual - inicio }.days() días
        ]
    )
}

/// Funcion para crear o Índice de materias
#let crear_indice_contidos() = {
    show outline.entry.where( level: 1 ): set block(above: 1.5em, below: 1em)
    show outline.entry.where( level: 1 ): set text(weight:"bold", font: _sans, size:1.4em)
    show outline.entry.where( level: 1 ): set outline.entry(fill: none)
    show heading.where(level: 1): set block(below: 1em)
    heading(
        level      : 1,
        numbering  : none,
        outlined   : false,
        bookmarked : true,
        sf[Índice de contidos],
    )
    outline(
        title: none,
        depth: 2
    )
}

/// Funcion para crear un encabezado
//
// :FACER: nome do seccion no encabezado
#let crear_encabezado() = context {
    let num = counter(page).get().first()
    if calc.even(num) {
        set text(size: 0.8em, fill: _gris_titulos)
        let cap = query(heading.where(level: 1).before(here()))
        grid(
            columns : (1fr, 1fr, 1fr),
            rows    : (1em, 1em),
            align   : (left + horizon, right + horizon, right + horizon),
            grid.cell(
                x:2, y:0,
                upper[#cap.last().body]
            ),
            grid.cell(
                x:0, y:1,
                colspan: 3,
                line(length: 100%, stroke: _pt_fino + _gris_titulos),
            )
        )
    } else {
        line(length: 100%, stroke: _pt_fino + _gris_titulos)
    }
}

/// Funcion para crear o pe de paxina
#let crear_pe() = context {
    let num = counter(page).get().first()
    if calc.even(num) {
        grid(
            columns: (10%, 1fr),
            align: (left + horizon, right + horizon),
            [*#num*], line(length:100%, stroke: _pt_fino + _gris_titulos)
        )
    } else {
        grid(
            columns: (1fr, 10%),
            align: (left + horizon, right + horizon),
            line(length:100%, stroke: _pt_fino + _gris_titulos ), [*#num*]
        )
    }
}

/// Funcion para crear a Bibliografía
#let crear_bibliografia() = {
    // :FACER: biblio en cada capítulo? https://github.com/typst/typst/issues/1097
    show heading.where(level: 1): set block(below: 1em)
    bibliography(
        "/bibliografia.bib",
        title: sf[Bibliografía],
        style : "/ebd.csl"
    )
}

/// Funcion para crear o Índice alfabético
#let crear_indice_alfabetico() = {
    heading(
        level: 1,
        numbering: none,
        sf[Índice Alfabético],
    )
    v(1em)
    columns(2)[ ]
}

// Funcion para crear o índice de teoremas
#let crear_indice_teoremas() = {
    show outline.entry: eso => {
        link(
            eso.element.location(),
            box[
                #eso.element.supplement
                #h(0.4em)
                #box(width: 1fr,repeat([.], gap: 0.4em))
                #h(0.4em)
                #eso.page()
                \
            ]
        )
    }
    heading(
        level: 1,
        numbering: none,
        sf[Índice de Teoremas],
    )
    v(1em)
    columns(2)[
        #outline(
            title: none,
            depth: 1,
            target: figure.where(kind: "teorema")
        )
    ]
}

// Funcion para crear o índice de definicions
#let crear_indice_definicions() = {
    show outline.entry: eso => {
        link(
            eso.element.location(),
            box[
                #eso.element.supplement
                #h(0.4em)
                #box(width: 1fr,repeat([.], gap: 0.4em))
                #h(0.4em)
                #eso.page()
                \
            ]
        )
    }
    heading(
        level: 1,
        numbering: none,
        sf[Índice de Definicións],
    )
    v(1em)
    columns(2)[
        #outline(
            title: none,
            depth: 1,
            target: figure.where(kind: "definicion")
        )
    ]
}

/// Funcion para crear a contraportada
//
// :FACER: crear unha contraportada decente
#let crear_contraportada() = {
    v(1fr)
}

/// ESTILO xeral, que aplica a TODO
#let estilo_xeral(
    titulo  : none,
    autoria : (),
    doc,
) = {
    set document(
        title  : titulo,
        author : autoria.map(autor => autor.nome),
        date   : datetime.today()
    )
    set page(
        paper   : "a4",
        binding : left,
    )
    set text(
        size      : _pt_letra,
        lang      : "gl",
        font      : _norm,
        weight    : 550,
        fallback  : false,
        style     : "normal",
        features  : (
            // = 0: false
            // >=1: true
            // algunhas poden diferenciar valores como 1,2,3,4, etc.
            // Outra posibilidade é cun array de cadeas ("ss05", "salt", etc)
            // https://en.wikipedia.org/wiki/List_of_typographic_features
            liga : 1,
            kern : 1,
        ),
        overhang  : true,
        costs     : (
            hyphenation : 100%,
            runt        : 100%,
            widow       : 100%,
            orphan      : 100%,
        ),
        region    : "ES",
        script    : "latn",
        dir       : ltr,
        hyphenate : true,
    )
    set par(
        justify              : true,
        justification-limits : (
            tracking : (min: -0.04em, max: 0.02em),
            spacing  : (min: 66.67% + 0pt, max: 150% + 0pt)
        ),
        first-line-indent    : 1.5em,
        spacing              : 0.65em,
        leading              : 0.65em,
        linebreaks           : "optimized"
    )
    show heading: set text(size: _pt_letra) // Un apaño
    show math.equation: set text(font: _math)
    doc
}

/// ESTILO da portada, fondos, cor por defecto, etc. Non ten contido, só estilo
#let estilo_portada(doc) = {
    set page(
        header     : none,
        footer     : none,
        numbering  : none,
        fill       : black,
        margin     : (top: 3cm, inside: 3cm, outside: 3cm, bottom: 3cm),
        background : rect(height: 90%, width: 90%, stroke: 3pt + red),
    )
    set text(fill: white)
    doc
}

#let estilo_frontmatter(doc) = {
    doc
}

/// ESTILO do corpo, entre a portada e a contraportada
#let estilo_mainmatter(doc) = {
    set page(
        // :FACER: comezar en 1 no corpo do documento
        numbering      : "1",
        header         : crear_encabezado(),
        footer         : crear_pe(),
        header-ascent  : 10%,
        footer-descent : 10%,
        background     : none,
        margin         : (
            // Ollo, se se cambia esto hai que cambiar tamén o 'bloque_ancho'
            top     : 3cm,
            inside  : 3cm,
            outside : 6cm,
            bottom  : 3cm
        ),
    )
    set text(fill:black)
    show math.equation.where(block: false): eso => { box(eso) }
    show raw: set text(font: _mono)
    show quote: set quote(block: true)
    show quote: set text(style:"italic")
    show figure.caption: set text(font: _sans)
    show figure.caption: eso => {
        strong[ #eso.supplement~#eso.counter.display() #eso.separator ]
        eso.body
    }
    // :FACER: funcion para escribir ecuacións. #ec, #ec_sin (sin numeracion), #ec_lin (en liña), etc
    // :FACER: como referencio as ecuacións??
    set math.equation(
        numbering: eso => {
            let HEA = counter(heading.where(level:1)).at(here()).last()
            let SEC = counter(heading.where(level:2)).at(here()).last()
            [(#HEA.#SEC.#eso)]
        }
    )
    // Esto é para customizar as referencias
    // :FACER: numeros para táboas
    // :FACER: pageref, incluso con nomes do teorema #context { query(<def:alxebra:subestrutura>).first().location().page() }
    // :FACER: simplificar esto...
    show ref: eso => {
        // SOBREESCRIBIR REFERENCIAS ÁS FIGURAS DOS TEOREMAS
        // no caso de que a referencia apunte a unha figura de tipo "teorema"
        if eso.element != none and eso.element.func() == figure and eso.element.kind == "teorema" {
            // :FACER: por qué non necesito usar un contexto aqui?
            let HEA = counter(heading.where(level: 1)).at(eso.element.location()).last()
            let SEC = counter(heading.where(level: 2)).at(eso.element.location()).last()
            let NUM = counter(figure.where(kind:"teorema")).at(eso.element.location()).last()
            link(
                eso.element.location(),
                [#HEA.#SEC.#NUM]
            )
        // O mesmo, pero con definicions
        } else if eso.element != none and eso.element.func() == figure and eso.element.kind == "definicion" {
            let HEA = counter(heading.where(level: 1)).at(eso.element.location()).last()
            let SEC = counter(heading.where(level: 2)).at(eso.element.location()).last()
            let NUM = counter(figure.where(kind:"definicion")).at(eso.element.location()).last()
            link(
                eso.element.location(),
                [#HEA.#SEC.#NUM]
            )
        } else if eso.element != none and eso.element.func() == figure and eso.element.kind == "capitulo" {
            let NUM = counter(figure.where(kind:"capitulo")).at(eso.element.location()).last()
            link(
                eso.element.location(),
                [#NUM]
            )
        } else if eso.element != none and eso.element.func() == figure and eso.element.kind == "seccion" {
            let HEA = counter(heading.where(level: 1)).at(eso.element.location()).last()
            let SEC = counter(heading.where(level: 2)).at(eso.element.location()).last()
            let NUM = counter(figure.where(kind:"seccion")).at(eso.element.location()).last()
            link(
                eso.element.location(),
                [#HEA.#SEC.#NUM]
            )
        // SOBREESCRIBIR REFERENCIAS ÁS ECUACION
        // no caso de que a referencia apunte a unha figura de tipo 'math.equation'
        } else if eso.element != none and eso.element.func() == math.equation {
            let HEA = counter(heading.where(level: 1)).at(eso.element.location()).last()
            let SEC = counter(heading.where(level: 2)).at(eso.element.location()).last()
            let NUM = counter(math.equation).at(eso.element.location()).first()
            link(
                eso.element.location(),
                [#HEA.#SEC.#NUM]
            )
        // No resto de casos
        } else {
            eso
        }
    }
    show footnote: eso => {
        super([[#text(fill: rgb("#bb0000"), weight:"bold", eso)]])
    }
    show footnote.entry: eso => {
        let loc = eso.note.location()
        let num = counter(footnote).at(loc).first()
        link(
            loc,
            [
                #super(
                    [[#text(fill: rgb("#bb0000"), weight:"bold", [#num])]]
                )
                #eso.note.body
            ]
        )
    }
    doc
}

#let estilo_backmatter(doc) = {
    doc
}

/// ESTILO da contraportada, idéntico á portada
#let estilo_contraportada(doc) = {
    set page(
        header     : none,
        footer     : none,
        numbering  : none,
        fill       : black,
        margin     : (top: 3cm, inside: 3cm, outside: 3cm, bottom: 3cm),
        background : rect(height: 90%, width: 90%, stroke: 3pt + red),
    )
    set text(fill: white)
    doc
}

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//     _    ____ _____ _____     ___    ____    _____ ____ _____ ___ _     ___  %
//    / \  / ___|_   _|_ _\ \   / / \  |  _ \  | ____/ ___|_   _|_ _| |   / _ \ %
//   / _ \| |     | |  | | \ \ / / _ \ | |_) | |  _| \___ \ | |  | || |  | | | |%
//  / ___ \ |___  | |  | |  \ V / ___ \|  _ <  | |___ ___) || |  | || |__| |_| |%
// /_/   \_\____| |_| |___|  \_/_/   \_\_| \_\ |_____|____/ |_| |___|_____\___/ %
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#let activar_estilo(
    autoria            : (),
    titulo             : none,
    portada            : crear_portada(),
    indice_contidos    : crear_indice_contidos(),
    bibliografia       : crear_bibliografia(),
    indice_alfabetico  : crear_indice_alfabetico(),
    indice_teoremas    : crear_indice_teoremas(),
    indice_definicions : crear_indice_definicions(),
    contraportada      : crear_contraportada(),
    documento
) = {

    //// ESTILO XERAL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    // Estilo xeral que afecta a TODO o documento.
    // Cousas como a tipografía básica, kerning,
    // dirección do texto, idioma, etc
    show: estilo_xeral.with(
        autoria : autoria,
        titulo  : titulo
    )

    //// PORTADA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    {

        if portada != none {
            show: estilo_portada
            portada
            pagebreak()
        }

    }

    //// FRONTMATTER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    // Cousas como o índice, agradecementos, dereitos, copyright, etc.
    {
        show: estilo_frontmatter

        // Mostramos o índice
        if indice_contidos != none {
            indice_contidos
        }

    }

    ////  MAINMATTER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    // O corpo do documento. Capítulos e tal.
    {
        show: estilo_mainmatter

        //// Devolvemos o contido do documento
        documento
    }

    //// BACKMATTER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    // Fin do documento, apéndices, índice alfabético, biblio, etc.
    {
        show: estilo_backmatter

        // Mostramos a bibliografía
        if bibliografia != none {
            pagebreak()
            bibliografia
        }

        if crear_indice_teoremas != none {
            pagebreak()
            indice_teoremas
        }

        if crear_indice_definicions != none {
            pagebreak()
            indice_definicions
        }

        // Mostramos o índice alfabético
        if crear_indice_alfabetico != none {
            pagebreak()
            indice_alfabetico
        }

    }

    //// CONTRAPORTADA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    // Simplemente a contraportada
    {

        if contraportada != none {
            show: estilo_contraportada
            contraportada
        }

    }

}
