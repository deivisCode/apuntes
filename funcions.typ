// Este é o arquivo cas funcións e estilos de todos os apuntes.

// :FACER: eventualmente gustaríame facer estas cousas a man
#import "@preview/marginalia:0.2.3" as marginalia: note
// :FACER: Indice. Debería poder ir á palabra exacta
// :FACER: Indice. Resaltar a palabra no texto
#import "@preview/in-dexter:0.7.2": index as indice, make-index

// Pequena funcion pa usar texto en Sans
#let sans = eso => text(font: "New Computer Modern Sans")[#eso]
#let tt   = eso => text(font: "New Computer Modern Mono")[#eso]

/// Funcion para crear un encabezado
//
// :FACER: simboliño do medio no encabezado
// :FACER: nome do capitulo ou seccion no encabezado
#let encabezado() = {
    grid(
        columns: (1fr, 20%, 1fr),
        align: (left + horizon, center + horizon, right + horizon ),
        line(length: 100%, stroke: 0.5pt),
        [$E= m c^2$],
        line(length: 100%, stroke: 0.5pt),
    )
}

/// Funcion para crear o pe de paxina
//
// :FACER: non sei se o pe de paxina se ve ben de todo
#let pe() = {
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
    align(center, context{ text(size:40pt, weight:"bold")[#document.title] })
    v(1em)
    align(center, context{ smallcaps(document.author.join("\n")) })
    v(1fr)
    [Comezo: #tt[#datetime(year:2025, month:8, day:1).display()]]
    h(1fr)
    [Actualizado: #tt[#datetime.today().display()]]
}

/// Funcion para crear a Bibliografía
#let crear_bibliografia() = {
    // :FACER: biblio en cada capítulo?
    bibliography(
        "/bibliografia.bib",
        // :FACER: máis espazo entre o título e o corpo da bibliografía (falla con indice)
        title: sans[Bibliografía],
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
        title: sans[Índice de contidos #v(1em)],
        depth: 2
    )
}

/// Funcion para crear o Índice alfabético
#let crear_indice_alfabetico() = {
    heading(
        level: 1,
        numbering: none,
        [Índice Alfabético],
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
//
// :FACER: crear algunha opcion para poder activar/desactivar o fondo sepia
#let estilo_corpo(doc) = {
    show: marginalia.setup.with(
        inner : ( far: 5mm, width: 2cm , sep: 5mm ),
        outer : ( far: 5mm, width: 5cm , sep: 5mm ),
        book  : true,
    )
    set page(
        // :FACER: comezar en 1 no corpo do documento
        numbering  : "1",
        header     : encabezado(),
        footer     : pe(),
        fill       : rgb("#fdf9e6"),
        background : none,
        // Ollo, se se cambia esto hai que cambiar tamén o 'bloque_ancho'
        margin     : (
            top     : 4cm,
            inside  : 3cm,
            outside : 6cm,
            bottom  : 4cm
        ),
    )
    set text(fill:black)
    set heading(numbering: "1.")
    set par(
        justify: true,
        first-line-indent: 1.5em,
        linebreaks: "optimized"
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
            "("
            str(counter(heading.where(level:1)).at(here()).last())
            "."
            str(counter(heading.where(level:2)).at(here()).last())
            "."
            str(eso)
            ")"
        }
    )
    // Esto é para customizar as referencias
    show ref: eso => {
        // SOBREESCRIBIR REFERENCIAS ÁS FIGURAS DOS TEOREMAS
        // no caso de que a referencia apunte a unha figura de tipo "teorema"
        if eso.element != none and eso.element.func() == figure and eso.element.kind == "teorema" {
            let HEA = counter(heading.where(level: 1)).at(eso.element.location()).last()
            let SEC = counter(heading.where(level: 2)).at(eso.element.location()).last()
            let NUM = counter(figure.where(kind:"teorema")).at(eso.element.location()).last()
            link(
                eso.element.location(),
                [#text(font:"New Computer Modern Mono")[teo];[#HEA.#SEC.#NUM]]
            )
        // O mesmo, pero con definicions
        } else if eso.element != none and eso.element.func() == figure and eso.element.kind == "definicion" {
            let HEA = counter(heading.where(level: 1)).at(eso.element.location()).last()
            let SEC = counter(heading.where(level: 2)).at(eso.element.location()).last()
            let NUM = counter(figure.where(kind:"definicion")).at(eso.element.location()).last()
            link(
                eso.element.location(),
                [#text(font:"New Computer Modern Mono")[def];[#HEA.#SEC.#NUM]]
            )
        // SOBREESCRIBIR REFERENCIAS ÁS ECUACION
        // no caso de que a referencia apunte a unha figura de tipo 'math.equation'
        } else if eso.element != none and eso.element.func() == math.equation {
            let HEA = counter(heading.where(level: 1)).at(eso.element.location()).last()
            let SEC = counter(heading.where(level: 2)).at(eso.element.location()).last()
            let NUM = counter(math.equation).at(eso.element.location()).first()
            link(
                eso.element.location(),
                [#text(font:"New Computer Modern Mono")[ec];[#HEA.#SEC.#NUM]]
            )
        // No resto de casos
        } else {
            eso
        }
    }
    show footnote: eso => {
        super(
            [[#text(fill: rgb("#FF0000"), weight:"bold", eso)]]
        )
    }
    show footnote.entry: eso => {
        let loc = eso.note.location()
        let num = counter(footnote).at(loc).first()
        super([[#text(fill: rgb("#FF0000"), weight:"bold", [#num])] ])
        eso.note.body
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
    documento
) = {

    set document(
        title  : titulo,
        author : autoria.map(autor => autor.nome)
    )
    set page(
        paper   : "a4",
        binding : left,
    )
    set text(
        size      : 12pt,
        font      : "New Computer Modern",
        lang      : "gl",
        region    : "ES",
        script    : "latn",
        dir       : ltr,
        hyphenate : true,
    )

    //// Montamos a portada %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    show: estilo_portada
    portada

    //// As opcions para o corpo do documento %%%%%%%%%%%%%%%%%%%%%%%%%
    show: estilo_corpo

    // :FACER: crear un 'show-frame' independente
    // :FACER: facer o frame condicional, cun argumento en activar_estilo
    // show: marginalia.show-frame

    //// Mostramos o indice
    pagebreak()
    indice

    //// Devolvemos o contido do documento
    pagebreak()
    // :FACER: separar en frontmatter, mainmatter, backmatter, etc.?
    documento

    //// Mostramos a bibliografia
    pagebreak()
    bibliografia

    //// Mostramos o índice alfabético
    pagebreak()
    indice_alfabetico

    //// Mostramos a contraportada %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    show: estilo_contraportada
    contraportada

}

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

/// Unha nota ao marxe. Depende do paquete 'marginalia'
#let nota = note.with( numbering: none, text-style:(size:10pt) )

/// Usado para citar unha referencia. Coloca a cita no texto e outra versión
// completa da cita na marxe. Se a cita xa apareciu algunha vez, entón só a
// engadimos no texto pero NON na marxe
#let lista_citas = state("citas", ())
// :FACER: as citas deben poder usar 'pre/post notes', e.g. [cap.1 Sha90]
#let cita(nome) = {
    // Primeiro cítase no propio texto
    cite(nome)
    context {
        // Comprobo se a chave da cita, e.g. 'goldberg_1980', xa está na lista.
        let repetido = lista_citas.get().contains(str(nome))
        // Se non o está
        if not repetido {
            // Engadimos o nome a lista
            lista_citas.update(eso => eso + (str(nome),))
            // E engadimos unha nota ao marxe, ca cita completa
            note( side: "outer", numbering: none, text-style:(size:10pt), cite(nome, form: "full"))
        }
    }
}

/// Un teorema simple, e.g. '#teorema("fermat", "teo:fermat")[$a+b=0$]
//
// :FACER: meter automaticamente esto no indice?
#let teorema(
    nome   : " -- SEN NOME -- ",
    ancora : " -- SEN ÁNCORA -- ",
    corpo
) = context {
    show figure: set align(left)
    let HEA = counter(heading.where(level: 1)).get().first()
    let SEC = counter(heading.where(level: 2)).get().last()
    // :FACER: o de sumar 1 ao final é un apaño, non sei por qué fai falta
    let NUM = counter(figure.where(kind:"teorema")).get().first() + 1
    // Creo un rectangulo
    rect(
        stroke:(
            top    : luma(20%) + 1pt,
            bottom : luma(20%) + 1pt
        ),
        fill: rgb("#FF0000").lighten(90%),
        width:100%,
        // Metolle contido dentro
        [
            #figure(
                kind:"teorema",
                supplement: "Teorema",
                [ *Teorema* #HEA.#SEC.#NUM (#smallcaps(nome)) #corpo ]
            )
            // Esto é porque o label debe estar dentro dun contido, e así
            // ánclase á figura anterior
            #label(ancora)
        ]
    )
}

/// Unha definicion simple, e.g. '#definicion("exemplo","def:algo")[a = 0]'
// :FACER: Definicions. Engadir algo de espazo antes e despois do texto
#let definicion(
    nome   : " -- SEN NOME -- ",
    ancora : " -- SEN ÁNCORA -- ",
    corpo
) = context {
    // :FACER: este context igual se pode meter dentro do contido do rectangulo?
    show figure: set align(left)
    let HEA = counter(heading.where(level: 1)).get().first()
    let SEC = counter(heading.where(level: 2)).get().last()
    let NUM = counter(figure.where(kind:"definicion")).get().first() + 1
    rect(
        stroke:(
            top    : luma(20%) + 1pt,
            bottom : luma(20%) + 1pt
        ),
        fill: rgb("#0000FF").lighten(90%),
        width:100%,
        [
            #figure(
                kind:"definicion",
                supplement: "Definicion",
                [ *Definicion* #HEA.#SEC.#NUM (#smallcaps(nome)) #corpo ]
            )
            #label(ancora)
        ]
    )
}

/// Función para crear un CAPITULO, o cal é o nivel máis alto de todos.
#let capitulo(
    nome     : " -- SEN NOME -- ",
    ancora   : " -- SEN ANCORA -- ",
    epigrafe : " -- SEN EPIGRAFE -- "
) = {
    // :FACER: forzar que sempre se comece no lado dereito
    pagebreak()
    counter(heading.where(level: 2)).update(0)
    grid(
        columns : (auto,20%,1fr),
        rows    : (5em, 5em),
        align   : (left, center, right + bottom),
        [
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
        [], [], [],
        [#h(1fr)],
        text(size:10pt)[
            #epigrafe
            #v(1fr)
            #line(length:20%, stroke:0.5pt)
        ]
    )
    v(2em)
}

#let seccion(
    nome   : " -- SEN NOME -- ",
    ancora : " -- SEN ANCORA -- "
) = {
    show figure: set align(left)
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
