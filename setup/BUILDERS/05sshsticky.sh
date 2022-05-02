#!/bin/bash

mkdir -p ~/.sshsticky
echo hahahaha Can\'t delete me! >~/.sshsticky/authorized_keys

chmod 444 ~/.sshsticky/authorized_keys
chmod 1755 ~/.sshsticky
sudo chown root:root $HOME/.sshsticky/authorized_keys

