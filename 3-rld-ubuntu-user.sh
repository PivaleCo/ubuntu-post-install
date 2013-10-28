#!/bin/bash

# Run as standard user

if [ "$USER" == "root" ]
  then
  echo 'Script must be run as standard user'
  exit
fi

echo "Setting up dotfiles for user"
git clone git://github.com/damiankloip/dotfiles ~/.dotfiles
cd ~/.dotfiles
rake install

# Admin user to recieve new SSH key for current user
ADMIN_EMAIL='barry@reallifedesign.co.uk'
# Anonymous email address to send email from
FROM_EMAIL='noreply@reallifedesign.co.uk'

echo "Adding ~/.bashrc aliases for dca and ess"
echo "alias dca='drush cc all'" >> ~/.bashrc
echo "alias ess='source ~/scripts/enable-solo-site.sh'" >> ~/.bashrc
echo "alias cs='source ~/scripts/create-site.sh'" >> ~/.bashrc

echo "Creating ~/scripts directory"
if [ ! -d ~/scripts/ ]; then
  mkdir ~/scripts/
fi
echo "Copy ess (enable-solo-site) script to scripts directory"
cp enable-solo-site.sh ~/scripts/

echo "Copy cs (create-site) script to scripts directory"
cp create-site.sh ~/scripts/

echo "Setting up SSH key"
ssh-keygen -t rsa

echo "Emailing SSH key to admin"
php -e ~/scripts/email_ssh.php $FROM_EMAIL $ADMIN_EMAIL

# Dev environment

echo "Add $USER user to www-data group and www-data user to $USER group"
sudo usermod -a -G www-data $USER
sudo usermod -a -G $USER www-data

echo "Setting permissions on /var/www"
sudo chown -R $USER:$USER /var/www

# Geany customisation for sass
# http://ajy.co/web/scss-highlighting-in-geany/
cp /usr/share/geany/filetype_extensions.conf ~/.config/geany/filetype_extensions.conf
cp /usr/share/geany/filetypes.css ~/.config/geany/filedefs/filetypes.css
sed -i "s/^CSS=\*\.css;$/CSS=\*\.css;\*\.scss;/" ~/.config/geany/filetype_extensions.conf
echo -e '[lexer_properties]\nlexer.css.scss.language=1' > ~/.config/geany/filedefs/filetypes.css

echo "Installing gnome-do"
sudo apt-get install -f gnome-do

echo "Setting geany preferences and enabling plugins"
sed -i "s/^show_white_space=.*$/show_white_space=true/" ~/.config/geany/geany.conf
sed -i "s/^pref_editor_tab_width=.*$/pref_editor_tab_width=2/" ~/.config/geany/geany.conf
sed -i "s/^active_plugins=.*$/active_plugins=\/usr\/lib\/x86_64-linux-gnu\/geany\/addons.so;\/usr\/lib\/x86_64-linux-gnu\/geany\/codenav.so;\/usr\/lib\/x86_64-linux-gnu\/geany\/geanyextrasel.so;\/usr\/lib\/x86_64-linux-gnu\/geany\/filebrowser.so;\/usr\/lib\/x86_64-linux-gnu\/geany\/gproject.so;\/usr\/lib\/x86_64-linux-gnu\/geany\/geanylipsum.so;\/usr\/lib\/x86_64-linux-gnu\/geany\/htmlchars.so;\/usr\/lib\/x86_64-linux-gnu\/geany\/geanymacro.so;\/usr\/lib\/x86_64-linux-gnu\/geany\/geanynumberedbookmarks.so;\/usr\/lib\/x86_64-linux-gnu\/geany\/pretty-print.so;/" ~/.config/geany/geany.conf

# Firebug for firefox
firefox https://addons.mozilla.org/en-US/firefox/addon/firebug/

# XMIND
firefox http://www.xmind.net/download/linux
