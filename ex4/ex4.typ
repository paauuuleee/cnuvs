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
    To guarantee that a node has found the shortest path to every other node in the network, we have to garantee that all paths to all nodes have been propagated. Each node has two neighbors so the first to update rounds are caused by a message from both neighbors propagating the distance to the opposing node from the one we picked. This opposing node also propagates its initial state two the two neighbors that it shares with our node. Since there could potentially be a shorter path to one of our neighbors via the other neighbor and that the opposing node we also have to consider those two update rounds to really garantee the shortest path to each node. So in total we need 4 update rounds for each node to be sure.
]

#task(label: "e")[
    The "count-to-infinity" problem will ocurr when the a link failure occurs in $min_w {D^X (Y, w)}$ and the next shortest route via another neighbor Z also uses the same route $phi$ with a prefix: $X -> Z -> phi$. Since $phi$ doesn't exisit any more the distance tables of $X$ and $Z$ are iteratively incremented by $c(X, Z)$ until they surpass the cost of the next cheapest valid route. This can take a lot of time. #parbreak() In a small network the poisoned-reverse-method can prevent this problem, by $Z$ propagating a route with destination $Y$ to $X$ that instantly loops back to $X$ as infintate.
    @slides2[p. 37, 39]
]

== Task 4
#task(label: "a")[
    #align(center)[
        #dvrtable(
            $D^A$,
            ("B", "D"),
            ("B", "C", "D", "E", "F"),
            oc(2), inf,
            inf, inf,
            inf, oc(6),
            inf, inf,
            inf, inf
        )
        #dvrtable(
            $D^B$,
            ("A", "C", "D"),
            ("A", "C", "D", "E", "F"),
            oc(2), inf, inf,
            inf, oc(2), inf,
            inf, inf, oc(1),
            inf, inf, inf,
            inf, inf, inf
        )
        #dvrtable(
            $D^C$,
            ("B", "D"),
            ("A", "B", "D", "E", "F"),
            inf, inf,
            oc(2), inf,
            inf, oc(3),
            inf, inf,
            inf, inf
        )
    ]

    #align(center)[
        #dvrtable(
            $D^D$,
            ("A", "B", "C", "E", "F"),
            ("A", "B", "C", "E", "F"),
            oc(6), inf, inf, inf, inf,
            inf, oc(1), inf, inf, inf,
            inf, inf, oc(3), inf, inf,
            inf, inf, inf, oc(2), inf,
            inf, inf, inf, inf, oc(3)
        )
        #dvrtable(
            $D^E$,
            ("D"),
            ("A", "B", "C", "D", "F"),
            inf,
            inf,
            inf,
            oc(2),
            inf
        )
        #dvrtable(
            $D^F$,
            ("D"),
            ("A", "B", "C", "D", "E"),
            inf,
            inf,
            inf,
            oc(3),
            inf
        )
    ]
]

