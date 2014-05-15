# Gollum

[gollum](https://github.com/gollum/gollum) is a small and nice personal wiki, used from github. My intention for using this was to be able to use the same Markdown syntax as on github, to be able to exchange documents. Furthermore gollum is totally based on git, which makes it easy to exchange documents written in this wiki with others and edit those documents in a "usual" editor.

## Installation

I installed gollum on my main server at home, which uses [ArchLinux](http://www.archlinux.org) as its base. Furthermore, I decided to use nginx as the Webserver of choice, to gather some experiences with it.

In the following the installation of gollum is described based on the above already mentioned Linux distro and Webserver.

### Ruby Install

As a base for the ruby installation, I chose the description in the [ArchLinux Wiki - The Perfect Rails Setup](https://wiki.archlinux.org/index.php/Ruby_on_Rails#The_Perfect_Rails_Setup).

Since gollum does not need a database, I skipped [Step 0](https://wiki.archlinux.org/index.php/Ruby_on_Rails#Step_0:_SQLite) nd proceeded directly to [Step 1](https://wiki.archlinux.org/index.php/Ruby_on_Rails#Step_1:_RVM).

The used Ruby version on my machine is Ruby 1.9.3, which works perfectly for gollum.

Passenger was slightly too complex from my perspective and I have chosen to use a different approach then [Step 3](https://wiki.archlinux.org/index.php/Ruby_on_Rails#Step_3:_Nginx_with_Passenger_support) and skipped this step as well. More on this in the following.

For [Step 4](https://wiki.archlinux.org/index.php/Ruby_on_Rails#Step_4:_Gemsets_and_Apps) I have decided to use a gemset named gollum. Therefor the used configuration has had be adopted slightly. 

The Steps 6 and 7 are skipped as well in favour of using the [Unicorn application server](http://unicorn.bogomips.org/) and a reverse nginx proxy to this application server.

## Gollum Install

I wanted to provide two different wikis (lets call them private and public) and therefor all of the following specific installation steps should be slightly adopted, if only one wiki is used.

For this to work, I needed to install some additional ruby gems inside the gemset "gollum", I created in one of the previous steps. 

I created a new folder (/srv/gollum) on the machine and then created two bare git repositories in there, which are then used as the git repositories for gollum. Note, that you do not need to use a bare git repository, but for my use-case (I wanted to be able to edit the files in the wikis from my local workstation as well and push the changes back to the wiki) this seemed to be the best alternative. The git repositories are shared on the group "golllum", so that I am able to put certain users into this group, so that they are able to change pages. Therefor the folder /srv/gollum is used by the user gollum and the group gollum as well. The user can be created using:

```
useradd -r gollum -s /bin/false
mkdir /srv/gollum
chown gollum:gollum /srv/gollum

mkdir /srv/gollum/private.git
cd /srv/gollum/private.git
git init --bare --shared=group
cd ..

mkdir /srv/gollum/public.git 
cd /srv/gollum/public.git
git init --bare --shared=group
cd ..

chown gollum:gollum * -R
chgrp gollum * -R
```

If you are using bare repositories with gollum, you need to suffix the repository directory with the ".git" extension, which is a convention in the git world.

Since I planned to provide two different wikis on my server I needed two configuration files for unicorn ([unicorn_private.rb](../network/zeus/etc/gollum/private.unicorn.rb) and [unicorn_public.rb](../network/zeus/etc/gollum/public.unicorn.rb)), which I placed in the /etc/gollum folder.

Furthermore each git repository needed a config.ru (rack file needed for unicorn), see [config.ru public](../network/zeus/srv/gollum/public.git/config.ru) and [config.ru private](../network/zeus/srv/gollum/private.git/config.ru).

To start the two gollum instances, I create a systemd-unit-file called [gollum@.service](../network/zeus/etc/systemd/system/gollum@.service). This file uses a new [gollum.sh](../network/zeus/bin/gollum.sh), which I put into the /bin folder.

Now I can start any of the two instances of gollum using:

```
systemctl start gollum@private.service
systemctl start gollum@public.service
```

Now I just needed to add the following couple of lines to my nginx to support those two gollum instances:

```
http {
    ...

    upstream gollum_private {
        server unix:/run/unicorn/private.wiki.sock;
    }

    upstream gollum_public {
        server unix:/run/unicorn/public.wiki.sock;
    }

    server {
        ...

        location /wiki/ {
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header Host $http_host;
            proxy_redirect off;

            location /wiki/private/ {
                proxy_pass http://gollum_private;
            }

            location /wiki/public/ {
                proxy_pass http://gollum_public;
            }
            
            allow 192.168.0.0/24;
            deny all;
        }
     
    ...
```

I would like to adopt the configuration of unicorn (unicorn.rb) and the two config.ru files, so that I can only change one file to adopt both instances.

