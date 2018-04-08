cd /fs
sh restart.sh
cd /ssr/shadowsocks
python server.py -p 17520 -k Ssr123456 -m aes-256-cfb -O auth_aes128_sha1 -o tls1.2_ticket_auth_compatible -G 32 -g www.bing.com > ssr.log 2>&1
