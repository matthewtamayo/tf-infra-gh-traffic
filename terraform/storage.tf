resource "google_storage_bucket" "src_bucket" {
  name     = "src-code-bucket"
  project  = var.project_id
  location = var.region
}

resource "google_storage_bucket_object" "src_archive" {
  name   = "src.zip"
  bucket = google_storage_bucket.src_bucket.name
  source = "./src"
}