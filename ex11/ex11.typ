#import "../header.typ": *
#show: doc

#header(number: 11)

== Task 4

#task(label: "a")[
  The first distinct operational risk is the missing redundancy. If for some reason the supercomputer in Frankfurt goes offline (power outage, crashes, cyberattack etc.), no one can access websites using standard URLs anymore, since there's no other way to translate domain names. #parbreak()
  The second operational risk is latency and traffic. Users sitting far away from Frankfurt would suffer from massive delays just because of the distance to the server. Another problem would be the combined traffic of the whole world, choking Frankfurts network. #parbreak()
  \
  The solution to the redundancy issue is the hierarchical, decentralized structure of DNS that is backed by Anycast routing. The 13 global root servers a duplicated into thousands aof instances. If one instance goes out, traffic is just rerouted to the next closest one. #parbreak()
  The solution to the latency and traffic issue is the caching logic of DNS. Previously visited IPs are saved localy for some time (TTL) and only a small amount of queries creates global traffic. \
  @slides6[p. 21, 24]
]

#task(label: "b")[
  In an iterative request query a server replies with the name of the server to contact if itself can't resolve the requested domain. #parbreak()
  In a recursive request query the burden of name resolution lies on the contacted name server. #parbreak()
  @slides6[p. 26, 27]  
]

#task(label: "c")[
  The mechanism causing this is DNS caching. Users that have a valid Resource Record will access the old website until the TTL is over. This helps performance since the user doesn't have to request a domain resolve everytime which could take a while depending on where the DNS-Server is located. #parbreak()
  The delay could be resolved by lowering the TTL to for example 5 minutes. Then wait for the duration of the old TTL. After this the updated IP would propagate worldwide within 5 minutes. \
  @slides6[p. 24]
]

#pagebreak()
#bibliography("source.yml", title: "Sources", style: "ieee")