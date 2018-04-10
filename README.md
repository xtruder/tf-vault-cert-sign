# Terraform vault cert signer

Terraform module for signing certs with vault

## Usage

```
module.vault_cert_sign {
  source = "github.com/xtruder/tf-vault-cert-sign"
  csr = "<CERT_SIGNING_REQUEST>"
  vault_address = "https://vault:8200"
  vault_token = "${file(/vault/token)}"
  vault_ca_cert_file = "/vault/ca.crt"
}
```
