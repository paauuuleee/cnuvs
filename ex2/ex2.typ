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
    + `AS_11111 -> AS_23456 -> AS_23232 -> AS_22222 -> AS_89767`
        - `B -> A -> C -> J -> N -> O -> Q -> M`
        - `B -> C -> J -> N -> O -> Q -> M`
    + `AS_11111 -> AS_13243 -> AS_14444 -> AS_89767`
        - `B -> A -> C -> E -> F -> P -> M`
        - `B -> C -> E -> F -> P -> M`

        - `B -> A -> C -> E -> F -> P -> L -> M`
        - `B -> C -> E -> F -> P -> L -> M`

        - `B -> A -> C -> E -> G -> P -> M`
        - `B -> C -> E -> G -> P -> M`

        - `B -> A -> C -> E -> G -> P -> L -> M`
        - `B -> C -> E -> G -> P -> L -> M`
    + `AS_11111 -> AS_87234 -> AS_85858 -> AS_87654 -> AS_89767`
        - `B -> D -> H -> K -> R -> L -> M`
        - `B -> D -> H -> I -> K -> R -> L -> M`
        - `B -> D -> I -> R -> L -> M`
        - `B -> D -> I -> H -> R -> L -> M`
]

#task(label: "b")[
    #enum(
        [Rule 2 eliminates path 3 because of the local preference of 10 and the other paths having not local preference causing a default preference of 100. #parbreak()
        Remaining routes: 1, 2],
        [Applying rule 3 causes path 1 to be eliminated so that only the router paths of AS Path 2 remain.],
        [Applying rule 5 eliminates all router paths that contain router L, so that 4 router paths remain.],
        [Since for every hop there is only one option between eBGP and iBGP this rule doesn't eliminate any path.],
        [Applying rule 7 eliminates paths internally that are not the shortest way out of the AS, which leaves only the two paths without the A router.],
        [Rule 9 finally eliminates the route that contains router G since router F has a alphabetically lower router id.]
    )
]

#task(label: "c")[
    Since the newly set local preference AS Path 1 and 2 are eliminated which eliminates a majority of paths only leaving the last 4 router paths from the third AS Path. #parbreak()
    Rule 5 selects the router with the lower MED when coming from outside (in this case from router D), so that all rules that list router H after router D are eliminated. #parbreak()
    Finally rule 7 eliminates the route that hops from I to H because it prefers eBGP over iBGP, leaving only the path: #parbreak()
    `B -> D -> I -> K -> R -> L -> M`
]

#pagebreak()
#bibliography("source.yml", title: "Sources", style: "ieee")