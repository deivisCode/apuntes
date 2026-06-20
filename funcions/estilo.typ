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
//     crear_apuntes()
//
// %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
//
// Niveis (depth) dos títulos (headers):
// (1) META:     Portada, Indice, Corpo do documento, Biblografía principal, Índices
//               adicionais, contraportada
// (2) PARTE:    Separacións semánticas do corpo máis xerais: física, matemáticas;
//               ou Conceptos Básicos, Matemáticas, Matemáticas Aplicadas, etc.
// (3) CAPÍTULO: Contido cunha mesma semántica, notación e finalidade: álxebra,
//               topoloxía, mecánica clásica, etc.
// (4) SECCIÓN:  Separacións necesarias para os capítulos
//
// Manter un ollo en:
// https://github.com/typst/typst/issues/1896 [Ergonomic numbering-by-section]
// https://github.com/typst/typst/issues/2652 [Dependent numberings]


// Importo variables como o tamaño de letra, cores, funcións para escribir en
// Sans, etc.
// :FACER: meter a info cun #toml(info.toml)?
#import("/funcions/variables.typ"): *

// Funcion para crear a portada
#let crear_portada() = grid(
    columns : 1fr,
    rows    : (1fr, 1fr, 1fr),

    grid.cell(
        x:0, y:0,
        {
            set align(center + horizon)
            text(size:3em, slab(title()) )
        }
    ),

    grid.cell(
        x:0, y:1,
        {
            set align(center + horizon)
            smallcaps( context {document.author.join("\n")} )
            v(1em)
            link("https://github.com/deivisCode/apuntes")
        }
    ),

    grid.cell(
        x:0, y:2,
        {
            set align(center + horizon)
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
    )

)

// Funcion para crear o Índice de materias
// Manter un ollo en:
// https://github.com/typst/typst/issues/1926 [Ancestry/inside/within selector]
// :FACER: o de repetir 'numbering' en tantos sitios é un lio...
#let crear_indice_contidos() = {
    // Encabezado de Nivel 1 para o propio índice de contidos
    heading(
        depth      : 1,
        numbering  : none,  // Non está numerado
        bookmarked : true,  // Pero si nos marcadores
        rect(
            width:100%,
            height:2cm,
            {
                set align(center + horizon)
                text(
                    size:2em,
                    condensada[Índice de contidos]
                )
            }
        )
    )
    context {
        set par(first-line-indent: 0pt)
        let encabezados = query(heading)
        v(1cm)
        // :FACER: tal vez faga falla separar os heading(depth:2) within
        // heading(within:1) ou como sexa. Agora mesmo esto é un bucle lineal
        for enc in encabezados {
            // META (portada, índice, documento, biblio, etc)
            if enc.level == 1 {
                // :FACER: meta-encabezados (nivel 1) aparte
                // :FACER: tal vez biblio, índices, etc. en figuras kind:
                //         anexos, e facer outro índice para esas partes, ou
                //         algo así
            // PARTES do documento
            } else if enc.level == 2 {
                text(
                    size: 1.5em,
                    {
                        set align(center)
                        let PARTE = counter(heading).at(enc.location()).last()
                        link(
                            enc.location(),
                            {
                                smallcaps[Parte]; h(1em)
                                numbering("I", PARTE); v(1pt)
                                enc.body
                            }
                        )
                    }
                )
                linebreak()
            // CAPITULOS
            } else if enc.level == 3 {
                let PAX = counter(page).at(enc.location()).first()
                let CAP = counter(heading).at(enc.location()).last()
                v(6pt)
                link(
                    enc.location(),
                    condensada[#CAP. #enc.body ]
                )
                box(width: 1fr,repeat([.], gap: 0.4em))
                condensada[ #PAX]
                linebreak()
            // SECCIONS
            } else if enc.level == 4 {
                // :FACER: indentar todo isto, ao mesmo nivel que a primeira
                // letra do capítulo. Fai falla refacer todo o índice...
                set text(features: (onum: 1))
                let PAX = counter(page).at(enc.location()).first()
                link(
                    enc.location(),
                    [#enc.body (#PAX) #h(5pt)]
                )
            }
        }
    }
}

/// Funcion para crear un encabezado
//
// Este estado garda todas as seccións do libro
#let _seccions = state("seccions", ([ ],))

// A propia función que devolve o contido (separada do resto para aprobeitar o
// caché de typst)
#let contido_cabeza(sec) = {
    grid(
        columns : 1,
        rows    : (1em, 1em),
        align   : left + horizon,
        grid.cell(x:0, y:0, condensada(sec)),
        grid.cell(x:0, y:1, line(length: 100%, stroke: _pt_fino + _gris_titulos))
    )
}

// A función que determina a info de cada encabezado e logo usamos en cada
// páxina. Ollo, este 'context' é extremadamente grande
// :FACER: non mostrar o encabezado en páxinas en branco, en inicios de cap, etc.
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
        contido_cabeza(seccion_ultima)
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
        contido_cabeza(seccion_ultima)
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
        depth: 1,
        numbering: none,
        condensada[Índice Alfabético],
    )
    v(1em)
    columns(2)[ ]
}

