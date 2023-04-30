--[[
        _                     
       | |                    
   ___ | | ____ _ _   _ _   _ 
  / _ \| |/ / _` | | | | | | |
 | (_) |   | (_| | |_| | |_| |
  \___/|_|\_\__,_|\__, |\__, |
                   __/ | __/ |
                  |___/ |___/ 

    UI - Vynixu
    Scripting - okayy

]]-- 
-- Compatable with --
-- KRNL
-- SYNAPSE X
-- FLUXUS 


-- Only reason you can see this is if you deobfuscated this code, good job I must say.
-- I don't know how you know how to deobfuscate MoonSec, but great job.
-- But you will still get in trouble from me if you skid or resell this code. So don't, Thanks! - okayy#3051

-- Copyright © 2023 okayy Scripts. All rights reserved. --

-- Define Library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/UI-Libraries/main/Vynixius/Source.lua"))()

-- Create Window
local Window = Library:AddWindow({
	title = {"oklol", "2.0"},
	theme = {
		Accent = Color3.fromRGB(127, 115, 235)
	},
	key = Enum.KeyCode.RightControl,
	default = true
})

-- Create Tab
local Tab = Window:AddTab("LocalPlayer", {default = true})

local Tab = Window:AddTab("Utilities", {default = false})

local Tab = Window:AddTab("Visuals", {default = false})

local Tab = Window:AddTab("Settings", {default = false})
-- Create Section
local Section = Tab:AddSection("Scripts", {default = false})

-- Create Button
local Button = Scripts:AddButton("Huggy Wuggy", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/okbruhlol/HuggyWuggy/main/wuggy.shears'))()
end)

local Button = Scripts:AddButton("NVCS-3000 / Tablet", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/DeividComSono/Scripts/main/Scanner.lua'))()
end)
-- Create Toggle
local Toggle = Section:AddToggle("Toggle", {flag = "Toggle_Flag", default = false}, function(bool)
	print("Toggle set to:", bool)
end)

-- Create Label
local Label = Section:AddLabel("Label")

-- Create DualLabel
local DualLabel = Section:AddDualLabel({"Dual", "Label"})

-- Create ClipboardLabel
local ClipboardLabel = Section:AddClipboardLabel("ClipboardLabel", function()
	return "ClipboardLabel"
end)

-- Create Box
local Box = Section:AddBox("Box", {fireonempty = true}, function(text)
	print(text)
end)

-- Create Bind
local Bind = Section:AddBind("Bind", Enum.KeyCode.RightShift, {toggleable = true, default = false, flag = "Bind_Flag"}, function(keycode)
	Window:SetKey(keycode)
end)

-- Create Slider
local Slider = Section:AddSlider("Slider", 1, 100, 50, {toggleable = true, default = false, flag = "Slider_Flag", fireontoggle = true, fireondrag = true, rounded = true}, function(val, bool)
	print("Slider value:", val, " - Slider toggled:", bool)
end)

-- Create Dropdown
local Dropdown = Section:AddDropdown("Dropdown", {"Item1", "Item2", "Item3"}, {default = "Item1"}, function(selected)
	print(selected)
end)

-- Create Picker
local Picker = Section:AddPicker("Picker", {color = Color3.fromRGB(255, 0, 0)}, function(color)
	Window:SetAccent(color)
end)


--[[
    All functions shown above are implemented the same way for SubSections
]]--
