echo "Adding additional deployment types..."

curl -X PATCH "https://apihub.googleapis.com/v1/projects/$PROJECT_ID/locations/$REGION/attributes/system-deployment-type?updateMask=allowedValues" \
-H "Authorization: Bearer $(gcloud auth print-access-token)" \
-H 'Content-Type: application/json; charset=utf-8' \
--data-binary @- << EOF >> $LOG_FILE 2>&1

{
	"name": "projects/$PROJECT_ID/locations/$REGION/attributes/system-deployment-type",
	"displayName": "Deployment Type",
	"description": "Deployment Type attribute",
	"definitionType": "SYSTEM_DEFINED",
	"scope": "DEPLOYMENT",
	"dataType": "ENUM",
	"allowedValues": [
		{
			"id": "apigee",
			"displayName": "Apigee",
			"description": "Apigee",
			"immutable": true
		},
		{
			"id": "apigee-hybrid",
			"displayName": "Apigee Hybrid",
			"description": "Apigee Hybrid",
			"immutable": true
		},
		{
			"id": "apigee-edge-private",
			"displayName": "Apigee Edge Private Cloud",
			"description": "Apigee Edge Private Cloud",
			"immutable": true
		},
		{
			"id": "apigee-edge-public",
			"displayName": "Apigee Edge Public Cloud",
			"description": "Apigee Edge Public Cloud",
			"immutable": true
		},
		{
			"id": "mock-server",
			"displayName": "Mock server",
			"description": "Mock server",
			"immutable": true
		},
		{
			"id": "cloud-api-gateway",
			"displayName": "Cloud API Gateway",
			"description": "Cloud API Gateway",
			"immutable": true
		},
		{
			"id": "cloud-endpoints",
			"displayName": "Cloud Endpoints",
			"description": "Cloud Endpoints",
			"immutable": true
		},
		{
			"id": "unmanaged",
			"displayName": "Unmanaged",
			"description": "Unmanaged",
			"immutable": true
		},
		{
			"id": "others",
			"displayName": "Others",
			"description": "Others",
			"immutable": true
		},
		{
			"id": "aws-api-gateway",
			"displayName": "AWS API Gateway",
			"description": "AWS API Gateway",
			"immutable": false
		},
		{
			"id": "azure-api-management",
			"displayName": "Azure API Management",
			"description": "Azure API Management",
			"immutable": false
		},
	],
	"cardinality": 1,
	"mandatory": true
}
EOF

echo "Adding example business units..."

curl -X PATCH "https://apihub.googleapis.com/v1/projects/$PROJECT_ID/locations/$REGION/attributes/system-business-unit?updateMask=allowedValues" \
-H "Authorization: Bearer $(gcloud auth print-access-token)" \
-H 'Content-Type: application/json; charset=utf-8' \
--data-binary @- << EOF >> $LOG_FILE 2>&1

{
  "name": "projects/$PROJECT_ID/locations/$REGION/attributes/system-business-unit",
  "displayName": "Business Unit",
  "description": "Business unit attribute",
  "definitionType": "SYSTEM_DEFINED",
  "scope": "API",
  "dataType": "ENUM",
  "allowedValues": [
    {
      "id": "example-business-unit",
      "displayName": "Personal Risk Management",
      "description": "Personal Risk Management"
    },
    {
      "id": "commercial-insurance-solutions",
      "displayName": "Commercial Insurance Solutions",
      "description": "Commercial Insurance Solutions"
    },
    {
      "id": "life-and-legacy-planning",
      "displayName": "Life & Legacy Planning",
      "description": "Life & Legacy Planning"
    },
    {
      "id": "group-benefits-and-wellness",
      "displayName": "Group Benefits & Wellness",
      "description": "Group Benefits & Wellness"
    },
    {
      "id": "claims-resolution-center",
      "displayName": "Claims Resolution Center",
      "description": "Claims Resolution Center"
    },
    {
      "id": "risk-assessment-and-underwriting",
      "displayName": "Risk Assessment & Underwriting",
      "description": "Risk Assessment & Underwriting"
    },
    {
      "id": "investment-and-asset-management",
      "displayName": "Investment & Asset Management",
      "description": "Investment & Asset Management"
    },
    {
      "id": "customer-care-and-support",
      "displayName": "Customer Care & Support",
      "description": "Customer Care & Support"
    },
    {
      "id": "digital-innovation-and-technology",
      "displayName": "Digital Innovation & Technology",
      "description": "Digital Innovation & Technology"
    },
    {
      "id": "strategic-partnerships-and-alliances",
      "displayName": "Strategic Partnerships & Alliances",
      "description": "Strategic Partnerships & Alliances"
    }
  ],
  "cardinality": 1
}
EOF

echo "Adding example teams..."

curl -X PATCH "https://apihub.googleapis.com/v1/projects/$PROJECT_ID/locations/$REGION/attributes/system-team?updateMask=allowedValues" \
-H "Authorization: Bearer $(gcloud auth print-access-token)" \
-H 'Content-Type: application/json; charset=utf-8' \
--data-binary @- << EOF >> $LOG_FILE 2>&1

