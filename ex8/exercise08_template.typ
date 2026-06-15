// table for calculating udp checksum
#let udp_checksum_table(rows: 13,..args) = {
  table(
      columns: (.6fr, .6fr, 1fr),
      rows: ((3em), rows*(2em,)).flatten(),
      align: left+horizon,
      [*Last Value*\ (hexadecimal notation)], [*Added Value*\ (hexadecimal notation)], [*Accumulator*\ (hexadecimal notation)],
      ..args,
    )
  }


// table for the udp segemnt
// row_data_count: Are the rows of the data to send 
// ..args: all data for the udp segment
#let udp_segment_table(row_data_count: 3, ..args) = {
    table(
      columns: (4*(2.5em,)),
      rows: ((row_data_count+2)*(2.5em,)),
      align: auto,
      inset: 10pt,
      stroke: (x, y) => (
        left: if x == 0 or (x == 2 and y <= 1) { 1pt },
        top: if y <= 2 { 1pt },
        right: if x == 3 { 1pt },
        bottom: if y == (row_data_count+1) { 1pt },
      ),
      ..args
    )
}

= Task 1: Group Exercise: Three-Way Handshake

  #figure(
    table(
      columns: (12em,12em,15em),
      align: left,
      table.header[Field][Value][Hex Representation],
      [Sequence Number], [], [],
      [Acknowledge Number], [], [],
      [Flags], [], [],
    ),
    caption: [Template table for task 1]
  )


= Task 2: Group Exercise: UDP

  #figure(
    udp_checksum_table(rows: 6,
      [00 00 (initial value)], [`_ _  _ _` (source port)], [`_ _  _ _`],
    ),
    caption: [Template for task 2 c\)]
  )<sample4checksumGE>

  #figure(
    udp_segment_table(row_data_count: 1),
    caption: [Template for task 2 d\)]
  )<sample4UDPGE>


= Task 3: UDP (16 Points)

  #figure(
    udp_checksum_table(rows: 10,
      [00 00 (initial value)], [`_ _  _ _` (source port)], [`_ _  _ _`],
    ),
    caption: [Template for task 3 c\)]
  )<sample4checksum>

  #figure(
    udp_segment_table(row_data_count: 3),
    caption: [Template for task 3 d\)]
  )<sample4UDP>

= Task 5: Theory questions (6 Points)