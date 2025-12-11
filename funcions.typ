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

// Pequena funcion pa usar texto en Sans e en Monoespaciado
#let sf = eso => text(font: "New Computer Modern Sans")[#eso]
#let tt = eso => text(font: "New Computer Modern Mono")[#eso]
#let nf = eso => text(font: "Symbols Nerd Font Mono")[#eso]

/// Unha nota ao marxe. Depende do paquete 'marginalia'
#let nota = note.with( numbering: none, text-style:(size:10pt) )

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
            note(
                side: "outer",
                numbering: none,
                text-style:(size:10pt),
                cite(label(nome), form: "full"),
            )
        }
    }
}

/// Un teorema simple, e.g. '#teorema("fermat", "teo:fermat")[$a+b=0$]
//
// :FACER: meter automaticamente esto no indice? BLOQUEADO por in-dexter, api non me gusta
// :FACER: entorno de demostracions
// :FACER: usar outra palabra en lugar de 'teorema'
// :FACER: explicar que uso a palabra 'teorema' máis laxa que en matemáticas, e.g.delgado_2010
#let teorema(
    nome   : " -- SEN NOME -- ",
    ancora : " -- SEN ÁNCORA -- ",
    corpo
) = {
    // Creo un rectangulo
    block(
        stroke : (
            top  : rgb("#FF0000").lighten(50%) + 2pt,
            left : rgb("#FF0000").lighten(50%) + 2pt
        ),
        radius : (
            top-left : 5pt,
            bottom-right : 5pt
        ),
        fill: rgb("#FF0000").lighten(90%),
        width:100%,
        inset : (
            top    : 0.9em,
            bottom : 0.9em,
            left   : 0.9em,
            right  : 0.9em
        ),
        // Metolle contido dentro
        [
            #show figure: set align(left)
            #show figure: set block(breakable: false) // :FACER: non me convence como se ve entre páxinas
            #set par(first-line-indent:0pt)
            #figure(
                kind:"teorema",
                supplement: nome,
                context {
                    let HEA = counter(heading.where(level: 1)).get().first()
                    let SEC = counter(heading.where(level: 2)).get().last()
                    let NUM = counter(figure.where(kind:"teorema")).get().first()
                    [ *Teorema* #HEA.#SEC.#NUM: #smallcaps(nome) #v(0.3em) #corpo ]
                }
            )
            // Esto é porque o label debe estar dentro dun contido, e así
            // ánclase á figura anterior
            #label(ancora)
        ]
    )
}

/// Unha definicion simple, e.g. '#definicion("exemplo","def:algo")[a = 0]'
#let definicion(
    nome   : " -- SEN NOME -- ",
    ancora : " -- SEN ÁNCORA -- ",
    corpo
) = {
    block(
        stroke : (
            top  : rgb("#0000FF").lighten(50%) + 2pt,
            left : rgb("#0000FF").lighten(50%) + 2pt
        ),
        radius : (
            top-left : 5pt,
            bottom-right : 5pt
        ),
        fill: rgb("#0000FF").lighten(90%),
        width:100%,
        inset : (
            top    : 0.9em,
            bottom : 0.9em,
            left   : 0.9em,
            right  : 0.9em
        ),
        [
            #show figure: set align(left)
            #show figure: set block(breakable: false)
            #set par(first-line-indent:0pt)
            #figure(
                kind:"definicion",
                supplement: nome,
                context {
                    let HEA = counter(heading.where(level: 1)).get().first()
                    let SEC = counter(heading.where(level: 2)).get().last()
                    let NUM = counter(figure.where(kind:"definicion")).get().first()
                    [ *Definición* #HEA.#SEC.#NUM: #smallcaps(nome) #v(0.3em) #corpo ]
                }
            )
            #label(ancora)
        ]
    )
}

/// Función para crear un CAPITULO, o cal é o nivel máis alto de todos.
#let capitulo(
    nome     : " -- SEN NOME -- ",
    ancora   : " -- SEN ÁNCORA -- ",
    epigrafe : " -- SEN EPÍGRAFE -- "
) = {
    pagebreak(to:"odd")
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
            text(size:10pt)[
                #epigrafe
                #v(1fr)
                #line(length:20%, stroke:0.5pt)
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
        sf[#v(1.5em) #h(1fr) *$section$* #HEA.#SEC #eso.body #v(0.5em)]
    }
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

#let sse = text(
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
