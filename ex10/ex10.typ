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
  The sender sends N unicast messages, one to each of the N recievers. #parbreak()
  \
  *Network multicast:* #parbreak()
  Routers participate in the multicast by making copies of the send data and forwarding it to multicast recievers. #parbreak()
  \
  *Application-layer multicast:* #parbreak()
  End systems participate in the multicast by copying the datagrams and distributing them among themselves. #parbreak()
  @slides6[p. 6, 7, 8]
]

#task(label: "c")[
  When translating IP multicast addresses into Ethernet multicast addresses there is a small probability of collision where a whole 32 IP multicast group is mapped into one Ethernet multicast address. \
  @slides6[p. 16]
]

#task(label: "d")[
  If a host does not respond to an IGMP query, the router impicates that the host left the group. This means that the host isn't recognized as a group member anymore and thus will not recieve any multicast messages anymore. \
  @slides6[p. 19]
]

#task(label: "d")[
  *192.168.1.10* -> Not valid, it's outside of the reserved IP space. #parbreak()
  *224.0.0.0* -> Not valid, the base address is reserved #parbreak()
  *224.1.2.3* -> Valid #parbreak()
  *226.17.30.197* -> Valid #parbreak()
  *240.0.0.1* -> Not valid, it's outside of the reserved IP space \
  @slides6[p. 13]
]

#task(label: "e")[
  We would rather use network multicast. Network multicast is the better option for this use case because in multicast via unicast the sending server would need to bear the load of 10000 connections. This would slow down the streaming bandwith of each connection drastically. In network multicast the load is distributed over multiple routers. \
  @slides6[p. 6, 7]
]

#pagebreak()
#bibliography("source.yml", title: "Sources", style: "ieee")