resource "github_repository_environment" "envs" {
  for_each    = local.matrix
  repository  = github_repository.apps[each.value.repo].name
  environment = each.value.environment
}
