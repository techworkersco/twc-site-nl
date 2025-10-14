# Techwerkers tf

Because managing cloud infra manually is error prone and easy to mess up.

## Pre-requisites

- `sops` installed (for decrypting .enc files)
- `age` key installed (see `../README.md`)
- `tofu` or `terraform` installed (recommend using `tenv` to manage tf versions)

## Running

Ensure the environment is set up:

```sh
sops decrypt tf.state.enc > tf.state
export TF_VAR_hcloud_token="$(sops decrypt tf.enc)"
```

Then run `tofu` or `terraform` as normal:

```sh
tofu plan
tofu apply
```

> [!WARNING]
> Remember to re-encrypt the state file and to commit it back to git!

```sh
sops encrypt --filename-override .enc tf.tfstate > tf.tfstate.enc
git add tf.state.enc
git commit -m "Updating latest tf state"
```

Note: The `tf.tfstate` file likely does not have any sensitive values, but #YouNeverKnow™.
