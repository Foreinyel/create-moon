version: "3.1"

networks:
  app_net_1:
    external: true
services:
  {{ appName }}:
    networks:
      - default
      - app_net_1
    hostname: {{ appName }}
    restart: always
    build: .
    environment:
      TZ: Asia/Shanghai
    ports:
      - "8011:7001"
