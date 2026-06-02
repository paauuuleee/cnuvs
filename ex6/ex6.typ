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
    The three-way handshake only works if each of the handshake messages are properly recieved in time by the respective party. Since communication channels are propabilistic channels, we can't guarantee that each message arrives correctly. From there several problems arise. The ACK-message, the second DR-message or even the first DR-message after a resend can fail to arrive. Each of these problems is solved by setting optimistic timeouts that trigger a retransmission of the pontentially failed message. @slides4[p. 7]
]

#task(label: "d")[
  The major limitation of Alternating Bit Protocol is that it can only handle one packet at a time, which means that the sender has to wait for an acknowledgment for each packet before sending the next one. This leads to inefficient use of network resources, especially in high-latency networks, as the sender spends a lot of time waiting for acknowledgments instead of transmitting data. #parbreak()
  This becomes severe if the distance between the sender and receiver is large, leading to increased latency due to the longer propagation time and reduced throughput. @slides4[p. 8, 9]
]

== Task 5

#task(label: "a")[
    The IP address is a defining part of the IP protocol on the network layer, while the networking port is a responsibility of the transport layer. The OSI model advocates for clear abstractions that encapsulate finer grain technicalities away from higher layers. Since the internet is older than the OSI model it still combines IP addresses and ports as socket identifiers. This has some major upsides like defining unique indefications for application endpoints and also enables are more efficient multiplexing between concurrently running network applications. @slides4[Part 1, p. 18, 19]
]

#task(label: "b")[
  Using PIDs would be problematic because processes can are created and killed dynamically, which means that the PID associated with a particular service may change over time.
  A device may also be rebooted which usually changes the PID. In these cases, everytime the PID changes, the new PID would need to be announeced to the network. #parbreak()
  Instead, abstract service addresses called Protocol Ports are used. #parbreak()
  @slides4[Part 1, p. 17]
]

#task(label: "c")[
  If both requests use UDP, 1 socket is needed on the server side, since UDP is connectionless and does not require a dedicated connection for each sender. The server can simply listen on the same port for incoming UDP packets from both clients. #parbreak()
  If both requests use TCP, 2 sockets are needed on the server side, since TCP is connection-oriented and requires a dedicated connection for each sender. The server would need to create a seperate socket for each client to handle the TCP connection. #parbreak()
  @slides4[Part 1, p. 9]
]

#task(label: "d")[
  The default port range for registered ports supported by Windows 10 is from 1024 to 49151. @ports #parbreak()
  The default port range for ephemeral ports supported by Windows 10 is from 49152 to 65535. @ports
]

== Task 6

#task(label: "a")[
  Packet size in bits:
  $ L = 13 times 1024 times 8 "bit" = 106 thin 496 "bit" $

  Data rate in bit/s:
  $ R = 35 times 2^30 "bit/s" = 37 thin 580 thin 963 thin 840 "bit/s" $

  Total data in bits:
  $ D = 3.7 times 1024 times 1024 times 8 "bit" = 31 thin 063 thin 040 "bit" $
  
  Transmission time per packet:
  $ t_"tx" = L / R = (106 thin 496) / (37 thin 580 thin 963 thin 840) approx 2.8338 times 10^(-3) "ms" = 2.8338 mu"s" $

  Number of Packets:
  $ N = ceil(D / L) = ceil((31 thin 063 thin 040) / (106 thin 496)) = ceil(291.68 dots) = 292 "packets" $

  In the alternating bit protocol, the sender must wait for the ACK before
  sending the next packet. One full round-trip cycle takes:

  $ t_"cycle" &= t_"tx" ("packet") + t_"prop" + t_"tx" ("ACK") + t_"prop" \
              &= 2 dot t_"tx" + 2 dot t_"prop" \
              &= 2 times 2.8338 mu"s" + 2 times 84 "ms" \
              &approx 0.0057 "ms" + 168 "ms" \
              &approx 168.0057 "ms" $

  \
  For the last packet we do not need to wait for the ACK to return:

  $ T_"total" &= (N - 1) dot t_"cycle" + t_"tx" ("packet") + t_"prop" \
             &= 291 times 168.0057 "ms" + 2.8338 mu"s" + 84 "ms" \
             &= 48 thin 889.6 "ms" + 84.0028 "ms" $
  \
  $ T_"total" approx 48 thin 973.6 "ms" approx bold(48.9736 "s") $
]

#task(label: "b")[
  The sender transmits all packets back-to-back without waiting for individual
  ACKs. Only one ACK is sent at the very end:

  $ T_"total" &= N dot t_"tx" ("packet") + t_"prop" + t_"tx" ("ACK") + t_"prop" \
              &= (N + 1) dot t_"tx" + 2 dot t_"prop" \
              &= 293 times 2.8338 mu"s" + 2 times 84 "ms" \
              &= 830.3 mu"s" + 168 "ms" $

  \
  $ T_"total" approx 168.8303 "ms" approx bold(0.1688 "s") $
]

#pagebreak()
#bibliography("source.yml", title: "Sources", style: "ieee")