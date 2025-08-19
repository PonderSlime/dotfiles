#!/bin/bash
find /proc/irq/ -name \*eth0\* | fgrep -q eth0 && echo up || echo down
