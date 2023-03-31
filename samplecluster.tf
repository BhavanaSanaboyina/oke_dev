resource "oci_containerengine_cluster" "k8s_cluster" {
    compartment_id     = var.compartment_id
    name               = var.cluster_name
    kubernetes_version = var.cluster_kubernetes_version
    vcn_id             = var.vcn_id

    cluster_pod_network_options {
        cni_type = var.cluster_cluster_pod_network_options_cni_type
    }
    defined_tags = {"Operations.Costcenter"= "42"}
    endpoint_config {
        is_public_ip_enabled = var.cluster_endpoint_config_is_public_ip_enabled
        nsg_ids = var.cluster_endpoint_config_nsg_ids
        subnet_id = "$[var.cluster_endpoint_config_subnet_id]"
    }

    freeform_tags = {"Department" = "Finance"}
    image_policy_config {
        is_policy_enabled = var.image_policy_config_is_policy_enabled
    

        key_details {
        kms_key_id = var.kms_key_id
        }
    }

    kms_key_id = var.kms_key_id

    options {
        add_ons {
            is_kubernetes_dashboard_enabled = var.options_add_on_is_kubernetes_dashboard_enabled
            is_tiller_enabled = var.options_add_on_is_tiller_enabled
        }

        admission_controller_options {
            is_pod_security_policy_enabled = var.admission_controller_options_is_pod_security_enabled
        }

        kubernetes_network_config {
            pods_cidr = "$[var.kubernetes_network_config_pods_cidr]"
            services_cidr = "$[var.kubernetes_network_config_services_cidr]"
        }

        service_lb_subnet_ids = var.cluster_service_lb_subnet_ids
    }

}

resource "oci_containerengine_node_pool" "k8s_node_pool" {
    compartment_id = var.compartment_id
    cluster_id = oci_containerengine_cluster.k8s_cluster.id
    node_shape = var.node_pool_node_shape
    
    for_each = toset ( ["node_pool1", "node_pool2"] )
        name = each.key

    dynamic "initial_node_labels" {
        for_each = var.node_pool_initial_node_labels
        iterator = np
        content {
          key = np.value.key
          value = np.value.value
        }
    }

    dynamic "node_config_details" {
        for_each = var.node_pool_node_config_deatils
        iterator = nc_block
        content {
            placement_configs {
                availability_domain = nc_block.value.availability_domain
                subnet_id = nc_block.value.subnet_id
            }
            size = nc_block.value.size
        }   
    }
    
    dynamic "node_shape_config" {
        for_each = var.node_pool_node_shape_config
        iterator = ns_block
        content {
            memory_in_gbs = ns_block.value.memory_in_gbs
            ocpus = ns_block.value.ocpus
        }
    }
    
    ssh_public_key = var.node_pool_ssh_public_key
    subnet_ids = var.node_pool_subnet_ids
    kubernetes_version =var.node_pool_kubernetes_version
}

