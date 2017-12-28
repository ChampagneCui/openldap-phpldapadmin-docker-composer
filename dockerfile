version: '1'

services:

  ldap-host:
    image: osixia/openldap:1.1.8
    networks:
      mynet:
    environment:
      - LDAP_ORGANISATION="My Company"
      - LDAP_DOMAIN=dominio.com
      - LDAP_ADMIN_PASSWORD=admin

  ldap-admin:
    image: osixia/phpldapadmin:0.7.1
    networks:
      mynet:
    ports:
      - "6080:80"
    environment:
      - PHPLDAPADMIN_LDAP_HOSTS=ldap-host
      - PHPLDAPADMIN_HTTPS=false

networks:
  mynet:
    driver: bridge
    ipam:
      config:
        - subnet: 172.31.0.0/16
          gateway: 172.31.0.1
