resource "hcloud_firewall" "k3s_api" {
  name = "k3s-api"

  rule {
    direction   = "in"
    protocol    = "tcp"
    port        = "6443"
    description = "K3s API Server"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }
}

resource "hcloud_firewall" "http_traffic" {
  name = "http-traffic"

  rule {
    direction   = "in"
    protocol    = "tcp"
    port        = "80"
    description = "HTTP"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

  rule {
    direction   = "in"
    protocol    = "tcp"
    port        = "443"
    description = "HTTPS"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }
}

resource "hcloud_firewall" "ssh" {
  name = "ssh"

  rule {
    direction   = "in"
    protocol    = "tcp"
    port        = "22"
    description = "SSH"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

  rule {
    direction   = "in"
    protocol    = "icmp"
    description = "PING"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }
}
