test_file:
  file.managed:
    - name: /tmp/test.txt
    - contents:
      - This is first test for salt sls
      - This is second test for salt sls
      - This is third test for salt sls
    - mode: 755
    - user: root
    - group: root
