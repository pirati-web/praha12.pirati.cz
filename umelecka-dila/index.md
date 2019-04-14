---
layout: page
title: Umělecká díla v Praze
img: vystavba/mapa-vystavby.png
mapycz_api: normal   # "normal" nebo "mini-api" nebo smazat uplne
rbar: textbox
textbox:
  title: O projektu
  text: >
    Tady je nějaký text o tom, proč se to dělá. A tak nějak.
    <br/><br/>
    Zde je další odstavec toho textu.
---

Provádíme inventarizaci a pasportizaci uměleckých děl v Praze. Postupně je budeme doplňovat.

{% assign projekty = site.umelecka-dila %}

{% comment %}
K udelani velkeho screenshotu mapy je treba:
- layout: default
- vyhodit radek s rbar
- zvysit style="height:650px;"
- zakomentovat mapa.addDefaultControls()
- zvetsit zoom cz[1] = 14;
{% endcomment %}

{% assign arrDistricts = projekty | map: 'mestska-cast' | uniq %}
<select name="thelist" onChange="districtChange(this)"><option selected>Všechny městské části</option>{% for item in arrDistricts %}<option>{{ item }}</option>{% endfor %}</select>

<div id="mapa" style="height:350px;"></div>

<br/>
<ul id="listItems"></ul>

<script type="text/javascript">
// source https://api.mapy.cz/view?page=markers-signals
var center = SMap.Coords.fromWGS84(14.43, 50.00);
var mapa = new SMap(JAK.gel("mapa"), center, 13);
mapa.addDefaultLayer(SMap.DEF_BASE).enable();

mapa.addDefaultControls();

var controls = mapa.getControls();  /* Odstranit kolecko mysi */
for (var i=0;i<controls.length;i++) {
  if (controls[i] instanceof SMap.Control.Mouse)
    controls[i].configure(SMap.MOUSE_PAN | SMap.MOUSE_ZOOM);
}

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
    district: "{{ item.mestska-cast }}",
    link: "{{ item.url | relative_url }}",
    id: {{ forloop.index }}
  },
  {% endif %}
{% endfor %}
];

function addFilteredMarkers(filter)
{
  souradnice = [];
  var elListItems = document.getElementById('listItems');
  elListItems.innerHTML = ''; // clear all items
  // vytvoreni markeru
  markers.forEach(function(marker) {
    if (filter==="" || filter===marker.district)
    {
      var c = SMap.Coords.fromWGS84(marker.coord_long, marker.coord_lat);
      var options = { title: marker.name }
      // duletize je prirazeni id jednotlivemu markeru
      var znacka = new SMap.Marker(c, marker.id, options);
      souradnice.push(c);
      vrstva.addMarker(znacka);
      znacka.getContainer()[SMap.LAYER_MARKER].style.cursor = "pointer";
      
      if (filter !=="")
      {
        var node = document.createElement("li");
        var link = document.createElement("a");
        link.setAttribute('href', marker.link);
        link.innerHTML = marker.name;
        node.appendChild(link);
        elListItems.appendChild(node);
      }
    }
  });
}
function centerMap()
{
  var cz = mapa.computeCenterZoom(souradnice); /* Spočítat pozici mapy tak, aby značky byly vidět */
  mapa.setCenterZoom(cz[0], cz[1]);
}

addFilteredMarkers("");

// zobrazime a povolime vrstvu - pokud by se vrstva povolila pred vkladanim markeru, tak by se s kazdym vlozenym markerem prekreslovala mapa a pocitaly pozice vsech markeru
mapa.addLayer(vrstva);                          /* Přidat ji do mapy */
vrstva.enable();                         /* A povolit */

centerMap();

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

function districtChange(combo)
{
  var idx = combo.selectedIndex;
  var selDistrict = combo.options[idx].innerHTML;
  if (idx == 0) selDistrict = "";
  //alert(selDistrict);
  
  vrstva.disable();
  vrstva.removeAll();
  addFilteredMarkers(selDistrict);
  vrstva.enable();
  vrstva.redraw();
  centerMap();
}
</script>
- - -
