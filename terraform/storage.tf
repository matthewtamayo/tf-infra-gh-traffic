resource "google_storage_bucket" "github_traffic_src_bucket" {
  name     = "github-traffic-src-code-bucket"
  project  = var.project_id
  location = var.region
}

resource "google_storage_bucket_object" "github_traffic_src_archive" {
  name   = "src.zip"
  bucket = google_storage_bucket.github_traffic_src_bucket.name
  source = "./src"
}

resource "google_storage_bucket" "github_traffic_timestamp_bucket" {
  name     = "github-traffic-timestamp-bucket"
  location = var.region
  project  = var.project_id
}