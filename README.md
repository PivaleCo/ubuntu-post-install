# ubuntu-post-install

**Some scripts that we find useful to run after installing Ubuntu from the point of view of our local development machines.**

[We](http://reallifedesign.co.uk) are [Drupal](http://drupal.org) developers so this is primarily a fully working development stack for our needs, which may also be useful for you if you're a PHP developer or want to get a functional LAMP stack set up right away after installing Ubuntu.

We've tested this primarily with Ubuntu 12.04 (LTS) although our intention is to try and eventually make this fairly Ubuntu distribution agnostic.

You should could consider these scripts fairly alpha-ish at this stage.

## Background

### Key installation packages

* See details of scripts (@todo update this when scripts have been tested)

### Key configuration and helpers

* See details of scripts (@todo update this when scripts have been tested)

### Why not Chef/Puppet/some other configuration management?

* Well, we wanted a quick (and dirty) way to do everything from the tools that come with Ubuntu out the box so we could get up and running with a few bash scripts- native to Ubuntu. Yeah, we could probably do better than this and it's certainly a possibility in the future that we'll move away from the dark side of bash scripts. For now, this works!
* If anybody wants to share similar (and even better) ways of doing this, then please fork and send me a pull request or simply drop me an email on barry AT reallifedesign.co.uk. Thanks!

## Installation

Install Ubuntu in the usual way.... then:

As a regular (non-root) user in your home folder, execute these commands. You don't need to have git installed (or any other non-standard software rolled with vanilla Ubuntu) at this point.

<pre>
$ mkdir ~/scripts
$ cd ~/scripts
$ wget https://github.com/reallifedesign/ubuntu-post-install/archive/master.zip
$ unzip master.zip
$ rm master.zip
$ mv ubuntu-post-install-master ubuntu-post-install
$ cd ubuntu-post-install
</pre>

**Review 3-rld-ubuntu-user.sh and set the first 2 variables at the top of the script. ADMIN_EMAIL is the email you want to receive your new SSH key. FROM_EMAIL is your own email address. These could be the same if you want.**

**Review these scripts that they suit your purposes before running them**

<pre>
$ ./1-rld-ubuntu-init.sh
$ sudo ./2-rld-ubuntu-system.sh
$ ./3-rld-ubuntu-user.sh
</pre>

**There are optional scripts you could run after this too- check repo for info.**
