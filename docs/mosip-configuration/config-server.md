# Config Server



_**Config server**_ is one of the more popular centralized configuration servers used in a micro service-based application. For all modules, configurations are defined through property files located in the GitHub repository. For example, for this sandbox, the properties are located within the sandbox folder at [https://github.com/mosip/mosip-config](https://github.com/mosip/mosip-config).

You can have a repository of your own with a folder containing files for properties. On GitHub, the repo will be private. In group **`vars/all.yml`**, configure the following parameters as below \(example\):

```text
config_repo:
  git_repo_uri: https://github.com/mosip/mosip-config
  version: 1.1.2
  private: false
  username: <your github username>
  search_folders: sandbox
  local_git_repo:
    enabled: false
```

If private: true, then, in **`group vars/all.yml`**, update your GitHub username as above. Please change the password to **`secrets.yml`**:

```text
config_repo:
    password: {YOUR GITHUB PASSWORD}
```

The repo is cloned to the NFS mounted folder if local git repo is allowed, and the config server pulls the properties locally. This option is useful if the sandbox is secured without access to the Internet. You should search git-in locally for any changes. Remember, however, that you will have to push them manually if you want the changes to be reflects in the parent GitHub repo. When making improvements to the configuration repo, there is no need to restart the _config-server pod_.

If you have updated the default passwords in **`secrets.yml`**, create these password ciphers and update the changed password property files. After the config server is up, the ciphers can be created from the console machine using the following curl command:

```text
$  curl http://mzworker0.sb:30080/config/encrypt -d  <string to be encrypted>
```

The above command connects via input to the Config server pod of the MZ cluster. You may also use the script to encrypt all the secrets at once by the following methods:

```text
Context:
```

Several secrets are required in Ansible's **`secrets.yml`** in the config server property files. We use config server encryption to encrypt the secrets in order to prevent explicit text secrets in properties using the following command:

```text
curl http://mzworker0.sb:30080/config/encrypt -d  <string to be encrypted>
```

The script here converts all secrets in **`secrets.yml`** using above command implemented in Python.

**Prerequisites:**

* Install required modules using

  ```text
  $ ./preinstall.sh
  ```

* Ensure config server is running

  ```text
  Config
  ```

* Set the server URL in `config.py`
* If the URL has an HTTPS certificate and the SSL server is self-signed, set 

  ```text
    ssl verify=False
  ```

* Run the following command:

  ```text
  $ ./convert.py {secrets_file_path}
  ```

  In this sandbox **`secrets_file_path`** is **`/home/mosipuser/mosip-infra/deployment/sandbox-v2/secrets.yml`**

  Output is saved in **`out.yaml`**.

