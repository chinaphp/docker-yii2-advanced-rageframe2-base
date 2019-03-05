FROM chinaphp/alpine-php-yii2-advanced:latest AS build-env
COPY composer.json composer.lock /app/

RUN cd /app && composer config --global --auth github-oauth.github.com 3fd3cd98adefa532d07ba1e03ed59d34178d8bdf && composer config repo.packagist composer https://packagist.laravel-china.org  && composer update

FROM chinaphp/alpine-php-yii2-advanced:latest

# COPY docker/nginx/default.conf /etc/nginx/presets/default.conf
COPY --from=build-env /app/vendor /app/vendor
