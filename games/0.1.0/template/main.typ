#import "@preview/datify:1.0.0": custom-date-format

#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 2.5cm),
  numbering: "1",
)

#set text(
  font: "New Computer Modern",
  size: 11pt,
  lang: "es",
)

#set par(
  justify: true,
  leading: 0.65em,
)

#show heading.where(level: 1): it => {
  set text(size: 22pt)
  line(length: 100%)
  align(center)[#it]
  line(length: 100%)
  v(1em)
}

#show heading.where(level: 2): set heading(numbering: (..nums) => {
  let n = nums.pos()
  numbering("1.", n.last())
})

#show heading.where(level: 3): set heading(numbering: (..nums) => {
  let n = nums.pos()
  if n.len() >= 2 {
    numbering("1.1.", n.at(-2), n.at(-1))
  } else if n.len() == 1 {
    numbering("1.", n.at(-1))
  }
})

#show heading: set block(above: 1.4em, below: 1em)

#let note = (body, title: "", use-underline: false) => {
  let ttl = if title == "" { "Nota" } else { title }
  text(weight: "bold")[#if use-underline { underline(ttl) } else { ttl }: ]
  [#body]
}

#let exercise = (number, body) => {
  note(title: [Ejercicio #number])[
    #body
  ]
}

#let solution = body => {
  text(weight: "semibold")[#underline("Solución") \ ]
  [#body]
  v(1em)
}

#let game2x2(
  row-names: ("A", "B"),
  col-names: ("a", "b"),
  p11: (0, 0),
  p12: (0, 0),
  p21: (0, 0),
  p22: (0, 0),
) = {
  table(
    columns: (auto, 60pt, 60pt),
    rows: (auto, 30pt, 30pt),
    align: center + horizon,
    stroke: (x, y) => if x > 0 and y > 0 { 0.5pt + black } else { none },
    [], [*#col-names.at(0)*], [*#col-names.at(1)*],
    [*#row-names.at(0)*], [$(#p11.at(0), #p11.at(1))$], [$(#p12.at(0), #p12.at(1))$],
    [*#row-names.at(1)*], [$(#p21.at(0), #p21.at(1))$], [$(#p22.at(0), #p22.at(1))$],
  )
}

#let top-heading = (title: "", author: "", date: none) => {
  line(length: 100%)
  align(center)[
    #block(text(weight: "bold", size: 1.75em, title))
    #line(length: 100%)
    #v(1em)
    #block(text(weight: "medium", size: 1.2em, author))
    #if date != none {
      block(text(size: 1.2em, [#date]))
    }
  ]
  v(2em)
}

#top-heading(
  title: [Ejercicios Teoría de Juegos],
  author: "Francisco Peláez Arias",
  date: custom-date-format(datetime.today(), lang: "es"),
)
