#!/bin/bash -u

child_pid=

# handler for SIGTERM
term_handler() {
  echo "SIGTERM signal is caught!";
  kill -TERM "$child_pid" 2>/dev/null;
}

trap term_handler SIGTERM;

ip_addr=`ip -4 route get 8.8.8.8 | awk {'print $7'} | tr -d '\n'`;

echo "<center><h2>Serving Web from IP address: ${ip_addr}</h2></center>" > /usr/share/nginx/html/ip-addr.html;

# start the process
nginx -g 'daemon off;' &

# save the child process id
child_pid=$! 

# wait for it until exit
wait "$child_pid"
