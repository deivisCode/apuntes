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
// - Función para crear os apuntes


// Importo variables como o tamaño de letra, cores, funcións para escribir en Sans, etc.
#import("/funcions/variables.typ"): *

// Funcion para crear a portada
// :FACER: usar un grid para a portada
#let crear_portada() = {
    v(3em)
    text(size:3em, slab(title()) )
    v(1em)
    smallcaps( context {document.author.join("\n")} )
    v(1em)
    link("https://github.com/deivisCode/apuntes")
    v(1em)
    grid(
        align: left,
        rows: (5em, 5em),
        [
            RAMA #simbolos[] #sys.inputs.at("rama") \
            HASH #simbolos[] #sys.inputs.at("hash") \
            DIRT #sys.inputs.at("dirt")
        ],
        [
            #let inicio = datetime(year:2025, month:8, day:1)
            #let actual = datetime.today()
            INIC #inicio.display() \
            ACTU #datetime.today().display() \
            DURA #{ actual - inicio }.days() días \
            CONT #sys.inputs.at("contribucions") contribucións
        ]
    )
}

// Funcion para crear o Índice de materias
#let crear_indice_contidos() = {
    // Encabezado de Nivel 1 para o propio índice de contidos
    heading(
        level      : 1,
        numbering  : none,  // Non está numerado
        outlined   : false, // Non aparece no propio índice
        bookmarked : true,  // Pero si nos marcadores
        condensada[Índice de contidos],
    )
    outline(
        title : none,
        depth : 2
    )
}

/// Funcion para crear un encabezado
//
// Este estado garda todas as seccións do libro
#let _seccions = state("seccions", ([ ],))

// Ollo, este 'context' é extremadamente grande
#let crear_encabezado() = context {
    // Páxina actual
    let num = counter(page).get().first()
    // Páxinas pares (esquerda)
    if calc.even(num) {
        set text(size: 0.8em, fill: _gris_titulos)
        // Todas as seccións definidas na páxina actual. Depende da función
        // 'sección' que crea unha figura baleira de tipo "seccions-49" con
        // metadata("nome seccion") dentro
        let seccions = query(figure.where(kind: "seccions-" + str(here().page())))
        // A última sección que hai na páxina
        let seccion_ultima = if seccions.len() != 0 {
            // Se hai seccións nesta páxina, mostrámola e actualizamos a lista global
            // Recordemos que:
            // seccions                   -> array
            // seccions.last()            -> ultimo elemento, unha figura
            // seccions.last().body       -> o corpo da figura (#metadata)
            // seccions.last().body.value -> o valor da metadata (o nome da seccion)
            seccions.last().body.value
            _seccions.update(s => s + (seccions.last().body.value,) )
        } else {
            // Se non hai, usamos a sección da lista global
            _seccions.get().last()
        }
        // Mostrar o encabezado. 2 filas, 3 columnas. 2ª fila toda xunta cunha liña
        grid(
            columns : 1,
            rows    : (1em, 1em),
            align   : left + horizon,
            grid.cell(
                x:0, y:0,
                condensada[#seccion_ultima]
            ),
            grid.cell(
                x:0, y:1,
                line(length: 100%, stroke: _pt_fino + _gris_titulos),
            )
        )
    // Páxinas impares (dereita)
    } else {
        set text(size: 0.8em, fill: _gris_titulos)
        let seccions = query(figure.where(kind: "seccions-" + str(here().page())))
        let seccion_ultima = if seccions.len() != 0 {
            seccions.last().body.value
            _seccions.update(s => s + (seccions.last().body.value,) )
        } else {
            _seccions.get().last()
        }
        grid(
            columns : 1,
            rows    : (1em, 1em),
            align   : right + horizon,
            grid.cell(
                x:0, y:0,
                condensada[#seccion_ultima]
            ),
            grid.cell(
                x:0, y:1,
                line(length: 100%, stroke: _pt_fino + _gris_titulos),
            )
        )
    }
}

/// Funcion para crear o pe de paxina
#let crear_pe() = context {
    // Páxina actual
    let num = counter(page).get().first()
    // Páxinas pares (esquerda)
    if calc.even(num) {
        grid(
            columns : (10%, 1fr),
            align   : (left + horizon, right + horizon),
            [*#num*], line(length:100%, stroke: _pt_fino + _gris_titulos)
        )
    // Páxinas impares (dereita)
    } else {
        grid(
            columns : (1fr, 10%),
            align   : (left + horizon, right + horizon),
            line(length:100%, stroke: _pt_fino + _gris_titulos ), [*#num*]
        )
    }
}

/// Funcion para crear a Bibliografía
#let crear_bibliografia() = {
    // Mostrar a bibliografía
    bibliography(
        "/bibliografia.bib",
        title : condensada[Bibliografía],
        style : "/ebd.csl"
    )
}

/// Funcion para crear o Índice alfabético
#let crear_indice_alfabetico() = {
    heading(
        level: 1,
        numbering: none,
        condensada[Índice Alfabético],
    )
    v(1em)
    columns(2)[ ]
}

