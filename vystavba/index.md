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

{% comment %}
K udelani velkeho screenshotu mapy je treba:
- layout: default
- vyhodit radek s rbar
- zvysit style="height:650px;"
- zakomentovat mapa.addDefaultControls()
- zvetsit zoom cz[1] = 14;
{% endcomment %}

<div id="mapa" style="height:350px;"></div>
<script type="text/javascript">
const MAPY_API_KEY = "m_FCeS4VbzD5XXQPBKb5eUrRAJ6e5GKYR2UDjwG603E";
var map = L.map('mapa', { scrollWheelZoom: false }).setView([50.006, 14.43], 13);
const tileLayers = {
  'Základní': L.tileLayer(`https://api.mapy.cz/v1/maptiles/basic/256/{z}/{x}/{y}?apikey=${MAPY_API_KEY}`, {
    minZoom: 0,
    maxZoom: 19,
    attribution: '<a href="https://api.mapy.cz/copyright" target="_blank">&copy; Seznam.cz a.s. a další</a>',
}),
  'Letecká': L.tileLayer(`https://api.mapy.cz/v1/maptiles/aerial/256/{z}/{x}/{y}?apikey=${MAPY_API_KEY}`, {
    minZoom: 0,
    maxZoom: 19,
    attribution: '<a href="https://api.mapy.cz/copyright" target="_blank">&copy; Seznam.cz a.s. a další</a>',
}),
};
tileLayers['Základní'].addTo(map);
L.control.layers(tileLayers).addTo(map);

// Mapy.cz require us to place their logo somewhere
const LogoControl = L.Control.extend({
  options: {
    position: 'bottomleft',
  },

  onAdd: function (map) {
    const container = L.DomUtil.create('div');
    const link = L.DomUtil.create('a', '', container);

    link.setAttribute('href', 'http://mapy.cz/');
    link.setAttribute('target', '_blank');
    link.innerHTML = '<img src="https://api.mapy.cz/img/api/logo.svg" />';
    L.DomEvent.disableClickPropagation(link);

    return container;
  },
});
new LogoControl().addTo(map);

{% for item in projekty %}
  {% if item.gps.lat and item.gps.long %}
    L.marker([{{ item.gps.lat }}, {{ item.gps.long }}]).addTo(map)
        .bindTooltip("{{ item.title }}")
        .on('click', function(e) { window.open("{{ item.url | relative_url }}");});
  {% endif %}
{% endfor %}
</script>
- - -

{% for item in projekty %}
 * [{{ item.title }}]({{ item.url | relative_url }}){% if item.katastr %} - {{ item.katastr }}{% endif %}{% if item.developer %} - {{ item.developer }}{% endif %}
{% endfor %}

- - -

## Informace o územním plánu, stavebním řízení

 * [Územní plán](uzemni-plan.html) - vysvětlení kódů územního plánu s odkazy na další zdroje informací
 * [Fáze schvalování projektu](faze-schvalovani.html) - popis fází od změny územního plánu, až k územnímu a stavebnímu řízení
 * [Jak se bránit změnám](zmena-planu.html) - kdy může veřejnost vstupovat do navrhovaných změn územního plánu
 * [Evidence územních rozhodnutí IPR](https://eur.praha.eu) - Evidence vydaných územních rozhodnutí v Praze v databázi IPR Praha

- - -

Verze mapy pro tisk: [pirati-mapa-vystavby-p12.pdf]({{ '/assets/img/vystavba/pirati-mapa-vystavby-p12.pdf' | relative_url }})<br/>
Tiskové verze jednotlivých projektů se generují funkcí tisk v prohlížeči na jednotlivých stránkách (nejlépe v Chrome)
