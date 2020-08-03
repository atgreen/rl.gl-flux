#!/bin/sh

kubectl cp keycloak-postgresql.dump keycloak-postgresql:/tmp/keycloak-postgresql.dump
kubectl exec keycloak-postgresql -- bash -c "pg_restore -U keycloak -Fc -j 8 -c -d keycloak /tmp/keycloak.dump"

kubectl cp rlgl-postgresql.dump postgresql:/tmp/rlgl-postgresql.dump
kubectl exec postgresql -- bash -c "pg_restore -U rlgl -Fc -j 8 -c -d rlgl /tmp/rlgl-postgresql.dump"
