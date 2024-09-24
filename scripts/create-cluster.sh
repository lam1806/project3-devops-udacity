#! /bin/bash
CLUSTER_NAME="my-cluster"
REGION="us-east-1"
eksctl create cluster --name "$CLUSTER_NAME" --region "$REGION" --nodegroup-name my-nodes --node-type t3.small --nodes 1 --nodes-min 1 --nodes-max 2