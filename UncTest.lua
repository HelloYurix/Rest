return function(Token)
    -- ตรวจสอบ Token: ถ้าผิด จะเตือนด้วย warn และสั่ง return nil เพื่อตัดจบการทำงานทันที
    if Token ~= "9f3a1c7be24d5086Yurixa1f7c3e9b0d24a68" then
        warn("Token No")
        return nil 
    end

    -- ==========================================
    -- โค้ด Test ทั้งหมดจะทำงานต่อเมื่อ Token ถูกต้องเท่านั้น!
    -- ==========================================
    
    local passes, fails, undefined = 0, 0, 0
    local running = 0

    local Service = {
        HttpService = game:GetService("HttpService")
    }

    local HttpService = Service.HttpService
    local REQUIRED = {
        ["loadstring"] = true,
        ["getgenv"] = true,
        ["request"] = true,
        ["gethui"] = true,
        ["writefile"] = true,
        ["readfile"] = true,
    }

    local STOP_ON_REQUIRED_FAIL = true
    local halted = false
    local failedRequired = {}

    local function onFail(name, reason)
        fails += 1
        if REQUIRED[name] then
            table.insert(failedRequired, name)
            if STOP_ON_REQUIRED_FAIL then
                halted = true
            end
        end
    end

    local function getGlobal(path)
        local value = getfenv(0)

        while value ~= nil and path ~= "" do
            local name, nextValue = string.match(path, "^([^.]+)%.?(.*)$")
            value = value[name]
            path = nextValue
        end

        return value
    end

    local function test(name, aliases, callback)
        if halted then return end 

        running += 1

        task.spawn(function()
            if halted then
                running -= 1
                return
            end

            if not callback then
            elseif not getGlobal(name) then
                onFail(name)
            else
                local success, message = pcall(callback)

                if success then
                    passes += 1
                else
                    onFail(name, message)
                end
            end

            running -= 1
        end)
    end

    -- ตัวอย่างฟังก์ชันทดสอบเบื้องต้น
    test("getgenv", {}, function()
        getgenv().__TEST_GLOBAL = true
        assert(__TEST_GLOBAL, "Failed to set a global variable")
        getgenv().__TEST_GLOBAL = nil
    end)

    repeat task.wait() until running == 0
    task.wait()

    if #failedRequired > 0 then
        return false, failedRequired
    end

    return true
end
