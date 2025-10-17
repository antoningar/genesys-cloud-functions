# Genesys Cloud prerequesites
To be executed, this terraform project need an oath with the following persmissions :
- integrations:actionFunction:edit
- integrations:actionFunction:view
- integrations:action:edit
- integrations:action:view
- integrations:action:add
- integrations:action:delete
- integrations:integration:view
- bridge:actions:view

Terraform credentials need to be set as env variable with GENESYSCLOUD_REGION, GENESYSCLOUD_OAUTHCLIENT_ID and GENESYSCLOUD_OAUTHCLIENT_SECRET.

# Terraform state management
State is managed in HCP Terraform through Terraform CLI.  
To run it locally, the following environment variables need to be set up :  
GENESYSCLOUD_OAUTHCLIENT_ID
GENESYSCLOUD_OAUTHCLIENT_SECRET
GENESYSCLOUD_REGION
TF_TOKEN_APP_TERRAFORM_IO
TF_CLOUD_ORGANIZATION
TF_WORKSPACE