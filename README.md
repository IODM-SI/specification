# Specifikacije IODM

Razvojni osnutek vsebuje sedem specifikacij in belo knjigo. Izvorne datoteke
Typst so v mapi `source/`, različice PDF za objavo pa v mapi `pdf/`.

Za gradnjo potrebujete Typst CLI 0.15 ali novejši in pisavo DejaVu Sans. Ukaz
`./build.sh` ponovno izdela PDF-je v mapi `pdf/`. Za poskusno gradnjo
lahko podate drugo izhodno mapo, na primer `./build.sh ./izvoz`.

V glavi vsake izvorne datoteke sta identifikator in različica, na primer
`#let publication = (id: "IODM-001", version: "0.3")`. Predloga uporabi
obe vrednosti v dokumentu, gradnja pa iz njiju sestavi ime
`IODM-001-v0.3.pdf`.

Priloženi PDF-ji različice 0.3 so bili preneseni iz obstoječe spletne
strani IODM. Gre za prvotne nadomestne izvoze Pandoc/XeLaTeX.

Spletna stran pripne revizijo tega repozitorija kot podmodul `standards`.
