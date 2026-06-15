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

#pagebreak()
#bibliography("source.yml", title: "Sources", style: "ieee")