#task(label: "b")[

    Round 1:

    #align(center)[
        #dvrtable(
            $D^A$,
            ("B", "D"),
            ("B", "C", "D", "E", "F"),
            [2], oc(7),
            bc(4), oc(9),
            bc(3), [6],
            inf, bc(8),
            inf, bc(9)
        )
        #dvrtable(
            $D^B$,
            ("A", "C", "D"),
            ("A", "C", "D", "E", "F"),
            [2], inf, oc(7),
            inf, [2], oc(4),
            oc(8), oc(5), [1],
            inf, inf, bc(3),
            inf, inf, bc(4)
        )
        #dvrtable(
            $D^C$,
            ("B", "D"),
            ("A", "B", "D", "E", "F"),
            bc(4), oc(9),
            [2], oc(4),
            oc(3), [3],
            inf, bc(5),
            inf, bc(6)
        )
    ]

    #align(center)[
        #dvrtable(
            $D^D$,
            ("A", "B", "C", "E", "F"),
            ("A", "B", "C", "E", "F"),
            [6], bc(3), inf, inf, inf,
            oc(8), [1], oc(5), inf, inf,
            inf, oc(3), [3], inf, inf,
            inf, inf, inf, [2], inf,
            inf, inf, inf, inf, [3]
        )
        #dvrtable(
            $D^E$,
            ("D"),
            ("A", "B", "C", "D", "F"),
            bc(8),
            bc(3),
            bc(5),
            [2],
            bc(5)
        )
        #dvrtable(
            $D^F$,
            ("D"),
            ("A", "B", "C", "D", "E"),
            bc(9),
            bc(4),
            bc(6),
            [3],
            bc(5)
        )
    ]

    Round 2:

    #align(center)[
        #dvrtable(
            $D^A$,
            ("B", "D"),
            ("B", "C", "D", "E", "F"),
            [2], oc(6),
            [4], oc(6),
            [3], [6],
            bc(5), bc(5),
            bc(6), bc(6)
        )
        #dvrtable(
            $D^B$,
            ("A", "C", "D"),
            ("A", "C", "D", "E", "F"),
            [2], oc(6), oc(4),
            oc(6), [2], [4],
            oc(5), [5], [1],
            oc(10), oc(7), [3],
            oc(11), oc(8), [4]
        )
        #dvrtable(
            $D^C$,
            ("B", "D"),
            ("A", "B", "D", "E", "F"),
            [4], oc(6),
            [2], [4],
            [3], [3],
            oc(5), [5],
            oc(6), [6]
        )
    ]

    #align(center)[
        #dvrtable(
            $D^D$,
            ("A", "B", "C", "E", "F"),
            ("A", "B", "C", "E", "F"),
            [6], [3], oc(7), oc(10), oc(12),
            oc(5), [1], [5], oc(5), oc(7),
            oc(7), [3], [3], oc(7), oc(9),
            oc(11), oc(4), oc(8), [2], oc(8),
            oc(12), oc(5), oc(9), oc(7), [3]
        )
        #dvrtable(
            $D^E$,
            ("D"),
            ("A", "B", "C", "D", "F"),
            bc(5),
            [3],
            [5],
            [2],
            [5]
        )
        #dvrtable(
            $D^F$,
            ("D"),
            ("A", "B", "C", "D", "E"),
            bc(6),
            [4],
            [6],
            [3],
            [5]
        )
    ]

    Round 3:

    #align(center)[
        #dvrtable(
            $D^A$,
            ("B", "D"),
            ("B", "C", "D", "E", "F"),
            [2], [6],
            [4], [6],
            [3], [6],
            [5], [5],
            [6], [6]
        )
        #dvrtable(
            $D^B$,
            ("A", "C", "D"),
            ("A", "C", "D", "E", "F"),
            [2], [6], [4],
            [6], [2], [4],
            [5], [5], [1],
            oc(7), [7], [3],
            oc(8), [8], [4]
        )
        #dvrtable(
            $D^C$,
            ("B", "D"),
            ("A", "B", "D", "E", "F"),
            [4], [6],
            [2], [4],
            [3], [3],
            [5], [5],
            [6], [6]
        )
    ]

    #align(center)[
        #dvrtable(
            $D^D$,
            ("A", "B", "C", "E", "F"),
            ("A", "B", "C", "E", "F"),
            [6], [3], [7], oc(7), oc(9),
            [5], [1], [5], [5], [7],
            [7], [3], [3], [7], [9],
            oc(8), [4], [8], [2], [8],
            oc(9), [5], [9], [7], [3]
        )
        #dvrtable(
            $D^E$,
            ("D"),
            ("A", "B", "C", "D", "F"),
            [5],
            [3],
            [5],
            [2],
            [5]
        )
        #dvrtable(
            $D^F$,
            ("D"),
            ("A", "B", "C", "D", "E"),
            [6],
            [4],
            [6],
            [3],
            [5]
        )
    ]
]

