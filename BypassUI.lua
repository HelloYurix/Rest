local CoreGui = game:GetService("CoreGui")

local Genv = getgenv and getgenv() or _G
if Genv.Xenith and typeof(Genv.Xenith) == "Instance" then
    pcall(function()
        Genv.Xenith.lua:Destroy()
    end)

end


local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Xenith000"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true

Genv.Xenith = ScreenGui

local ProtectedCoreGui = (cloneref and cloneref(CoreGui)) or CoreGui

local function protectAndHideUI(gui)
    if syn and syn.protect_gui then
        syn.protect_gui(gui)
        gui.Parent = ProtectedCoreGui
    elseif gethui then
        gui.Parent = gethui()
    else
      return 
end

protectAndHideUI(ScreenGui)

return ScreenGui

