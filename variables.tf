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
