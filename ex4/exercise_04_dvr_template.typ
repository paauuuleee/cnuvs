// Do not change this funciton
// source: Table name e. g. $D^A$
// via: Array of neighboring nodes of A
// destination: Array of all nodes in the network
// ..args: Table entries
#let dvrtable(source, via, destination, ..args) = [
  #box()[ // so that it won't get split up on a pagebreak

    // changes desination column automaticly
    #let dst_size = 8pt
    #let dest_text = "Destination"
    #if(destination.len() > 3) {dst_size = 10pt}
    #if(destination.len() < 3) {
      dest_text = "Dest."
    }
    
    #table(
      //style
      columns: (via.len()+2) * (1.9em,),
      rows: (destination.len()+2) * (auto,),
      align: center + horizon,

      // source node
      table.cell(rowspan: 2, colspan: 2)[#text(15pt)[#source]], 

      // via text
      table.cell(colspan: via.len())[Via],
      
      // via knoten
      ..for value in via {
        ([#value],)
      },
      
      // destination text
      table.cell(rowspan: destination.len())[#rotate(-90deg, reflow: true)[#text(size: dst_size)[#dest_text]]],
      
      // destination knoten
      ..for value in range(destination.len()) { 
        (table.cell(x: 1, y: 2 + value)[#destination.at(value)],)
      }, 
      
      // werte
      ..args
    )
  ]
]

// Helper functions to efficiently solve the task
#let inf = $infinity$ // writes out infinity
#let bc(value) = table.cell(fill: blue)[#value] // colors the cell blue 
#let oc(value) = table.cell(fill: orange)[#value] // colors the cell orange
#let rs(value) = [#text(fill: red, strike([#value]))] // red text striked through
#let c(value) = [#value]

= Task 3: Distance Vector Routing

Given template for DVR:

#figure(
    dvrtable(
      $D^A$,
      ("B", "D"),
      ("B", "C", "D", "E", "F"),
    ),
    caption: [Example distance-table layout for node A for task 3],
  )

Example use of helper functions in the template:

#figure(
    dvrtable(
      $D^A$,
      ("B", "D"),
      ("B", "C", "D", "E", "F"),
      inf, bc(inf), // to desination B
      oc(inf),rs(0) // to destination C
    ),
    caption: [Helper functions in action],
  )