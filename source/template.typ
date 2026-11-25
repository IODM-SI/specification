#let iodm(code: "001", subtitle: "Tehnična specifikacija", body) = {
  set page(paper: "a4", margin: (x: 22mm, top: 24mm, bottom: 22mm), header: align(right, text(size: 8pt, fill: rgb("526579"))[IODM-#code / 0.3 — delovni osnutek]), footer: context [#text(size: 8pt, fill: rgb("526579"))[iodm.si] #h(1fr) #counter(page).display("1")])
  set text(font: "DejaVu Sans", size: 10pt, lang: "sl")
  set par(justify: false, leading: 0.65em)
  show heading: set text(fill: rgb("12354A"))
  show raw.where(block: true): it => block(fill: rgb("EDF3F5"), inset: 9pt, radius: 3pt, width: 100%, text(size: 9pt, it))
  text(size: 16pt, weight: "bold", fill: rgb("007E82"))[IODM / #code]
  v(34mm)
  text(size: 32pt, weight: "bold", fill: rgb("12354A"))[Interoperabilni dostopni medij]
  v(6mm)
  text(size: 17pt, subtitle)
  v(18mm)
  line(length: 100%, stroke: 1pt + rgb("007E82"))
  [*Različica:* 0.3 · delovni osnutek \ *Datum:* 25. november 2026 \ *Spletno mesto:* iodm.si]
  pagebreak()
  body
}
