---
layout: page
title: Developerské projekty na Praze 12
img: vystavba/mapa-vystavby.png
mapycz_api: normal   # "normal" nebo "mini-api" nebo smazat uplne
rbar: textbox
textbox:
  title: Moderní rozvoj sídlišť
  text: >
    Podstatnou část Prahy tvoří sídliště. Záměrem jejich tvůrce byla vyváženost staveb, která společně s hojnou zelení vytvoří na relativně malé ploše přijatelné bydlení pro velký počet obyvatel. Vyšší obytné bloky domů jsou tak vyvažovány nižšími objekty občanské vybavenosti.
    <br/><br/>
    Řadu objektů koupili noví majitelé, ale na jejich opravu či rozvoj nechtějí dát prostředky. Chtějí je zbourat a místo nich postavit výškové objekty bez ohledu, zda zastíní či jinak znehodnotí domy v jejich okolí. Chtějí je vybudovat bez patřičné infrastruktury, vyřešení dopravy atd.
    <br/><br/>
    Nejsme proti revitalizaci sídlišť, ale s lidským rozměrem nástavby několika pater.
    <br/><br/>
    <a href="../aktuality/mapa-vystavby.html">Přečíst celý článek</a>
---

Vytvořili jsme mapu, kde můžete najít jednotlivé developerské projekty. Postupně budeme doplňovat stav jejich projednání a doufáme, že se ty předimenzované buď podaří zastavit nebo je alespoň změnit na únosnou míru.

{% assign projekty = site.vystavba %}

<div id="mapa" style="height:350px;"></div>
<script type="text/javascript">
// source https://api.mapy.cz/view?page=markers-signals
var center = SMap.Coords.fromWGS84(14.43, 50.00);
var mapa = new SMap(JAK.gel("mapa"), center, 13);
mapa.addDefaultLayer(SMap.DEF_BASE).enable();
mapa.addDefaultControls();

var vrstva = new SMap.Layer.Marker();     /* Vrstva se značkami */
var souradnice = [];
// data pro markery
var markers = [
{% for item in projekty %}
  {% if item.gps.lat and item.gps.long %}
  {
    name: "{{ item.title }}",
    coord_lat: {{ item.gps.lat }},
    coord_long: {{ item.gps.long }},
    link: "{{ item.url | relative_url }}",
    id: {{ forloop.index }}
  },
  {% endif %}
{% endfor %}
];
// vytvoreni markeru
markers.forEach(function(marker) {
	var c = SMap.Coords.fromWGS84(marker.coord_long, marker.coord_lat);
  var options = { title: marker.name }
  // duletize je prirazeni id jednotlivemu markeru
  var znacka = new SMap.Marker(c, marker.id, options);
  souradnice.push(c);
  vrstva.addMarker(znacka);
});

// zobrazime a povolime vrstvu - pokud by se vrstva povolila pred vkladanim markeru, tak by se s kazdym vlozenym markerem prekreslovala mapa a pocitaly pozice vsech markeru
mapa.addLayer(vrstva);                          /* Přidat ji do mapy */
vrstva.enable();                         /* A povolit */

var cz = mapa.computeCenterZoom(souradnice); /* Spočítat pozici mapy tak, aby značky byly vidět */
mapa.setCenterZoom(cz[0], cz[1]);

// poslouchani na kliknuti u markeru
mapa.getSignals().addListener(this, "marker-click", function(e) {
  // vybrany marker
  var marker = e.target;
  var id = marker.getId();
  // zobrazime jeho jmeno - parovani vybraneho markeru pomoci jeho id a nasich vstupnich dat
  for (var i = 0; i < markers.length; i++) {
  	if (markers[i].id == id) {
    	location.href = markers[i].link;
      break;
    }
  }
});
</script>
- - -

{% for item in projekty %}
 * [{{ item.title }}]({{ item.url | relative_url }}){% if item.katastr %} - {{ item.katastr }}{% endif %}{% if item.developer %} - {{ item.developer }}{% endif %}
{% endfor %}

- - -

## Jak funguje územní plán a jak se bránit jeho změnám

 * [Územní plán](uzemni-plan.html) - vysvětlení kódů územního plánu s odkazy na další zdroje informací
 * [Jak se bránit změnám](zmena-planu.html) - kdy může veřejnost vstupovat do navrhovaných změn územního plánu
