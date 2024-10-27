---
# The title text to show on the page. Will be slugified, and needs to be unique
title: title
# Uncommment to translate the title
#title_nl: Eerste
# Author keys are available in _data/authors.yml
author: techwerkers
# Date format: YYYY-MM-DD
date: 2024-10-01
# Set to true when you want this resource to be published
published: false
# Uncomment to specify a URL for the resource
#permalink: /resources/title/
#permalink_nl: /bronnen/titel/
---

{% if site.lang == "nl" %}

Dit is een voorbeeldbron

{% else %}

This is a sample resource

{% endif %}