#task(label: "c")[

    Initialization:

    #align(center)[
        #dvrtable(
            $D^A$,
            ("B", "D"),
            ("B", "C", "D", "E", "F"),
            oc(2), inf,
            inf, inf,
            inf, oc(1),
            inf, inf,
            inf, inf
        )
        #dvrtable(
            $D^B$,
            ("A", "C", "D"),
            ("A", "C", "D", "E", "F"),
            oc(2), inf, inf,
            inf, oc(2), inf,
            inf, inf, oc(1),
            inf, inf, inf,
            inf, inf, inf
        )
        #dvrtable(
            $D^C$,
            ("B", "D"),
            ("A", "B", "D", "E", "F"),
            inf, inf,
            oc(2), inf,
            inf, oc(3),
            inf, inf,
            inf, inf
        )
    ]

    #align(center)[
        #dvrtable(
            $D^D$,
            ("A", "B", "C", "E", "F"),
            ("A", "B", "C", "E", "F"),
            oc(1), inf, inf, inf, inf,
            inf, oc(1), inf, inf, inf,
            inf, inf, oc(3), inf, inf,
            inf, inf, inf, oc(2), inf,
            inf, inf, inf, inf, oc(3)
        )
        #dvrtable(
            $D^E$,
            ("D"),
            ("A", "B", "C", "D", "F"),
            inf,
            inf,
            inf,
            oc(2),
            inf
        )
        #dvrtable(
            $D^F$,
            ("D"),
            ("A", "B", "C", "D", "E"),
            inf,
            inf,
            inf,
            oc(3),
            inf
        )
    ]

    Round 1:

    #align(center)[
        #dvrtable(
            $D^A$,
            ("B", "D"),
            ("B", "C", "D", "E", "F"),
            [2], oc(2),
            bc(4), bc(4),
            oc(3), [1],
            inf, bc(3),
            inf, bc(4)
        )
        #dvrtable(
            $D^B$,
            ("A", "C", "D"),
            ("A", "C", "D", "E", "F"),
            [2], inf, oc(2),
            inf, [2], oc(4),
            oc(3), oc(5), [1],
            inf, inf, bc(3),
            inf, inf, bc(4)
        )
        #dvrtable(
            $D^C$,
            ("B", "D"),
            ("A", "B", "D", "E", "F"),
            bc(4), bc(4),
            [2], oc(4),
            oc(3), [3],
            inf, bc(5),
            inf, bc(6)
        )
    ]

    #align(center)[
        #dvrtable(
            $D^D$,
            ("A", "B", "C", "E", "F"),
            ("A", "B", "C", "E", "F"),
            [1], oc(3), inf, inf, inf,
            oc(3), [1], oc(5), inf, inf,
            inf, oc(3), [3], inf, inf,
            inf, inf, inf, [2], inf,
            inf, inf, inf, inf, [3]
        )
        #dvrtable(
            $D^E$,
            ("D"),
            ("A", "B", "C", "D", "F"),
            bc(3),
            bc(3),
            bc(5),
            [2],
            bc(5)
        )
        #dvrtable(
            $D^F$,
            ("D"),
            ("A", "B", "C", "D", "E"),
            bc(4),
            bc(4),
            bc(6),
            [3],
            bc(5)
        )
    ]

    Round 2:

    #align(center)[
        #dvrtable(
            $D^A$,
            ("B", "D"),
            ("B", "C", "D", "E", "F"),
            [2], [2],
            [4], [4],
            [3], [1],
            oc(5), [3],
            oc(6), [4]
        )
        #dvrtable(
            $D^B$,
            ("A", "C", "D"),
            ("A", "C", "D", "E", "F"),
            [2], oc(6), [2],
            oc(6), [2], [4],
            [3], [5], [1],
            oc(5), oc(7), bc(3),
            oc(6), oc(8), bc(4)
        )
        #dvrtable(
            $D^C$,
            ("B", "D"),
            ("A", "B", "D", "E", "F"),
            [4], [4],
            [2], [4],
            [3], [3],
            oc(5), [5],
            oc(6), [6]
        )
    ]

    #align(center)[
        #dvrtable(
            $D^D$,
            ("A", "B", "C", "E", "F"),
            ("A", "B", "C", "E", "F"),
            [1], [3], oc(7), oc(5), oc(7),
            [3], [1], [5], oc(5), oc(7),
            oc(5), [3], [3], oc(7), oc(9),
            oc(4), oc(4), oc(8), [2], oc(8),
            oc(5), oc(5), oc(9), oc(7), [3]
        )
        #dvrtable(
            $D^E$,
            ("D"),
            ("A", "B", "C", "D", "F"),
            [3],
            [3],
            [5],
            [2],
            [5]
        )
        #dvrtable(
            $D^F$,
            ("D"),
            ("A", "B", "C", "D", "E"),
            [4],
            [4],
            [6],
            [3],
            [5]
        )
    ]

    Round 3:

    #align(center)[
        #dvrtable(
            $D^A$,
            ("B", "D"),
            ("B", "C", "D", "E", "F"),
            [2], [2],
            [4], [4],
            [3], [1],
            [5], [3],
            [6], [4]
        )
        #dvrtable(
            $D^B$,
            ("A", "C", "D"),
            ("A", "C", "D", "E", "F"),
            [2], [6], [2],
            [6], [2], [4],
            [3], [5], [1],
            [5], [7], [3],
            [6], [8], [4]
        )
        #dvrtable(
            $D^C$,
            ("B", "D"),
            ("A", "B", "D", "E", "F"),
            [4], [4],
            [2], [4],
            [3], [3],
            [5], [5],
            [6], [6]
        )
    ]

    #align(center)[
        #dvrtable(
            $D^D$,
            ("A", "B", "C", "E", "F"),
            ("A", "B", "C", "E", "F"),
            [1], [3], [7], [5], [7],
            [3], [1], [5], [5], [7],
            [5], [3], [3], [7], [9],
            [4], [4], [8], [2], [8],
            [5], [5], [9], [7], [3]
        )
        #dvrtable(
            $D^E$,
            ("D"),
            ("A", "B", "C", "D", "F"),
            [3],
            [3],
            [5],
            [2],
            [5]
        )
        #dvrtable(
            $D^F$,
            ("D"),
            ("A", "B", "C", "D", "E"),
            [4],
            [4],
            [6],
            [3],
            [5]
        )
    ]
]

