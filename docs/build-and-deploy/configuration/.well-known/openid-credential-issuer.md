# openid-credential-issuer

eSignet's `openid-credential-issuer` well-known endpoint holds the map which is exactly the same as the [openid-credential-issuer](https://openid.github.io/OpenID4VCI/openid-4-verifiable-credential-issuance-wg-draft.html#name-credential-issuer-metadata) well-known specifications.

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
    'name': 'eSignet',
    'locale': 'en'
  }
}
```

* `credential_issuer`: The identifier of the credential issuer. The value comes from the configuration property `mosip.esignet.vci.identifier`.
* `credential_endpoint`: The URL where the verifiable credential can be obtained.
* `credentials_supported`: An object representing the supported credentials.
* `format`: The format of the supported credentials. Today eSignet supports the value: '`ldp_vc`', indicating Linked Data Proof Verifiable Credentials.
* `id`: The identifier of the sample verifiable credential. Today eSignet supports the value:  '`SampleVerifiableCredential_ldp`'.
* `scope`: The scope of the sample verifiable credential. Today eSignet supports the value: '`sample_vc_ldp`'.
* `cryptographic_binding_methods_supported`: The supported cryptographic binding methods. Today eSignet only supports the `did:jwk` method.
* `cryptographic_suites_supported`: The supported cryptographic suites. In this case, the value is {'`RsaSignature2018`'}, indicating that only the RsaSignature2018 suite is supported.
* `proof_types_supported`: The supported proof types. In this case, the value is {'jwt'}, indicating that only JWT-based proofs are supported.
* `credential_definition`: An object representing the definition of the sample verifiable credential.
* `type`: The type of the verifiable credential. The value is {'VerifiableCredential'}.
* `credentialSubject`: An object representing the subject of the verifiable credential.
* `name`: An object representing the name of the subject. The value is {'display': \[{'name': 'Given Name', 'locale': 'en'}]}.
* `age`: An object representing the age of the subject. The value is {'display': \[{'name': 'Age', 'locale': 'en'}]}.
* `display`: An object representing the display information of the sample verifiable credential.
* `name`: The name of the sample verifiable credential. The value is 'Sample Verifiable Credential by eSignet'.
* `locale`: The locale of the display information. The value is 'en'.
* `logo`: An object representing the logo of the verifiable credential.
* `url`: The URL of the logo.
* `alt_text`: The alternative text for the logo. The value is 'a square logo of a MOSIP'.
* `background_color`: The background colour of the verifiable credential. The value is '#12107c'.
* `text_color`: The text colour of the verifiable credential. The value is '#FFFFFF'.
* `display`: An object representing the display information of the eSignet.
* `name`: The name of the eSignet. The value is 'eSignet'.
* `locale`: The locale of the display information. The value is 'en'.
