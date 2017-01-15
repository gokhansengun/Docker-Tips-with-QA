#!/bin/bash -u

ip_addr=`ip -4 route get 8.8.8.8 | awk {'print $7'} | tr -d '\n'`;

echo "<center><h2>Serving Web from IP address: ${ip_addr}</h2></center>" > /usr/share/nginx/html/ip-addr.html

nginx -g 'daemon off;'
