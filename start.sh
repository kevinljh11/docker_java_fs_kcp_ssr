./server_linux_amd64 -t "0.0.0.0:17520" -l ":17518" -key test -mtu 1350 -sndwnd 610 -rcvwnd 610 -crypt none -mode fast2 -dscp 0 -datashard 10 -parityshard 3 -nocomp> kcptun.log 2>&1 &
cd /fs
sh restart.sh
cd /ssr/shadowsocks
python server.py -p 17520 -k Ssr123456 -m aes-256-cfb -O auth_aes128_sha1 -o tls1.2_ticket_auth_compatible -G 32 -g www.bing.com > ssr.log 2>&1