// :FACER: xuntar función comun e separar tipos
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
        depth: 1,
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
        depth: 1,
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
        lang      : "gl",
        region    : "ES",
        script    : "latn",
        dir       : ltr,
        hyphenate : true,
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
    set text(
        overhang : true,
        costs    : (
            hyphenation : 100%,
            runt        : 100%,
            widow       : 100%,
            orphan      : 100%,
        )
    )
    set par(
        justify              : true,
        justification-limits : _tamaños_xustificacion,
        first-line-indent    : _par_ind,
        spacing              : _spacing,
        leading              : _leading,
        linebreaks           : "optimized"
    )
    // As ecuacions no texto deben ser 'box' para que non se rompan
    show math.equation.where(block: false): eso => { box(eso) }
    show quote: set text(style:"italic")
    show figure.caption: eso => {
        set text(size: 0.83em)
        sans[*#eso.supplement~#eso.counter.display():*]
        sans[#eso.body]
    }
    // :FACER: funcion para escribir ecuacións. #ec, #ec_sin (sin numeracion),
    // #ec_lin (en liña), etc. Véxase:
    // https://github.com/typst/typst/issues/3031
    // https://github.com/typst/typst/issues/380
    //
    // (capitulo.seccion.numero_absoluto)
    set math.equation(
        numbering: eso => {
            let CAP = counter(heading.where(level:3)).at(here()).last()
            let SEC = counter(heading.where(level:4)).at(here()).last()
            [(#CAP.#SEC.#eso)]
        }
    )
    // Esto é para customizar as referencias
    // :FACER: simplificar esto...
    // :FACER: por que as veces é .last() e outras .first() ? LEER: https://typst.app/docs/reference/introspection/counter/
    // :FACER: unificar <exp:>, <ec:>, etc. Facer tests?
    show ref: eso => {
        // SOBREESCRIBIR REFERENCIAS ÁS FIGURAS DOS TEOREMAS
        // no caso de que a referencia apunte a unha figura de tipo "teorema"
        // (capitulo.seccion.numero_absoluto)
        if eso.element != none and eso.element.func() == figure and eso.element.kind == "teorema" {
            // :FACER: por qué non necesito usar un contexto aqui?
            let CAP = counter(heading.where(level: 3)).at(eso.element.location()).last()
            let SEC = counter(heading.where(level: 4)).at(eso.element.location()).last()
            let NUM = counter(figure.where(kind:"teorema")).at(eso.element.location()).last()
            link( eso.element.location(), [#CAP.#SEC.#NUM])
        // O mesmo, pero con definicions
        // (capitulo.seccion.numero_absoluto)
        } else if eso.element != none and eso.element.func() == figure and eso.element.kind == "definicion" {
            let CAP = counter(heading.where(level: 3)).at(eso.element.location()).last()
            let SEC = counter(heading.where(level: 4)).at(eso.element.location()).last()
            let NUM = counter(figure.where(kind:"definicion")).at(eso.element.location()).last()
            link( eso.element.location(), [#CAP.#SEC.#NUM])
        // (capitulo)
        } else if eso.element != none and eso.element.func() == figure and eso.element.kind == "capitulo" {
            let NUM = counter(figure.where(kind:"capitulo")).at(eso.element.location()).last()
            link( eso.element.location(), [#NUM])
        // (capitulo.seccion)
        } else if eso.element != none and eso.element.func() == figure and eso.element.kind == "seccion" {
            let CAP = counter(heading.where(level: 3)).at(eso.element.location()).last()
            // :FACER: Por que teño que sumarlle 1..?
            let SEC = counter(heading.where(level: 4)).at(eso.element.location()).last() +1
            link( eso.element.location(), [#CAP.#SEC])
        // SOBREESCRIBIR REFERENCIAS ÁS ECUACION
        // no caso de que a referencia apunte a unha figura de tipo 'math.equation'
        } else if eso.element != none and eso.element.func() == math.equation {
            let CAP = counter(heading.where(level: 3)).at(eso.element.location()).last()
            let SEC = counter(heading.where(level: 4)).at(eso.element.location()).last()
            let NUM = counter(math.equation).at(eso.element.location()).first()
            // (capitulo.seccion.numero_absoluto)
            link( eso.element.location(), [#CAP.#SEC.#NUM])
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
    show bibliography: set heading(depth: 1)
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
        // :FACER: usar isto..?
        heading(depth: 1, hide[Documento])
        // counter(heading.where(level: 3)).update(0)

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
