base:
  '*':
    - env.base
  'host:test-salt-minion':
    - match: grain
    - env.m1
