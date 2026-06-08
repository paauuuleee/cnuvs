#import "../header.typ": *
#show: doc

#header(number: 7)

== Task 4

#task(label: "a")[
    The fundamental limitation of open-loop congestion control compared to closed-loop control is the lack of live feedback. Because the system cannot observe the actual state of the network during data transmission, it is optimized for expected scenarios, making it either terribly inefficient or completely helpless when unexpected traffic spikes occur. #parbreak() @slides4[p. 26, 27]
    \
    \
    Example: #parbreak()
    A system sends video data at a fixed 5 Mbps based on a guess, blindly flooding an overloaded router with data it can't process when a traffic surge hits. Because it lacks feedback, it keeps sending data anyway, causing massive packet drops and a frozen stream. A closed-loop system instantly detects those dropped packets and automatically drops its bitrate to match the available bandwidth. 
]

#task(label: "b")[
    
]

#pagebreak()
#bibliography("source.yml", title: "Sources", style: "ieee")
