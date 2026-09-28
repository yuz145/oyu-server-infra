# ==============================================================================
# 宣言的インポート定義 (Terraform 1.5+)
# ==============================================================================
import {
  to = cloudflare_dns_record.play
  id = "${var.cloudflare_zone_id}/${var.cloudflare_play_record_id}"
}

# ==============================================================================
# Cloudflare DNS レコード定義
# ==============================================================================
# クライアント接続用のフロントエンド A レコード
# TCP パケットを直接クラウド VPS（HAProxy）へ流すため DNS Only（灰色の雲）で構成
resource "cloudflare_dns_record" "play" {
  zone_id = var.cloudflare_zone_id
  name    = "play"
  content = var.vps_public_ip
  type    = "A"
  proxied = false # TCP トラフィックを直接伝送するためプロキシ OFF
  ttl     = 1     # Auto TTL
  comment = "ゲームサーバー中継用VPSフロントエンド"
}
