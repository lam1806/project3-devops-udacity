#! /bin/bash
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
helm install project3 bitnami/postgresql --set primary.persistence.enabled=false
$POSTGRE_SQL=project3-postgresql
export POSTGRES_PASSWORD=$(kubectl get secret project3-postgresql -o jsonpath="{.data.postgres-password}" | base64 -d)
kubectl port-forward svc/"$POSTGRESQL" 5432:5432 &

kubectl port-forward svc/project3-postgresql 5432:5432 &
export POSTGRES_PASSWORD=$(kubectl get secret --namespace default project3-postgresql -o jsonpath="{.data.postgres-password}" | base64 -d)

PGPASSWORD="$POSTGRES_PASSWORD"  psql -U postgres -d postgres -h 127.0.0.1 -a -f db/1_create_tables.sql

PGPASSWORD="$DB_PASSWORD" psql --host 127.0.0.1 -U myuser -d mydatabase -p 5433 < <FILE_NAME.sql>

export DB_USERNAME=project3
export DB_PASSWORD=mypassword
export DB_HOST=127.0.0.1
export DB_PORT=5433
export DB_NAME=project3