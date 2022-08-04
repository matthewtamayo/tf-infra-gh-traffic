resource "google_project_service" "vpcaccess_api" {
  service            = "vpcaccess.googleapis.com"
  disable_on_destroy = false
}

# VPC
resource "google_compute_network" "private_sql_network" {
  name                    = "cloudfx-sql-network"
  provider                = google-beta
  auto_create_subnetworks = true
}

# VPC access connector
resource "google_vpc_access_connector" "connector" {
  name           = "vpc-conn"
  provider       = google-beta
  ip_cidr_range  = "10.9.0.0/28"
  max_throughput = 300
  network        = google_compute_network.private_sql_network.name
  depends_on     = [google_project_service.vpcaccess_api]
}