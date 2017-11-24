#!/bin/bash
export PATH=/usr/local/node/bin/:$PATH
cd /var/demo-ci-cd/api
pm2 start app.js