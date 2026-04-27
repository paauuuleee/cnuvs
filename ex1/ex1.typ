#import "../header.typ": * 
#show: doc 

= CNuvS Ex. 1 - Jan Lindauer, Paul Feidieker
== Task 2
#task(label: "a")[
    Time Division Multiplexing as well as Frequency Division Multiplexing allow for bidirectional use of a shared connection between devices. TDM defines time slices in which only one device can send packets exclusivly and the other one waits for its respective time slot. #parbreak() Contrary to that in Frequency Division Multiplexing both can send packets at the same time but using different frequencies which can be laid on top of each other without loss. @slides2[p. 14]
]

#task(label: "b")[
    Code Division Multiplexing uses the same frequency band for multiple users of the channel. The messages are encoded by orthogonal codes that prevent the loss of information when overlaying the signals. @cdm #parbreak()
    Space Division Multiplexing is a method to increase transmission capacity through simply providing more physical channel instances that run in parallel between two connection points. For radio transmission that means that both connection points have multiple antennas for sending and recieving. Another example would be the submarine optical cables that have several optical fibre lanes in one cable. @sdm
]

== Task 3

#task(label: "a")[
    The description corrisponds to the network layer (layer 3) in the OSI model. Its main objective is to provide proper routing of a packet using IP addresses and in local networks MAC addresses. X.25 is a protocol on this layer. @slides2[p. 38] @osi
]

#task(label: "b")[
    SMTP is a protocol living on the application layer (layer 7) on the OSI model. This layer is the only one that is responsible for direct handling of user data (e.g. emails). Another protocol on this layer would be FTP (File Transfer Protocol). @slides2[p. 41] @osi 
]

#task(label: "c")[
    The described layer is the data link layer (layer 2) in the OSI model. This layer finds application especially in local networks where it garantees consitency of the transfered data at the atomic level of data frames. A well known protocol which is typically considered to live on the second layer is ARP (Address Resolution Protocol). Its task is to resolve the MAC address of an IP address in a local network. @osi @arp
]


#task(label: "d")[
    HTTPS uses a combination of HTTP for web traffic and TLS for securing the connection that client and server share. TLS is usually considered to be on the presentation layer (layer 6). This layer is concerned with the representation of messages that are send over a network. It defines compression, encryption and general data formats that messages over the internet can adhere to. Since TLS is not directly mentioned it is a fitting example for this layer. @slides2[p. 40] @osi
]

#task(label: "e")[
    TCP is a protocol on the tranport layer (layer 4) of the OSI model. This layer is responsible for successfull end-to-end transfer of data which it recieves from the session layer and above. TCP especially is a considered a reliable protocol which ensures consisency of transfored data, via flow control and error correction. Another protocol on this layer would be UDP (User Datagram Protocol) which contrary to TCP is not considered reliable. @slides2[p. 39] @osi
]

#task(label: "f")[
    The statement describes the lowest layer of the OSI model which is the physical layer (layer 1). It contains all physical devices and cables that are part of the transfer chain of the bitstreams that repesent the send data in a serial manner. RS232-C is an example for a protocol living on this layer. @slides2[p. 36] @osi
]

#task(label: "g")[
    The description fits the session layer (layer 5) of the OSI model. It is responsible for managing a communication session, and especially useful for large transfers that should be broken up into smaller ones. This layer manages a whole session for such a transfer. NetBIOS is a protocol that lives on this layer. @slides2[p. 40] @osi @netbios
]

== Task 4
#task(label: "a")[
    The physical and network layer are both agnostic to the application in use. Since the original message has been broken up into packets and frames respectively on these layers both a unknowing of the content and purpose of the message as a whole. Therefore both cannot be considered application-oriented layers and should correctly be identified as transfer-oriented layers. Additionally, both layer's main objective is to transfer packets and frames on their respective level of abstraction. On the other hand the session-layer hardly manages any form of transfer itself. It's entire purpose is to manage a connection between devices with application dependend attributes (duration of communication and size of transfered data). It is a primary tool in applications that use a network to communicate. Therefore, it should be classified as an application-oriented layer. @slides2[p. 36, 38, 41] @osi
]

#task(label: "b")[
    The TCP/IP stack is a simplified model of the inner workings of network communication. The OSI stack, on the other hand, defines more fine grain destinctions between the layers and their respective responsibilies. Each layer of the TCP/IP stack can be mapped to a set of the OSI stack:

    #enum(
        [The link layer corresponds to the physical and data link layer (layers 1, 2)],
        [The internet layer maps to the network layer but also encapsulates data link layer protocols like ARP (layer 3)],
        [The transport layer translates directly to the transport layer in the OSI model (layer 4)],
        [The application layer of the TCP/IP stack summarizes the remaining top layers of the OSI model which are session layer, presentation layer and application layer (layers 5, 6, 7)],
    )
    
    Also note worthy is that some sources also devide the link layer of the TCP/IP model up into physical and data link layer. @slides3[p. 7] @tcp_ip_osi
]


#task(label: "c")[
    The TCP/IP model was developed in the 1970s be the DoD (Department of Defense) of the US. It is the modern implementation of networking in practice today. The OSI model was later developed the ISO standardization organization (1980s). Today it serves as a theoretical model to further specify differences between protocols that are summarized together into one layer by the TCP/IP stack especially when looking at the seperation of the application layer into session, presentation and application layer. In practice often times protocols span across the boundries of the layers of the OSI model stemming from the fact that the internet is constructed around the TCP/IP stack and it is hard to precisely catagorize a protocol into one layer. An example would be TLS which contains aspects of every of the top 3 layers of the OSI model. Despite the lack of clear real world applicabilty of the OSI model, it serves as an important tool in diagnosing network issues and for better understanding in acedamic contexts. @tcp_ip_osi
]


// TODO: Quellen für MIME, ARP, TLS, Wi-Fi, NetBIOS
#pagebreak()
#bibliography("source.yml", title: "Sources", style: "ieee")
