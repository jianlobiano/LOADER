local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/jianlobiano/LOADER/refs/heads/main/JX-UI/JX-UI.lua"))()
local CheatName = "JX-Blox Fruit"

Library.Folders = {
    Directory = CheatName,
    Configs = CheatName .. "/Configs",
    Assets = CheatName .. "/Assets",
}

local Accent = Color3.fromRGB(255, 80, 80)
local Gradient = Color3.fromRGB(120, 20, 20)

Library.Theme.Accent = Accent
Library.Theme.AccentGradient = Gradient
Library:ChangeTheme("Accent", Accent)
Library:ChangeTheme("AccentGradient", Gradient)
local Window = Library:Window({
    Name = "Ro-Ghoul",
    SubName = "JX | Dsc.gg/getjxs",
    Logo = "85279746515974"
})

local KeybindList = Library:KeybindList("Keybinds")
Library:Watermark({
    "JX",
    "By Jianlobiano",
    85279746515974
})
Library:Notification({
            Title = "JX",
            Description = "Dont Forget To Join Discord Server | Dsc.gg/getjxs!",
            Duration = 5,
            Icon = "85279746515974"
        })

task.spawn(function()
    while true do
        local FPS = math.floor(1 / game:GetService("RunService").RenderStepped:Wait())
        local pingValue = 0
        pcall(function()
            pingValue = math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue())
        end)
        Library:Watermark({
            85279746515974,
            "JX | Dsc.gg/getjxs",
            "By Jianlobiano",
            "FPS: " .. FPS,
            "Ping: " .. pingValue .. "ms"
        })
        task.wait(1)
    end
end)

Window:Category("Main")

local LegitPage = Window:Page({Name = "Legit", Icon = "138827881557940"})
local MainSection = LegitPage:Section({Name = "Main Features", Side = 1})

local LegitToggle = MainSection:Toggle({
    Name = "Enabled",
    Flag = "LegitEnabled",
    Default = true,
    Callback = function(Value)
        print("Legit Enabled:", Value)
    end
})
LegitToggle:SubKeybind({
    Flag = "LegitEnabledKey",
    Default = Enum.KeyCode.V,
    Mode = "Toggle",
})

local AnotherToggle = MainSection:Toggle({
    Name = "Auto Farm",
    Flag = "AutoFarm",
    Default = false,
    Callback = function(Value)
        print("Auto Farm:", Value)
    end
})
AnotherToggle:Keybind({
    Flag = "AutoFarmKey",
    Default = Enum.KeyCode.F,
})

local EspToggle = MainSection:Toggle({
    Name = "ESP",
    Flag = "EspToggle",
    Default = false,
    Callback = function(Value)
        print("ESP:", Value)
    end
})
EspToggle:SubColorpicker({
    Flag = "EspColor",
    Default = Color3.fromRGB(255, 100, 100),
    Callback = function(Value)
        print("ESP Color:", Value)
    end
})

local DualColorToggle = MainSection:Toggle({
    Name = "Dual Color",
    Flag = "DualColorToggle",
    Default = false,
    Callback = function(Value)
        print("Dual Color:", Value)
    end
})
DualColorToggle:SubColorpicker({
    Flag = "DualColor1",
    Default = Color3.fromRGB(255, 100, 100),
})
DualColorToggle:SubColorpicker({
    Flag = "DualColor2",
    Default = Color3.fromRGB(100, 200, 255),
})

local FullToggle = MainSection:Toggle({
    Name = "Full Feature",
    Flag = "FullFeature",
    Default = false,
    Callback = function(Value)
        print("Full Feature:", Value)
    end
})
FullToggle:SubColorpicker({
    Flag = "FullFeatureColor1",
    Default = Color3.fromRGB(100, 200, 255),
})
FullToggle:SubColorpicker({
    Flag = "FullFeatureColor2",
    Default = Color3.fromRGB(255, 200, 100),
})
FullToggle:SubKeybind({
    Flag = "FullFeatureKey",
    Default = Enum.KeyCode.Backspace,
})

MainSection:Slider({
    Name = "Speed Hack",
    Flag = "SpeedSlider",
    Min = 1,
    Max = 100,
    Default = 16,
    Suffix = " studs",
    Callback = function(Value)
        print("Speed set to:", Value)
    end
})

MainSection:Dropdown({
    Name = "Hitbox Type",
    Flag = "HitboxType",
    Default = {"Head"},
    Items = {"Head", "Torso", "Arms", "Legs"},
    Multi = true,
    Callback = function(Value)
        print("Selected Hitboxes:", table.concat(Value, ", "))
    end
})

MainSection:Label("ESP Color"):Colorpicker({
    Name = "Color",
    Flag = "EspMainColor",
    Default = Color3.fromRGB(255, 255, 255),
    Callback = function(Value)
        print("Color changed")
    end
})

local MiscSection = LegitPage:Section({Name = "Misc", Side = 2})
MiscSection:Button({
    Name = "Test Notification",
    Callback = function()
        Library:Notification({
            Title = "System",
            Description = "This is a test notification!",
            Duration = 5,
            Icon = "85279746515974"
        })
    end
})

MiscSection:Keybind({
    Name = "Test keybind",
    Flag = "testkeybind",
    Default = Enum.KeyCode.Delete,
    Callback = function(Value)
        print("Keybind pressed")
    end
})

MiscSection:Sub2keybind({
    Name = "Action key",
    Flag = "actionkey",
    Default = Enum.KeyCode.G,
    Mode = "Toggle",
    Callback = function(Toggled)
        print("Sub2keybind pressed, Toggled:", Toggled)
    end
})

Window:Category("Settings")
local SettingsPage = Library:CreateSettingsPage(Window, KeybindList)

local SilentLoadEnabled = false
pcall(function()
    local path = Library.Folders.Configs .. "/silentload.txt"
    if isfile and isfile(path) and readfile then
        local ok, content = pcall(readfile, path)
        if ok and content == "true" then
            SilentLoadEnabled = true
        end
    end
end)

Window:Init()

if SilentLoadEnabled and Window.SetOpen then
    Window:SetOpen(false)
end

Library:Notification({
            Title = "JX",
            Description = "Script Has Been Successfully Loaded!",
            Duration = 5,
            Icon = "85279746515974"
        })
