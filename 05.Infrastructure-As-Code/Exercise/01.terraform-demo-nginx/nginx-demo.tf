terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  host = "npipe:////./pipe/dockerDesktopLinuxEngine"
}

resource "docker_image" "nginx_demos_image" {
  name = "nginxdemos/hello"
}

resource "docker_container" "nginx_container_resource_name" {
  image = docker_image.nginx_demos_image.name
  name  = "nginx-container"
  ports {
    external = 8000
    internal = 80
  }
}

resource "docker_volume" "shared_volume" {
  name = "nginx-volume"
}

resource "docker_network" "private_network" {
  name = "terraform-network"
}