== Task 5

#task(label: "a")[
    #align(center)[
        #dvrtable(
            $D^C$,
            ("A", "B", "D"),
            ("A", "B", "D"),
            [3], [5], [3],
            [7], [1], [5],
            [4], [4], [2]
        )
        #dvrtable(
            $D^C$,
            ("A", "B", "D"),
            ("A", "B", "D"),
            [3], [5], rs(3),
            [7], [1], rs(5),
            [4], [4], rs(2)
        )
    ]

    #align(center)[
        #dvrtable(
            $D^D$,
            ("A", "C"),
            ("A", "B", "C"),
            [1], [5],
            [5], [3],
            [4], [2]
        )
        #dvrtable(
            $D^D$,
            ("A", "C"),
            ("A", "B", "C"),
            [1], rs(5),
            [5], rs(3),
            [4], rs(2)
        )
    ]
]

#task(label: "b")[
    #table(
        stroke: none,
        columns: (1fr, 1fr, 1fr),
        rows: (auto, auto, auto, auto, auto),
        [After initialisation], [Update round 1], [Update round 2],
        dvrtable(
            $D^A$,
            ("B", "C", "D"),
            ("B", "C", "D"),
            [5], [4], [4],
            [6], [3], [3],
            [8], [5], [1]
        ),
        dvrtable(
            $D^A$,
            ("B", "C", "D"),
            ("B", "C", "D"),
            [5], [4], oc(6),
            [6], [3], oc(5),
            [8], oc(7), [1]
        ),
        dvrtable(
            $D^A$,
            ("B", "C", "D"),
            ("B", "C", "D"),
            [5], [4], [6],
            [6], [3], [5],
            oc(10), [7], [1]
        ),
        dvrtable(
            $D^B$,
            ("A", "C"),
            ("A", "C", "D"),
            [5], [4],
            [8], [1],
            [6], [3],
        ),
        dvrtable(
            $D^B$,
            ("A", "C"),
            ("A", "C", "D"),
            [5], [4],
            [8], [1],
            [6], oc(5),
        ),
        dvrtable(
            $D^B$,
            ("A", "C"),
            ("A", "C", "D"),
            [5], [4],
            [8], [1],
            [6], [3],
        ),
        dvrtable(
            $D^C$,
            ("A", "B", "D"),
            ("A", "B", "D"),
            [3], [5], rs(3),
            [7], [1], rs(5),
            [4], [4], rs(2)
        ),
        dvrtable(
            $D^C$,
            ("A", "B", "D"),
            ("A", "B", "D"),
            [3], [5], rs(3),
            [7], [1], rs(5),
            [4], [4], rs(2)
        ),
        dvrtable(
            $D^C$,
            ("A", "B", "D"),
            ("A", "B", "D"),
            [3], [5], rs(3),
            [7], [1], rs(5),
            [4], oc(6), rs(2)
        ),
        dvrtable(
            $D^D$,
            ("A", "C"),
            ("A", "B", "C"),
            [1], rs(5),
            [5], rs(3),
            [4], rs(2)
        ),
        dvrtable(
            $D^D$,
            ("A", "C"),
            ("A", "B", "C"),
            [1], rs(5),
            [5], rs(3),
            [4], rs(2)
        ),
        dvrtable(
            $D^D$,
            ("A", "C"),
            ("A", "B", "C"),
            [1], rs(5),
            [5], rs(3),
            [4], rs(2)
        ),
    )
]

#pagebreak()
#bibliography("source.yml", title: "Sources", style: "ieee")