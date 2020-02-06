# docker_host_provisioner

This is an Ansible playbook used to provision remote hosts for Docker usage. It is based on **** of installing an environment suitable for running Docker images. It is meant to be an automated, faster alternative. Our dockerhost.sh script **** is another alternative.

## Different Environments

This playbook can be run in different environments, namely
* dev,
* test,
* and prod.

Several environment variables will be replaced in the playbook accordingly. You will need to specify your chosen environment when running this playbook (see *To run this playbook...*).

## Environment variables

To run this playbook, you will need to replace the following dummy variables:

#### inventory.yml

**HOST_NAME**: the name which will be used throughout the playbook, when referring to the remote host we are provisioning (eg.: sbx6). In the case of more than one remote hosts, more values need to be added according to the YAML syntax. **Make sure to use the correct environment group when adding a new host!**

**HOST_IP**: the IP address of the remote host we are provisioning.

#### master.yml

**HOST_NAME**: the same as above.

**USER_NAME**: the username you will be using when creating an SSH connection to the remote host. An SSH key will be needed for this user to make this connection. Make sure to add the public key to the user's authorized keys file.

#### group_vars/dev.yml

In this example, we are provisioning a development server, hence the name of the file. You will need to use the names "test" and "prod" for the test and production environments respectively (see *Different Environments*). Once the passwords are replaced it is recommended to encrypt this file with Ansible Vault.

## To run this playbook...

...you will need to run the following command in the repository's root directory:

```
ansible-playbook -i inventory.yml master.yml --key-file "/path/to/your/key/file/used/with/ansible"
```