# Syscoin for Salt

You should either know a bit about saltstack or be willing to learn to make this work. An introduction to salt is quite a bit out of scope for this repo, but can be found here: https://docs.saltstack.com/en/latest/topics/tutorials/walkthrough.html

## General Adjustment

In order for this to work, you need to deposit a 'syscoind' and 'syscoin-cli' binary in the 'salt'syscoind/' folder. You can get those from https://github.com/syscoin/syscoin/releases.

## For use with salt-ssh (this doesn't require a salt master with public/static IP)

* Add your nodes in '/etc/salt/roster'.
* Adjust pillar data in '/srv/pillar'.

See https://docs.saltstack.com/en/latest/topics/ssh/ for more information.

## For use with salt (this does require a salt master with public/static IP)

* Adjust pillar data in '/srv/pillar'. (You might want to use IP/subnet targetting)

### Donations

In case you'd like to tip some SYS: SPdXXwaMg4cSXfPq6Zn1PZrjz66qsTF4bo
