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

== Task 5

#task(label: "a")[
  
]

#pagebreak()
#bibliography("source.yml", title: "Sources", style: "ieee")