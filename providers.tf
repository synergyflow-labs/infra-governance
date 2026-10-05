terraform {
  required_version = ">= 1.5.0"
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
    doppler = {
      source  = "dopplerhq/doppler"
      version = "~> 1.13.0"
    }
  }
}

# Automatically authenticates via GITHUB_APP_ID, GITHUB_APP_INSTALLATION_ID, and GITHUB_APP_PEM_FILE
provider "github" {
  owner = "synergyflow-labs"
  app_auth {}
}

# Automatically authenticates via DOPPLER_TOKEN
provider "doppler" {}
