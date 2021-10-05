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

<ul>
  {% for post in site.tags.top5 %}
    <li><a class="c-emphasized-anchor" href="{{ post.url }}">{{ post.title }}</a></li>
  {% endfor %}
</ul>

<div class="o-section-block">
  <div class="row u-uniform-size-row">
    {% for article in site.tags.top5 %}
      <div class="medium-6 large-4 columns {% if forloop.last %}end{% endif %}">
        {% assign art1 = article %}
        {% assign art1.authorId = nil %}
        {% include articles/vertical-article.html article=art1 %}
      </div>
    {% endfor %}
  </div>
</div>

    </div>
</div>
