---
layout: default
title: 5 hlavních témat v tomto volebním období
---

<div class="row o-section">
  <div class="columns large-12">
    <header class="c-page-header">
      <h1 itemprop="headline" class="c-page-title">{{ page.title }}</h1>
    </header>
  </div>
    <div class="columns large-12">

<style>span[itemprop="author"] {display:none}</style>
<div class="o-section-block">
  <div class="row u-uniform-size-row">
    {% for article in site.tags.top5 %}
      <div class="medium-6 large-4 columns {% if forloop.last %}end{% endif %}">
        {% include articles/vertical-article.html article=article %}
      </div>
    {% endfor %}
  </div>
</div>

    </div>
</div>
