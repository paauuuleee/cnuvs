#import "../header.typ": *
#show: doc

#header(number: 5)

== Task 3

#task(label: "a")[
  Neighbours in an overlay network (likely) aren't direct neighbours in the underlying network. The routing between neighbours in an overlay network is likely stretched compared to the longer standard path. @slides2[p. 97]
]

#task(label: "b")[
  When the stretch factor is minimized the ratio between the hops needed by the path in the overlay network and the hops needed in the underlying network is minimized. @slides2[p. 98]
]

#task(label: "c")[
  The first important goal is to minimize the hops in the overlay network, which means to find the path with the least amount of hops between the source and destination node. This is accomplished by using traditional routing algorithms to determine the shortest path respective to the cost in the overlay network. #parbreak()
  \
  The second important goal is to minimize the stretch, namely to minimize the ratio between the hops that the path from the overlay network would need in the underlying network and the actual best path. This is done by applying the number of hops an edge from the overlay network would need in the underlying network to the according edges in the overlay network and then using the ususal routing algorithm. #parbreak()
  @slides2[p. 97, 98]
]

#task(label: "d")[
  An overlay network is needed for Peer-to-Peer because in P2P there must me a direct connection between to communication partners. #parbreak()
  Two applications that use overlay networks are: #parbreak()
  #enum(
    [Freenet @freenet],
    [OnionShare @onionshare]
  )
]

== Task 4

#show table.cell: it => {
    let c = pad(x: 1em)[#it]
    if it.x == 0 {
        strong(c)
    } else {
        c
    }
}

#task(label: "a")[
    #table(
        columns: (auto, 1fr),
        [Route start/end],      [$C -> D$],
        [Overlay route],        [$C -> D$],
        [Underlay hop count],   [$C -> D: 4; sum = 4$],
        [Shortest IP path],     [$4$],
        [Stretch factor],       [$1 = 4 div 4$]
    )    
]
#task(label: "b")[
    #table(
        columns: (auto, 1fr),
        [Route start/end],      [$B -> D$],
        [Overlay route],        [$B -> C -> D$],
        [Underlay hop count],   [$B -> C: 2, C -> D: 4; sum = 6$],
        [Shortest IP path],     [$3$],
        [Stretch factor],       [$2 = 6 div 3$]
    )    
]
#task(label: "c")[
    #table(
        columns: (auto, 1fr),
        [Route start/end],      [$F -> C$],
        [Overlay route],        [$F -> B -> C$],
        [Underlay hop count],   [$F -> B: 4, B -> C: 2; sum = 6$],
        [Shortest IP path],     [$5$],
        [Stretch factor],       [$1.2 = 6 div 5$]
    )    
]
#task(label: "d")[
    #table(
        columns: (auto, 1fr),
        [Route start/end],      [$E -> F$],
        [Overlay route],        [$E -> D -> C -> B -> F$],
        [Underlay hop count],   [$E -> D: 2, D -> C: 4; C -> B: 2, B -> F: 4; sum = 12$],
        [Shortest IP path],     [$3$],
        [Stretch factor],       [$4 = 12 div 3$]
    )    
]

== Task 5

#task(label: "a")[
  The two primary protocols are TCP and UDP. TCP includes services like congestion control, flow control and connection setup / teardown. UDP doesn't really provide any services except the no-frills extension of "best-effort" IP which cuts away the overhead of TCP. TCP is considered a connection oriented transport protocol, UDP a connectionless transport protocol. @slides4[p. 7]
]

#task(label: "b")[

]

#pagebreak()
#bibliography("source.yml", title: "Sources", style: "ieee")