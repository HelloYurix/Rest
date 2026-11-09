

    local NameUi = "มึงหากูไม่เจอหรอกค้าบ"
    local Service = {
        CoreGui = game:GetService("CoreGui")
    }

    local CoreGui = Service.CoreGui
    local Genv = getgenv()
    if Genv.Xenith and typeof(Genv.Xenith) == "Instance" then
        pcall(function()
            Genv.Xenith:Destroy()
        end)
    end

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = NameUi
    ScreenGui.ResetOnSpawn = false
    ScreenGui.IgnoreGuiInset = true

    Genv.Xenith = ScreenGui

    local ProtectedCoreGui = CoreGui

    local function protectAndHideUI(gui)
        if syn and syn.protect_gui then
            syn.protect_gui(gui)
            gui.Parent = ProtectedCoreGui
        elseif gethui then
            gui.Parent = gethui()
        else
          return 
        end
    end

    protectAndHideUI(ScreenGui)

    return ScreenGui

