# Create scoped read-only service token in Doppler for each repo and environment
resource "doppler_service_token" "tokens" {
  for_each = local.matrix
  project  = each.value.repo
  config   = each.value.doppler_cfg
  name     = "gh-actions-${each.value.environment}"
  access   = "read"
}

# Inject the service token into the corresponding GitHub Environment Secret
resource "github_actions_environment_secret" "doppler_tokens" {
  for_each        = local.matrix
  repository      = github_repository.apps[each.value.repo].name
  environment     = github_repository_environment.envs[each.key].environment
  secret_name     = "DOPPLER_TOKEN"
  value           = doppler_service_token.tokens[each.key].key
}
