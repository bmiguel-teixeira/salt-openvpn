include:
  - openvpn.v1_0.certificates
  - openvpn.v1_0.acl

epel.repo:
  pkg.installed:
    - name: epel-release
    - refresh: True

openvpn.server:
  pkg.installed:
    - name: openvpn
    - version: 2.4.6-1.el7
    - refresh: True

openvpn.config:
  file.managed:
    - name: /etc/openvpn/server.conf
    - source: salt://openvpn/v1_0/files/server.conf.j2
    - tempalte: jinja

openvpn.service:
  service.running:
    - name: openvpn@server.service
    - enable: True
    - watch:
      - openvpn.config