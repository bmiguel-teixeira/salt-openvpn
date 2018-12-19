ca.key:
  file.managed:
    - name: /etc/openvpn/ca.key
    - mode: 600
    - contents_pillar: openvpn:certificates:ca_private_key
ca.crt:
  file.managed:
    - name: /etc/openvpn/ca.crt
    - mode: 600
    - contents_pillar: openvpn:certificates:ca_certificate
server.key:
  file.managed:
    - name: /etc/openvpn/server.key
    - mode: 600
    - contents_pillar: openvpn:certificates:server_key
server.crt:
  file.managed:
    - name: /etc/openvpn/server.crt
    - mode: 600
    - contents_pillar: openvpn:certificates:server_crt
dh.parameters:
  file.managed:
    - name: /etc/openvpn/dh2048.pem
    - mode: 600
    - contents_pillar: openvpn:certificates:dh_parameters
openvpn.auth:
  file.managed:
    - name: /etc/openvpn/openvpn.tlsauth
    - mode: 600
    - contents_pillar: openvpn:certificates:openvpn_auth