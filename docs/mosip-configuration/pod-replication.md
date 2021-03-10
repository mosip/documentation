# Pod Replication

For production setups you may want to replicate pods more than the default replication factor of **1**. Upgrade `podconfig.yml` to the same file. A separate production file can be generated and pointed to from **`group vars/all.yml`** ``--&gt; `podconfig` file.

