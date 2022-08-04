module "pubsub_puller_github_traffic" {
  source     = "git::https://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@github.com/telus/tf-module-gcp-pubsub?ref=v0.3.0%2Btf.0.13.3"
  project_id = var.project_id
  topic_name = "puller-github-traffic"
}