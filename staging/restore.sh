#!/bin/sh

kubectl -n staging cp keycloak-postgresql.dump keycloak-postgresql:/tmp/keycloak-postgresql.dump
kubectl -n staging exec keycloak-postgresql -- bash -c "pg_restore -U keycloak -Fc -j 8 -c -d keycloak /tmp/keycloak.dump"

kubectl -n staging cp rlgl-postgresql.dump postgresql:/tmp/rlgl-postgresql.dump
kubectl -n staging exec postgresql -- bash -c "pg_restore -U rlgl -Fc -j 8 -c -d rlgl /tmp/rlgl-postgresql.dump"
