#import "../header.typ": *
#import "template_exercise07.typ": *
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
  Routers use a warning state to prevent devestating network bottlenecks known as "tail drop". When a router's buffer is full, it enters a warning state, signaling to senders that they need to slow down their transmission rates. This helps prevent the router from becoming overwhelmed and dropping all incoming packets, which would lead to severe congestion and degraded network performance. By signaling senders to reduce their rates, the router can manage traffic more effectively and maintain smoother data flow across the network. #parbreak()
  \
  Actions taken when the router enters a wrarning state include:
  #enum(
    [Sending a Choke Packet back to the traffic source (explicitly ordering it to reduce its transmission rate by a certain percentage)],
    [Setting a Warning Bit (or ECN bit) in the packet's header to notify the destination or source along the data path]
  )
  @warning
]
#pagebreak()

== Task 5
#tcp_flow_control_table(
    rows: 22,
   "0",  "0-0", "-", "-", "-", "-", "-", "0-5",
   "1",  "0-1", "F0", "F0", "-", "-", "-", "0-5",
   "2",  "0-2", "F1", "F1", "-", "F0", "-", "1-5",
   "3",  "0-2", "-", "-", "-", "F1", "-", "2-5",
   "4",  "0-3", "F2", "F2", "-", "-", "ACK0", "2-6",
   "5",  "0-4", "F3", "F3", "-", "F2", "-", "3-6",
   "6",  "0-5", "F4", "F4", "-", "F3", "-", "4-6",
   "7",  "1-5", "F5", "", "ACK0", "F4", "-", "5-6",
   "8",  "1-6", "F5", "F5", "-", "-", "ACK1", "5-7",
   "9",  "2-6", "-", "-", "ACK1", "F5", "-", "6-7",
   "10", "2-6", "-", "-", "-", "-", "ACK2", "6-8",
   "11", "2-7", "F6", "F6", "-", "-", "ACK3", "6-9",
   "12", "3-7", "-", "-", "ACK2", "F6", "-", "7-9",
   "13", "4-7", "-", "-", "ACK3", "-", "ACK4", "7-10",
   "14", "4-8", "F7", "F7", "-", "-", "ACK5", "7-11",
   "15", "5-8", "-", "-", "ACK4", "F7", "-", "8-11",
   "16", "6-8", "-", "-", "ACK5", "-", "ACK6", "8-12",
   "17", "7-8", "-", "-", "ACK6", "-", "ACK7", "8-13",
   "18", "7-9", "F8", "F8", "-", "-", "-", "8-13",
   "19", "8-9", "-", "-", "ACK7", "F8", "-", "9-13",
   "20", "8-9", "-", "-", "-", "-", "ACK8", "9-14",
   "21", "9-9", "-", "-", "ACK8", "-", "-", "9-14",
)

#pagebreak()
== Task6

#figure(
    table(
      rows: 3,
      columns: 8,
      // top
      $0$, $1$, $2$, $3$, $4$, $5$, $6$, $7$,
      // center
      clock(0, 0),
      clock(0, 1),
      clock(0, 2),
      clock(0, 3),
      clock(0, 3),
      clock(0, 3),
      clock(1, 3),
      clock(1, 4),
      // bottom
      "init", "send 0", "send 1", "send 2", "wait", "wait", "rec ack 0", "send 3"
    ),
    caption: "Sender part 1"
)

#figure(
    table(
      rows: 3,
      columns: 8,
      // top
      $0$, $1$, $2$, $3$, $4$, $5$, $6$, $7$,
      // center
      clock(0, 3),
      clock(0, 3),
      clock(1, 3),
      clock(2, 3),
      clock(3, 3),
      clock(3, 4),
      clock(3, 5),
      clock(3, 6),
      // bottom
      "init", "wait", "rec 0", "rec 1", "rec 2", "send ack 0", "send ack 1", "send ack 2"
    ),
    caption: "Receiver part 1"
)

  #figure( 
    table(
      rows: 3,
      columns: 7,
      // top
      $8$, $9$, $10$, $11$, $12$, $13$, $14$,
      // center
      clock(2, 4),
      clock(2, 5),
      clock(3, 5),
      clock(3, 6),
      clock(4, 6),
      clock(5, 6),
      clock(6, 6),
      // bottom
      "rec ack 1", "send 4", "rec ack 2", "send 5", "rec ack 3", "rec ack 3", "rec ack 5"
    ),
    caption: "Sender part 2"
)

#figure( 
    table(
        rows: 3,
        columns: 7,
        // top
        $8$, $9$, $10$, $11$, $12$, $13$, $14$,
        // center
        clock(4, 6),
        clock(4, 7),
        clock(5, 7),
        clock(5, 8),
        clock(6, 8),
        clock(6, 9),
        clock(6, 9),
        // bottom
        "rec 3", "send ack 3", "rec 4", "send ack 4", "rec 5", "send ack 5", "wait"
    ),
    caption: "Reciever part 2"
)

#pagebreak()
#bibliography("source.yml", title: "Sources", style: "ieee")
