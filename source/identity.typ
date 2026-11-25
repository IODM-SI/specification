#import "template.typ": iodm
#let publication = (id: "IODM-006", version: "0.3")
#show: iodm.with(publication: publication, subtitle: "Identifikacija medijev in integracija s SKD")
= 1. Namen
<namen>
IODM-006 določa enolično identiteto medija in posredovanje preverjene
identitete sistemu kontrole dostopa \(SKD oziroma PACS). Normativna
osnova: IODM-001, 003, 004, 005. MORA pomeni obveznost.

= 2. Identifikator
<identifikator>
IODM-ID je 48-bitna vrednost IID || MID v omrežnem vrstnem redu. IID je
16-bitni identifikator izdajatelja, MID 32-bitni identifikator medija.
IID 0000 in FFFF, MID 00000000 in FFFFFFFF so rezervirani. IODM dodeli
IID, izdajatelj dodeli MID in ga nikoli ne ponovno uporabi za drug
medij. Besedilni zapis je natanko 12 velikih šestnajstiških znakov.

#table(
  columns: (0.36fr, 0.64fr),
  align: (col, row) => (auto,auto,).at(col),
  inset: 6pt,
  [Polje], [Primer],
  [IID],
  [0001],
  [MID],
  [00001234],
  [IODM-ID],
  [000100001234],
  [Binarni zapis],
  [00 01 00 00 12 34],
)

Potrdilo medija MORA vsebovati celoten IODM-ID v subject.serialNumber
\(OID 2.5.4.5), PrintableString, skladno z IODM-001 § 4. Serijska
številka potrdila ni IODM-ID. Bralnik preveri IID proti registriranemu
CA; ne sprejema identitete iz UID, nepodpisanega EF ali manifesta brez
avtentikacije medija. Ob obnovi potrdila istega medija se IODM-ID
ohrani, ob zamenjavi medija se dodeli nov MID.

= 3. Posredovanje identitete
<posredovanje-identitete>
Bralnik MORA posredovati preverjeno identiteto šele po uspešnem
preverjanju potrdila, preklica, registra in svežega podpisa. SKD sam
odloči o pravici dostopa. Povezava med bralnikom in SKD mora biti
avtenticirana, integritetno zaščitena ter vezana na sejo in vrata;
priporočena sta OSDP Secure Channel ali ustrezno zaščiten API. Wiegand
sam ne zagotavlja teh lastnosti in ni skladen varnostni transport brez
dodatne zaščite.

Predlagani zapis dogodka za integracijo API \(format API ni obvezen):

```json
{
  "iodmId": "000100001234",
  "authenticated": true,
  "sessionId": "example-session",
  "readerId": "door-01"
}
```

= 4. Starejši sistemi
<starejši-sistemi>
Če SKD ne podpira 48 bitov, se uporabi lokalna injektivna preslikava v
razpoložljivi prostor. Preslikava mora biti trajna, nadzorovana in brez
kolizij, ne sme temeljiti na krajšanju ali modulo. Ob izčrpanju prostora
se izdaja lokalnega identifikatorja zavrne. Preslikava se uporabi šele
po avtentikaciji. Decimalni prikaz je informativen in ne sme izgubiti
vodilnih ničel pri pretvorbi v kanonični hex.

= 5. Preskusi
<preskusi>
#table(
  columns: (0.16fr, 0.41fr, 0.43fr),
  align: (col, row) => (auto,auto,auto,).at(col),
  inset: 6pt,
  [ID], [Preskus], [Merilo],
  [ID-01],
  [Kanonični zapis in DER],
  [Enaka 48-bitna vrednost],
  [ID-02],
  [Različni IID, isti MID],
  [Različni identiteti],
  [ID-03],
  [Obnova potrdila],
  [Isti IODM-ID],
  [ID-04],
  [Zamenjava medija],
  [Nov MID],
  [ID-05],
  [Neveljaven podpis ali IID],
  [Brez preverjene identitete],
  [ID-06],
  [Kolizija preslikave],
  [Zavrnitev ali nova enolična dodelitev],
  [ID-07],
  [Ponovitev dogodka zaledja],
  [Brez nepooblaščenega dostopa],
)
