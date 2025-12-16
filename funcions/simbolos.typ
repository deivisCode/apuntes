// Letras moi reviradas
#let scr(eso) = text(
    features: ("ss01",),
    box($cal(eso)$),
)

#let frecha = math.class(
    "relation",
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
