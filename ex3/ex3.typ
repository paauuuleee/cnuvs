#import "../header.typ": *
#show: doc

#header(number: 3)
== Task 4
#task(label: "a")[
    #show table.cell: it => {
        if it.y == 0 {
            strong(it)
        } else if it.x == 0 {
            emph(it)
        } else { 
            it
        }
    }
    
    #show table.cell: it => {
        pad(x: 1em, y: 0.5em, align(center)[#it])
    }

    #table(
        columns: (auto, 1fr, auto, auto),
        [Key characteristic], [Given Description], [IPv4], [IPv6],
        [Notation], [Hexadecimal (e.g. 2001:db8::1)], [[ ]], [[#sym.crossmark]],
        [Address length], [32-bit], [[#sym.crossmark]], [[ ]],
        [Helper protocol], [ARP], [[#sym.crossmark]], [[ ]],
        [Header structure], [Additional Fields in the header: Traffic Class, Flow Label, Payload Length, Next Header, Hop Limit. Header size is fixed to 40 bytes.], [[ ]], [[#sym.crossmark]] 
    )
]

#task(label: "b")[
    
]
#task(label: "c")[
    1234:0000:0000:00ab:1234 -> 1234::ab:1234 @slides3[p. 32]
]
#task(label: "d")[
    0010:4aee:53ab -> 0210:4aff:feee:53ab @slides3[p. 32]
]
#task(label: "e")[
    The solutions is called tunneling. It is a technique to encapsulate IPv6 packets within IPv4 packets, allowing them to be transmitted over an IPv4 network. @slides3[p. 33]
]

#bibliography("source.yml", title: "Sources", style: "ieee")
