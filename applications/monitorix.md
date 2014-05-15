# Monitorix

[Monitorix](http://www.monitorix.org/) is a graphical system monitoring tool written
in perl and using CGI technology.

Unfortunately [nginx](http://nginx.org/) has no fcgi-support out of the box,
like eg. [lighttp](http://www.lighttpd.net/) and/or [apache](http://httpd.apache.org/),
therefor the internal web-server of monitorix is used and reverse proxied by nginx.

## Installation

The monitorix package is installed via the [AUR](https://aur.archlinux.org/packages/monitorix).

Monitorix is started via the following command:

```
systemctl start monitorix
```

This starts the Monitorix web-server, which listens on port 8080. I adopted the
configuration of monitorix (../network/zeus/etc/monitorix/monitorix.conf), so that
the base_url /monitorix is used.

To enable the reverse proxy in nginx the following lines need to get added to the
nginx.conf:

```
http {
  ...
  server {
    ...
    location /monitorix {
  #    auth_basic "Restricted";
  #    auth_basic_user_file /etc/monitorix/monitorix-users;

      proxy_set_header  Host $host;
          proxy_pass    http://localhost:8080/monitorix;
     # proxy_redirect http://localhost:8080 /monitorix;
      allow 192.168.0.0/24;
      deny all;     

        # since 3.5.0 version
        location ~ ^/monitorix/(.+\.png)$ {
                alias /srv/http/monitorix/$1;
          } 
        }
  }
}
```

Now the monitorix service is available on http://servername/monitorix.

