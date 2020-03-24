base:
  '*':
    - test.base
  'host:test-salt-minion':
    - match: grain
    - test.m1
