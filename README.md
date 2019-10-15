# Ignition Key
> John Hammond | January 23rd, 2018

------------

I have had the idea to write something like this for a long time, but never got around to it. Today I ended up reinstalling my Ubuntu image so I could have more space on my harddrive, but I needed all my tools back. I figured I would put together this script now.

All the code is in the [ignition_key.sh](ignition_key.sh) script.

## Ansible install
Using the Ansible Playbook option to install. Follow the instructions before.

### Testing
This has been tested on disco 19.04.

#### Dependencies
Packages to be installed prior to running the playbooks.

Add `127.0.0.1` to `etc/ansible/hosts` file.

```bash
$ apt update
$ apt -y install python-apt ansible
```

#### Examples
Perform a dry run:

```bash
$ sudo ansible-playbook ignition_key.yml --check
```

List tasks or tags:
```bash
$ sudo ansible-playbook ignition_key.yml --list-tasks
```

Install or skip specific tasks:
```bash
$ sudo ansible-playbook ignition_key.yml --tags "remove-home-dir,apt-tools"
$ sudo ansible-playbook ignition_key.yml --skip-tags "remove-home-dir,apt-tools""
```
