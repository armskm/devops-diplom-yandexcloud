### Generate Ansible inventory from Terraform outputs

resource "local_file" "ansible_inventory" {
  content = <<-EOF
    [all]
    master-1 ansible_host=${yandex_compute_instance.k8s-master[0].network_interface[0].nat_ip_address} ansible_user=ubuntu ansible_ssh_private_key_file=/root/.ssh/id_rsa
    node-1 ansible_host=${yandex_compute_instance.k8s-worker[0].network_interface[0].nat_ip_address} ansible_user=ubuntu ansible_ssh_private_key_file=/root/.ssh/id_rsa
    node-2 ansible_host=${yandex_compute_instance.k8s-worker[1].network_interface[0].nat_ip_address} ansible_user=ubuntu ansible_ssh_private_key_file=/root/.ssh/id_rsa

    [kube_control_plane]
    master-1

    [etcd]
    master-1

    [kube_node]
    node-1
    node-2

    [calico_rr]

    [k8s_cluster:children]
    kube_control_plane
    kube_node
    calico_rr

  EOF
  filename = "${path.module}/ansible/inventory.ini"
}