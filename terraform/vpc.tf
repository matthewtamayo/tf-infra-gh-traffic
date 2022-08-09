resource "google_project_service" "vpcaccess_api" {
  service            = "vpcaccess.googleapis.com"
  disable_on_destroy = false
}

# VPC
resource "google_compute_network" "github_traffic_network" {
  name                    = "github-traffic-network"
  provider                = google-beta
  auto_create_subnetworks = true
}

# VPC access connector
resource "google_vpc_access_connector" "github_traffic_connector" {
  name           = "github-traffic-connector"
  provider       = google-beta
  ip_cidr_range  = "10.8.0.0/28"
  max_throughput = 300
  network        = google_compute_network.github_traffic_network.name
  depends_on     = [google_project_service.vpcaccess_api]
}