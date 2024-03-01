FROM wordpress:5.3.2-php7.4-apache
RUN apt-get update && apt-get -y install sendmail && rm -rf /var/lib/apt/lists/*
RUN echo "sendmail_path=sendmail -t -i" >> /usr/local/etc/php/conf.d/sendmail.ini \
    && echo '#!/bin/bash' >> /usr/local/bin/docker-entrypoint-wrapper.sh \
    && echo 'set -euo pipefail' >> /usr/local/bin/docker-entrypoint-wrapper.sh \
    && echo 'echo "127.0.0.1 $(hostname) localhost localhost.localdomain" >> /etc/hosts' >> /usr/local/bin/docker-entrypoint-wrapper.sh \
    && echo 'service sendmail restart' >> /usr/local/bin/docker-entrypoint-wrapper.sh \
    && echo 'exec docker-entrypoint.sh "$@"' >> /usr/local/bin/docker-entrypoint-wrapper.sh \
    && chmod +x /usr/local/bin/docker-entrypoint-wrapper.sh
COPY wp-config.php /var/www/html/
ENTRYPOINT ["docker-entrypoint-wrapper.sh"]
CMD ["apache2-foreground"]