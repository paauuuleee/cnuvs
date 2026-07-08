#import "../header.typ": *
#import "lamportclock_template.typ": *
#show: doc

#header(number: 12)

== Task 3

#task(label: "a")[
  A peer to peer system is a fully decentralized system where there are no servers normally. Contrary to a client/server system in P2P the clients function as clients and servers at the same time. In P2P every client benefits from the resources of the other participating clients. #parbreak()
  @slides7[p. 6]
]

#task(label: "b")[
  Gnutella is a file transfer protocol. A sender sends a query message over all existing edges (valid TCP connections). Every peer forwards the query message to all it's edges and returns a query hit over the reverse path if it got the desired data. #parbreak()
  @slides7[p. 11, 12]
]

#pagebreak()
#bibliography("source.yml", title: "Sources", style: "ieee")