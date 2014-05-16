# Minimserver

[Minimserver](http://minimserver.com/) is the best UPnP server currently available. If you do like it, please consider giving a [donation](http://minimserver.com/donate.html) to the owner of this project.

## Installation

Unfortunately the license of Minimserver prohibits to create Packages for distributions (see [License](http://minimserver.com/license.html), specifically Section 2.). Therefor I am describing the manual installation and provide links to config files like used in my own environment.

1. [Download](http://minimserver.com/downloads/index.html) Minimserver
1. Extract downloaded file to the directory /opt/minimserver
1. Adopt the file [/opt/minimserver/data/minimserver.config](../network/zeus/opt/minimserver/data/minimserver.config) to reflect you local needs. Note the minimserver.contentDir as well as the .logFile settings. Adopt these settings and create the log-directory if necessary.
1. Add a new [service file](../network/zeus/etc/systemd/system/minimserver.service) to your /etc/systemd/system directory
1. Start the service via ``` systemctl start minimserver ```
1. If needed add the following config lines to your nginx server, to show the corresponding admin page without the need to use the port number:

```
        location /minimserver/ {
            rewrite /minimserver/(.*) /$1 break;
            proxy_pass          http://localhost:9790;
            proxy_redirect      http://localhost:9790 /minimserver;
            allow 192.168.0.0/24;
            deny all;
        }
```