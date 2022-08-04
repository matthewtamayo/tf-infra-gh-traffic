resource "google_sql_database_instance" "instance" {
  name             = "tf-github-traffic"
  project          = var.project_id
  region           = var.region
  database_version = "MYSQL_8_0"
  # service_account_email_address = "p541105984323-wvvril@gcp-sa-cloud-sql.iam.gserviceaccount.com"

  settings {
    tier = "db-f1-micro"
    ip_configuration {
      ipv4_enabled    = false
      private_network = google_compute_network.private_sql_network.id
    }
  }
}