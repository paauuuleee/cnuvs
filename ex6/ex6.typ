#import "../header.typ": *
#show: doc

#header(number: 6)

== Task 4

#task(label: "a")[
  #enum(
    [Segmentation, Addressing, Multiplexing],
    [Connection Control]
  )@slides4[p. 4]
]

#task(label: "b")[
  The component 130.83.47.181 is the IP address representing the receiving host on the network, which a reverse DNS lookup identifies as a server belonging to TU Darmstadt (Hostname: cms-sip02.hrz.tu-darmstadt.de.). The component 443 is the port number representing the specific receiving service, which stands for HTTPS. @slides4[p. 5] @dnschecker
]

#task(label: "c")[
    
]

#pagebreak()
#bibliography("source.yml", title: "Sources", style: "ieee")