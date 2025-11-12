CLUSTER_NAME="iris-cluster"
REGION="us-central1"
PROJECT_ID="iitmbs-mlops"
MACHINE_TYPE="e2-standard-4"

gcloud container clusters create $CLUSTER_NAME \
  --region $REGION \
  --project $PROJECT_ID \
  --num-nodes 1 \
  --machine-type $MACHINE_TYPE \
  --enable-autoscaling \
  --min-nodes 1 \
  --max-nodes 3 \
  --enable-ip-alias \
  --enable-autoupgrade \
  --enable-autorepair \
  --logging=SYSTEM,WORKLOAD \
  --monitoring=SYSTEM