#!/bin/bash

/bin/uname.orig "$@" | sed 's/armv7l/armv6l/g'
