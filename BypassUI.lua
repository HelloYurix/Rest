return function(Token)
    if Token ~= "9f3a1c7be24d5086Yurixa1f7c3e9b0d24a68" then
        warn("Token No")
        return nil
    end

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
    ScreenGui.Name = "Xenith000"
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
end
