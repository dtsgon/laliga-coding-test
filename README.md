# LaLiga coding test
# Daniel T. Sanz González (langares@yahoo.es)

Este proyecto Symfony API REST monta un servidor Apache + MaríaDB + PHP 8.1 dockerizados en la ruta [http://localhost:180](http://localhost:180) y provee de las siguientes direcciones

  - API:  [http://localhost/:180/API](http://localhost:180/API)
  - CRUD: [http://localhost/:180/CRUD](http://localhost:180/CRUD)

La API es donde se llevan a cabo los requerimientos de la prueba.

El CRUD es un simple just-for-fun que quizá pueda ser útil.



## Despliegue

- Instalación inicial (derivados de Debian)

  `sudo apt install make build-essential docker docker-compose -y`
 

- Crear grupo 'docker'

  `sudo groupadd docker`
 

- Añadir usuario al grupo 'docker'

  `sudo usermod -aG docker $USER`
 
  
- Reiniciar para refrescar los grupos del usuario

- Situarse en la carpeta del proyecto con el terminal

- Iniciar proceso

  `make init`
 
 
## Ejecución
- Situarse en la carpeta del proyecto con el terminal

- Lanzar app

  `make start`

- Usar la colección de Postman

  `"La Liga.postman_collection.json"`


## Esta prueba hace uso de...
- [x] make (sí, make, el de los Makefiles)
- [x] Doctrine
- [x] Composer
- [x] Symfony 6
- [x] PHP 8.1
- [x] MariaDB
- [x] Apache2
- [ ] Sirope
- [x] Mucho esfuerzo
- [ ] Swagger
- [ ] RabbitMQ


## Esta prueba incluye...
- [x] Instrucciones en el README.md
- [x] Colección Postman
- [x] Patrones de diseño
- [x] Buenas prácticas Symfony y PHP
- [x] Verbos REST
- [x] Gestión de Excepciones
- [x] Refactorización de Controladores REST
- [x] Lista de los primeros clubs de fútbol españoles
- [x] Migración de datos en lugar de usar fixtures
- [x] Probado desde 0 en una VM
- [x] Un README.md medio decente
- [ ] Un README.md bonito
- [ ] Tests unitarios (timeout! 😢)
- [ ] Aplicar PHPStan o Rector
- [x] Uso de Interfaces
- [x] Uso de Traits
- [x] En CRUD para las entidades más allá del REST


## Cumple con los requerimientos (100%)
- [x] Dar de alta un club
- [x] Dar de alta un jugador en el club
- [x] Dar de alta un entrenador en el club
- [x] Modificar el presupuesto de un club
- [x] Dar de baja un jugador del club
- [x] Dar de baja un entrenador del club
- [x] Listar jugadores de un club con posibilidad de filtrar por una de las propiedades (por ejemplo nombre) y con paginación
- [x] Dar de alta un jugador sin pertenecer a un club
- [x] Dar de alta un entrenador sin pertenecer a un club
- [x] Cada club deberá de tener un presupuesto, este presupuesto se asignará en el alta del club.
- [x] Al dar de alta un jugador/entrenador a un club se deberá especificar el salario del jugador/entrenador para ese club, ese salario debe de salir del presupuesto del club y el presupuesto nunca puede ser menor que cero.
- [x] Al modificar el presupuesto de un club se tiene que tener en cuenta los salarios actuales de ese club.
- [x] Un jugador/entrenador no podrá estar dado de alta en mas de un club.
- [x] Cada vez que se de alta o baja a un jugador/entrenador tendrá que ser notificado por email.
- [x] Implementación de un Interace de Mensajeria del putno anterior: ser notificado por otras vías (sms, whatsapp, ...) por lo tanto lo tendremos que dejar abierta esta posibilidad sin ser implementada actualmente)


## Cumple con los requerimientos deseables (100%)
- [x] Instrucciones de instalación (añadirlas al README.md).
- [x] Symfony 4.4 o superior.
- [x] Se deberá utilizar Doctrine como ORM.
- [x] Se pueden utilizar bundles de terceros (excepto API Platform).
- [x] El tipo de contenido siempre debe ser application/json.
- [x] Entregar un dump de la DB con datos de prueba.
- [x] Se valorará muy positivamente una colección de Postman.
- [x] Se valorará muy positivamente el uso de docker.
- [x] Se valorará muy positivamente la estructura y limpieza del código, tests unitarios, el uso de “Patrones de diseño”, el uso de los verbos REST y las buenas prácticas de Symfony.


## Uso del API REST
Los datos de las entidades se envían y devuelven en el cuerpo de la petición en formato JSON.

El id de la entidad SIEMPRE se envía en la URL. Por tanto, para modificar un dato, debe enviar un JSON correctamente formado.

Aunque éstos son solo algunos ejemplos, los JSON al completo pueden encontrarse en los cuerpos (Body\raw) de las peticiones de la colección de Postman:

### Club/New
#### Request
    {
        "name": "Athletic Clubsss",
        "budget": 1369887.84,
        "city": "Bilbao",
        "foundation_year": {
            "date": "1921-04-23"
        },
        "active": 1
    }

#### Response
    {
        "status": "👍",
        "data": {
            "12": {
                "id": 12,
                "name": "Athletic Clubsss",
                "budget": 1369887.84,
                "city": "Bilbao",
                "foundation_year": {
                    "date": "1921-04-23 00:00:00.000000",
                    "timezone_type": 3,
                    "timezone": "UTC"
                },
                "active": 1,
                "created_at": {
                    "date": "2021-12-13 02:43:02.371527",
                    "timezone_type": 3,
                    "timezone": "UTC"
                },
                "update_at": null
            }
        },
        "message": ""
    }


### Player/New
#### Request
    {
        "club": 3,
        "name": "Pepe Lopez Nuñezaaaaa",
        "salary": 13333.42,
        "dorsal": 13,
        "birth_date": {
            "date": "1891-03-27"
        },
        "active": 1
    }

#### Response
    {
        "status": "👍",
        "data": {
            "200": {
                "id": 200,
                "club": "Foot-Ball Club Barcelona",
                "name": "Pepe Lopez Nuñezaaaaa",
                "salary": 13333.42,
                "dorsal": 13,
                "birth_date": {
                    "date": "1891-03-27 00:00:00.000000",
                    "timezone_type": 3,
                    "timezone": "UTC"
                },
                "active": 1,
                "created_at": {
                    "date": "2021-12-13 12:54:55.592938",
                    "timezone_type": 3,
                    "timezone": "UTC"
                },
                "update_at": null
            }
        },
        "message": ""
    }

### Manager/New
#### Request
    {
        "club": 3,
        "name": "Pepe Lopez Nuñezaaaaa",
        "salary": 1233.42,
        "license_date": {
            "date": "2021-12-12 19:13:43.589712"
        },
        "active": 1
    }

#### Response
    {
        "status": "👍",
        "data": {
            "15": {
                "id": 15,
                "club": "Foot-Ball Club Barcelona",
                "name": "Pepe Lopez Nuñezaaaaa",
                "salary": 1233.42,
                "license_date": {
                    "date": "2021-12-12 19:13:43.589712",
                    "timezone_type": 3,
                    "timezone": "UTC"
                },
                "active": 1,
                "created_at": {
                    "date": "2021-12-13 12:55:28.924002",
                    "timezone_type": 3,
                    "timezone": "UTC"
                },
                "update_at": null
            }
        },
        "message": ""
    }

### Player/Listado-por-club
Aquí se el envía un filtro para hacer búsquedas %LIKE% siendo OR entre los campos.

Acepta los campos: 'name', 'salary', 'dorsal' y 'birth_date'
#### Request
    {
        "filter":
        {
            "dorsal": "2",
            "name": "ñ"
        }
    }
