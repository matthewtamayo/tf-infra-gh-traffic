resource "google_secret_manager_secret" "github_traffic_puller_private_key" {
  project   = var.project_id
  secret_id = "ep-github-app-private-key"

  replication {
    user_managed {
      replicas {
        location = "northamerica-northeast1"
      }
      replicas {
        location = "northamerica-northeast2"
      }
    }
  }
}

resource "google_secret_manager_secret_iam_member" "github_traffic_puller_private_key_access" {
  project   = var.project_id
  secret_id = google_secret_manager_secret.github_traffic_puller_private_key.id
  role      = "roles/secretmanager.secretAccessor"
  member    = "serviceAccount:${module.github_traffic_puller_sa.email}"
}