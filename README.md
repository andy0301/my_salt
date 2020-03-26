### my_salt
For some saltstack testing

### Install salt:
- Create 3 VMs in GCP compute engine
  - test-salt-master
  - test-salt-minion
  - test-salt-minion-1
- ssh to each vm, then run commands to install from here: https://repo.saltstack.com/#ubuntu 
- Config salt: https://docs.saltstack.com/en/latest/ref/configuration/index.html#configuring-salt
  - master config, except below lines others all default
    ```
    fileserver_backend:
      - git
    gitfs_remotes:
      - https://github.com/andy0301/my_salt.git
    ```
  - minion config, except below lines others all default for 
    ```
    master: test-salt-master # master hostname
    master_finger: 'master.pub' # using below setup minion connect to master steps to get
    ```
  - setup minion connect to master
    ```
    #in master:
    $ salt-key -F master # copy master.pub to add to /etc/salt/minion -> 'master_finger'  in each minion server
    $ salt-key --finger test-salt-minion # this should get finger match which from minion as below
    $ salt-key -A # once match then run this approve connect
    #in minion
    # after add master.pub,restart minion
    $ systemctl restart salt-minion
    $ salt-call --local key.finger # this is should match which get from master
    ```
- Test salt
  ```
  $ ssh test-salt-master
  $ salt '*' test.version
  $ salt '*' cmd.run hostname
  $ salt -G 'host:test-salt-minion' test.ping
  $ salt '*' state.apply
  ```
