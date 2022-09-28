for PORT in $(ss -6tuln | tail -n +2 | awk '{print $5}' | cut -d ] -f 2 | grep -o '[0-9]*' ); do 
        sudo ip6tables -L INPUT -v -n | grep -q $PORT && echo "PASS: '{$PORT}' found in iptables" || echo "FAIL: '${PORT}' not in iptables"; done
