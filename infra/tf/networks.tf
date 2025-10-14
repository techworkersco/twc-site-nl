resource "hcloud_network" "vpc" {
  name     = "vpc"
  ip_range = "10.0.0.0/16" # 65534 usable IPs
}

resource "hcloud_network_subnet" "eu_central-vms" {
  network_id   = hcloud_network.vpc.id
  type         = "cloud"
  network_zone = "eu-central"
  ip_range     = "10.0.0.0/24" # 254 usable IPs
}

resource "hcloud_primary_ip" "ipv4_k3s" {
  name              = "techwerkers-k8s-v4"
  datacenter        = "nbg1-dc3"
  type              = "ipv4"
  assignee_type     = "server"
  delete_protection = true
  auto_delete       = false
}

resource "hcloud_primary_ip" "ipv6_k3s" {
  name              = "techwerkers-k8s-v6"
  datacenter        = "nbg1-dc3"
  type              = "ipv6"
  assignee_type     = "server"
  delete_protection = true
  auto_delete       = false
}
