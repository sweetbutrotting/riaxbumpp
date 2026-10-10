--[[
	Example.lua  -  demo for BumppLib
	Put this in a LocalScript (StarterPlayer > StarterPlayerScripts) and put BumppLib.lua
	in a ModuleScript named "BumppLib" inside ReplicatedStorage.
]]

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Library = require(game:GetService("ReplicatedStorage"):WaitForChild("BumppLib"))

local Window = Library:CreateWindow({
	Title = "Pinkie",
	Subtitle = "Pink UI Library",
	ToggleKey = Enum.KeyCode.RightShift,

	-- Optional customization (uncomment to try):
	-- Theme = "Lilac",              -- "Pink", "Lilac", "Mint", "Sky", "Peach", "Light", or your own table
	-- Theme = { Accent = Color3.fromRGB(255, 111, 168), Background = Color3.fromRGB(18, 14, 22) },
	-- Roundness = 0.5,              -- 0 = square corners, 1 = default, 2 = very round
	-- Font = Enum.Font.Gotham, BoldFont = Enum.Font.GothamBold,
	-- Width = 700, Height = 460, SidebarWidth = 170,
	-- UserCard = false, Welcome = false, Draggable = true, CanClose = true,
})

-- HOME
local Home = Window:CreateTab("Home")
Home:AddSection("Welcome")
Home:AddLabel("Hey " .. LocalPlayer.DisplayName .. "! This is a clean pink UI library. Drag the top bar to move the window, press RightShift to hide it, and use the tabs on the left.")
Home:AddButton({
	Name = "Say hi",
	Callback = function()
		Window:Notify({ Title = "Hi " .. LocalPlayer.DisplayName .. " :)", Content = "Everything is working.", Duration = 3 })
	end,
})

-- COMPONENTS
local Components = Window:CreateTab("Components")
Components:AddSection("Toggles and sliders")
Components:AddToggle({ Name = "Example toggle", Default = true, Flag = "ExampleToggle", Callback = function(on) print("Toggle:", on) end })
Components:AddToggle({ Name = "Another toggle", Default = false })
Components:AddSlider({ Name = "Example slider", Min = 0, Max = 200, Default = 100, Increment = 1, Flag = "ExampleSlider", Callback = function(v) print("Slider:", v) end })
Components:AddSlider({ Name = "Precise slider", Min = 0, Max = 1, Default = 0.5, Increment = 0.05, Suffix = "x" })
Components:AddSection("Choices")
Components:AddDropdown({ Name = "Dropdown", Options = { "Rose", "Bubblegum", "Peach", "Lilac", "Berry" }, Default = "Rose", Callback = function(v) print("Dropdown:", v) end })
Components:AddKeybind({ Name = "Example keybind", Default = Enum.KeyCode.E, Callback = function() print("Keybind pressed") end })
Components:AddTextbox({ Name = "Textbox", Placeholder = "Say something", Callback = function(text, enter) print("Textbox:", text, enter) end })
Components:AddSection("Colors")
Components:AddColorPicker({ Name = "Example color", Default = Color3.fromRGB(255, 143, 186), Callback = function(c) print("Color:", c) end })

-- SETTINGS
local Settings = Window:CreateTab("Settings")
Settings:AddSection("Interface")
Settings:AddColorPicker({
	Name = "Accent color",
	Default = Window.Accent,
	Callback = function(c) Window:SetAccent(c) end,
})
Settings:AddKeybind({
	Name = "Menu keybind",
	Default = Window.ToggleKey,
	Changed = function(key)
		Window:SetToggleKey(key)
		Window:Notify({ Title = "Keybind changed", Content = "Menu key is now " .. key.Name .. ".", Duration = 3 })
	end,
})
Settings:AddButton({ Name = "Unload UI", Callback = function() Window:Destroy() end })
