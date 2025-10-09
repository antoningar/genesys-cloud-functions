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

# Terraform state management
State is managed by Terraform Cloud.  
Plan is done when a PR is created.  
Apply is done when a merge is done on main branch.

