// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//  _____ ____ _____ ___ _     ___
// | ____/ ___|_   _|_ _| |   / _ \
// |  _| \___ \ | |  | || |  | | | |
// | |___ ___) || |  | || |__| |_| |
// |_____|____/ |_| |___|_____\___/
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//
// Este é o arquivo cas funcións e estilos de todos os apuntes.

#import("/funcions.typ"): *

/// Funcion para crear un encabezado
//
// :FACER: nome do capitulo ou seccion no encabezado
#let crear_encabezado() = grid(
    columns: 1,
    align: (center + horizon),
    line(length: 100%, stroke: 0.5pt),
)

/// Funcion para crear o pe de paxina
//
// :FACER: non sei se o pe de paxina se ve ben de todo. As notas ao pe
// colocanse no corpo do documento, polo que quedan entre o texto do corpo e a
// liña do pe de paxina. Non me convence, pero tampouco as uso...Esto vai da
// man do 'footer-descent'
#let crear_pe() = {
    context {
        let num = counter(page).get().first()
        if calc.even(num) {
            grid(
                columns: (10%, 1fr),
                align: (left + horizon, right + horizon),
                [#num], line(length:100%, stroke:0.5pt)
            )
        } else {
            grid(
                columns: (1fr, 10%),
                align: (left + horizon, right + horizon),
                line(length:100%, stroke:0.5pt), [#num]
            )
        }
    }
}

/// Funcion para crear a portada
#let crear_portada() = {
    v(3em)
    align(center, text(size:30pt, weight:"bold", title() ) )
    v(1em)
    align(center, smallcaps( context {document.author.join("\n")} ) )
    v(1fr)
    set text(font: "New Computer Modern Mono")
    [
        // :FACER: intervalo entre o inicio e a actualidade
        INIC #datetime(year:2025, month:8, day:1).display() \
        ACTU #datetime.today().display() \
        RAMA #text(font : "Symbols Nerd Font Mono")[] #sys.inputs.at("rama") \
        HASH #text(font : "Symbols Nerd Font Mono")[] #sys.inputs.at("hash") \
        DIRT #sys.inputs.at("dirt")
    ]
}

/// Funcion para crear a Bibliografía
#let crear_bibliografia() = {
    // :FACER: biblio en cada capítulo? https://github.com/typst/typst/issues/1097
    bibliography(
        "/bibliografia.bib",
        // :FACER: máis espazo entre o título e o corpo da bibliografía (falla con indice)
        title: text(font: "New Computer Modern Sans")[Bibliografía],
        style : "ebd.csl"
    )
}

/// Funcion para crear o Índice de materias
//
// :FACER: crear un Indice de cero, con 'query', máis personal
#let crear_indice() = {
    show outline.entry.where( level: 1 ): eso => {
        set block(above: 1.2em)
        set text(weight:"bold", size:15pt)
        eso
    }
    outline(
        title: text(font: "New Computer Modern Sans")[Índice de contidos #v(1em)],
        depth: 2
    )
}

/// Funcion para crear o Índice alfabético
#let crear_indice_alfabetico() = {
    heading(
        level: 1,
        numbering: none,
        text(font: "New Computer Modern Sans")[Índice Alfabético],
    )
    v(1em)
    columns(2)[ #make-index(title: none) ]
}

/// Funcion para crear a contraportada
//
// :FACER: crear unha contraportada decente
#let crear_contraportada() = {
    v(1fr)
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


