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
  @slides6[p. 9]
]

#task(label: "c")[
  Network Time Protocol: #parbreak()
  Accurate time synchronization is critical for servers to ensure that financial transactions and database entries are recorded in the correct chronological order across distributed systems. Without it, debugging errors becomes incredibly difficult and security protocols like Kerberos or TLS certificates may fail due to clock drift. #parbreak()
  @ntp
]

== Task 5

#task(label: "a")[
  #align(center)[
    #table(
      columns: (0.6fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
      align: center + horizon,

      stroke: (x, y) => (
        top: none,
        bottom: if y == 0 { 0.8pt + black } else { none },
        left: if x > 0 { 0.5pt + black } else { none },
        right: none
      ),
      inset: (x: 5pt, y: 6pt),

      [$t$], [$C_0$], [$E_0$], [$C_1$], [$E_1$], [$C_2$], [$E_2$], [$C_3$], [$E_3$],

      [0], [240], [],   [151], [],   [150], [],   [200], [],

      [1], [241],    [a],  [152],    [b],  [150],    [],    [201],    [c],

      [2], [242],    [d],  [152],    [],   [150],    [],    [202],    [e],

      [3], [243],    [f],  [153],    [g],  [150],    [],    [202],    [],

      [4], [244],    [h],  [203],    [i],  [150],    [],    [203],    [j],

      [5], [244],    [],   [203],    [],   [154],    [k],   [204],    [l],

      [6], [245],    [m],  [244],    [n],  [154],    [],    [204],    [],

      [7], [245],    [],   [245],    [o],  [154],    [],    [204],    [],

      [8], [245],    [],   [245],    [],   [204],    [p],   [204],    [],
    )
  ]
]

#task(label: "b")[
  #figure(
    lamportclockgraph(
      // events are written from left to right and top to botton
      // e.g. Event P_0 at t=1 with 5 as count and event name "a"
      // ("1","0","a","5")
      events: (
        ("1","0","a","10"),
        ("1","1","b","3"),
        ("1","2","c","5"),
        ("2","0","d","11"),
        ("2","1","e","6"),
        ("2","2","f","6"),
        ("3","2","g","12"),
        ("4","0","h","12"),
        ("4","1","i","11"),
        ("4","2","j","13"),
        ("5","2","k","14"),
        ("6","0","l","15"),
      ),
      
      // edges from event to event
      edge(<c>,<e>,"->"),
      edge(<d>,<g>,"->"),
      edge(<a>,<i>,"->"),
      edge(<k>,<l>,"->"),
    )
  )
]

#pagebreak()
#bibliography("source.yml", title: "Sources", style: "ieee")