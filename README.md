<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400"></a></p>

<p align="center">
<a href="https://travis-ci.org/laravel/framework"><img src="https://travis-ci.org/laravel/framework.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://poser.pugx.org/laravel/framework/d/total.svg" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://poser.pugx.org/laravel/framework/v/stable.svg" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://poser.pugx.org/laravel/framework/license.svg" alt="License"></a>
</p>

## About Laravel

Laravel is a web application framework with expressive, elegant syntax. We believe development must be an enjoyable and creative experience to be truly fulfilling. Laravel takes the pain out of development by easing common tasks used in many web projects, such as:

- [Simple, fast routing engine](https://laravel.com/docs/routing).
- [Powerful dependency injection container](https://laravel.com/docs/container).
- Multiple back-ends for [session](https://laravel.com/docs/session) and [cache](https://laravel.com/docs/cache) storage.
- Expressive, intuitive [database ORM](https://laravel.com/docs/eloquent).
- Database agnostic [schema migrations](https://laravel.com/docs/migrations).
- [Robust background job processing](https://laravel.com/docs/queues).
- [Real-time event broadcasting](https://laravel.com/docs/broadcasting).

Laravel is accessible, powerful, and provides tools required for large, robust applications.

## Learning Laravel

Laravel has the most extensive and thorough [documentation](https://laravel.com/docs) and video tutorial library of all modern web application frameworks, making it a breeze to get started with the framework.

If you don't feel like reading, [Laracasts](https://laracasts.com) can help. Laracasts contains over 1500 video tutorials on a range of topics including Laravel, modern PHP, unit testing, and JavaScript. Boost your skills by digging into our comprehensive video library.

## Laravel Sponsors

We would like to extend our thanks to the following sponsors for funding Laravel development. If you are interested in becoming a sponsor, please visit the Laravel [Patreon page](https://patreon.com/taylorotwell).

### Premium Partners

- **[Vehikl](https://vehikl.com/)**
- **[Tighten Co.](https://tighten.co)**
- **[Kirschbaum Development Group](https://kirschbaumdevelopment.com)**
- **[64 Robots](https://64robots.com)**
- **[Cubet Techno Labs](https://cubettech.com)**
- **[Cyber-Duck](https://cyber-duck.co.uk)**
- **[Many](https://www.many.co.uk)**
- **[Webdock, Fast VPS Hosting](https://www.webdock.io/en)**
- **[DevSquad](https://devsquad.com)**
- **[OP.GG](https://op.gg)**

## Contributing

Thank you for considering contributing to the Laravel framework! The contribution guide can be found in the [Laravel documentation](https://laravel.com/docs/contributions).

## Code of Conduct

In order to ensure that the Laravel community is welcoming to all, please review and abide by the [Code of Conduct](https://laravel.com/docs/contributions#code-of-conduct).

## Security Vulnerabilities

If you discover a security vulnerability within Laravel, please send an e-mail to Taylor Otwell via [taylor@laravel.com](mailto:taylor@laravel.com). All security vulnerabilities will be promptly addressed.

## License

The Laravel framework is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).

## versio laravel 8.0

## php version 7.4.0

## for init server
> composer global require laravel/installer

## para configurar nginx
https://www.nginx.com/blog/setting-up-nginx/
https://nginx.org/en/linux_packages.html#Debian


## servicios para ver el estado de los servicio

systemctl status php7.3-fpm 
systemctl status nginx
service apache2 restart
systemctl reload apache2

## para ver los logs errores 

> tail -f /var/log/nginx/domain1.access.log

## algunos errores identificados permisos al configurar php en nginx

## error de configuracion de cache

sudo chown -R $USER:www-data storage

sudo chown -R $USER:www-data bootstrap/cache

chmod -R 775 storage

chmod -R 775 bootstrap/cache
## error de configuracion de cache
https://stackoverflow.com/questions/23443398/nginx-error-connect-to-php5-fpm-sock-failed-13-permission-denied
otras actualizaciones mas 
> usermod -aG www-data nginx
systemctl status php7.3-fpm 

## error con los certificados para los get a api externa
descargar de https://curl.se/docs/caextract.html
poner en php.ini
[curl]
curl.cainfo = C:\ACH\php\extras\ssl\cacert.pem
[openssl]
openssl.cafile = C:\ACH\php\extras\ssl\cacert.pem

## error al descargar archivos laravel error "Class 'finfo' not found"

editat php.ini
fileinfo 

line
;extension=fileinfo


## mapa de rutas 

> php artisan route:list

+--------+----------+-----------------------------+-----------------------------+---------+------------+
| Domain | Method   | URI                         | Name                        | Action  | Middleware |
+--------+----------+-----------------------------+-----------------------------+---------+------------+
|        | GET|HEAD | /                           | generated::A4mAn9fIANFXsbg8 | Closure | web        |
|        | GET|HEAD | api/formularios_kobo_master | generated::yFBk3ygDSnUnHrn2 | Closure | api        |
|        | GET|HEAD | api/formularios_master      | generated::icUaK4J45OxhJUky | Closure | api        |
|        | GET|HEAD | api/kobo/{uui}              | generated::ppTA2QSTrQWFYNBE | Closure | api        |
|        | GET|HEAD | api/user                    | generated::DMUKFoQ72sLqfXdM | Closure | api        |
|        |          |                             |                             |         | auth:api   |
+--------+----------+-----------------------------+-----------------------------+---------+------------+
## para descargar formato para la carga de excel en sistema mire sys
http://127.0.0.1:8000/api/meal/lpa/download

## solo para la primra migracio corres estas migraciones




DO


DOING
    crear servicio para cargar excel de meal formato fuente 1 lpa en la base de datos con adaptacion de tablas existe


DOES


    solucionar error 
        InvalidArgumentException
        Malformed UTF-8 characters, possibly incorrectly encoded

    solucionar errore de conexion crear dos ramas master para produccion y dev para desarrollo en local
