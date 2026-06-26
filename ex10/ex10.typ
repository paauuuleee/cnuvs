#import "../header.typ": *
#show: doc

#header(number: 10)

== Task 4

#task(label: "a")[
  Multicast is preferable if the same data needs to be send to multiple recipients simultaneously. With seperate unicast transmissions the sender would quickly choke on it's bandwidth because the would be too much duplicate data. #parbreak()
  The advantage of using multicast in these situations is efficiency and it's ressource saving capabilities. \
  @slides6[p. 3, 9]
]

#task(label: "b")[
  *Multicast via unicast:* #parbreak()
  \
  The sender sends N unicast messages, one to each of the N recievers. #parbreak()
  \
  *Network multicast:* #parbreak()
  \
  Routers participate in the multicast by making copies of the send data and forwarding it to multicast recievers. #parbreak()
  \
  *Application-layer multicast:* #parbreak()
  \
  End systems participate in the multicast by copying the datagrams and distributing them among themselves. #parbreak()
  @slides6[p. 6, 7, 8]
]

#task(label: "c")[
  
]

#pagebreak()
#bibliography("source.yml", title: "Sources", style: "ieee")