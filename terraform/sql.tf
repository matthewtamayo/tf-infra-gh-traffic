resource "google_sql_database_instance" "github_traffic_mysql" {
  name             = "github-traffic-mysql"
  project          = var.project_id
  region           = var.region
  database_version = "MYSQL_8_0"

  settings {
    tier = "db-f1-micro"
    ip_configuration {
      ipv4_enabled    = false
      private_network = google_compute_network.github_traffic_network.id
    }
  }
}