# NKS module for Terraform

## Requirements

* Terraform 0.11.0 or greater
* Existing NKS organization
* Existing NKS provider keysets
* Existing NKS SSH keyset

## Usage

Create a Terraform config file. For example, `main.tf`.

```
module "aws_cluster" {
  source = "github.com/StackPointCloud/tf_nks"

  provider_code = "aws"
  cluster_name = "My Test Cluster"
  provider_keyset_name = "My AWS Keyset Name"
  ssh_keyset_name = "My SSH Keyset Name"
  kubeconfig_path = "./kubeconfig-aws"

  region = "us-east-2"
  zone = "us-east-2a"
  master_size = "t2.medium"
  worker_size = "t2.medium"
}

resource "nks_solution" "aws_istio" {
  org_id     = "${module.aws_cluster.org_id}"
  cluster_id = "${module.aws_cluster.cluster_id}"
  solution   = "istio"
}
```

Here is an example using Azure.

```
module "azure_cluster" {
  source = "github.com/StackPointCloud/tf_nks"

  provider_code = "azure"
  cluster_name = "My Test Cluster"
  provider_keyset_name = "My Azure Keyset"
  ssh_keyset_name = "My SSH Keyset"
  kubeconfig_path = "./kubeconfig-azure"

  region = "eastus"
  master_size = "standard_f2"
  worker_size = "standard_f2"
}
```

Initialize and run Terraform:

```
terraform init
terraform plan
terraform apply
```

## Todo

* Document available module variables
* Added GCE support
* Allow SSH keys to be auto-generated through TF and imported as a keyset
* Allow existing local SSH keys to be imported as a keyset
* Allow user specified organization rather than assume the default
* Allow provider credentials to be imported as keysets
* Further testing...
