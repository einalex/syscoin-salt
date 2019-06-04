system:
  network.system:
    - enabled: True
    - hostname: {{ pillar['system']['hostname'] }}
    - apply_hostname: True
    - retain_settings: True