{
  "name": "projects/$PROJECT_ID/locations/$REGION/attributes/system-team",
  "displayName": "Team",
  "description": "Team attribute",
  "definitionType": "SYSTEM_DEFINED",
  "scope": "API",
  "dataType": "ENUM",
  "allowedValues": [
    {
      "id": "example-team",
      "displayName": "Policy Services Team",
      "description": "Policy Services Team"
    },
    {
      "id": "claims-response-unit",
      "displayName": "Claims Response Unit",
      "description": "Claims Response Unit"
    },
    {
      "id": "underwriting-solutions-group",
      "displayName": "Underwriting Solutions Group",
      "description": "Underwriting Solutions Group"
    },
    {
      "id": "the-navigators",
      "displayName": "The Navigators",
      "description": "The Navigators"
    },
    {
      "id": "the-risk-wranglers",
      "displayName": "The Risk Wranglers",
      "description": "The Risk Wranglers"
    },
    {
      "id": "the-safety-net",
      "displayName": "The Safety Net",
      "description": "The Safety Net"
    },
    {
      "id": "the-horizon-team",
      "displayName": "The Horizon Team",
      "description": "The Horizon Team"
    },
    {
      "id": "the-phoenix-group",
      "displayName": "The Phoenix Group",
      "description": "The Phoenix Group"
    }
  ],
  "cardinality": 1
}
EOF

echo "Adding additional user attributes..."

curl -X POST "https://apihub.googleapis.com/v1/projects/$PROJECT_ID/locations/$REGION/attributes?attributeId=gdpr-relevance" \
-H "Authorization: Bearer $(gcloud auth print-access-token)" \
-H 'Content-Type: application/json; charset=utf-8' \
--data-binary @- << EOF >> $LOG_FILE 2>&1

{
  "name": "projects/$PROJECT_ID/locations/$REGION/attributes/gdpr-relevance",
  "displayName": "GDPR Relevance",
  "description": "How relevant the API is for GDPR data protection audits & concerns.",
  "scope": "API",
  "dataType": "ENUM",
  "allowedValues": [
    {
      "id": "high",
      "displayName": "HIGH",
      "description": "Highly relevant."
    },
    {
      "id": "partial",
      "displayName": "PARTIAL",
      "description": "Partially relevant."
    },
    {
      "id": "none",
      "displayName": "NONE",
      "description": "Not at all relevant."
    }
  ],
  "cardinality": 1
}
EOF

curl -X POST "https://apihub.googleapis.com/v1/projects/$PROJECT_ID/locations/$REGION/attributes?attributeId=business-type" \
-H "Authorization: Bearer $(gcloud auth print-access-token)" \
-H 'Content-Type: application/json; charset=utf-8' \
--data-binary @- << EOF >> $LOG_FILE 2>&1

{
  "name": "projects/$PROJECT_ID/locations/$REGION/attributes/business-type",
  "displayName": "Business Type",
  "description": "The type of API for different categories of business operations.",
  "scope": "API",
  "dataType": "ENUM",
  "allowedValues": [
    {
      "id": "payments",
      "displayName": "PAYMENTS",
      "description": "Payment processing APIs."
    },
    {
      "id": "insurance",
      "displayName": "INSURANCE",
      "description": "Insurance related APIs."
    },
    {
      "id": "risk",
      "displayName": "RISK",
      "description": "Risk related APIs."
    },
    {
      "id": "claims",
      "displayName": "CLAIMS",
      "description": "Claims related APIs."
    },
    {
      "id": "investment",
      "displayName": "INVESTMENT",
      "description": "Investment related APIs."
    }
  ],
  "cardinality": 1
}
EOF

curl -X POST "https://apihub.googleapis.com/v1/projects/$PROJECT_ID/locations/$REGION/attributes?attributeId=regions" \
-H "Authorization: Bearer $(gcloud auth print-access-token)" \
-H 'Content-Type: application/json; charset=utf-8' \
--data-binary @- << EOF >> $LOG_FILE 2>&1

{
  "name": "projects/$PROJECT_ID/locations/$REGION/attributes/regions",
  "displayName": "Regions",
  "description": "The regions that the API is active in.",
  "definitionType": "USER_DEFINED",
  "scope": "API",
  "dataType": "ENUM",
  "allowedValues": [
    {
      "id": "northam",
      "displayName": "NORTHAM",
      "description": "North America"
    },
    {
      "id": "southam",
      "displayName": "SOUTHAM",
      "description": "South America"
    },
    {
      "id": "europe",
      "displayName": "EUROPE",
      "description": "Europe"
    },
    {
      "id": "asia",
      "displayName": "ASIA",
      "description": "Asia"
    },
    {
      "id": "africa",
      "displayName": "AFRICA",
      "description": "Africa"
    },
    {
      "id": "australia",
      "displayName": "AUSTRALIA",
      "description": "Australia"
    }
  ],
  "cardinality": 20
}
EOF