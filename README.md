ubuntu-post-install
===================

Some scripts that we find useful to run after installing Ubuntu from the point of view of our local development machines.

We are Drupal developers so this is primarily a fully working development stack for our needs, which may also be useful for you if you're a PHP developer or want to get a functional LAMP stack set up right away after installing Ubuntu.

We've tested this primarily with Ubuntu 12.04 (LTS) although our intention is to try and eventually make this fairly Ubuntu distribution agnostic.

You should could consider these scripts fairly alpha-ish at this stage.

### Key installation packages

* See details of scripts (@todo update this when scripts have been tested)

### Key configuration and helpers

* See details of scripts (@todo update this when scripts have been tested)

### Installation

Install Ubuntu.... then:

As a regular (non-root) user in your home folder

> mkdir ~/scripts

> cd ~/scripts

> wget https://github.com/reallifedesign/ubuntu-post-install/archive/master.zip

> unzip master.zip

> rm master.zip

> mv ubuntu-post-install-master ubuntu-post-install

> cd ubuntu-post-install

Review email_ssh.php and set the first 2 variables at the top of the script.

> ## Review these scripts that they suit your purposes before running them

> ./1-rld-ubuntu-init.sh

> sudo ./2-rld-ubuntu-system.sh

> ./3-rld-ubuntu-user.sh

There are optional scripts you could run after this too- check repo for info
