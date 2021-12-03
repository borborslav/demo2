##################
provider "google" {
  credentials = file("credentials.json")
  project     = "teak-strength-332610"
  region      = "us-central1"
}
####################################
resource "google_compute_address" "extipmain" {
  name = "extipmain"
}
######################################
resource "google_compute_instance" "default10" {
  name         = "mainmachine"
  machine_type = "e2-standard-4"
  zone         = "us-central1-a"

  //user_data    = ("docker.sh")
  metadata_startup_script = file("${path.module}/docker_main.sh")
  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  // Local SSD disk
  //scratch_disk {
    //interface = "SCSI"
  //}

  network_interface {
    network = "default"
		    access_config {
    nat_ip = "${google_compute_address.extipmain.address}"
    }
  }
  metadata = {
    foo = "bar"
  }
}








###########################################

####################################
resource "google_compute_address" "extipslave" {
  name = "extipslave"
}
resource "google_compute_instance" "default11" {
  name         = "slavemachine"
  machine_type = "e2-standard-2"
  zone         = "us-central1-a"
  //user_data    = file("docker.sh")
  metadata_startup_script = file("${path.module}/docker_slave.sh")
  tags = ["foo", "bar"]
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    network = "default"
			access_config {
    nat_ip = "${google_compute_address.extipslave.address}"
    }
  }
  metadata = {
    foo = "bar"
  }
}
