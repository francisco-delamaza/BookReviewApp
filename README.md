# README

## Book Review App
Una aplicación web para la gestión de reseñas de libros utilizando Ruby on Rails y CouchDB.

Requisitos:
Ruby (versión especificada en el Gemfile), 
Rails (versión especificada en el Gemfile) y 
CouchDB


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
