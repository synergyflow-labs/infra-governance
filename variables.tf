locals {
  app_repos = toset(["api", "web"])

  environments = {
    development = "dev"
    staging     = "stg"
    production  = "prd"
  }

  matrix = merge([
    for repo in local.app_repos : {
      for env_name, dop_slug in local.environments :
      "${repo}-${env_name}" => {
        repo        = repo
        environment = env_name
        doppler_cfg = dop_slug
      }
    }
  ]...)
}
