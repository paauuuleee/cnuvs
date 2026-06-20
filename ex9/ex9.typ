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
  - *M*: Exponential process
  - *D*: Deterministic
  - *G*: General

  @slides5[p. 36]
]

#task(label: "b")[

]

#pagebreak()
#bibliography("source.yml", title: "Sources", style: "ieee")