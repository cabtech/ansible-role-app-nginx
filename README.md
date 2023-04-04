# ansible-role-app-nginx

## Default variables
| Name | Type | Value | Comments |
| ---- | ---- | ----- | -------- |
| nginx_default_server | Boolean | false | OK for testing |
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
| nginx_svc_state | SystemdState | started ||
| nginx_vhosts | list(dict) | see example below ||

### Example
nginx_vhosts:
  - {docroot: /NotYourRootDisk/apt-mirror/mirror/archive.ubuntu.com, fqdn: "example.io", redirect: true, shortname: handy, ssl: true}

# --------------------------------
...
