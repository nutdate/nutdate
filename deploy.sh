#!/bin/bash/zsh

# สคริปต์สำหรับส่งโค้ดขึ้น Git
# วิธีใช้: ./deploy.sh "ข้อความ commit ของคุณ"

# ตรวจสอบว่ามี commit message ส่งมาด้วยหรือไม่
if [ -z "$1" ]; then
  echo "🛑 Error: กรุณาใส่ข้อความสำหรับ commit"
  echo "ตัวอย่าง: ./deploy.sh \"แก้ไขฟีเจอร์ A\""
  exit 1
fi

echo "🚀 เริ่มกระบวนการ Deploy..."

# 1. Add ไฟล์ทั้งหมด
git add .

# 2. Commit พร้อมข้อความที่รับมา
git commit -m "$1"

# 3. Push โค้ดไปยัง branch 'main' (หรือ 'master' แล้วแต่โปรเจกต์)
git push origin main

echo "✅ Push โค้ดขึ้น Git สำเร็จ! รอให้ EC2 ทำงานต่อ..."
