# Jenkins Node Creator Playbook

This is an Ansbile playbook used to install Jenkins worker nodes. It was created as an automated alternative to manually building worker nodes as described in ****.

## Necessary Files

**id_rsa.pub**: you will need the public key used by Jenkins for this playbook to work. You must include this file inside the "files" folder under the node_creator role.

## Environment Variables

To run this playbook, you will need to replace the following dummy variables:

#### inventory.yml

**IP_ADDRESS**: the IP address of the remote host Jenkins is running on.

#### master.yml

**USER_NAME**: the username you will be using when creating an SSH connection to the remote host. An SSH key will be needed for this user to make this connection. Make sure to add the public key to the user's authorized keys file.

**NODE_NAME**: the name of the worker node you are creating. You will be prompted to verify this variable, before any changes will be made.

**PROXY_INFO**: the list of all websites the container should connect to without the use of the company proxy.

**IMAGE_NAME**: the name of the Docker image the worker node will be using.

**ADDITIONAL_LINES**: in some cases additional arguments might be required for the container to run properly (see run.sh for reference).

## To run this playbook...

...you will need to run the following command in the repository's root directory:

```
ansible-playbook -i inventory.yml master.yml --key-file "/path/to/your/key/file/used/with/ansible"
```

# Keep in mind...

...that you will still need to add the worker node to Jenkins through the GUI. ****.