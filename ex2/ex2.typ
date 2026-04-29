#import "../header.typ": *
#show: doc 

= CNuvS Ex. 2 - Jan Lindauer, Paul Feidieker
== Task 3
#task(label: "a")[
    BGP is a protocol used to configure the most efficient communication path between multiple neighbours, especially when two communication partners lie in different autonomous systems. @slides3[p. 13] @bgp
]

#task(label: "b")[
    The AS Path is a mandatory attribute of a BGP announcement, primarily to record a specific route through different AS until it reaches the wanted goal AS. Also it prevents loops in BGP routing which is a very important routing error prevention mechanism. @aspath
]

#task(label: "c")[
    The address range of 134.130.0.0/16 is owned by AS47610 which has the ASN of 47610. This AS lists one upstream to AS680 (Deutsches Forschungsnetz) @bgptool
]

== Task 4
#task(label: "a")[
    
]

#pagebreak()
#bibliography("source.yml", title: "Sources", style: "ieee")