/// ESTILO do corpo, entre a portada e a contraportada
#let estilo_corpo(doc) = {
    show: marginalia.setup.with(
        inner  : ( far: 5mm, width: 2cm , sep: 5mm ),
        outer  : ( far: 5mm, width: 5cm , sep: 5mm ),
        top    : 4cm,
        bottom : 4cm,
        book   : true,
    )
    set page(
        // :FACER: comezar en 1 no corpo do documento
        numbering      : "1",
        header         : crear_encabezado(),
        footer         : crear_pe(),
        // O texto comeza EXACTAMENTE onde están as marxes. Se queremos ter
        // espazo entre encabezado e o texto, metemos o encabezado _dentro_ da
        // marxe. Co pe de paxina é análogo. O de ascent/descent é canto os
        // metemos nas marxes
        header-ascent  : 10%,
        footer-descent : 10%,
        fill           : rgb("#fdf9e6"),
        background     : none,
        margin         : (
            // Ollo, se se cambia esto hai que cambiar tamén o 'bloque_ancho'
            top     : 4cm,
            inside  : 3cm,
            outside : 6cm,
            bottom  : 4cm
        ),
    )
    set text(fill:black)
    set heading(numbering: "1.")
    set par(
        justify              : true,
        justification-limits : (tracking : (min: -0.04em, max: 0.02em)),
        first-line-indent    : 1.5em,
        linebreaks           : "optimized"
    )
    show raw: set text( font: "New Computer Modern Mono" )
    show quote: eso => {
        set quote(block: true)
        set text(style:"italic")
        eso
    }
    show figure.caption: eso => context {
        set text(font:"New Computer Modern Sans")
        strong[ #eso.supplement~#eso.counter.display() #eso.separator ]
        eso.body
    }
    // :FACER: funcion para escribir ecuacións. #ec, #ec_sin (sin numeracion), #ec_lin (en liña), etc
    // :FACER: como referencio as ecuacións??
    set math.equation(
        numbering: eso => context {
            let HEA = counter(heading.where(level:1)).at(here()).last()
            let SEC = counter(heading.where(level:2)).at(here()).last()
            [(#HEA.#SEC.#eso)]
        }
    )
    // Esto é para customizar as referencias
    // :FACER: numeros para táboas
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
                [[#text(fill:rgb("#bb0000"))[#HEA.#SEC.#NUM]]]
            )
        // O mesmo, pero con definicions
        } else if eso.element != none and eso.element.func() == figure and eso.element.kind == "definicion" {
            let HEA = counter(heading.where(level: 1)).at(eso.element.location()).last()
            let SEC = counter(heading.where(level: 2)).at(eso.element.location()).last()
            let NUM = counter(figure.where(kind:"definicion")).at(eso.element.location()).last()
            link(
                eso.element.location(),
                [[#text(fill:rgb("#bb0000"))[#HEA.#SEC.#NUM]]]
            )
        } else if eso.element != none and eso.element.func() == figure and eso.element.kind == "capitulo" {
            let NUM = counter(figure.where(kind:"capitulo")).at(eso.element.location()).last()
            link(
                eso.element.location(),
                [#text(fill:rgb("#bb0000"))[#NUM]]
            )
        } else if eso.element != none and eso.element.func() == figure and eso.element.kind == "seccion" {
            let HEA = counter(heading.where(level: 1)).at(eso.element.location()).last()
            let SEC = counter(heading.where(level: 2)).at(eso.element.location()).last()
            let NUM = counter(figure.where(kind:"seccion")).at(eso.element.location()).last()
            link(
                eso.element.location(),
                // :FACER: o espazo nobreak debería ser zw
                [$section$#sym.space.nobreak;#text(fill:rgb("#bb0000"))[#HEA.#SEC.#NUM]]
            )
        // SOBREESCRIBIR REFERENCIAS ÁS ECUACION
        // no caso de que a referencia apunte a unha figura de tipo 'math.equation'
        } else if eso.element != none and eso.element.func() == math.equation {
            let HEA = counter(heading.where(level: 1)).at(eso.element.location()).last()
            let SEC = counter(heading.where(level: 2)).at(eso.element.location()).last()
            let NUM = counter(math.equation).at(eso.element.location()).first()
            link(
                eso.element.location(),
                [(#text(fill:rgb("#bb0000"))[#HEA.#SEC.#NUM])]
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

#let activar_estilo(
    autoria           : (),
    titulo            : none,
    portada           : crear_portada(),
    indice            : crear_indice(),
    bibliografia      : crear_bibliografia(),
    indice_alfabetico : crear_indice_alfabetico(),
    contraportada     : crear_contraportada(),
    marco             : false,
    documento
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
        size      : 12pt,
        lang      : "gl",
        font      : "New Computer Modern",
        // fallback  : false,
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

    //// Montamos a portada %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if portada != none {
        show: estilo_portada
        portada
        pagebreak()
    }

    //// As opcions para o corpo do documento %%%%%%%%%%%%%%%%%%%%%%%%%
    show: estilo_corpo


    //// Mostramos o indice
    if indice != none {
        indice
    }

    //// Devolvemos o contido do documento
    // :FACER: separar en frontmatter, mainmatter, backmatter, etc.?
    if marco == true {
        // :FACER: crear un 'show-frame' independente
        // :FACER: facer o frame condicional, cun argumento en activar_estilo
        show: marginalia.show-frame
        documento
    } else {
        documento
    }

    //// Mostramos a bibliografia
    if bibliografia != none {
        pagebreak()
        bibliografia
    }

    //// Mostramos o índice alfabético
    if crear_indice_alfabetico != none {
        pagebreak()
        indice_alfabetico
    }

    //// Mostramos a contraportada %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if contraportada != none {
        show: estilo_contraportada
        contraportada
    }

}
