include:
  - syscoind.user

/etc/syscoin:
  file.directory:
    - user: syscoin
    - group: syscoin
    - mode: 755
    - makedirs: True
    - require:
      - user: syscoin

/etc/syscoin/syscoin.conf:
  file.managed:
    - source: salt://syscoind/syscoin.conf
    - user: syscoin
    - group: syscoin
    - mode: 600
    - template: jinja
    - require:
      - user: syscoin
      - file: /etc/syscoin

/usr/local/bin/syscoind:
  file.managed:
    - source: salt://syscoind/syscoind
    - user: syscoin
    - group: syscoin
    - mode: 755
    - require:
      - user: syscoin

/usr/local/bin/syscoin-cli:
  file.managed:
    - source: salt://syscoind/syscoin-cli
    - user: syscoin
    - group: syscoin
    - mode: 755
    - require:
      - user: syscoin
