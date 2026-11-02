# Mizani

**Mizani** ni mashine ya ternary iliyosawazishwa (balanced ternary), iliyoandikwa kwa [Swa](https://github.com/lugha-swa/swa). Kila tarakimu (trit) ni **-1, 0 au +1** -- mfumo uliotumiwa na Setun (Moscow, 1958), kompyuta ya ternary iliyofanya kazi kweli.

Ternary iliyosawazishwa haihitaji biti ya ishara (hasi ni trits zote zimegeuzwa), kukata trits ndiko kukadiria, na tawi la njia tatu (hasi / sifuri / chanya) ni agizo moja. Vifaa vya ternary bado ni vya utafiti; Mizani inajenga programu yake -- maktaba, mashine pepe, assembler, na mwishowe lengo la mkusanyaji wa Swa -- juu ya vifaa vya binary vya leo.

## Awamu 1: maktaba ya ternary

`msingi/mizani.swa`: neno la **trits 27**, linaloshika namba kamili yoyote katika ±3,812,798,742,493.

Neno linahifadhiwa kama maski mbili za biti 27: `p` (trits za +1) na `n` (trits za -1). Kwa uhifadhi huu kila operesheni inafanywa kwa trits zote 27 kwa pamoja, kwa `& | ~ <<` pekee:

| Kazi | Maana |
|---|---|
| `mizani_kutoka(x)` / `mizani_kwa_namba(a)` | namba kamili <-> neno |
| `mizani_ongeza(a, b)` | kijumlishi cha ternary: trits zote zinajumlishwa pamoja, mabeba yanazunguka hadi yaishe |
| `mizani_toa(a, b)` | `a + kinyume(b)` |
| `mizani_zidisha(a, b)` | sogeza-na-ongeza kwa kila trit ya `b` |
| `mizani_linganisha(a, b)` | -1 / 0 / +1, trit kwa trit kutoka juu |
| `mizani_kinyume(a)` | badilisha `p` na `n` -- hasi NA NOT ya ternary |
| `mizani_na(a, b)` / `mizani_au(a, b)` | mantiki ya Kleene: min / max kwa kila trit |
| `mizani_sogeza(a, k)` | zidisha kwa 3^k |

Hesabu ni ya modulo 3^27: kupita mpaka kunazunguka, kama vifaa halisi.

```swa
husisha { msingi/mizani.swa }

Neno a = mizani_kutoka(-7);          // -7 = (-1)*9 + 1*3 + (-1)*1
Neno b = mizani_kutoka(5);
n64 c = mizani_kwa_namba(mizani_zidisha(a, b));   // -35
```

## Majaribio

```sh
SWA=/njia/ya/swa ./jaribu.sh
```

`mtihani/jaribio_hesabu.swa` hulinganisha kila operesheni na hesabu ya kawaida ya namba kamili: ubadilishaji wa kila namba katika [-3000, 3000] na mipaka yenyewe, gridi kamili ya jumla/tofauti/ulinganisho [-60, 60]², jozi 20,000 za nasibu katika neno zima (pamoja na kuzunguka), zidisha kwenye gridi na jozi 5,000 hadi 10^9, na mantiki ya Kleene trit kwa trit -- **ukaguzi 283,489**. CI inatumia Swa iliyotolewa ([v0.0.1](https://github.com/lugha-swa/swa/releases/tag/v0.0.1)), si ya kujengwa.

## Inayofuata

2. Mashine pepe: rejista, kumbukumbu ya trytes (trits 9), maagizo ~20, tawi la njia tatu
3. Assembler kwa Swa
4. Kivinjari (WASM): Mizani mtandaoni
5. `swa --mizani`: Swa ikikusanya kwenda ternary

## Leseni

MIT au Apache-2.0, upendavyo.
