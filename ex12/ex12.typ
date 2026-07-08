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

#task(label: "c")[
  The churn problem refers to the continuous, rapid, and unpredictable joining and leaving of nodes in the network. #parbreak()
  This can cause data loss (if the leaving note holds data that other nodes may request) and inefficient routing since routes over the leaving node become inaccessible. #parbreak()
  @churn
]

== Task 4

#task(label: "a")[
  No, the absolute clock values are not comparable. The durations are. #parbreak()
  @slides6[p. 8]
]

#task(label: "b")[
  P sets it's clock to 4960. #parbreak()
  \
  This results from: $T_S_2$ + $1/2 * $ message transmission delay#parbreak()
  \
  Message transmission delay: #parbreak()
  #sym.delta = $#sym.delta _"req" + #sym.delta _"resp" = (T_C_2 - T_C_1) - (T_S_2 - T_S_1)$ #parbreak()
  #sym.delta = $(4920 - 4200) - (4700 - 4500)$
  #parbreak()
  #sym.delta = $720 - 200$
  #parbreak()
  #sym.delta = $520$
  #parbreak()
  \
  Clock set = $T_S_2$ + $1/2 * $ #sym.delta #parbreak()
  Clock set = $4700 + 1/2 * 520$ #parbreak()
  Clock set = $4700 + 260$ #parbreak()
  Clock set = $4960$ #parbreak()
]

#task(label: "c")[

]

== Task 5

#task(label: "a")[

]

#task(label: "b")[

]

#pagebreak()
#bibliography("source.yml", title: "Sources", style: "ieee")