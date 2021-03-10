# Master Data

Before you start installing the sandbox, load country-specific master data:

* Ensure the Master Data **`.csv`** files are available in a folder, say **`my_dml`**
* Add the following line in **`group_vars/all.yml`** ``-&gt; **databases** -&gt; **`mosip_master`**

  ```text
        mosip_master:
        sql_path: '{{repos.commons.dest}}/db_scripts'
        dml: 'my_dml/'
  ```

