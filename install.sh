#!/bin/bash
set -euo pipefail

cd /app

mv /var/www/html/index.html{,.ORIG}
cp -r data script.js index.php gpio.php /var/www/html/

service apache2 restart
