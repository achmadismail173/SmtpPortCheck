#!/bin/bash

# Konfigurasi host dan port
HOSTNAME="smtp.gmail.com"
PORTS=(25 465 587)

# Header tabel
printf "%-20s %-5s %-17s %s\n" "Hostname" "Port" "TcpTestSucceeded" "Status"
printf "%-20s %-5s %-17s %s\n" "--------" "----" "----------------" "------"

# Looping tiap port
for PORT in "${PORTS[@]}"; do
    if timeout 3 bash -c "echo > /dev/tcp/$HOSTNAME/$PORT" 2>/dev/null
    then
        printf "%-20s %-5s %-17s %s\n" "$HOSTNAME" "$PORT" "True" "Open"
    else
        printf "%-20s %-5s %-17s %s\n" "$HOSTNAME" "$PORT" "False" "Closed or Blocked"
    fi
done
