#!/bin/bash

PORT=$1
/usr/sbin/sshd -D -p $PORT
