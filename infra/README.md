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

### Servers

API Server:

- Location: Nuremberg;
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
- Cloud Init: contents of `k3s-server-01.ci.yaml`
- Name: k3s-server-01

Agents:

TBD

## Kubenetes

This applies to the `infra/` and `docmost/` folders specifically.

### Configs for remote management (e.g. kubectl, k9s)

The kube config can be retrieved by reading the file as root on the host:

```sh
ssh k3s-server-01 sudo cat /etc/rancher/k3s/k3s.yaml > k3s.yaml
```

Note:

- the above is also stored in keepass
- TODO: One day we should harden this, but we assume the cluster is disposable

### Kustomize pre-reqs

Binaries:

- sops: https://github.com/getsops/sops
- kustomize: https://kubectl.docs.kubernetes.io/installation/kustomize/
- ksops: https://github.com/viaduct-ai/kustomize-sops

The following curl runs do kustomize and ksops.

```bash
curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash
curl -s https://raw.githubusercontent.com/viaduct-ai/kustomize-sops/master/scripts/install-ksops-archive.sh | bash
``` 

> [!NOTE]
> You need to use the real kustomize, not the one bundled with `kubectl -k`

### Running Kustomize

Since we're using sops, kustomize needs some extra command line args.

```sh
kustomize build --enable-alpha-plugins --enable-exec"
```

Pro-tip: Add the following to a .bashrc or .zshrc

```sh
alias kb="kustomize build --enable-alpha-plugins --enable-exec"
```

This will kustomize to be run as follows:

```sh
# Get a diff of local changes vs. what's running in cluster
kb . | kubectl diff -f -
# Apply the changes
kb . | kubectl apply -f -
```

### SOPS

sops (Secret OPerationS) is used to encrypt the secrets in this repo at rest.

In order to access the encrypted files, you will need to ensure the `age`
private key is available in a path that [sops understands](https://github.com/getsops/sops?tab=readme-ov-file#encrypting-using-age).
This generally means ensuring the age key is in `~/.config/sops/age/keys.txt`.

The age key is available in the keepass.

### `infra/` Manifests

These should always be applied to a fresh cluster first.

### `docmost/` Manifests

All the manifests required to run docmost. This includes:

- postgres
- redis
- docmost itself
- gateway and httproutes for the routing
- certificates for HTTPS
