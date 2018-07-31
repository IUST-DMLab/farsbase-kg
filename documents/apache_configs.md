# sites-available

```bash
sudo nano /etc/apache2/sites-available/000-default.conf
```

change apache config and append these lines:

```apache
Alias /mapping /codes/gui/mapping-ui
Alias /search /codes/gui/search-ui
Alias /expert /codes/gui/expert-ui
Alias /raw /codes/gui/raw-text-ui
Alias /ui /codes/gui/kg-ui
Alias /pkg /codes/gui/pkg-ui
Alias /evaluation /codes/gui/evaluation-ui

<Directory /codes/gui/mapping-ui>
    Options All
    AllowOverride All
    #order allow,deny
    #allow from all
    Require all granted
</Directory>

<Directory /codes/gui/search-ui>
    Options All
    AllowOverride All
    #order allow,deny
    #allow from all
    Require all granted
</Directory>

<Directory /codes/gui/expert-ui>
    Options All
    AllowOverride All
    #order allow,deny
    #allow from all
    Require all granted
</Directory>

<Directory /codes/gui/raw-text-ui>
    Options All
    AllowOverride All
    #order allow,deny
    #allow from all
    Require all granted
</Directory>

<Directory /codes/gui/kg-ui>
    Options All
    AllowOverride All
    #order allow,deny
    #allow from all
    Require all granted
</Directory>

<Directory /codes/gui/pkg-ui>
    Options All
    AllowOverride All
    #order allow,deny
    #allow from all
    Require all granted
</Directory>

<Directory /codes/gui/evaluation-ui>
    Options All
    AllowOverride All
    #order allow,deny
    #allow from all
    Require all granted
</Directory>
```

# config httpd
create / edit .httpd file:

```bash
sudo nano /var/www/html/.htaccess
```

```apache
RewriteEngine On

RewriteRule ^resource/templates/(.*)$ mapping/html/templates/$1 [QSA]
RewriteRule ^category/templates/(.*)$ mapping/html/templates/$1 [QSA]
RewriteRule ^ontology/templates/(.*)$ mapping/html/templates/$1 [QSA]
RewriteRule ^property/templates/(.*)$ mapping/html/templates/$1 [QSA]


RewriteCond %{HTTP_REFERER}  ^http://farsbase\.net/.*$
RewriteRule ^mapping/.* - [L]

RewriteCond %{HTTP_REFERER}  ^http://farsbase\.net/.*$
RewriteRule ^(.*)$ mapping/$1 [QSA]

RewriteRule ^resource/([^\/]*)$ mapping/html/triple.html?subject=http://farsbase.net/resource/$1 [QSA]
RewriteRule ^ontology/([^\/]*)$ mapping/html/triple.html?subject=http://farsbase.net/ontology/$1 [QSA]
RewriteRule ^property/([^\/]*)$ mapping/html/triple.html?subject=http://farsbase.net/property/$1 [QSA]
RewriteRule ^category/([^\/]*)$ mapping/html/triple.html?subject=http://farsbase.net/resource/$1 [QSA]
```

```bash
sudo service apache2 restart
```