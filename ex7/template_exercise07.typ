
// important import for clock tasks
#import "@preview/cetz:0.3.4"

// clock which takes two or three arguments (by default the clock will have 8 steps), example: #clock(steps:6, 2, 4)
// if to < from -> empty clock
#let clock(steps: 8, from, to) = [
  #cetz.canvas({
    import cetz.draw: *
    let clocksteps = steps
    
    for i in range(0,clocksteps) { // parameterized steps
      let step-angle = ((360/clocksteps) * i) * 1deg

      line( // number linemarks
        (step-angle + 90deg, 1cm), 
        ((step-angle + 90deg, 18pt)), 
        stroke: black + 0.75pt
      )

      content( // numbers
        ((360/clocksteps)/2 * 1deg + 90deg + step-angle, 0.8), 
        text(font: "Roboto", size: 7pt)[#{clocksteps - i - 1}]
      )
    }

    let start = -((360/clocksteps) * from) * 1deg + 90deg
    let end = -((360/clocksteps) * to) * 1deg + 90deg

    if from <= to {
      if start == end {
        line( // use line instead 
          (start, 1cm), (0,0),
          stroke: 1.3pt + red,
        )
      } else {
        arc( // red selection
          (calc.cos(start), calc.sin(start)),
          stroke: 1.3pt + red,
          start: start,
          stop: end,
          radius: 1cm,
          mode: "PIE",
          fill: color.rgb(255,0,0,64),
        )      
      }
    }

    circle((0,0), stroke: 1.5pt) // outer black circle
    circle((0,0), radius: 1pt, stroke: 2pt, fill: black) // center dot
  })
]

#let tcp_flow_control_table(rows: 17, ..args) = {
  table(
    columns: (2em, 7 * (1fr,)).flatten(),
    rows: (3.5em, (rows - 1)*(2em,)).flatten(),
    align: center+horizon,
    $t$, [*Sender\ window*], [*Frame(s)\ ready*], [*Sender\ sending*], [*Sender\ receiving*], [*Receiver\ receiving*], [*Receiver\ sending*], [*Receiver\ window*],
    ..args,
  )
}


= Task 2: Group Exercise: TCP/Flow Control
  // TODO: Change the none values into the correct ones
  #figure( 
    tcp_flow_control_table(
      rows: 17,
      $0$, "0-0", "-", "-", "-", "-", "-", "0-2",
      $1$, "0-1", "F0", "F0", "-", "-", "-", "0-2",
      $2$, "0-1", "-",  "-", "-", "F0", "-", "1-2",
      $3$, "0-2", "F1", "F1", "-", "-", "ACK0", "1-3",
      $4$, "1-2", "F2", none,  none, "F1", none, none,
      $5$, none, "F2, F3", none, none, none, none, none,
      $6$, none, "F3, F4", none, none, none, none, none,
      $7$, none, "F3, F4", none, none, none, none, none,
      $8$, none, "F4", none, none, none, none, none,
      $9$, none, "F4", none, none, none, none, none,
      $10$, none, "-", none, none, none, none, none,
      $11$, none, "-", none, none, none, none, none,
      $12$, none, "F5", none, none, none, none, none,
      $13$, none, "-", none, none, none, none, none,
      $14$, none, "-", none, none, none, none, none,
      $15$, none, "-", none, none, none, none, none,
      $16$, none, "-", none, none, none, none, none,
    ),
    caption: [Template table for task 2]
  )

