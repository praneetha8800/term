resource "null_resource" "example" {
  provisioner "local-exec" {
    command = "echo Provisioning simulated resource..."
  }
}
