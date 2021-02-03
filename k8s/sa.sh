#!/bin/bash

export NAMESPACE="traefik-system"
export ROBOT="traefik-dns01-solver"
export CLOUDDNS_SECRET="traefik-dns01-solver"
export GCLOUD_PROJECT_ID="jll-ci-test"
export CDNS_SA_KEYFILE="service-account.json"

# create-serviceAccount:

gcloud iam service-accounts create "$ROBOT" --display-name="$ROBOT" --project="$GCLOUD_PROJECT_ID"

# add-iam-policy-binding
gcloud projects add-iam-policy-binding "$GCLOUD_PROJECT_ID" --member="serviceAccount:$ROBOT@$GCLOUD_PROJECT_ID.iam.gserviceaccount.com" --role=roles/dns.admin

# create-serviceAccount-keys
gcloud iam service-accounts keys create "$CDNS_SA_KEYFILE" --iam-account="$ROBOT@$GCLOUD_PROJECT_ID.iam.gserviceaccount.com" --project="$GCLOUD_PROJECT_ID"

# install-clouddns-secret: 
kubectl delete secret "$CLOUDDNS_SECRET" --namespace="$NAMESPACE"
kubectl create secret generic "$CLOUDDNS_SECRET" --from-file="$CDNS_SA_KEYFILE" --namespace="$NAMESPACE"