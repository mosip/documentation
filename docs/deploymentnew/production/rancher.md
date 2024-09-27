# Administration Using Rancher

## Cluster administration

In V3 installation cluster can be administered by logging into organisation wide [Rancher setup](https://github.com/mosip/k8s-infra/tree/main/rancher). Rancher is integrated with Keycloak for authentication. To provide cluster access to a user perform the following steps as administrator:

1. Login into organisation wide Keycloak e.g `https://iam.xyz.net`. It is assumed that you have `admin` role in Keycloak.
2. Create a new user.
3. Make sure a strong password is set for the same under _Credentials_ tab.
4.  On _Details_ tab you should see _Update Password_ flag under _Required User Actions_. This will prompt a user to change the password during first login. Disable the same only if you are sure you don't want user to change password.

    ![](../../.gitbook/assets/keycloak-user-create.png)
5. Login to Rancher as administrator, e.g. `https://rancher.xyz.net`.
6. Select a cluster for which you would like to enable access to the user.
7. Add the user as member of the cluster.
8. Assign a role, e.g Cluster Owner, Cluster Viewer.
