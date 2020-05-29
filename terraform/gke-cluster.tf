# GKE cluster
resource "google_container_cluster" "primary" {
  name     = var.gcp_cluster_name
  location = var.gcp_region

  remove_default_node_pool = true
  initial_node_count       = 1

  network    = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet.name

  /*master_auth {
    username = var.gke_username
    password = var.gke_password

    client_certificate_config {
      issue_client_certificate = false
    }
  }*/
}

# Separately Managed Node Pool
resource "google_container_node_pool" "primary_nodes" {
  name       = "${var.resource_prefix}-${google_container_cluster.primary.name}-node-pool"
  location   = var.gcp_region
  cluster    = google_container_cluster.primary.name
  node_count = var.gcp_node_count

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels = {
      #env = var.gcp_project_id
    }

    # preemptible  = true
    machine_type = "n1-standard-1"
    tags         = ["gke-node", "${var.gcp_project_id}-gke"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}

output "gke_cluster_name" {
  value       = google_container_cluster.primary.name
  description = "GKE Cluster Name"
}