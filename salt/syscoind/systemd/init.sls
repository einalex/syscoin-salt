include:
  - syscoind.user
  - syscoind

/usr/lib/systemd/system/syscoind.service:
  file.managed:
    - source: salt://syscoind/systemd/syscoind.service
    - user: root
    - group: root
    - mode: 644

syscoind:
  service.running:
      - enable: True
      - reload: True
      - watch:
        - file: /etc/syscoin/syscoin.conf
        - file: /usr/local/bin/syscoind
      - require:
        - user: syscoin
        - sls: syscoind
        - file: /usr/lib/systemd/system/syscoind.service
