output "org_id" {
  value = "${data.nks_organization.default.id}"
}

output "cluster_id" {
  value = "${nks_cluster.cluster.id}"
}

output "network_id" {
  value = "${nks_cluster.cluster.provider_network_id}"
}

output "network_cidr" {
  value = "${nks_cluster.cluster.provider_network_cidr}"
}

output "subnet_id" {
  value = "${nks_cluster.cluster.provider_subnet_id}"
}

output "subnet_cidr" {
  value = "${nks_cluster.cluster.provider_subnet_cidr}"
}

output "nodes" {
  value = "${nks_cluster.cluster.nodes}"
}

output "kubeconfig" {
  value = "${nks_cluster.cluster.kubeconfig}"
}
