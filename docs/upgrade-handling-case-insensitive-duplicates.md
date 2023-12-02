# Handling case insensitive duplicates user detail table

In the registration processor, there was an issue where packets were failing at the supervisor validation stage when the username of the supervisor was entered in a different case than it appeared in the database. To resolve this issue, a case insensitive search will be implemented to retrieve the username of the supervisor during the validation stage.

In order for this fix to work properly, it is necessary for the `user_id` column of the `user_details` table in the master database to not contain any case insensitive duplicates.

If there are any duplicates in this table, packets will fail at the supervisor validation stage once again. Therefore, it is important to deactivate or delete these case insensitive duplicates. It should be noted that this action will not have any impact on other areas, as the mapping between keycloak users and the `user_id` of the `user_details` table is one-to-one and case insensitive.

## How can we identify case-insensitive duplicates in the user_id column of the user_details table?

Follow these steps:

1. Log in to the master schema of the mosip_master database.

2. Open a query tool.

3. Execute the following SQL command in the query tool:

   ```
   SELECT lowerid, cnt from (SELECT count(*) as cnt,LOWER(id) as lowerid FROM master.user_detail group by lowerid) t1 where cnt>1 ;
   ```

   Make sure to copy the output to a text file to manage the duplicate data effectively.

## How to deactivate/ delete the case insensitive duplicates?

1. Login in to the [admin portal](https://docs.mosip.io/1.2.0/modules/administration/admin-portal-user-guide) with a user having `ZONAL_ADMIN` role.

2. On the left pane, click on `Resources` in the side-menu.

   ![](\_images/upgrade-hcid1.jpg)

3. Select `User Center Mapping` under Resources in the side-menu.

    ![](\_images/upgrade-hcid2.jpg)

4. Click **Filter** on the `User Center Mapping` page.

   ![](\_images/upgrade-hcid3.jpg)

5. Enter the `user_id` that was retrieved from the database and copied into the text file. After entering the `user_id`, click on the **Apply** button.

    ![](\_images/upgrade-hcid4.jpg)

   * Now, on the User Center Mapping page, case insensitive duplicates of `user_id` would be displayed. 

   * Based on the Center, choose the entry that can be deactivated/deleted.

   * Now click on the ellipsis of the selected entry.
  
   ![](\_images/upgrade-hcid5.jpg)

6. Select the appropriate action (Delete/Deactivate) on that entry.

    ![](\_images/upgrade-hcid6.jpg)


