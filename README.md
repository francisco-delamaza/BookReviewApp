# README

## Book Review App
Una aplicación web para la gestión de reseñas de libros utilizando Ruby on Rails y CouchDB.

Requisitos:
Ruby (versión especificada en el Gemfile), 
Rails (versión especificada en el Gemfile), 
CouchDB,
Docker


# Instalar las dependencias del proyecto

Asegúrate de tener bundler instalado. Luego, ejecuta el siguiente comando para instalar las gemas necesarias:

```bundle install```


# Configurar CouchDB

Asegúrate de que CouchDB esté en funcionamiento. Luego, edita el archivo de configuración de CouchDB en config/initializers/couchdb.rb y actualiza los valores de username, password, y config.database con la información correspondiente de tu base de datos CouchDB.


# Poblar la base de datos

Ejecuta el siguiente comando para poblar la base de datos con datos iniciales:

```rake db:seed```



# Iniciar el servidor Rails

Finalmente, inicia el servidor Rails ejecutando el siguiente comando:

```rails server```

La aplicación estará disponible en http://localhost:3000.

# Conteinerizar la aplicación

Para desplegar la aplicacion y db en contenedores de Docker primero certifica que tengas docker instalado siguiendo las instrucciones en el
siguiente link https://docs.docker.com/engine/install/ubuntu/. Despues asegurate de que couchdb no este corriendo para evitar conflictos de puerto.

```sudo systemctl stop couchdb```

Por ultimo ejecuta el siguiente comando para armar los contenedores:

```docker-compose up --build```

La aplicación estará disponible en http://localhost:3000.

Para detener y eliminar los contenedores, ejecuta:

```docker-compose down```

# Consideraciones

Por temas de tiempo al generar datos con los contenedores redujimos los datos autogenerados a dos autores con sus libros, ventas y reseñas respectivas. En la tarea pasada se puede ver que la generación de datos era la requerida para esa entrega y que en esta lo cambiamos solo por conveniencia.