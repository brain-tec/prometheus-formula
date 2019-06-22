# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import prometheus with context %}
 
    {%- if prometheus.pkg.use_upstream_repo %}
include:
  - .repo
    {%- endif %}

prometheus-package-install-pkg-installed:
  pkg.installed:
    - name: {{ prometheus.pkg.name }}