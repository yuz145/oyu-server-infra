# ==============================================================================
# Cloudflare 関連変数
# ==============================================================================
variable "cloudflare_zone_id" {
  type        = string
  description = "Cloudflareの対象ドメインのZone ID"
}

variable "cloudflare_play_record_id" {
  type        = string
  description = "宣言的インポート用の既存DNSレコードID"
}

variable "vps_public_ip" {
  type        = string
  description = "中継用クラウドVPS（HAProxyフロントエンド）のパブリックIPアドレス"
}

# ==============================================================================
# OCI (Oracle Cloud Infrastructure) 認証・接続変数
# ==============================================================================
variable "tenancy_ocid" {
  type        = string
  description = "OCI テナンシのOCID"
}

variable "user_ocid" {
  type        = string
  description = "OCI 操作ユーザーのOCID"
}

variable "fingerprint" {
  type        = string
  description = "OCI API署名キーのフィンガープリント"
}

variable "private_key_path" {
  type        = string
  description = "OCI API秘密鍵（PEM形式）のローカルファイルパス（例: ~/.oci/oci_api_key.pem）"
}

variable "region" {
  type        = string
  description = "OCI プロバイダの対象リージョン"
  default     = "ap-tokyo-1"
}
