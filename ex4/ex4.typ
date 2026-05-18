#import "../header.typ": *
#import "exercise_04_dvr_template.typ": *
#show: doc

#header(number: 4)

== Task 3
#task(label: "a")[
  Routing is the process  of determining the route taken by packets from source to destitination. #parbreak()
  Forwarding is the process of moving packets from router's input to appropriate router output. 
  @slides2[p. 4]
]

#task(label: "b")[
    #enum(
        [Distance vector routing has a limited view. The routers only know what direct neighbors tell them. Link state routing has a global view. Each router knows the entire network topology.],
        [Distance vector routing uses the Bellman-Ford algorithm. Link state routing uses Dijkstra's algorithm.],
        [Distance vector routing is slow to adapt to changes. It periodically broadcasts the entire routing table to its neighbors. Link state routing is faster to adapt to changes. It only sends updates when there are changes in the network topology.]
    )
]

#task(label: "c")[
    To garantee that a node has found the shortest path to every other node in the network, we have to garantee that all paths to all nodes have been propagated. Each node has two neighbors so the first to update rounds are caused by a message from both neighbors propagating the distance to the opposing node from the one we picked. This opposing node also propagates its initial state two the two neighbors that it shares with our node. Since there could potentially be a shorter path to one of our neighbors via the other neighbor and that the opposing node we also have to consider those two update rounds to really garantee the shortest path to each node. So in total we need 4 update rounds for each node to be sure.
]

#task(label: "d")[
    The "count-to-infinity" problem will ocurr when the a link failure occurs in $min_w {D^X (Y, w)}$ and the next shortest route via another neighbor Z also uses the same route $phi$ with a prefix: $X -> Z -> phi$. Since $phi$ doesn't exisit any more the distance tables of $X$ and $Z$ are iteratively incremented by $c(X, Z)$ until they surpass the cost of the next cheapest valid route. This can take a lot of time. #parbreak() In a small network the poisoned-reverse-method can prevent this problem, by $Z$ propagating a route with destination $Y$ to $X$ that instantly loops back to $X$ as infintate.
    @slides2[p. 37, 39]
]


== Task 5

#task(label: "a")[
    #dvrtable(
        $D^C$,
        ("A", "B", "D"),
        ("A", "B", "D"),
        c(3), c(5), c(3),
        c(7), c(1), c(5),
        c(4), c(4), c(2)
    )
    #dvrtable(
        $D^C$,
        ("A", "B", "D"),
        ("A", "B", "D"),
        c(3), c(5), rs(3),
        c(7), c(1), rs(5),
        c(4), c(4), rs(2)
    )

    #dvrtable(
        $D^D$,
        ("A", "C"),
        ("A", "B", "C"),
        c(1), c(5),
        c(5), c(3),
        c(4), c(2)
    )
    #dvrtable(
        $D^D$,
        ("A", "C"),
        ("A", "B", "C"),
        c(1), rs(5),
        c(5), rs(3),
        c(4), rs(2)
    )
]

#task(label: "b")[

]

#pagebreak()
#bibliography("source.yml", title: "Sources", style: "ieee")