// Funcion para crear o índice de teoremas
#let crear_indice_teoremas() = {
    // Refacer o outline case de cero
    show outline.entry: eso => {
        link(
            eso.element.location(),
            box[
                #eso.element.supplement
                #h(0.4em)
                #box(width: 1fr,repeat([.], gap: 0.4em))
                #h(0.4em)
                #eso.page()
            ]
        )
    }
    heading(
        level: 1,
        numbering: none,
        condensada[Índice de Teoremas],
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
            ]
        )
    }
    heading(
        level: 1,
        numbering: none,
        condensada[Índice de Definicións],
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
        height  : _alto_pax,
        width   : _ancho_pax,
        binding : left,
    )
    set text(
        size      : _pt_letra,
        font      : _norm.familia,
        weight    : _norm.peso,
        style     : _norm.estilo,
        stretch   : _norm.estiramento,
        fallback  : false,
        features  : (
            // = 0: false, >=1: true
            // algunhas poden diferenciar valores como 1,2,3,4, etc.
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
        lang      : "gl",
        region    : "ES",
        script    : "latn",
        dir       : ltr,
        hyphenate : true,
    )
    set par(
        justify              : true,
        justification-limits : _tamaños_xustificacion,
        first-line-indent    : _par_ind,
        spacing              : _spacing,
        leading              : _leading,
        linebreaks           : "optimized"
    )
    show raw: eso => mono(eso)
    show math.equation: eso => mates(eso)
    // Un apaño: https://github.com/typst/typst/discussions/2919#discussioncomment-7831644
    // :FACER: cando deixe de ser necesario sobreescribir os valores dos
    // encabezados estaría ben unificar todos os 'show heading' que hai
    // desperdigados, como os dos indices, biblio, etc. Tamén depende de que
    // haxa máis cousas seleccionables, como 'show heading/footer, etc,'
    show heading: set text(size: _pt_letra)
    doc
}

/// ESTILO da portada, fondos, cor por defecto, etc. Non ten contido, só estilo
#let estilo_portada(doc) = {
    set align(center)
    set page(
        header     : none,
        footer     : none,
        numbering  : none,
        fill       : black,
        margin     : (top: 3cm, inside: 3cm, outside: 3cm, bottom: 3cm),
        background : rect(height: 90%, width: 90%, stroke: 3pt + red),
    )
    set text(fill: white)
    show grid: set text(font: _mono.familia)
    show link: set text(font: _mono.familia)
    doc
}

// ESTILO do frontmatter. Agradecementos, índice de contido, prólogo, etc.
#let estilo_frontmatter(doc) = {
    show outline.entry.where( level: 1 ): set block(above: 1.5em, below: 1em)
    show outline.entry.where( level: 1 ): set text(
        font    : _cond.familia,
        weight  : _cond.peso + 250,
        stretch : _cond.estiramento,
        size    : 1.4em,
    )
    show outline.entry.where( level: 1 ): set outline.entry(fill: none)
    show heading.where(level: 1): set block(below: 1em)
    doc
}

