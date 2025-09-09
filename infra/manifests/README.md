# Techwerkers Kubernetes Manifests

## Configs for remote management (e.g. kubectl, k9s)

The kube config can be retrieved by reading the file as root on the host:

```sh
ssh k3s-server-01 sudo cat /etc/rancher/k3s/k3s.yaml > k3s.yaml
```

Note:

- the above is also stored in keepass
- TODO: One day we should harden this, but we assume the cluster is disposable

## Kustomize pre-reqs

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

## Running Kustomize

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

## SOPS

sops (Secret OPerationS) is used to encrypt the secrets in this repo at rest.

In order to access the encrypted files, you will need to ensure the `age`
private key is available in a path that [sops understands](https://github.com/getsops/sops?tab=readme-ov-file#encrypting-using-age).
This generally means ensuring the age key is in `~/.config/sops/age/keys.txt`.

The age key is available in the keepass.

## Manifest directories

### `infra/`

These should always be applied to a fresh cluster first.

### `docmost/`

All the manifests required to run docmost. This includes:

- postgres
- redis
- docmost itself
- gateway and httproutes for the routing
- certificates for HTTPS
