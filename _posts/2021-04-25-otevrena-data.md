---
category: blog
title: Praha 12 publikuje další otevřená data a sdílí ostatním obcím návod, jak na to
date: 2021-04-25
author: Jan Adamec
authorId: jan.adamec
image: posts/2021-04-25-otevrena-data.jpg
tags:
  - transparentnost
  - digitalizace
  - top5
---

Městská část Praha 12 již od roku 2020 publikuje otevřená data. Zpočátku to byla data zejména ekonomického charakteru, která zvyšují otevřenost a transparentnost městské části. Nyní přibylo 6 dalších sad, které by mohly být použity v mobilních či webových aplikacích třetích stran. Data jsou zveřejněna na pražském portálu otevřených dat [opendata.praha.eu](https://opendata.praha.eu/organization/praha-12).

Již rok jsou průběžně aktualizovány tyto datové sady:
* **faktury**,
* **objednávky**,
* **smlouvy** - všechny faktury, objednávky a smlouvy od roku 2010;
* **pronájmy nebytových prostor** - všechny nebytové prostory určené k pronájmu, kterými městská část disponuje vč. polohy na mapě, výměry, jména aktuálního nájemce a výše ročního nájemného;
* **kalendář akcí konaných na Praze 12** - automaticky generovaný z kalendáře akcí na webových stránkách.

K těmto datovým sadám nyní přibylo několik dalších:
* **umělecká díla ve veřejném prostoru** - seznam soch, plastik, mozaik, maleb a dalších. s názvy, fotografií a polohou na mapě;
* **stavební projekty soukromých investorů** - záměry vč. polohy na mapě;
* **dětská hřiště a sportoviště** - seznam dětských hřišť vč. polohy na mapě;
* **harmonogramy přistavování kontejnerů na velkoobjemový odpad a bioodpad** - časové údaje na několik měsíců dopředu vč. polohy na mapě;
* **seznam členů Zastupitelstva MČ Praha 12** - od roku 2014;
* **seznam příspěvkových organizací** - seznam (nejčastěji základních a mateřských škol zřizovaných městskou částí) vč. polohy a základních kontaktních údajů

Všechny datové sady byly navrženy i s ohledem na to, aby jejich aktualizace nepřidělala zaměstnancům úřadu příliš práce. Lze očekávat, že díky otevřeným datům práce dokonce ubude.

Publikování otevřených dat neprobíhá nahodile, Praha 12 se řídí doporučenými postupy, které  dále rozvíjí. V srpnu roku 2019 byla schválena směrnice na publikování a katalogizaci otevřených dat (viz usnesení [R-039-005-19](https://www.praha12.cz/assets/File.ashx?id_org=80112&id_dokumenty=71703)), která vznikla přizpůsobením celostátního vzoru z [opendata.gov.cz](https://opendata.gov.cz/standardy:start) na úroveň středně velkého úřadu samosprávy. Ten posloužil i jako vzor pro jiné městské části (např [Praha 11](https://www.praha11.cz/aplikace/smlouvy_p11/file.php?file=da1c43915619f540337696da87a66769&type=1)). V únoru 2020 pak byl schválen první publikační plán (viz usnesení [R-064-021-20](https://www.praha12.cz/assets/File.ashx?id_org=80112&id_dokumenty=75344)), v březnu 2021 byly přidány další sady (viz usnesení [R-112-017-21](https://www.praha12.cz/assets/File.ashx?id_org=80112&id_dokumenty=82166)).

## Automaticky generované mapové datové sady

Do webových stránek Prahy 12 byla dodána nová funkcionalita, která umožňuje přidat k dokumentům v jedné složce polohu a z nich automaticky generovat přehledovou mapu.

Toho bylo využito například u seznamu dětských hřišť a sportovišť, který byl do té doby na webu se statickými mapkami podle lokalit, které tak bylo možné jen velmi obtížně aktualizovat (tudíž se tak nedělo). Nyní je mapa jen jedna a je automaticky generována. Přidání dalšího hřiště je tedy otázkou několika minut.

Nové mapové složky webu mají také možnost automaticky generovat základní údaje jako otevřená data ve formátu JSON. Toho se dá následně využít jako vstupu pro další aplikace. Zmíněná dětská hřiště jsou uvedena i v mobilní aplikaci Prahy 12, ale seznam s údaji pro mobilní aplikaci byl dříve aktualizován separátně v dalším sdíleném dokumentu. Nyní si bude moci jakákoliv mobilní či webová aplikace “sáhnout” pro údaje o hřištích do otevřených dat, která budou stejně aktuální jako seznam hřišť na webu.

Stejným způsobem jako dětská hřiště a sportoviště je publikována i [mapa uměleckých děl ve veřejném prostoru](https://praha12.pirati.cz/aktuality/mapa-umeleckych-del.html) a [mapa developerských záměrů](https://praha12.pirati.cz/aktuality/mapa-developerskych-projektu.html).

## Skripty na převod otevřených dat jako open-source

Abychom sdíleli své zkušenosti s automatizací exportu, uveřejnila Praha 12 zdrojové kódy skriptů pro generování ekonomických dat na serveru GitLab na adrese [gitlab.com/mcpraha12](https://gitlab.com/mcpraha12/otevrena-data). Pokud obec nebo městská část používá jako svůj ekonomický systém software Ginis, je velká pravděpodobnost, že bude moci použít skript vyvinutý a využívaný pro převod dat na Praze 12. Skript je napsaný jako makro pro Excel v jazyce Visual Basic for Applications.

Díky tomu by mohlo více obcí publikovat otevřená data ve stejné struktuře, což by následně mohlo pomoct třetím stranám v jejich zpracování a vzájemnému porovnávání.

## Použití otevřených dat pro další potřeby úřadu

Jak jsme již zmínili, je ideální, pokud otevřená data dále využije i úřad pro automatizaci jiných úkolů. Například harmonogramy přistavování velkoobjemových kontejnerů jsou zveřejňovány i na webu a Novinách Prahy 12. Ruční práce s plněním tabulek by nyní mohla být nahrazena automatickými skripty. První verze takového skriptu pro interní užití již běží na [mcpraha12.gitlab.io/otevrena-data](https://mcpraha12.gitlab.io/otevrena-data/). Zdrojový kód je skriptu je otevřený, komunita má možnost jej vylepšovat.

**Plníme tak další bod našeho volebního programu.**

