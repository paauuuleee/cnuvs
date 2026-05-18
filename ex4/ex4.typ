#import "../header.typ": *
#import "exercise_04_dvr_template.typ": *
#show: doc

#header(number: 4)

== Task 3
#task(label: "a")[
  Routing is the process  of determining the route taken by packets from source to destitination. #parbreak()
  Forwarding is the process of moving packets from router's input to appropriate router output. 
  @slides2[p. 4]
]

#task(label: "b")[
  Distance vector routing has a limited view. The routers only know what direct neighbors tell them. Link state routing has a global view. Each router knows the entire network topology. #parbreak()
  \
  Distance vector routing uses the Bellman-Ford algorithm. Link state routing uses Dijkstra's algorithm. #parbreak()
  \
  Distance vector routing is slow to adapt to changes. It periodically broadcasts the entire routing table to its neighbors. Link state routing is faster to adapt to changes. It only sends updates when there are changes in the network topology. #parbreak()
]

#pagebreak()
#bibliography("source.yml", title: "Sources", style: "ieee")