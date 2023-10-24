# squid-https
Squid HTTPS forward proxy

### Usage
```bash
1. chmod 777 ./log        # Granting write permissions to the log directory
2. docker compose up -d   # start
```

### docker-compose.yaml
```yaml
version: '3.8'
services:
  squid-container:
    image: miaoyc/squid:v1.0.1
    container_name: squid
    environment:
      - TZ=UTC
    ports:
      - "3128:3128"
      - "3129:3129"
    restart: always
    volumes:
      - ./squid.conf:/home/s/apps/squid/conf/squid.conf
      - ./certs/proxy.happycode.fun.pem:/home/s/apps/squid/certs/proxy.happycode.fun.pem
      - ./certs/proxy.happycode.fun.key:/home/s/apps/squid/certs/proxy.happycode.fun.key
      - ./log:/var/log/squid
```