#!/bin/bash

kubectl exec keycloak-postgresql -- bash -c "pg_dump -U keycloak -Fc -Z 9" > keycloak-postgresql.dump
kubectl exec postgresql -- bash -c "pg_dump -U rlgl -Fc -Z 9" > rlgl-postgresql.dump
