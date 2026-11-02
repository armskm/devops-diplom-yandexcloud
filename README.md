# Дипломный практикум в Yandex.Cloud




```bash
# настройка kubespray
git clone https://github.com/kubernetes-sigs/kubespray
cd kubespray
python3.12 -m venv .venv
.venv/bin/pip install --upgrade pip
.venv/bin/pip install -r requirements.txt


.venv/bin/ansible-playbook -u ubuntu -i /root/diplom/terraform-infra/ansible/inventory.ini cluster.yml -b -v


```




## Тестовое приложение

armskm/my-diplom-app:v1
https://hub.docker.com/repository/docker/armskm/my-diplom-app/general

https://github.com/armskm/my-diplom-app