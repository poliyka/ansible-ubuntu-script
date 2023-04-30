#! /bin/bash

ENV_FILE="ansible.env"

# 讀取 .env file
set -o allexport # enable all variable definitions to be exported
source <(sed -e "s/\r//" -e '/^#/d;/^\s*$/d' -e "s/'/'\\\''/g" -e "s/=\(.*\)/=\"\1\"/g" "${ENV_FILE}")
set +o allexport

# 確定 Ansible 指令是否存在
if ! command -v ansible-playbook
then
python3 -m pip install ansible
fi

# 安裝第三方模組
ansible-galaxy collection install community.general

# 執行 Ansible
ansible-playbook -i inventory playbook.yml --extra-vars "ansible_become_pass=${OE_PASSWORD}"
