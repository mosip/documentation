# Secrets

All secrets are stored in **`secrets.yml`**. Edit the file and change all of the passwords for a secure Sandbox. For creation and testing, defaults will be used, but be aware that the sandbox will not be secure with defaults. In order to edit **`secrets.yml`**.

```text
$ av edit secrets.yml
```

If you update PostGres passwords, you will need to update their ciphers in the property files. See the section below on Config Server. To be able to find out the text password, all the passwords used **`in. properties`** were added to **`secrets.yml`**- some of them for purely informational purposes.

_**Caution**_ : Make sure that **`secrets.yml`** is updated when you change any password _**`in. properties`**_.

