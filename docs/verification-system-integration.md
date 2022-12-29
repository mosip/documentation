How to integrate with IdP - Relying Party Integration? {Developer Guide}
  What needs to be added on relying party website (guidelines)
    Need to provide the /authorize URL , explain all the query params passed to this authorize URL 
    Note: take the query params descriptions from stoplight
    https://mosip.stoplight.io/docs/identity-provider/branches/main/85f761d237115-authorization-endpoint
  How to get credentials or register for IdP
    Non-MOSIP deployment:
      https://mosip.stoplight.io/docs/identity-provider/branches/main/e5bf97e265109-create-oidc-client-endpoint
      https://mosip.stoplight.io/docs/identity-provider/branches/main/6081c36c68d08-update-oidc-client-endpoint
    MOSIP-deployment:
      In the mosip deployment, Auth partners are considered as relying parties, creating of oidc client under each auth-partner
      is provisioned. An auth-partner can have multiple oidc clients.
      Auth-partner's are mapped with one or more policies. Policy defines the registered/supported authentication factors and kyc attributes. 
      An oidc client is created for an auth-partner with a particular policy via pms portal.
      Pms portal, resolves the ACRs and user claims based on the mapped policy. 
      pms service internally calls client-mgmt apis of IDP-service and raises a websub event to IDA to create the client details respective databases.
      single point API to create/update OIDC client in IDP and IDA is 
      POST https://api-internal.dev.mosip.net/v1/partnermanager/oidc/client
      PUT https://api-internal.dev.mosip.net/v1/partnermanager/oidc/client
