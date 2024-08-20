#!/bin/bash
set -e

# Esperar hasta que CouchDB esté disponible
until curl -s http://couchdb:5984/; do
  >&2 echo "CouchDB está inactivo - esperando..."
  sleep 2
done

>&2 echo "CouchDB está disponible - ejecutando seeds"

# Ejecutar las migraciones y semillas
bundle exec rake db:seed

# Ejecutar el servidor Rails
exec "$@"
