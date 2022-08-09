# Service Account used by GitHub Traffic Puller.
module "github_traffic_puller_sa" {
  source       = "git::https://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@github.com/telus/tf-module-gcp-cio-service-accounts?ref=v0.3.0%2Btf.0.13.3"
  project_id   = var.project_id
  account_id   = "github-traffic-puller"
  display_name = "Service Account used by GitHub Traffic Puller Cloud Function."
}