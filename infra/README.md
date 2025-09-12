# Techwerkers Infra

This whole doc is intended for people with infra knowledge. Doing any
operations in this doc is likely to require access to keepass. Access is
generally restricted unless absolutely necessary.

## SSH Key

Key was generated as follows (in keepass)

```sh
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519_techwerkers -C k3s@techwerkers
```

The above ssh key is available in the keepass.

It is generally recommended to write the `ssh_config` to your ssh config to
make SSH'ing into the host easier.

```sh
cat ssh_config >> ~/.ssh/config
```

## Hetzner

We are using Hetzner Cloud servers to host some small machines to run
kubernetes (specifically k3s).

### Networks, firewalls, etc.

Networks:

```yaml
- vpc: 10.0.0.0/16
  zone: eu-central
```

Firewalls:

```yaml
- name: ssh
  inbound:
  - source: Any IPv4, Any IPv6
    protocol: tcp
    port: 22
  - source: Any IPv4, Any IPv6
    protocol: icmp
- name: http-traffic
  inbound:
  - source: Any IPv4, Any IPv6
    protocol: tcp
    port: 80
  - source: Any IPv4, Any IPv6
    protocol: tcp
    port: 443
- name: k3s-api
  inbound:
  - source: Any IPv4, Any IPv6
    protocol: tcp
    port: 6443
```

TODO: Move the above to the terraform provider.

### Servers

Cloud init: `cloudinit/k3s-server.yaml`

**API Server:**

- Location: Nuremberg
- Image: Debian 13
- Type: Shared vCPU
  - Arch: x86 (Intel/AMD)
  - CX22
- Networking:
  - Public IPv4: 167.235.136.141
  - Public IPv6
  - Private networks: vpc
- SSH Keys:
  - k3s@techwerkers
- Firewalls:
  - ssh
  - http-traffic
  - k3s-api
- Backups: true
- Cloud Init: contents of `k3s-server.cloudinit.yaml`
- Name: k3s-server-[number]

Command:

```sh
hcloud server create \
  --datacenter nbg1-dc3 \
  --type cx22 \
  --image debian-13 \
  --primary-ipv4 techwerkers-k8s \
  --enable-backup \
  --firewall http-traffic \
  --firewall ssh \
  --firewall k3s-api \
  --network vpc \
  --ssh-key "k3s@techwerkers" \
  --user-data-from-file cloudinit/k3s-agent.yaml \
  --name k3s-server-[number]
```

**Agents:**

Cloud init: `cloudinit/k3s-agent.yaml`

- Location: Nuremberg
- Image: Debian 13
- Type: Shared vCPU
  - Arch: x86 (Intel/AMD)
  - CX22
- Networking:
  - Public IPv4: None
  - Public IPv6: None
  - Private networks: vpc
- SSH Keys:
  - k3s@techwerkers
- Backups: true
- Cloud Init: contents of `k3s-agent.cloudinit.yaml`
- Name: k3s-agent-[number]

Command:

```sh
hcloud server create \
  --datacenter nbg1-dc3 \
  --type cx22 \
  --image debian-13 \
  --network vpc \
  --ssh-key "k3s@techwerkers" \
  --without-ipv4 \
  --without-ipv6 \
  --user-data-from-file cloudinit/k3s-agent.yaml \
  --name k3s-agent-[number]
```

## Kubernetes Manifests

A number of kubernetes manifests are provided in the `manifests` directory
All information in the `manifests` directory. A readme is avaialble there.
