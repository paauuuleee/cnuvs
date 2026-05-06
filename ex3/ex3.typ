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
    Firstly NDP uses IPv6, contrary to ARP using IPv4. Secondly the MAC address resolution requests are send as broadcasts for ARP protocol and NDP only sends them to its nearest neighbors which means it is considered a multicast message.
]
#task(label: "c")[
    `1234:0000:0000:00ab:1234 -> 1234::ab:1234` @slides3[p. 32]
]

#task(label: "d")[
    `0010:4aee:53ab -> 0210:4aff:feee:53ab` @slides3[p. 32]
]

#task(label: "e")[
    The solutions is called tunneling. It is a technique to encapsulate IPv6 packets within IPv4 packets, allowing them to be transmitted over an IPv4 network. @slides3[p. 33]
]

== Task 5
#task(label: "a")[
        #show table.cell: it => {
        if it.y == 0 {
            strong(it)
        } else { 
            it
        }
    }
    
    #show table.cell: it => {
        pad(x: 1em, y: 0.5em, align(center)[#it])
    }

    #table(
        columns: (auto, 1fr, auto),
        [Link Interface], [Destination Address Range], [Prefix Match],
        [0], [`10101110 01011110 11000000 00000000` through #parbreak() `10101110 01011110 11000111 11111111`], [],
        [1], [`10101110 01011110 11001100 10000000`
through #parbreak() `10101110 01011110 11001100 111111111`], [],
        [2], [`10101110 01011110 11001100 00000000`
through #parbreak() `10101110 01011110 11001101 11111111`], [],
        [3], [otherwise], [] 
    )

]

#bibliography("source.yml", title: "Sources", style: "ieee")
