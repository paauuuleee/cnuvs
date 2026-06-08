#import "../header.typ": *
#show: doc

#header(number: 7)

== Task 4

#task(label: "a")[
  The fundamental limitation of open-loop congestion control compared to closed-loop control is the lack of live feedback. Because the system cannot observe the actual state of the network during data transmission, it is optimized for expected scenarios, making it either terribly inefficient or completely helpless when unexpected traffic spikes occur. #parbreak() @slides4[Part2, p. 26, 27]
  \
  \
  Example: #parbreak()
  A system sends video data at a fixed 5 Mbps based on a guess, blindly flooding an overloaded router with data it can't process when a traffic surge hits. Because it lacks feedback, it keeps sending data anyway, causing massive packet drops and a frozen stream. A closed-loop system instantly detects those dropped packets and automatically drops its bitrate to match the available bandwidth. 
]

#task(label: "b")[
  Routers use a warning state to prevent devestating nettwork bottlenecks known as "tail drop". When a router's buffer is full, it enters a warning state, signaling to senders that they need to slow down their transmission rates. This helps prevent the router from becoming overwhelmed and dropping all incoming packets, which would lead to severe congestion and degraded network performance. By signaling senders to reduce their rates, the router can manage traffic more effectively and maintain smoother data flow across the network. #parbreak()
  \
  Actions taken when the router enters a wrarning state include:
  #enum(
    [Sending a Choke Packet back to the traffic source (explicitly ordering it to reduce its transmission rate by a certain percentage)],
    [Setting a Warning Bit (or ECN bit) in the packet's header to notify the destination or source along the data path]
  )
  @warning
]

== Task 5


#pagebreak()
#bibliography("source.yml", title: "Sources", style: "ieee")
