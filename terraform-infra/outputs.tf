output "master_external_ip" {
  description = "External IP of the Kubernetes master node"
  value       = yandex_compute_instance.k8s-master[*].network_interface[0].nat_ip_address
}

output "worker_external_ips" {
  description = "External IPs of the Kubernetes worker nodes"
  value       = yandex_compute_instance.k8s-worker[*].network_interface[0].nat_ip_address
}