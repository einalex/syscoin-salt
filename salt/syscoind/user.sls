syscoin:
  group.present:
    - gid: 999
    - system: True
  user.present:
    - home: /var/lib/syscoin
    - uid: 999
    - gid: 999
    - groups:
      - syscoin
    - require:
      - group: syscoin
