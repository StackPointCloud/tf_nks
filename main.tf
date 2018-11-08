provider "nks" {
  /* Set environment variable NKS_API_TOKEN with your API token from NKS
     Set environment variable NKS_BASE_API_URL with API endpoint */
}

data "nks_organization" "default" {
  name = "${var.organization_name}"
}

data "nks_keyset" "provider_keyset" {
  category = "provider"
  entity = "${var.provider_code}"
  name = "${var.provider_keyset_name}"
}

data "nks_keyset" "ssh_keyset" {
  count = "${var.ssh_keyset_name == "" ? 0 : 1}"
  org_id = "${data.nks_organization.default.id}"
  category = "user_ssh"
  name = "${var.ssh_keyset_name}"
}


resource "nks_keyset" "ssh_keyset" {
  count = "${var.ssh_key_path == "" ? 0 : 1}"
  name     = "${var.cluster_name} SHH Key"
  org_id   = "${data.nks_organization.default.id}"
  category = "user_ssh"
  entity   = "aws"

  keys = [
    {
      key_type = "pub"
      key      = "${file(var.ssh_key_path)}"
    },
  ]
}


data "nks_instance_specs" "master_specs" {
  provider_code = "${var.provider_code}"
  node_size     = "${var.master_size}"
}

data "nks_instance_specs" "worker_specs" {
  provider_code = "${var.provider_code}"
  node_size     = "${var.worker_size}"
}

resource "nks_cluster" "cluster" {
  org_id                = "${data.nks_organization.default.id}"
  cluster_name          = "${var.cluster_name}"
  provider_code         = "${var.provider_code}"
  provider_keyset       = "${data.nks_keyset.provider_keyset.id}"
  region                = "${var.region}"
  k8s_version           = "${var.k8s_version}"
  startup_master_size   = "${data.nks_instance_specs.master_specs.node_size}"
  startup_worker_count  = "${var.worker_count}"
  startup_worker_size   = "${data.nks_instance_specs.worker_specs.node_size}"
  zone                  = "${var.zone}"
  provider_network_cidr = "${var.network_cidr}"
  provider_subnet_cidr  = "${var.subnet_cidr}"
  rbac_enabled          = true
  dashboard_enabled     = true
  etcd_type             = "classic"
  platform              = "${var.platform}"
  channel               = "stable"
  project_id            = "${var.project_id}"
  ssh_keyset            = "${var.ssh_key_path == "" ? data.nks_keyset.ssh_keyset.id : nks_keyset.ssh_keyset.id}"
}

resource "local_file" "kubeconfig" {
  content  = "${nks_cluster.cluster.kubeconfig}"
  filename = "${var.kubeconfig_path}"
}
