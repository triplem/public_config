# linux-dash

[linux-dash](https://github.com/afaqurk/linux-dash) is a mostly textual but quite
nice system monitoring system offering mostly current information about the system
it is running on. linux-dash is PHP based and therefor nginx has to be adopted to
be able to run this application.

## Installation

I followed the installation instructions found on the github-page of the
[project](https://github.com/afaqurk/linux-dash#installation). On ArchLinux
php5-json is no longer needed, since it is already included in the usual
php package. The files are installed into the directory /srv/http/linux-dash.

PHP and nginx are working together via the [php-fpm](https://www.archlinux.org/packages/extra/x86_64/php-fpm/)
package, which needs to get installed.

The following nginx.conf-adoptions are needed to make this work:

```
http {
  ...
  server {
    ...

      # Pass PHP requests on to PHP-FPM using sockets
      location ~ \.php$ {
          root /srv/http;
              fastcgi_pass   unix:/run/php-fpm/php-fpm.sock;
              fastcgi_index  index.php;
              include        fastcgi.conf;
      }

    ...
  }
}
```
