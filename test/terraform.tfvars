compartment_id = ""
cluster_kubernetes_version = ""
cluster_name  = "OKE cluster"
vcn_id = ""
cluster_cluster_pod_network_options_cni_type = ""
cluster_endpoint_config_is_public_ip_enabled = "false"
cluster_endpoint_config_nsg_ids = [""]
cluster_endpoint_config_subnet_id = [""]
image_policy_config_is_policy_enabled = "true"
kms_key_id = ""
options_add_on_is_kubernetes_dashboard_enabled = "true"
options_add_on_is_tiller_enabled = "false"
admission_controller_options_is_pod_security_enabled = ""
kubernetes_network_config_pods_cidr = ["10.196.0.0/16","10.197.0.0/16"]
kubernetes_network_config_services_cidr = ["10.244.0.0/16","10.245.0.0/16"]
cluster_service_lb_subnet_ids = ""
region = "US-east"
env    = "dev"
name = each.key
node_pool_node_shape = ""
node_pool_initial_node_labels = [{key = "name1", value = "np1"},{key = "name2", value = "np2"}]
node_pool_node_config_deatils = [{availability_domain = "", subnet_id = ""}, {size = "3"}]
node_pool_node_shape_config = [{memory_in_gbs = "5", ocpus = "2"},{memory_in_gbs = "4", ocpus = "3"}]
node_pool_ssh_public_key = ""
node_pool_subnet_ids = ""