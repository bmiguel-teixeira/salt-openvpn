openvpn.server:
    pkgrepo.managed:
      - humanname: CentOS-$releasever - Base
      - mirrorlist: http://mirrorlist.centos.org/?release=$releasever&arch=$basearch&repo=os
      - comments:
        - 'http://mirror.centos.org/centos/$releasever/os/$basearch/'
      - gpgcheck: 1
      - gpgkey: file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6