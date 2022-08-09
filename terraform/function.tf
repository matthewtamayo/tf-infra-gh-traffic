resource "google_cloudfunctions_function" "github_traffic_function" {
  name                  = "github-traffic-function"
  description           = "GitHub traffic puller function"
  runtime               = "nodejs16"
  service_account_email = "541105984323-compute@developer.gserviceaccount.com"
  vpc_connector         = google_vpc_access_connector.github_traffic_connector.id

  available_memory_mb   = 256
  source_archive_bucket = google_storage_bucket.github_traffic_src_bucket.name
  source_archive_object = google_storage_bucket_object.github_traffic_src_archive.name
  entry_point           = "main"

  event_trigger {
    event_type = "google.pubsub.topic.publish"
    resource   = "projects/${var.project_id}/topics/${module.pubsub_puller_github_traffic.topic_id}"
  }
}