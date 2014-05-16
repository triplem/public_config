# Minimwatch

[Minimwatch](http://minimserver.com/) is a client system for the Minimserver. If you do like it, please consider giving a [donation](http://minimserver.com/donate.html) to the owner of this project.

## Installation

Unfortunately the license of Minimwatch prohibits to create Packages for distributions (see [License](http://minimserver.com/license.html), specifically Section 2.). Therefor I am describing the manual installation and provide links to config files like used in my own environment.

1. [Download](http://minimserver.com/downloads/index.html) Minimwatch
1. Extract downloaded file to the directory /opt/minimwatch
1. I adopted the bin/startc file slightly, so that minimwatch will start headless, without any graphical interface.
1. Start the program via ```cd /opt/minimwatch/bin; startc```

You are able to install new packages and/or updates via this application. You can install it on the server or (like I did) on a laptop in the same network, minimwatch will automatically recognize the minimserver in your network ;-)