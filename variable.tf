variable "compartment_id" {
    description = "the ocid of the compartment where to place the cluster"
    type        = string
}

variable "cluster_name" {
    description = "the name of the cluster"
    type        = string
}

variable "vcn_id" {
    description = "the id of the vcn"
    type        = string
}

variable "cluster_kubernetes_version" {
    description = "the version of the kubernetes"
}

variable "cluster_cluster_pod_network_options_cni_type" {
    description = "the cni used by this cluster"
    type = string
}

variable "defined_tags" {
    description = "about the metadata and specifies about the data"
    type = map(string)
    default = {
        "Operations.Costcenter" = "42"
    }
}

variable "cluster_endpoint_config_is_public_ip_enabled" {
    description = "specifies whether public ip is enabled"
    type = string
}

variable "cluster_endpoint_config_nsg_ids" {
    description = "specifies ids of network security group" 
    type = list(string)
}

variable "cluster_endpoint_config_subnet_id" {
    description = "the subnet id of thecluster"
    type = list(string)
}

variable "freeform_tags" {
    description = "defines the freeform tags"
    type = map(string)
    default = {"Environment" = "Dev"}
}

variable "image_policy_config_is_policy_enabled" {
    description = "specifies whether the image policy is enabled or not"
    type = bool
}

variable "kms_key_id" {
    description = "the kms key id which you used to verify whether the images are signed by approved source"
    type = string
}

variable "options_add_on_is_kubernetes_dashboard_enabled" {
    type = bool
    description = "gives info whether kubernetes dashboard is enabled or not"
}

variable "options_add_on_is_tiller_enabled" {
    description = "specifies whether tiller is enabled or not" 
    type = bool
}

variable "admission_controller_options_is_pod_security_enabled" {
    description = "specifies the status of pod security of admission controller"
    type = bool
}


variable "kubernetes_network_config_pods_cidr" {
    description = "the cidr block for kubernetes pods"
    type = list(string)
}

variable "kubernetes_network_config_services_cidr" {
    description = "the cidr block for kubernetes services"
    type = list(string)
}

variable "cluster_service_lb_subnet_ids" {
    description = "the subnet id of service load balancer"
    type = list(string)
}

variable "env" {
    description = "specifies the environment"
    type        = string
    default     = "dev"
}

# variable "node_pool_name" {
#     description = "specifies the name of the node pool"
#     type        = list(object({
#         name = string
#     }))
# }

variable "node_pool_node_shape" {
    description = "specifies the node shape"
    type        = string
}

variable "node_pool_initial_node_labels" {
    description = "list of key values assigned to the pair "
    type = list(object({
        key = string
        value = string
    }))
}

variable "node_pool_node_config_deatils" {
    type = list(object({
        placement_configs = object({
          availability_domain = string
          subnet_id = string
        })
      size = number
    }))
}

variable "node_pool_node_shape_config" {
    description = "the total amount of memory available to each node"
    type = list(object({
        memory_in_gbs = number
        ocpus = number
    }))
}

variable "node_pool_kubernetes_version" {
    description = "specifies the kubernetes version" 
    type = string
}

variable "node_pool_ssh_public_key" {
    description = "ssh public key on each node in the node pool"
    type = string
}

variable "node_pool_subnet_ids" {
    description = "the ocid of the subnet to place the nodes for the nodepool"
}

# variable "fingerprint" {}
# variable "user_ocid" {}
# variable "tenancy_ocid" {}
# variable "private_key" {}
# variable "region" {}