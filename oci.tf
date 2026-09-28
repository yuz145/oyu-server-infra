# ==============================================================================
# 宣言的インポート定義 (Terraform 1.5+)
# ==============================================================================
import {
  to = oci_core_default_security_list.default
  id = var.oci_default_security_list_id
}

# ==============================================================================
# OCI VCN デフォルト・セキュリティ・リスト
# ==============================================================================
# OCI VPS (中継盾) の外壁ファイアウォール定義
# - ポート 25565 (TCP): 外部全開放 (Minecraft プレイヤー接続中継用)
# - ポート 22 (SSH): 外部完全閉鎖 (Tailscale 暗号化トンネル経由限定)
resource "oci_core_default_security_list" "default" {
  manage_default_resource_id = var.oci_default_security_list_id
  compartment_id             = var.tenancy_ocid
  display_name               = "Default Security List for mc-vcn"

  # 全てのアウトバウンド通信を許可
  egress_security_rules {
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    protocol         = "all"
    stateless        = false
  }

  # PMTU (Path MTU Discovery) 制御用 ICMP
  ingress_security_rules {
    protocol    = "1" # ICMP
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = false

    icmp_options {
      type = 3
      code = 4
    }
  }

  # VCN 内部通信用 ICMP
  ingress_security_rules {
    protocol    = "1" # ICMP
    source      = "10.0.0.0/16"
    source_type = "CIDR_BLOCK"
    stateless   = false

    icmp_options {
      type = 3
    }
  }

  # Minecraft 外部公開用ポート（TCP 25565）
  # ※ 外部向け SSH (22) は完全に排除しゼロトラスト要塞化
  ingress_security_rules {
    description = "mcサーバー用"
    protocol    = "6" # TCP
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = false

    tcp_options {
      min = 25565
      max = 25565
    }
  }
}
