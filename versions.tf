terraform {
  required_version = ">= 1.5.0, < 2.0.0"

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5.0"
    }
    oci = {
      source  = "oracle/oci"
      version = "~> 6.0"
    }
  }
}

provider "cloudflare" {
  # API トークンは環境変数 CLOUDFLARE_API_TOKEN から自動検知
}

provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region
}