/// ESTILO do corpo. O propio documento con matemáticas e física
#let estilo_mainmatter(doc) = {
    set page(
        numbering      : "1",
        header         : crear_encabezado(),
        footer         : crear_pe(),
        header-ascent  : 10%,
        footer-descent : 10%,
        background     : none,
        margin         : (
            top     : _marxe_sup,
            inside  : _marxe_int,
            outside : _marxe_ext,
            bottom  : _marxe_inf
        ),
    )
    // As ecuacions no texto deben ser 'box' para que non se rompan
    show math.equation.where(block: false): eso => { box(eso) }
    show quote: set text(style:"italic")
    show figure.caption: set text(font: _sans.familia)
    show figure.caption: eso => {
        strong[#eso.supplement~#eso.counter.display() #eso.separator]
        eso.body
    }
    // :FACER: funcion para escribir ecuacións. #ec, #ec_sin (sin numeracion),
    // #ec_lin (en liña), etc. Véxase:
    // https://github.com/typst/typst/issues/3031
    // https://github.com/typst/typst/issues/380
    set math.equation(
        numbering: eso => {
            let HEA = counter(heading.where(level:1)).at(here()).last()
            let SEC = counter(heading.where(level:2)).at(here()).last()
            [(#HEA.#SEC.#eso)]
        }
    )
    // Esto é para customizar as referencias
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
            // :FACER: Por que teño que sumarlle 1..?
            let SEC = counter(heading.where(level: 2)).at(eso.element.location()).last() +1
            link(
                eso.element.location(),
                [#HEA.#SEC]
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
    doc
}

#let estilo_backmatter(doc) = {
    // Encabezados nivel 1 con máis espaciado
    show heading.where(level: 1): set block(below: 1em)
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
//   ____ ____  _____    _    ____       _    ____  _   _ _   _ _____ _____ ____
//  / ___|  _ \| ____|  / \  |  _ \     / \  |  _ \| | | | \ | |_   _| ____/ ___|
// | |   | |_) |  _|   / _ \ | |_) |   / _ \ | |_) | | | |  \| | | | |  _| \___ \
// | |___|  _ <| |___ / ___ \|  _ <   / ___ \|  __/| |_| | |\  | | | | |___ ___) |
//  \____|_| \_\_____/_/   \_\_| \_\ /_/   \_\_|    \___/|_| \_| |_| |_____|____/
//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#let crear_apuntes(
    autoria            : (),
    titulo             : none,
    portada            : true,
    indice_contidos    : true,
    bibliografia       : true,
    indice_alfabetico  : true,
    indice_teoremas    : true,
    indice_definicions : true,
    contraportada      : true,
    documento          : none
) = {

    // ESTILO XERAL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    // Estilo xeral que afecta a TODO o documento. Cousas como a tipografía
    // básica, kerning, dirección do texto, idioma, etc
    show: estilo_xeral.with(
        autoria : autoria,
        titulo  : titulo
    )

    //// PORTADA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    {

        if portada {
            show: estilo_portada
            crear_portada()
            pagebreak()
        }

    }

    // FRONTMATTER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    // Cousas como o índice, agradecementos, dereitos, copyright, etc.
    {
        show: estilo_frontmatter

        // Mostramos o índice
        if indice_contidos {
            crear_indice_contidos()
        }

    }

    //  MAINMATTER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    // O corpo do documento. Capítulos e tal.
    {
        show: estilo_mainmatter

        //// Devolvemos o contido do documento
        documento
    }

    // BACKMATTER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    // Fin do documento, apéndices, índice alfabético, biblio, etc.
    {
        show: estilo_backmatter

        // Mostramos a bibliografía
        if bibliografia {
            pagebreak()
            crear_bibliografia()
        }

        if indice_teoremas {
            pagebreak()
            crear_indice_teoremas()
        }

        if indice_definicions {
            pagebreak()
            crear_indice_definicions()
        }

        // Mostramos o índice alfabético
        if indice_alfabetico {
            pagebreak()
            crear_indice_alfabetico()
        }

    }

    //// CONTRAPORTADA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    // Simplemente a contraportada
    {

        if contraportada {
            show: estilo_contraportada
            crear_contraportada()
        }

    }

}
