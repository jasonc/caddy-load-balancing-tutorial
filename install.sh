#!/bin/bash

# Add the GPG key for the Caddy stable repository to your system's trusted keyrings.
curl -sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg

# Download the repository information for the Caddy stable software repository and add it to the APT sources list
curl -sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list

# Refresh the list of available packages.
sudo apt update

# Install caddy:
sudo apt install -y caddy

# Put the load balancing config on "lb01"
if [ "$(hostname)" = "lb01" ]
then
  # Copy example load balancing configs into place
  cp /vagrant/Caddyfile* /etc/caddy/

  # Copy the random load balancing config into place
  cp /vagrant/Caddyfile.random /etc/caddy/Caddyfile

  # Reload the Caddy configuration
  sudo systemctl reload caddy

# Put the web server hostname in the index.html file on all other nodes (web01/web02)
else
  # Put the name of the server in the index.html file:
  uname -n | sudo tee /usr/share/caddy/index.html
fi
