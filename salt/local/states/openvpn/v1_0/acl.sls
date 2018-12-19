firewalld:
  service.running:
    - name: firewalld
    - enable: True

#ssh:
#  firewalld.present:
#    - name: trusted
#    - require:
#      - firewalld
#openvpn:
#  firewalld.present:
#    - name: trusted
#    - masquerade: True
#    - require:
#      - firewalld
cmd1:
  cmd.run:
    - name: 'firewall-cmd --zone=trusted --add-service openvpn'
cmd2:
  cmd.run:
    - name: 'firewall-cmd --zone=trusted --add-service openvpn --permanent'
cmd3:
  cmd.run:
    - name: 'firewall-cmd --add-masquerade'
cmd4:
  cmd.run:
    - name: 'firewall-cmd --add-masquerade --permanent'
cmd5:
  cmd.run:
    - name: 'firewall-cmd --permanent --direct --passthrough ipv4 -t nat -A POSTROUTING -s 10.8.0.0/24 -o eth0 -j MASQUERADE'
cmd6:
  cmd.run:
    - name: 'firewall-cmd --reload'

network.config:
  file.line:
    - name: /etc/sysctl.conf
    - content: 'net.ipv4.ip_forward = 1'
    - mode: insert
    - location: start

network.service:
  service.running:
    - name: network
    - watch: 
      - network.config