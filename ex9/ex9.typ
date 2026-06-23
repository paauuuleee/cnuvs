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

#task(label: "Parameters for c - g")[
    \
    Arrival Rate: 25 req/sec #parbreak()
    Service Time ($E(S)$): $1/mu = 0.02$ seconds #parbreak()
    Service Rate ($mu$): $mu = 50$ req/sec #parbreak()
]

#task(label: "c")[
  The average system time represents the total time a request spends in the system (waiting time + service time).
  \
  Formula:
  $ W = 1 / (mu - lambda) $
  \
  Calculation:
  $ W = 1 / (50 - 25) = 1 / 25 = 0.0400 " seconds" $
  @slides5[p. 40]
]

#task(label: "d")[
  Utilization measures the fraction of time that the server is busy handling requests.
  \
  Formula:
  $ rho = lambda / mu $
  \
  Calculation:
  $ rho = 25 / 50 = 0.5000 $
  @slides5[p. 39]
]

#task(label: "e")[
  This represents the total expected number of requests currently being served and waiting in the queue.
  \
  Formula:
  $ L = lambda / (mu - lambda) = rho / (1 - rho) $
  \
  Calculation:
  $ L = 25 / (50 - 25) = 25 / 25 = 1.0000 " request" $
  @slides5[p. 40]
]

#task(label: "f")[
  The probability of having exactly $n$ customers/requests in a steady-state M/M/1 system follows a geometric distribution.
  \
  Formula:
  $ P_n = (1 - rho) rho^n $
  \
  Calculation for $n = 4$:
  $ P_4 = (1 - 0.5) times (0.5)^4 = 0.5 times 0.0625 = 0.0313 $
  @slides5[p. 39]
]

#task(label: "g")[
  The probability that the server is completely idle is $P_0 = 1 - rho$. Over a time interval $T$, the expected total idle duration is the idle probability multiplied by $T$.
  \
  Formula:
  $ I = (1 - rho) times T $
  \
  Calculation: \
  First, convert the time interval to seconds: $T = 6 " minutes" times 60 " seconds/minute" = 360 " seconds"$.
  $ I = (1 - 0.5) times 360 = 180.0000 " seconds" $
]

== Task 6

The maximum segment size ($"MSS"$) is $4"KB"$ and the maximum congestion window is $64"KB"$. Therefore the maximum congestion window can contain $
  64 / 4 = 16 "MSS"
$ 
1. A timeout event reduces the congestion window to $1 "MSS"$. The AIMD mechanism increments the congestion window by $1 "MSS"$ every round-trip time ($"RTT"$). Therefore it takes $15 "RTT"$ to return back to the maximum congestion window. This takes $80 "msec" * 15 "RTT" = 1200 "msec" = 1.2 "sec"$.
2. The triple duplicate ACKs event only halves the congestion window to a size of $8 "MSS"$. To return to the maximum size for the congestion window it therefore takes $8 "RTT"$. This means it takes $80 "msec" * 8 "RTT" = 640 "msec" = 0.64 "sec"$.

#pagebreak()
#bibliography("source.yml", title: "Sources", style: "ieee")