sudo apt update -y && sudo apt upgrade -y
sudo apt install -y ansible
ansible-playbook task.yml --ask-become-pass
