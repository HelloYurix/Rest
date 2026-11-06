## วิธิการใช้งาน BypassUI.lua

ตัวอย่าง {


local Success_BuildUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/HelloYurix/Rest/refs/heads/main/BypassUI.lua"))()

local MainUi = instance.new("ScreenGui")

MainUi.Parent = Success_BuildUI -- <<<


}

* สคริปต์นี้ถูกออกแบบมาเพื่อช่วยซ่อนและป้องกันไม่ให้ระบบตรวจจับของเกม (Anti-Cheat / CoreGui Detection) สังเกตเห็น UI หรือหน้าต่างเมนูที่เราสร้างขึ้นมาใหม่ได้อย่างมีประสิทธิภาพ


