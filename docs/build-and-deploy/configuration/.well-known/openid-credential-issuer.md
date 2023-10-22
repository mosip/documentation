# openid-credential-issuer



```json
{
  'credential_issuer': '${mosip.esignet.vci.identifier}',
  'credential_endpoint': '${mosipbox.public.url}${server.servlet.path}/vci/credential',
  'credentials_supported': {
    'format': 'ldp_vc',
    'id': 'SampleVerifiableCredential_ldp',
    'scope': 'sample_vc_ldp',
    'cryptographic_binding_methods_supported': {'did:jwk'},
    'cryptographic_suites_supported': {'RsaSignature2018'},
    'proof_types_supported': {'jwt'},
    'credential_definition': {
      'type': {'VerifiableCredential'},
      'credentialSubject': {
        'name': {'display': [{'name': 'Given Name', 'locale': 'en'}]},
        'age': {'display': [{'name': 'Age', 'locale': 'en'}]}
      }
    },
    'display': {
      'name': 'Sample Verifiable Credential by e-Signet',
      'locale': 'en',
      'logo': {
        'url': '${mosipbox.public.url}/logo.png',
        'alt_text': 'a square logo of a MOSIP'
      },
      'background_color': '#12107c',
      'text_color': '#FFFFFF'
    }
  },
  'display': {
    'name': 'e-Signet',
    'locale': 'en'
  }
}
```
