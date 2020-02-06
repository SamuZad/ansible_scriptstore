# cicd_updater

This is an Ansible playbook that automates the update of any element of a CI/CD chain. It will check the remote host's for running CI/CD applications, and will prompt the user to choose the one to be updated. Afterwards the user will be prompted to enter the full image name of the image that will be used for the update. Ansible will pull the new image, stop the running container and start the new one instead.

## Environment variables

To run this playbook, you will need to replace the following dummy variables:

#### inventory.yml

**HOST_NAME**: the name which will be used throughout the playbook, when referring to the remote host we are provisioning (eg.: lnv100bld01).

**HOST_IP**: the IP address of the remote host we are provisioning.

#### master.yml

**HOST_NAME**: the same as above.

**USER_NAME**: the username you will be using when creating an SSH connection to the remote host. An SSH key will be needed for this user to make this connection. Make sure to add the public key to the user's authorized keys file.

## To run this playbook...

...you will need to run the following command in the repository's root directory:
```
ansible-playbook -i inventory.yml master.yml --key-file "/path/to/your/key/file/used/with/ansible"
```