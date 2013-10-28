#!/bin/bash
# Enter into ~/.bashrc :
# alias ess='source ~/scripts/enable-solo-site.sh'

if [ "$1" == "" ]
  then
  echo "You need to enter a site to enable";

elif [ "$1" == "--list" ]
  then
  ls /etc/apache2/sites-available/;

else
  echo "Disabling all sites"
  sudo rm -Rf /etc/apache2/sites-enabled/*
  echo "Enabling $1"
  sudo a2ensite "$1"
  echo "Restarting Apache"
  sudo service apache2 reload

  echo "Going to docroot"
  DOCROOT=`grep "DocumentRoot" /etc/apache2/sites-available/$1 | head -n1 | sed 's/DocumentRoot//g' | tr -d ' '`
  cd $DOCROOT
fi
