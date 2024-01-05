
### Optional Steps

1. Ensure that the datashare property is properly configured in the abis policy for the domain. Please refer to this [link](upgrade-new-datashare-properties.md) for more detailed information.

2. Remove any unnecessary roles for clients and users.

3. When the admin portal becomes accessible, the admin user should generate the master keys that have been recently added to the `key_policy_def` table. This can be done using the admin UI master key generation page (Keymanager) for the `ADMIN_SERVICES` and `RESIDENT` roles. Only proceed with this step if the corresponding entries are not already available in the `key_alias` table of keymanager. For more detailed instructions, please consult the provided [document](https://docs.mosip.io/1.2.0/modules/administration/admin-portal-user-guide#generatemasterkey).
