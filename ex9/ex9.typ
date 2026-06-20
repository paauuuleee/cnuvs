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

#pagebreak()
#bibliography("source.yml", title: "Sources", style: "ieee")