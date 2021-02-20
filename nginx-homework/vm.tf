resource "ah_cloud_server" "example" {
  name       = "nginx-hw-server-2"
  datacenter = "ams1"
  image      = "centos-7-x64"
  product    = "start-xs"
  ssh_keys   = ["05:ef:62:37:52:e0:fb:0e:34:e8:e2:fc:4c:7b:ce:d7"]

  provisioner "remote-exec" {
    inline = ["sudo ls /"]

    connection {
      type = "ssh"
      user = "adminroot"
      # private_key = "${file(var.ssh_key_private)}"
      host = ah_cloud_server.example.ips.0.ip_address

    }
  }

  provisioner "local-exec" {
    command = "ansible-playbook -u adminroot -i '${ah_cloud_server.example.ips.0.ip_address},' install-nginx.yaml"
  }

}

