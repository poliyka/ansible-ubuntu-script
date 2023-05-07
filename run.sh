#! /bin/bash

ENV_FILE="ansible.env"

# 讀取 .env file
source $ENV_FILE
export PATH="$HOME/.local/bin:$PATH"

while read -r line; do
  if [ -n "$line" ]; then
    echo "${line%%=*}: ${line#*=}"
  fi
done < ansible.env > ./vars/env.yaml



# python3.8
sudo apt install python3.8 python3-setuptools -y
echo "1" | sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.8 1
sudo update-alternatives --config python
curl https://bootstrap.pypa.io/get-pip.py | python


# 確定 Ansible 指令是否存在
if ! command -v ansible-playbook
then
python -m pip install ansible
fi



# 安裝第三方模組
ansible-galaxy collection install community.general

# 執行 Ansible
ansible-playbook -i inventory playbook.yml --extra-vars "ansible_become_pass=${OE_PASSWORD}"

