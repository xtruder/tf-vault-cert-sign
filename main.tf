variable "csr" {}

variable "vault_address" {}

variable "vault_token" {}

variable "vault_ca_cert_file" {}

variable "vault_mount" {
    default = "rootca"
}

provider "vault" {
    addreess = "${var.vault_address}"
    token = "${var.vault_token}"
    ca_cert_file = "${var.vault_ca_cert_file}"
}

resource vault_generic_secret "cert_sign" {
    path = "${var.vault_mount}/root/sign-intermediate"
    disable_read = true
    data_json = <<EOT
{
    "csr": ''${jsonencode(var.csr)},
    "format": "pem_bundle"  
}
EOT
}

output "cert" {
    value = "${vault_generic_secret.cert_sign.data["certificate"]}"
}
