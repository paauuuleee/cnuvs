#import "@preview/fletcher:0.5.8": diagram, node, edge

#let lamportclockgraph(x_stretch: 1.5,y_stretch: 2, darkmode: false, processcount: 3, timecount: 10, events: (), ..args) = diagram(
    let edge_color = if darkmode {white} else {rgb(29,31,33)},
    let neg_edge_color = if darkmode {rgb(29,31,33)} else {white},
    node-inset: 3pt,
    node-shape: circle,
    node-stroke: 1pt+edge_color,
    edge-stroke: 1pt+edge_color,

    spacing: 1em,
    axes: (ltr, btt),
    // debug: 1,

    //processes edges
    ..for value in range(processcount) {
      let p_name = "p" + str(value)
      let i_name = "pi" + str(value)
      (node((0*x_stretch,value*y_stretch*-1),$P_value$,name: p_name, stroke: none),)
      (edge(),)
      (node(((timecount+1)*x_stretch,value*y_stretch*-1), stroke: none),)
    },

    // time edges
    ..for value in range(1,timecount+1){
      let t_name = "t" + str(value)
      let i_name = "ti" + str(value)
      (node((value*x_stretch,3*y_stretch*-1),"t="+str(value),name: t_name, stroke: none),)
      (edge("--", stroke: blue),)
      (node((value*x_stretch,0*-1),name: i_name),)
    },
    
    ..for value in events {
      (node((int(value.at(0))*x_stretch,int(value.at(1))*y_stretch*-1),value.at(2),name: value.at(2), fill: neg_edge_color),)
      (node((int(value.at(0))*x_stretch,(-int(value.at(1))+.5)*y_stretch),text(fill:orange)[#value.at(3)],stroke: none,fill: neg_edge_color),)
      
    },
    
    ..args
)

#figure(
  lamportclockgraph(
    // events are written from left to right and top to botton
    // e.g. Event P_0 at t=1 with 5 as count and event name "a"
    // ("1","0","a","5")
    events: (
      ("1","0","a","1"),
      ("3","0","b","2"),
      ("4","0","c","3"),
      ("6","0","d","4"),
      ("7","0","e","5"),
      ("8","0","f","6"),
      ("10","0","g","7"),
      ("3","1","h","1"),
      ("4","1","i","3"),
      ("9","1","j","7"),
      ("2","2","k","1"),
      ("5","2","l","2"),
    ),
    
    // edges from event to event
    edge(<b>,<i>,"->"),
    edge(<h>,<c>,"->"),
    edge(<l>,<e>,"->"),
    edge(<f>,<j>,"->"),
  ),
  caption: [Lamport Clock drawing example]
)<example1_lamport>