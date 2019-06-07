include:
  - syscoind.user

python-virtualenv:
  pkg.installed

git:
  pkg.installed

https://github.com/syscoin/sentinel.git:
  git.latest:
    - target: /var/lib/syscoin/sentinel
    - branch: sys4
    - user: syscoin
    - require:
      - user: syscoin
      - pkg: git

/var/lib/syscoin/sentinel/venv:
  virtualenv.managed:
    - requirements: /var/lib/syscoin/sentinel/requirements.txt
    - user: syscoin
    - require:
      - git: https://github.com/syscoin/sentinel.git
      - pkg: python-virtualenv
      - user: syscoin

/var/lib/syscoin/sentinel/sentinel.conf:
  file.managed:
    - source: salt://syscoind/sentinel/sentinel.conf
    - user: syscoin
    - group: syscoin
    - template: jinja
    - mode: 640
    - require:
      - virtualenv: /var/lib/syscoin/sentinel/venv
      - user: syscoin


/usr/local/bin/sentinel-ping:
  file.managed:
    - source: salt://syscoind/sentinel/sentinel-ping
    - user: syscoin
    - group: syscoin
    - mode: 755
    - require:
      - user: syscoin
  cron.present:
    - user: syscoin
    - minute: '*/3'
    - require:
      - user: syscoin
      - file: /var/lib/syscoin/sentinel/sentinel.conf
      - file: /usr/local/bin/sentinel-ping
