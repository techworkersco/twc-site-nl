---
layout: translated
namespace: index
templateClass: tmpl-home
permalink: /
---

<section class="intro-section">
  {% t home.summary %}
</section>

<section class="titled-block" aria-labelledby="hl-events">
  <h2 id="hl-events">{% t home.events.title %}</h2>
  {% include events.html limit=5 %}
</section>

{% if site.blog.count > 0%}

<section class="titled-block" aria-labelledby="hl-news">
  <h2 id="hl-news">{% t home.blog.title %}</h2>
  {% include blog.html limit=3 %}
</section>
{% endif %}

<section class="titled-block" aria-labelledby="hl-links">
  <h2 id="hl-links">{% t connect.info %}</h2>
  {% include links.html %}
</section>

<section class="titled-block" aria-labelledby="hl-a11y">
  <h2 id="hl-a11y">{% t global.accessibility.title %}</h2>
  {% t global.accessibility.summary %}
</section>

<section class="titled-block" aria-labelledby="hl-coc">
  <h2 id="hl-coc">{% t global.code_of_conduct.title %}</h2>
  {% t global.code_of_conduct.summary %}
</section>
