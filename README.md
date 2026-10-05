# Infra Governance (`synergyflow-labs/infra-governance`)

This repository is the Infrastructure-as-Code (IaC) control plane for the `@synergyflow-labs` GitHub organization.

## Architecture

* **Authentication**: Automated via GitHub App (`synergyflow-labs-tf-admin`) with scoped organization permissions.
* **Secrets Management**: Backed by [Doppler](https://doppler.com). Secrets are injected directly into runtime memory with zero hardcoded credentials.
* **Provisioning**: Terraform manages:
  * Application repositories (`api`, `web`)
  * Target environments (`development`, `staging`, `production`)
  * Read-only Doppler Service Tokens injected as environment secrets (`DOPPLER_TOKEN`)

## Usage

```bash
# Initialize Terraform
doppler run -- terraform init

# Review changes
doppler run -- terraform plan

# Apply changes
doppler run -- terraform apply
```
