# cert_updater

# Jenkins Node Creator Playbook

This is an Ansbile playbook used to update certificates on remote hosts. It was created as an automated alternative to manual updating, as described in *****.

## Necessary Files

You will need to include the certificates inside the "files" folder under the cert_updater role. Again, read ****  on this subject.

## Environment Variables

To run this playbook, you will need to replace the following dummy variables:

#### master.yml

**HOST_NAME**: the name which will be used throughout the playbook, when referring to the remote host we are provisioning (eg.: sbx6). In the case of more than one remote hosts, more values need to be added according to the YAML syntax.

**USER_NAME**: the username you will be using when creating an SSH connection to the remote host. An SSH key will be needed for this user to make this connection. Make sure to add the public key to the user's authorized keys file.

#### inventory.yml

**HOST_IP**: the IP address of the remote host we are provisioning.

## To run this playbook...

...you will need to run the following command in the repository's root directory:
```
ansible-playbook -i inventory.yml master.yml --key-file "/path/to/your/key/file/used/with/ansible"
```