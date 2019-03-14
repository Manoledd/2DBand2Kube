// Copyright (c) 2017, 2019, Oracle and/or its affiliates. All rights reserved.

variable "cluster_name1" {
  default = "Cluster1"
}

variable "cluster_name2" {
  default = "Cluster2"
}

variable "availability_domain" {
  default = 3
}

variable "cluster_options_add_ons_is_kubernetes_dashboard_enabled" {
  default = true
}

variable "cluster_options_add_ons_is_tiller_enabled" {
  default = true
}

variable "cluster_options_kubernetes_network_config_pods_cidr" {
  default = "10.1.0.0/16"
}

variable "cluster_options_kubernetes_network_config_services_cidr" {
  default = "10.2.0.0/16"
}

variable "node_pool_initial_node_labels_key" {
  default = "key"
}

variable "node_pool_initial_node_labels_value" {
  default = "value"
}

variable "node_pool_name" {
  default = "DorinPool"
}

variable "node_pool_node_image_name" {
  default = "Oracle-Linux-7.4"
}

variable "node_pool_node_shape" {
  default = "VM.Standard2.1"
}

variable "node_pool_quantity_per_subnet" {
  default = 2
}

variable "node_pool_ssh_public_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDOuBJgh6lTmQvQJ4BA3RCJdSmxRtmiXAQEEIP68/G4gF3XuZdKEYTFeputacmRq9yO5ZnNXgO9akdUgePpf8+CfFtveQxmN5xo3HVCDKxu/70lbMgeu7+wJzrMOlzj+a4zNq2j0Ww2VWMsisJ6eV3bJTnO/9VLGCOC8M9noaOlcKcLgIYy4aDM724MxFX2lgn7o6rVADHRxkvLEXPVqYT4syvYw+8OVSnNgE4MJLxaw8/2K0qp19YlQyiriIXfQpci3ThxwLjymYRPj+kjU1xIxv6qbFQzHR7ds0pSWp1U06cIoKPfCazU9hGWW8yIe/vzfTbWrt2DK6pLwBn/G0x3 sample"
}







variable "ssh_public_key" {}
variable "ssh_private_key" {}



# DBSystem specific 
variable "db_system_shape" {
  default = "VM.Standard2.1"
}

variable "cpu_core_count" {
  default = "2"
}

variable "db_edition" {
  default = "ENTERPRISE_EDITION"
}

variable "db_admin_password" {
  default = "BEstrO0ng_#12"
}

variable "db_name" {
  default = "Dorindb"
}

variable "db_name1" {
  default = "Dorindb1"
}

variable "db_version" {
  default = "12.1.0.2"
}

variable "db_home_display_name" {
  default = "DBHome"
}

variable "db_home_display_name1" {
  default = "DBHome1"
}

variable "db_disk_redundancy" {
  default = "HIGH"
}

variable "db_system_display_name" {
  default = "DBSystem"
}

variable "db_system_display_name1" {
  default = "DBSystem1"
}

variable "hostname" {
  default = "myoracledb"
}

variable "hostname1" {
  default = "myoracledb1"
}

variable "host_user_name" {
  default = "opc"
}

variable "n_character_set" {
  default = "AL16UTF16"
}

variable "character_set" {
  default = "AL32UTF8"
}

variable "db_workload" {
  default = "OLTP"
}

variable "pdb_name" {
  default = "pdbName"
}

variable "data_storage_size_in_gb" {
  default = "256"
}

variable "license_model" {
  default = "LICENSE_INCLUDED"
}
variable "node_count" {
  default = "1"
}

variable "data_storage_percentage" {
  default = "40"
}

variable "vcn_cidr" {
    default = "10.0.0.0/16"
}




variable "DBA2_subnet_cidr" {
    default = "10.0.1.0/24"
}
