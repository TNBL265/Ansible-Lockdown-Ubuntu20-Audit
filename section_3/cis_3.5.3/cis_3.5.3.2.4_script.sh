for PORT in $(ss -4tuln | tail -n +2 | awk '{print $5}' | cut -d : -f 2); do 
        sudo iptables -L INPUT -v -n | grep -q $PORT && echo "PASS: '{$PORT}' found in iptables" || echo "FAIL: '${PORT}' not in iptables"; done
