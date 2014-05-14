#!/bin/sh
unicorn -c /etc/gollum/$1.unicorn.rb -E production -D

