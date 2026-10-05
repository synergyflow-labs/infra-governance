resource "github_repository" "apps" {
  for_each   = local.app_repos
  name       = each.key
  visibility = "public"
  auto_init  = true
}
