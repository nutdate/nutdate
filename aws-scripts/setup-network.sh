#!/bin/bash
# ===============================
# Proot Network + VPN Setup Script
# ===============================

# 1️⃣ อัปเดตระบบ
echo "[*] Updating system..."
apt update && apt upgrade -y

# 2️⃣ ติดตั้งเครื่องมือที่จำเป็น
echo "[*] Installing network tools and nano..."
apt install iproute2 iputils-ping net-tools curl wget nano -y

# 3️⃣ ตรวจสอบอินเตอร์เน็ต
echo "[*] Checking internet connectivity..."
ping -c 3 8.8.8.8
curl -I http://example.com

# 4️⃣ แสดง interface และ routing table
echo "[*] Current network interfaces:"
ip addr show
echo "[*] Routing table:"
ip route show

# 5️⃣ ตรวจสอบ VPN (ถ้ามี tun0)
echo "[*] Checking VPN interface (tun0)..."
if ip addr show tun0 &>/dev/null; then
    echo "VPN tunnel tun0 detected!"
    ip addr show tun0
else
    echo "No VPN tunnel detected."
fi

# 6️⃣ เปิด nano ให้สร้างหรือแก้ไข scripts
echo "[*] You can now edit scripts using nano:"
echo "Example: nano ~/projects/myscript.sh"
