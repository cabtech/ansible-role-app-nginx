# Install Nginx server and vhost configs

## Default variables
| Name | Type | Value | Comments |
| ---- | ---- | ----- | -------- |
| nginx_dirs | list(dict) | see `defaults.yml` ||
| nginx_doc_dir | UnixDir | `/var/www/html` ||
| nginx_etc_dir | UnixDir | `/etc/nginx` ||
| nginx_group | string | adm | needs access to SSL dirs |
| nginx_http_port | integer | 80 ||
| nginx_https_port | integer | 443 ||
| nginx_log_dir | UnixDir | `/var/log/nginx` ||
| nginx_packages | list(string) | ["nginx"] ||
| nginx_port | integer | 443 ||
| nginx_ssl_cert | UnixFile | fullchain.pem ||
| nginx_ssl_dir | UnixDir | `/etc/letsencrypt/live` ||
| nginx_ssl_prikey | UnixFile | privkey.pem ||
| nginx_runtime | string | www-data ||
| nginx_svc_enabled | Boolean | true ||
| nginx_svc_name | string | nginx ||
| nginx_svc_state | SystemdState | stnginx_ssl_certarted ||
| nginx_vhosts | list(dict) | see example below ||

### Examples
```
nginx_vhosts:
- docroot: /data/apt-mirror/mirror/archive.ubuntu.com
  enabled: true
  fqdn: "example.io"
  port: 8888
  redirect: true
  shortname: handy
  ssl:
    cert_file: certExample.pem          # default nginx_ssl_cert
    cert_site: omsk.testing.example.com # default item.fqdn
    key_file: keyExample.pem            # default nginx_ssl_prikey
    ssl_dir: /etc/example/special       # default nginx_ssl_dir
  locations:
  - directives:
      autoindex: "on"  # need the quotes to avoid translation to Boolean
      index: index.html
      root: /var/www/ops
    path: "/"
#
- enabled: true
  fqdn: "dundee.example.com"
  redirect: true
  shortname: kxd
  ssl: {}
  locations:
  - comment: "dashboards"
    path: "/"
    redirect:
      uri: "http://ADD_YOUR_ADDR:ADD_YOUR_PORT"
#
- docroot: /var/www/ops
  enabled: true
  fqdn: "orlando.example.com"
  redirect: true
  shortname: ops
  ssl:
    cert_site: "dundee.example.com"
  locations:
  - comment: "Trading UI"
    directives:
      autoindex: "on"
      index: index.html
      root: /var/www/ops
    path: "/"

```

# --------------------------------
...
