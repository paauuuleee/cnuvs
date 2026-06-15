#import "../header.typ": *
#import "exercise08_template.typ": *
#show: doc

#header(number: 8)

== Task 3

== Task 4

#task(label: "a")[
  TCP/8080: #parbreak()
  This port is often used as an alternative to the standard HTTP port 80. It is often employed in scenarios of development enviroments like locally hosted web servers. By using this port, developers can run web applications without requiring administrative privileges. #parbreak() @tcp8080
  \
  \
  UDP/514: #parbreak()
  This port is used for the syslog protocol, which is a standard for message logging. It allows devices and applications to send log messages to a central server for monitoring and analysis. The syslog protocol is widely used in network management and security applications to collect and analyze log data from various sources. #parbreak() @udp514
]

#task(label: "b")[
    QUIC is a protocol that combines the features of TCP and UDP. It is designed to provide faster and more efficient communication over the internet. QUIC uses UDP as its underlying transport protocol, but it incorporates features such as congestion control, multiplexing, and encryption to improve performance and security. #parbreak()
    \
    Key differences to TCP and UDP: #parbreak()
    #enum(
        [Faster Connection Establishment: QUIC reduces the number of round trips required to establish a connection, leading to faster communication.],
        [Improved Performance: QUIC incorporates features like congestion control and multiplexing to enhance performance and reduce latency.],
        [Enhanced Security: QUIC includes built-in encryption, ensuring that data transmitted over the network is secure and protected from eavesdropping.]
    )
    @quic
]

#task(label: "c")[
    When a TCP connection is terminated, the sender sends a FIN (finish) packet to the receiver, indicating that it has finished sending data. The receiver responds with an ACK (acknowledgment) packet to acknowledge the receipt of the FIN packet. The receiver then sends its own FIN packet to indicate that it has also finished sending data. Finally, the sender responds with an ACK packet to acknowledge the receipt of the receiver's FIN packet. #parbreak() @slides4[p. 12, 13]
]

#pagebreak()
#bibliography("source.yml", title: "Sources", style: "ieee")