system:
  network.system:
    - hostname: {{ pillar['system']['hostname'] }}
    - apply_hostname: True
    - retain_settings: True
