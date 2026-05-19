#let task(label: str, body) = block(width: 100%)[
    #set par(spacing: 0.65em)
    #show enum: set block(below: 0.65em) 
    #place(dx: -2em, [(#label)])
    #body
]

#let header(number: int) = heading(level: 1)[
    CNuvS Ex. #number - Jan Lindauer, Paul Feidieker 
]

#let doc(body) = {
    set highlight(fill: rgb("#ffc2f0"))
    set page(paper: "a4")
    set text(font: "Helvetica")
    show raw: set text(font: "JetBrainsMono NF", size: 10pt)
    show heading: set block(spacing: 1em)
    set par(spacing: 2em)
    show bibliography: set heading(level: 2)
    body
}

#let checkbox(checked: bool) = {
    if checked {
        square(size: 0.8em)[#align(center + horizon)[#sym.crossmark]]
    } else {
        square(size: 0.8em)[]
    }
}