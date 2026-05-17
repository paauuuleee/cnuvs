#import "../header.typ": *
#show: doc

#show table.cell: it => {
    pad(x: 1em, y: 0.5em, align(center)[#it])
}

#let checkbox(checked: bool) = {
    if checked {
        square(size: 0.8em)[#align(center + horizon)[#sym.crossmark]]
    } else {
        square(size: 0.8em)[]
    }
}

#header(number: 4)
== Task 3
#task(label: "a")[
  Routing means determining the route taken by packets from source to destitination. #parbreak()
  Forwarding means moving packets from router's input to appropriate router output. 
  @slides2[p. 4]
]

#task(label: "b")[
  
]