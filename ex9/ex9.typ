#import "../header.typ": *
#show: doc

#header(number: 9)

== Task 5

#task(label: "a")[
  Kendall's queueing notation: #parbreak()
  \
  - *A*: Arrival process
  - *S*: Service process
  - *m*: Number of servers
  - *N*: places in the system (bounded queue length), if not given, then assumed $inf$
  - *K*: Population Size
  - *SD*: Queue discipline
  \
  *A* and *S* are noted as follows: #parbreak()
  \
  - *M*: Exponential process (Markovian)
  - *D*: Deterministic
  - *G*: General

  @slides5[p. 36]
]

#task(label: "b")[
  The notation is structured as A/S/m, where each component gives a specific rule about how the system behaves. #parbreak()
  \
  The first *M* in M/M/1 represents *A*, an exponential process, specifically a Markovian. #parbreak()
  The second *M* represents *S*, also an exponential process, specifically a Markovian. #parbreak()
  The *1* stands for *m*, the number of servers.

  @slides5[p. 36, 37, 44]
]

#task(label: "c")[

]

== Task 6

The maximum segment size ($"MSS"$) is $4"KB"$ and the maximum congestion window is $64"KB"$. Therefore the maximum congestion window can contain $
  64 / 4 = 16 "MSS"
$ 
1. A timeout event reduces the congestion window to $1 "MSS"$. The AIMD mechanism increments the congestion window by $1 "MSS"$ every round-trip time ($"RTT"$). Therefore it takes $15 "RTT"$ to return back to the maximum congestion window. This takes $80 "msec" * 15 "RTT" = 1200 "msec" = 1.2 "sec"$.
2. The triple duplicate ACKs event only halves the congestion window to a size of $8 "MSS"$. To return to the maximum size for the congestion window it therefore takes $8 "RTT"$. This means it takes $80 "msec" * 8 "RTT" = 640 "msec" = 0.64 "sec"$.

#pagebreak()
#bibliography("source.yml", title: "Sources", style: "ieee")