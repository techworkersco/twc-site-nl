resource "hcloud_ssh_key" "k3s_techwerkers" {
  name       = "k3s@techwerkers"
  public_key = file("../id_ed25519_techwerkers.pub")
}

# The main k3s server
resource "hcloud_server" "k3s-server-01" {
  name = "k3s-server-01"

  delete_protection  = true
  rebuild_protection = true

  image = "debian-13"

  server_type = "cx23"
  datacenter  = "nbg1-dc3"
  backups     = true
  keep_disk   = true

  public_net {
    ipv4_enabled = true
    ipv4         = hcloud_primary_ip.ipv4_k3s.id
    ipv6_enabled = true
    ipv6         = hcloud_primary_ip.ipv6_k3s.id
  }

  network {
    network_id = hcloud_network.vpc.id
    ip         = "10.0.0.2"
  }

  firewall_ids = [
    hcloud_firewall.http_traffic.id,
    hcloud_firewall.ssh.id,
    hcloud_firewall.k3s_api.id
  ]
  ignore_remote_firewall_ids = false

  # WARN: the cloudinit file needs editing
  # WARN: These trigger resource recreation - e.g. server go bang
  # user_data = file("../cloudinit/k3s-server.yaml")
  # ssh_keys = [
  #  hcloud_ssh_key.k3s_techwerkers.id
  # ]
}
