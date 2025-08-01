// Este é o arquivo cas funcións e estilos de todos os apuntes.

// :FACER: eventualmente gustaríame facer estas cousas a man
#import "@preview/marginalia:0.2.3" as marginalia: note
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
        style : "aps_modificado.csl"
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
        outer : ( far: 5mm, width: 4cm , sep: 5mm ),
        book  : true,
    )
    set page(
        // :FACER: comezar en 1 no corpo do documento
        numbering  : "1",
        header     : encabezado(),
        footer     : pe(),
        fill       : rgb("#fdf9e6"),
        background : none,
        margin     : (
            top     : 4cm,
            inside  : 3cm,
            outside : 5cm,
            bottom  : 4cm
        ),
    )
    set text(fill:black)
    set heading(numbering: "1.")
    set par( justify: true, first-line-indent: 1.5em )
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
    set math.equation(numbering: "[1]")
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
        size : 12pt,
        font : "New Computer Modern",
        lang : "gl",
    )

    //// Montamos a portada %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    show: estilo_portada
    portada

    //// As opcions para o corpo do documento %%%%%%%%%%%%%%%%%%%%%%%%%
    show: estilo_corpo

    // :FACER: crear un 'show-frame' independente
    // :FACER: facer o frame condicional, cun argumento en activar_estilo
    show: marginalia.show-frame

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
#let nota = note.with( numbering: none, text-style:(size:9pt) )

/// Usado para citar unha referencia. Coloca a cita no texto e outra versión
// completa da cita na marxe
//
// :FACER: só poñela na marxe a primeira vez, se volve aparecer, colocala so no
//         texto, así non se ocupa demasiado as marxes
#let cita(nome) = {
    // Primeiro cítase no propio texto
    cite(nome)
    // E logo na marxe exterior
    nota(
        side: "outer",
        cite(nome, form: "full")
    )
}

/// Contadores para teoremas e definicions.
#let contador_teorema = counter("teorema")
#let contador_definicion = counter("definicion")

/// Un teorema simple, e.g. '#teorema("fermat")[$a+b=0$]
// :FACER: meter automaticamente esto no indice?
// :FACER: os numeros deberían ser algo como CAP . SEC . CONTADOR, por exemplo
//         algo como 1.2.356, pero non sei facelo. Estou mesturando un conteo
//         creado a man con counter() e ademais o conteo das figuras (as cales
//         necesito para poder referenciar as cousas)
#let teorema(nome, ancla, corpo) = {
    contador_teorema.step()
    show figure: set align(left)
    // Creo un rectangulo
    rect(
        stroke:(
            top    : luma(20%) + 1pt,
            bottom : luma(20%) + 1pt
        ),
        fill: rgb("#FF0000").lighten(90%),
        // Metolle contido dentro
        [
            // E dentro do contido, unha figura
            #figure(
                kind:"teorema",
                supplement: [Teorema],
                [
                    *Teorema*
                    *#context contador_teorema.display()*
                    (#smallcaps[#nome]) : #corpo
                ]
            )
            // Esto é porque o label debe estar dentro dun contido, e así
            // ánclase á figura anterior
            #label(ancla)
        ]
    )

}

/// O mismo pero pa definicions
#let definicion(nome, ancla, corpo) = {
    contador_definicion.step()
    show figure: set align(left)
    rect(
        stroke:(
            top    : luma(20%) + 1pt,
            bottom : luma(20%) + 1pt
        ),
        fill: rgb("#0000FF").lighten(90%),
        [
            #figure(
                kind:"definicion",
                supplement: [Definición],
                [
                    *Definición*
                    *#context contador_definicion.display()*
                    (#smallcaps[#nome]) : #corpo
                ]
            )
            #label(ancla)
        ]
    )
}

/// Función para crear un CAPITULO, o cal é o nivel máis alto de todos.
#let capitulo(nome, epigrafe, ancla) = {
    // :FACER: forzar que sempre se comece no lado dereito
    pagebreak()
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
            #label(ancla)
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

#let seccion(nome, ancla) = {
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
        #label(ancla)
    ]
}
