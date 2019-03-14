// Copyright (c) 2017, 2019, Oracle and/or its affiliates. All rights reserved.
data "oci_identity_availability_domains" "ADs" {
  compartment_id = "${var.tenancy_ocid}"
}



resource "oci_core_virtual_network" "test_vcn" {
  cidr_block     = "10.0.0.0/16"
  compartment_id = "${var.compartment_ocid}"
  display_name   = "DorinVcnForClusters"
  defined_tags = {"BUCH_IaaS.PersonalLearning"="Dorin"}
}

resource "oci_core_internet_gateway" "test_ig" {
  compartment_id = "${var.compartment_ocid}"
  display_name   = "tfClusterInternetGateway"
  vcn_id         = "${oci_core_virtual_network.test_vcn.id}"
  defined_tags = {"BUCH_IaaS.PersonalLearning"="Dorin"}
}

resource "oci_core_route_table" "test_route_table" {
  compartment_id = "${var.compartment_ocid}"
  vcn_id         = "${oci_core_virtual_network.test_vcn.id}"
  display_name   = "DorinClustersRouteTable"
  defined_tags = {"BUCH_IaaS.PersonalLearning"="Dorin"}

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = "${oci_core_internet_gateway.test_ig.id}"
  }
}

resource "oci_core_subnet" "clusterSubnet_1" {
  #Required
  availability_domain = "${lookup(data.oci_identity_availability_domains.test_availability_domains.availability_domains[var.availability_domain - 2],"name")}"
  cidr_block          = "10.0.20.0/24"
  compartment_id      = "${var.compartment_ocid}"
  vcn_id              = "${oci_core_virtual_network.test_vcn.id}"
  defined_tags = {"BUCH_IaaS.PersonalLearning"="Dorin"}

  # Provider code tries to maintain compatibility with old versions.
  security_list_ids = ["${oci_core_virtual_network.test_vcn.default_security_list_id}"]
  display_name      = "DorinSubNet1ForClusters"
  route_table_id    = "${oci_core_route_table.test_route_table.id}"
}

resource "oci_core_subnet" "clusterSubnet_2" {
  #Required
  availability_domain = "${lookup(data.oci_identity_availability_domains.test_availability_domains.availability_domains[var.availability_domain -1],"name")}"
  cidr_block          = "10.0.21.0/24"
  compartment_id      = "${var.compartment_ocid}"
  vcn_id              = "${oci_core_virtual_network.test_vcn.id}"
  display_name        = "DorinSubNet2ForClusters"
  defined_tags = {"BUCH_IaaS.PersonalLearning"="Dorin"}

  # Provider code tries to maintain compatibility with old versions.
  security_list_ids = ["${oci_core_virtual_network.test_vcn.default_security_list_id}"]
  route_table_id    = "${oci_core_route_table.test_route_table.id}"
}


resource "oci_core_subnet" "nodePool_Subnet_1" {
  #Required
  availability_domain = "${lookup(data.oci_identity_availability_domains.test_availability_domains.availability_domains[var.availability_domain -2],"name")}"
  cidr_block          = "10.0.22.0/24"
  compartment_id      = "${var.compartment_ocid}"
  vcn_id              = "${oci_core_virtual_network.test_vcn.id}"
  defined_tags = {"BUCH_IaaS.PersonalLearning"="Dorin"}

  # Provider code tries to maintain compatibility with old versions.
  security_list_ids = ["${oci_core_virtual_network.test_vcn.default_security_list_id}"]
  display_name      = "DorinSubNet1ForNodePool"
  route_table_id    = "${oci_core_route_table.test_route_table.id}"
}

resource "oci_core_subnet" "nodePool_Subnet_2" {
  #Required
  availability_domain = "${lookup(data.oci_identity_availability_domains.test_availability_domains.availability_domains[var.availability_domain -1],"name")}"
  cidr_block          = "10.0.23.0/24"
  compartment_id      = "${var.compartment_ocid}"
  vcn_id              = "${oci_core_virtual_network.test_vcn.id}"
  defined_tags = {"BUCH_IaaS.PersonalLearning"="Dorin"}

  # Provider code tries to maintain compatibility with old versions.
  security_list_ids = ["${oci_core_virtual_network.test_vcn.default_security_list_id}"]
  display_name      = "DorinSubNet2ForNodePool"
  route_table_id    = "${oci_core_route_table.test_route_table.id}"
}

#define the internet gateway for the VCN
#define the route table 
resource "oci_core_route_table" "RouteFordorinVCN" {
    compartment_id = "${var.compartment_ocid}"
    vcn_id = "${oci_core_virtual_network.test_vcn.id}"
    display_name = "RouteForDorinVCN"
    defined_tags = {"BUCH_IaaS.PersonalLearning"="Dorin"}
}



resource "oci_core_subnet" "DBsubnet" {
  availability_domain = "${lookup(data.oci_identity_availability_domains.ADs.availability_domains[1],"name")}" 
  cidr_block = "${var.DBA2_subnet_cidr}"
  display_name = "DBsubnet"
  dns_label      = "DBexample"
  compartment_id = "${var.compartment_ocid}"
  vcn_id = "${oci_core_virtual_network.test_vcn.id}"
  route_table_id = "${oci_core_route_table.RouteFordorinVCN.id}"
  dhcp_options_id = "${oci_core_virtual_network.test_vcn.default_dhcp_options_id}"
  defined_tags = {"BUCH_IaaS.PersonalLearning"="Dorin"}
}

