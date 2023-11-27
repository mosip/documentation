# Partner organization name mismatch error

This document helps in addressing an error related to partner organization name mismatch.

**How do we handle this error**?

During the partner certificate renewal process, users may encounter an error message while uploading the partner certificate. 

```
KER-PCM-008 
Partner Organization Name not Matched.
```

The error code KER-PCM-008 indicates a partner organization name mismatch.

This error suggests that the organization name on the partner's certificate is different from the one originally registered with.

To resolve this issue, users need to manually update the `name` column in the `partner` table of the `mosip_pms` database with the new organization name from the fresh certificates.

After successfully uploading the partner certificate, it is important to restart the `partner-management-service` pod.

<<<image to be inserted>>
