#import "../header.typ": *
#show: doc

#header(number: 3)
== Task 4
#task(label: "a")[
    #show table.cell: it => {
        if it.y == 0 {
            strong(it)
        } else if it.x == 0 {
            emph(it)
        } else { 
            it
        }
    }
    
    #show table.cell: it => {
        pad(x: 1em, y: 0.5em, align(center)[#it])
    }
    
    #table(
        columns: (auto, 1fr, auto, auto),
        [Key characteristic], [Given Description], [IPv4], [IPv6],
        [Notation], [Hexadecimal (e.g. 2001:db8::1)], [], [#sym.crossmark],
        [Address length], [32-bit], [#sym.crossmark], [],
        [Helper protocol], [ARP], [#sym.crossmark], [],
        [Header structure], [Additional Fields in the header: Traffic Class, Flow Label, Payload Length, Next Header, Hop Limit. Header size is fixed to 40 bytes.], [], [#sym.crossmark] 
    ) @slides3[p. ]
]

#task(label: "b")[
    Firstly NDP uses IPv6, contrary to ARP using IPv4. Secondly the MAC address resolution requests are send as broadcasts for ARP protocol and NDP only sends them to its nearest neighbors which means it is considered a multicast message. @arp_ndp
]
#task(label: "c")[
    `1234:0000:0000:00ab:1234 -> 1234::ab:1234` @slides3[p. 32]
]

#task(label: "d")[
    `0010:4aee:53ab -> 0210:4aff:feee:53ab` @slides3[p. 32]
]

#task(label: "e")[
    The solutions is called tunneling. It is a technique to encapsulate IPv6 packets within IPv4 packets, allowing them to be transmitted over an IPv4 network. @slides3[p. 33]
]

== Task 5
#task(label: "a")[


    #show table.cell: it => {
        if it.y == 0 {
            strong(it)
        } else { 
            it
        }
    }
    
    #show table.cell: it => {
        pad(x: 1em, y: 0.5em, align(center)[#it])
    }
    
    #table(
        columns: (auto, 1fr),
        [Link Interface], [Destination Address Range], 
        [0], [#highlight[`10101110 01011110 11000`]`000 00000000` 
        #parbreak() through #parbreak() #highlight[`10101110 01011110 11000`]`111 11111111`], 
        [1], [#highlight[`10101110 01011110 11001100 1`]`0000000`
        #parbreak() through #parbreak() #highlight[`10101110 01011110 11001100 1`]`11111111`], 
        [2], [#highlight[`10101110 01011110 1100110`]`0 00000000`
        #parbreak() through #parbreak() #highlight[`10101110 01011110 1100110`]`1 11111111`], 
        [3], [otherwise], 
    )

    #table(
        columns: (auto, 1fr),
        [Link Interface], [Prefix Match],
        [0], [`10101110 01011110 11000`],
        [1], [`10101110 01011110 11001100 1`],
        [2], [`10101110 01011110 1100110`],
        [3], [otherwise] 
    )
]

#task(label: "b")[
    `174.94.205.60 -> Link Interface 2` #parbreak()
    Since the address has the longest (only) prefix match with the address range of link interface 2 it belongs to this link interface. Note that link interface 1 defines a subnet of link interface 2 but the prefix doesnt match the address.
]

#task(label: "c")[
    `174.94.194.175 -> Link Interface 0` #parbreak()
    This address only matches the prefix of link interface 0, therefore it belongs to that interface.
]

#task(label: "d")[
    `174.94.206.127 -> Link Interface 3` #parbreak()
    This address doesn't match any of the well defined link interfaces. It conflicts link interface at the 21st prefix digit. For link interface 1 and 2 it is prefix digit 23. Therefore only link interface 3 remains.
]

== Task 6

#task(label: "a")[
    *Subnet mask:* 255.255.252.0 (decimal), `11111111 11111111 11111100 00000000` (binary)    
    *Network part:* 172.16.4.0 (decimal), #highlight[`10101100 00010000 000001`]`00 00000000`(binary)
    *Host part:* 0.0.1.10 (decimal), `00000000 00000000 000000` #highlight[`01 00001010`] (binary)
    #parbreak()
    Only the marked parts of the binary representation really make out the network and host part of the subnet respectively.
]

#task(label: "b")[
    So the first 23 bit of the address is the network part of the address. Therefore the last 9 bit of the address are the host part and can be used as addresses inside of the network, although we have to correctly subtract the breadcast and network address. Our total of usable addresses sums up to: 
    $
        510 = 512 - 2 = 2^9 - 2
    $
]

#task(label: "c")[
    The `127.0.0.0/8` block is called the loopback block. It is used to address the same host the message is comming from. It is often called localhost.
]

== Task 7

#pagebreak()
#bibliography("source.yml", title: "Sources", style: "ieee")