= Task 3: Group Exercise: Sliding Window Protocols
  // TODO: change the variables in the clock function in center and and write the correct state description in bottom
  #figure( 
    table(
      rows: 3,
      columns: 8,
      // top
      $0$, $1$, $2$, $3$, $4$, $5$, $6$, $7$,
      // center
      clock(0,0),
      clock(0,-1),
      clock(0,-1),
      clock(0,-1),
      clock(0,-1),
      clock(0,-1),
      clock(0,-1),
      clock(0,-1),
      // bottom
      "init",
    ),
    caption: [Sender table part 1 for task 3]
  )
  
  #figure( 
    table(
      rows: 3,
      columns: 8,
      // top
      $0$, $1$, $2$, $3$, $4$, $5$, $6$, $7$,
      // center
      clock(0,4),
      clock(0,-1),
      clock(0,-1),
      clock(0,-1),
      clock(0,-1),
      clock(0,-1),
      clock(0,-1),
      clock(0,-1),
      // bottom
      "init",
    ),
    caption: [Receiver table part 1 for task 3]
  )
  
  #figure( 
    table(
      rows: 3,
      columns: 7,
      // top
      $8$, $9$, $10$, $11$, $12$, $13$, $14$,
      // center
      clock(0,-1),
      clock(0,-1),
      clock(0,-1),
      clock(0,-1),
      clock(0,-1),
      clock(0,-1),
      clock(0,-1),
      // bottom
      "",
    ),
    caption: [Sender table part 2 for task 3]
  )
  
  #figure( 
    table(
      rows: 3,
      columns: 7,
      // top
      $8$, $9$, $10$, $11$, $12$, $13$, $14$,
      // center
      clock(0,-1),
      clock(0,-1),
      clock(0,-1),
      clock(0,-1),
      clock(0,-1),
      clock(0,-1),
      clock(0,-1),
      // bottom
      "",
    ),
    caption: [Receiver table part 2 for task 3]
  )

  = Task 5: TCP/Flow Control (14 Points)
  // TODO: Change the none values into the correct ones
    #figure(
      tcp_flow_control_table(
        rows: 22,
        $0$, "0-0", "-", "-", "-", "-", "-", "0-5",
        $1$, "0-1", "F0", "F0", "-", "-", "-", "0-5",
        $2$, "0-2", "F1",  "F1", "-", "F0", "-", "1-5",
        $3$, "0-2", "-", "-", "-", "F1", "-", "2-5",
        $4$, "0-3", "F2", none,  none, none, none, none,
        $5$, none, "F3", none, none, none, none, none,
        $6$, none, "F4", none, none, none, none, none,
        $7$, none, "F5", none, none, none, none, none,
        $8$, none, "F5", none, none, none, none, none,
        $9$, none, "-", none, none, none, none, none,
        $10$, none, "-", none, none, none, none, none,
        $11$, none, "F6", none, none, none, none, none,
        $12$, none, "-", none, none, none, none, none,
        $13$, none, "-", none, none, none, none, none,
        $14$, none, "F7", none, none, none, none, none,
        $15$, none, "-", none, none, none, none, none,
        $16$, none, "-", none, none, none, none, none,
        $17$, none, "-", none, none, none, none, none,
        $18$, none, "F8", none, none, none, none, none,
        $19$, none, "-", none, none, none, none, none,
        $20$, none, "-", none, none, none, none, none,
        $21$, none, "-", none, none, none, none, none,
    ),
    caption: [Template table for task 5]
  )

= Task 6: Sliding Window Protocols (14 Points)
  // TODO: change the variables in the clock function in centerand and write the correct state description in bottom
  #figure( 
    table(
      rows: 3,
      columns: 8,
      // top
      $0$, $1$, $2$, $3$, $4$, $5$, $6$, $7$,
      // center
      clock(0,0),
      clock(0,-1),
      clock(0,-1),
      clock(0,-1),
      clock(0,-1),
      clock(0,-1),
      clock(0,-1),
      clock(0,-1),
      // bottom
      "init",
    ),
    caption: [Sender table part 1 for task 6]
  )
  
  #figure( 
    table(
      rows: 3,
      columns: 8,
      // top
      $0$, $1$, $2$, $3$, $4$, $5$, $6$, $7$,
      // center
      clock(0,3),
      clock(0,-1),
      clock(0,-1),
      clock(0,-1),
      clock(0,-1),
      clock(0,-1),
      clock(0,-1),
      clock(0,-1),
      // bottom
      "init",
    ),
    caption: [Receiver table part 1 for task 6]
  )
  
  #figure( 
    table(
      rows: 3,
      columns: 7,
      // top
      $8$, $9$, $10$, $11$, $12$, $13$, $14$,
      // center
      clock(0,-1),
      clock(0,-1),
      clock(0,-1),
      clock(0,-1),
      clock(0,-1),
      clock(0,-1),
      clock(0,-1),
      // bottom
      "",
    ),
    caption: [Sender table part 2 for task 6]
  )
  
  #figure( 
    table(
      rows: 3,
      columns: 7,
      // top
      $8$, $9$, $10$, $11$, $12$, $13$, $14$,
      // center
      clock(0,-1),
      clock(0,-1),
      clock(0,-1),
      clock(0,-1),
      clock(0,-1),
      clock(0,-1),
      clock(0,-1),
      // bottom
      "",
    ),
    caption: [Receiver table part 2 for task 6]
  )
