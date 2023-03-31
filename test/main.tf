terraform {
    required_providers {
        oci = {
            source = "hashicorp/oci"
        }
    }
}

provider "oci" {
    auth = "InstancePrincipal"
    region = "US-ashburn-1"
}

module "oracle_k8s_engine" {
    source = "../OKE"

    env  = var.env
    compartment_id = var.compartment_id
    cluster_name   = var.cluster_name
    cluster_kubernetes_version = var.cluster_kubernetes_version
    vcn_id  = var.vcn_id
    cluster_cluster_pod_network_options_cni_type = var.cluster_cluster_pod_network_options_cni_type
    cluster_endpoint_config_is_public_ip_enabled = var.cluster_endpoint_config_is_public_ip_enabled
    cluster_endpoint_config_nsg_ids    = var.cluster_endpoint_config_nsg_ids
    cluster_endpoint_config_subnet_id = var.cluster_endpoint_config_subnet_id
    image_policy_config_is_policy_enabled = var.image_policy_config_is_policy_enabled
    kms_key_id    = var.kms_key_id
    defined_tags  = {"Operations.Costcenter" = "42"}
    freeform_tags = {"Environment" = "Dev"}
    options_add_on_is_kubernetes_dashboard_enabled = var.options_add_on_is_kubernetes_dashboard_enabled
    options_add_on_is_tiller_enabled = var.options_add_on_is_tiller_enabled
    admission_controller_options_is_pod_security_enabled = var.admission_controller_options_is_pod_security_enabled
    kubernetes_network_config_pods_cidr     = var.kubernetes_network_config_pods_cidr
    kubernetes_network_config_services_cidr = var.kubernetes_network_config_services_cidr
    cluster_service_lb_subnet_ids = var.cluster_service_lb_subnet_ids
    name = each.key
    node_pool_node_shape = var.node_pool_node_shape
    node_pool_initial_node_labels= var.node_pool_initial_node_labels
    node_pool_kubernetes_version  = var.node_pool_kubernetes_version
    node_pool_node_config_deatils = var.node_pool_node_config_deatils
    node_pool_size = var.node_pool_size
    node_pool_node_shape_config = var.node_pool_node_shape_config
    node_pool_ssh_public_key = var.node_pool_ssh_public_key
    node_pool_subnet_ids     = var.node_pool_subnet_ids
}
