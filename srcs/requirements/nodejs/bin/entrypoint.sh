#!/bin/bash

npm install --prefix /etc/local/nodejs
npm install --prefix /etc/local/nodejs -g npm@8.19.2
npm --prefix /etc/local/nodejs start

# Change last cmd with exec "$@"