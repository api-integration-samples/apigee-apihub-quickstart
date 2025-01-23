# create service identity
gcloud beta services identity create --service=apihub.googleapis.com --project=$PROJECT_ID >> $LOG_FILE 2>&1

# get project number and grant sa roles
PROJECT_NUMBER=$(gcloud projects list --filter="$PROJECT_ID" --format="value(PROJECT_NUMBER)")
SA_EMAIL="service-$PROJECT_NUMBER@gcp-sa-apihub.iam.gserviceaccount.com"
gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:$SA_EMAIL" \
    --role="roles/cloudkms.cryptoKeyEncrypterDecrypter" >> $LOG_FILE 2>&1
gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:$SA_EMAIL" \
    --role="roles/apihub.admin" >> $LOG_FILE 2>&1
gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:$SA_EMAIL" \
    --role="roles/apihub.runtimeProjectServiceAgent" >> $LOG_FILE 2>&1

# create key ring
# gcloud kms keyrings create apihub-keyring --project=$PROJECT_ID --location $API_HUB_REGION >> $LOG_FILE 2>&1
# gcloud kms keys create apihub-key --keyring apihub-keyring --project=$PROJECT_ID --location $API_HUB_REGION --purpose "encryption" >> $LOG_FILE 2>&1

# register host
curl -X POST "https://apihub.googleapis.com/v1/projects/$PROJECT_ID/locations/$API_HUB_REGION/hostProjectRegistrations?hostProjectRegistrationId=$PROJECT_ID" \
-H "Authorization: Bearer $(gcloud auth print-access-token)" \
-H 'Content-Type: application/json; charset=utf-8' \
--data-binary @- << EOF >> $LOG_FILE 2>&1

{
  "name": "projects/$PROJECT_ID/locations/$API_HUB_REGION/hostProjectRegistrations/$PROJECT_ID",
  "gcpProject": "projects/$PROJECT_ID"
}
EOF

APIHUB_RESULT=$(curl -X POST "https://apihub.googleapis.com/v1/projects/$PROJECT_ID/locations/$API_HUB_REGION/apiHubInstances" \
-H "Authorization: Bearer $(gcloud auth print-access-token)" \
-H 'Content-Type: application/json; charset=utf-8' \
--data-binary @- << EOF >> $LOG_FILE 2>&1

{
  "config": {
    "vertexLocation": "eu"
  }
}
EOF
)

echo "API Hub status is ACTIVE"