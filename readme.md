

## Packer Windows Setup


Automatically create a windows VM preconfigured with:
- debloated software and privacy enforced
- WinRM management configured (insecure)
- Some common software installs 

### Commands 


To pack the windows machine in one go

On MacOS we need the variable `export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES` which is added to the _ansible_play.sh_ file

```shell
packer build --var-file vars.pkrvars.hcl  .
```

To use ansible directly on a different VM, adjust the username / password / connection type :

```shell
# on macos fix winrm (https://github.com/ansible/ansible/issues/76322)
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

ansible-playbook -i IP, ansible/site.yml
# or with GH fetched ssh key
ansible-playbook -i IP, ansible/site.yml -e "github_user=MYGHUSERNAME"
```

### SSH
Ansible vars:
- github_user - GH user for ssh key fetching
- ssh_key_path - local ssh public key path to copy remotely (defaults to ~/.ssh/id_rsa.pub)