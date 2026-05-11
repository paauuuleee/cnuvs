#import "../header.typ": *
#show: doc

#show table.cell: it => {
    pad(x: 1em, y: 0.5em, align(center)[#it])
}

#let checkbox(checked: bool) = {
    if checked {
        square(size: 0.8em)[#align(center + horizon)[#sym.crossmark]]
    } else {
        square(size: 0.8em)[]
    }
}

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
    
    #table(
        columns: (auto, 1fr, auto, auto),
        [Key characteristic], [Given Description], [IPv4], [IPv6],
        [Notation], [Hexadecimal (e.g. 2001:db8::1)], [#checkbox(checked: false)], [#checkbox(checked: true)],
        [Address length], [32-bit], [#checkbox(checked: true)], [#checkbox(checked: false)],
        [Helper protocol], [ARP], [#checkbox(checked: true)], [#checkbox(checked: false)],
        [Header structure], [Additional Fields in the header: Traffic Class, Flow Label, Payload Length, Next Header, Hop Limit. Header size is fixed to 40 bytes.], [#checkbox(checked: false)], [#checkbox(checked: true)] 
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
]@slides3[p. 4, 5]

#task(label: "b")[
    So the first 23 bit of the address is the network part of the address. Therefore the last 9 bit of the address are the host part and can be used as addresses inside of the network, although we have to correctly subtract the breadcast and network address. Our total of usable addresses sums up to: 
    $
        510 = 512 - 2 = 2^9 - 2
    $
]@slides3[p. 5]

#task(label: "c")[
    The `127.0.0.0/8` block is called the loopback block. It is used to address the same host the message is comming from. It is often called localhost.
]@localhost

== Task 7

#task(label: "a")[
    The main problem was a shortage of IP adresses. The end-to-end-principle suggested that every device should have a unique IP address, but with the growth of the internet and the availabale IP adresses in the IPv4 protocol (2^32) this became a problem. NAT was a solution to this by giving local networks only one IP address to the outside "world". However this soultion was contrary to the end-to-end-principle and caused problems for applications that needed to establish direct connections between devices. The solution to solve this issue was the implementation of the IPv6 protocol which has a much larger address space (2^128).
]@slides3[p. 17, 18, 21]

#task(label: "b")[
    Request: #parbreak()
    10.0.0.4:3345 --> 1.1.1.1:80 #parbreak()
    Response: #parbreak()
    1.1.1.1:80 --> 138.76.29.7:5001
]@slides3[p. 20]

== Task 8

#task(label: "a")[
    The four addresses can be aggregated to 172.16.1.0/24. #parbreak()
    The aggregation is possible because they only differ on bits 25 and 26 (last two bits of the /26 network block). Since the 4 addresses cover all possible combinations of bits 25 & 26 (00, 01, 10, 11) and share the same interface, they can be aggregated to the /24 block.
]@slides3[p. 4, 18]

#task(label: "b")[
    For interface \u{0023}1 the following calculations can be done to determine the routing table entry: #parbreak()
    First Range: #parbreak()
    10.40.50.59 ->  #highlight[00001010 001]01000 00110010 00111011 #parbreak()
    10.60.103.225 -> #highlight[00001010 001]11100 01100111 11100001 #parbreak()
    As the marked bits are the same for both addresses, we can aggregate them to the address range 10.32.0.0/11. #parbreak()
    Second Range: #parbreak()
    10.0.20.8 -> #highlight[00001010 000]00000 00010100 00001000 #parbreak()
    10.23.150.252 -> #highlight[00001010 000]10111 10010110 11111100 #parbreak()
    As the marked bits are the same for both addresses, we can aggregate them to the address range 10.0.0.0/11. #parbreak()
    To see, if the range can be further aggregated, we can compare the two calculated address blocks: #parbreak()
    10.32.0.0 -> #highlight[00001010 00]1 00000 00000000 00000000 #parbreak()
    10.0.0.0 -> #highlight[00001010 00]0 00000 00000000 00000000 #parbreak()
    As the marked bits are the same for both addresses, we can aggregate them to the address range 10.0.0.0/10. #parbreak()
    So the final routing table entry for interface \u{0023}1 is: 10.0.0.0/10 #parbreak()
    \
    For interface \u{0023}2 the following calculations can be done to determine the routing table entry: #parbreak()
    192.168.10.128 -> #highlight[11000000 10101000 00001010 1]0000000 #parbreak()
    192.168.10.255 -> #highlight[11000000 10101000 00001010 1]1111111 #parbreak()
    As the marked bits are the same for both addresses, we can aggregate them to the address range 192.168.10.128/25. #parbreak()
    So the final routing table entry for interface \u{0023}2 is: 192.168.10.128/25
]@slides3[p. 13, 14]

#pagebreak()
#bibliography("source.yml", title: "Sources", style: "ieee")
