repeat task.wait(0.25) until game:IsLoaded() and game.Players.LocalPlayer and game.Players.LocalPlayer.Character 

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/okbruhlol/Hub/main/Source'))() 
local Window = Rayfield:CreateWindow({ 
Name = "okayy template GUI", 
LoadingTitle = "Example", 
LoadingSubtitle = "Example", 
ConfigurationSaving = { 
Enabled = true, 
FolderName = "okayyProSaves", -- Create a custom folder for your hub/game 
FileName = "Doors" 
}, 
Discord = { 
Enabled = true, 
Invite = "Tf2yXfkB8S", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD. 
RememberJoins = true -- Set this to false to make them join the discord every time they load it up 
}, 
KeySystem = false, -- Set this to true to use our key system 
}) 

local TweenService = game:GetService("TweenService") 
local RunService = game:GetService("RunService") 
local Camera = workspace.CurrentCamera 

local MobsNames = {"Rush", "Ambush", "Snare", "A60", "A120"} 
local ItemsNames = {"Candle", "Crucifix", "Shears", "SkeletonKey", "Vitamins", "Lockpick", "Lighter", "Flashlight"} 

_G.SpeedHack = false 
_G.CurrentSpeed = 0 
_G.FOVHack = false 
_G.CurrentFov = 70 
_G.NoClip = false 
_G.NoClipBypass = false 
_G.FullBright = false 
_G.InfJump = false 

local KeyChams = {} 

local Plr = game.Players.LocalPlayer 
local Char = Plr.Character 

local ModuleScripts = { 
MainGame = Plr.PlayerGui.MainUI.Initiator.Main_Game, 
} 

local esptable = {doors={},keys={},items={},entity={}} 

local MainTab = Window:CreateTab("Main", 11347112400) -- Title, Image 

local VisualsTab = Window:CreateTab("Visuals", 11347112400) -- Title, Image 

local GameTab = Window:CreateTab("Game", 10110576663) -- Title, Image 

local RoomsTab = Window:CreateTab("Rooms", 11915302404) -- Title, Image 




-- Char Tab 

MainTab:CreateToggle({ 
Name = "Enable Speed Boost", 
CurrentValue = false, 
Callback = function(Value) 
_G.SpeedHack = Value 
Plr.Character.Humanoid:SetAttribute("SpeedBoostBehind", 0) 
end 
}) 

MainTab:CreateSlider({ 
Name = "Speed Boost", 
Range = {0, 35}, 
Increment = 0.5, 
Suffix = "", 
CurrentValue = 0, 
Callback = function(Value) 
_G.CurrentSpeed = Value 
end, 
}) 

MainTab:CreateToggle({ 
Name = "Enable FOV Boost", 
CurrentValue = false, 
Callback = function(Value) 
_G.FOVHack = Value 
workspace.CurrentCamera.FieldOfView = 70 
end 
}) 

MainTab:CreateSlider({ 
Name = "Field of View", 
Range = {70, 120}, 
Increment = 0.5, 
Suffix = "", 
CurrentValue = _G.CurrentFov, 
Callback = function(Value) 

_G.CurrentFov = Value 
end, 
}) 

MainTab:CreateToggle({ 
Name = "NoClip", 
CurrentValue = false, 
Callback = function(Value) 
_G.NoClip = Value 
end 
}) 

MainTab:CreateToggle({ 
Name = "NoClip Bypass", 
CurrentValue = false, 
Callback = function(Value) 
_G.NoClipBypass = Value 
end 
}) 

MainTab:CreateToggle({ 
Name = "Fullbright", 
CurrentValue = false, 
Callback = function(Value) 
game.Lighting.Ambient = Color3.fromRGB(67, 51, 56) 
_G.FullBright = Value 
end 
}) 

MainTab:CreateButton({ 
Name = "Huggy Wuggy", 
CurrentValue = false, 
Callback = function(Value) 
loadstring(game:HttpGet("https://raw.githubusercontent.com/okbruhlol/HuggyWuggy/main/wuggy.shears"))() 
end 
}) 

MainTab:CreateButton({ 
Name = "Duck Crucifix", 
CurrentValue = false, 
Callback = function(Value) 
loadstring(game:HttpGet("https://raw.githubusercontent.com/okbruhlol/DuckCrucifix/main/duck"))() 
end 
}) 

MainTab:CreateButton({ 
Name = "Pizza", 
CurrentValue = false, 
Callback = function(Value) 
loadstring(game:HttpGet("https://raw.githubusercontent.com/okbruhlol/Pizza/main/PizzaTimeBullyMaguire"))() 
end 
}) 

MainTab:CreateButton({ 
Name = "Bypass Anti-Cheat", 
CurrentValue = false, 
Callback = function(Value) 
loadstring(game:HttpGet("https://raw.githubusercontent.com/ChronoAccelerator/Public-Scripts/main/DoorsBypasses/DoorsACBypass.lua", true))() 
end 
}) 

MainTab:CreateButton({ 
Name = "Tablet", 
CurrentValue = false, 
Callback = function(Value) 
loadstring(game:HttpGet("https://raw.githubusercontent.com/DeividComSono/Scripts/main/Scanner.lua"))() 
end 
}) 

-- Visuals Tab 

local ESPSection = VisualsTab:CreateSection("ESP") 

VisualsTab:CreateToggle({ 
Name = "Door ESP", 
CurrentValue = false, 
Flag = "DoorEsp", 
Callback = function(Value) 
if Value then 
local function setup(room) 
if room.Name == "49" or room.Name == "50" then return end 
local door = room:WaitForChild("Door"):WaitForChild("Door") 
local doorText 

task.wait() 
if door.Parent:FindFirstChild("Lock") then 
doorText = "Door [Locked]" 
else 
doorText = "Door" 
end 
--local nText = NewTextTest(doorText, Color3.fromRGB(0, 255, 0), door) 
local nText = TextEsp(doorText, Color3.fromRGB(0, 255, 0), door) 
local Outline = OutlineEsp(Color3.fromRGB(0, 255, 0), door) 
table.insert(esptable.doors,nText) 
table.insert(esptable.doors,Outline) 

door.AncestryChanged:Connect(function() 
nText.delete() 
Outline.delete() 
end) 
end 

local addconnect 

addconnect = Plr:GetAttributeChangedSignal("CurrentRoom"):Connect(function() 
for i,v in pairs(esptable.doors) do 
v.delete() 
end 
setup(workspace.CurrentRooms[Plr:GetAttribute("CurrentRoom")]) 
end) 

if workspace.CurrentRooms[Plr:GetAttribute("CurrentRoom")]:FindFirstChild("Assets") then 
setup(workspace.CurrentRooms[Plr:GetAttribute("CurrentRoom")]) 
end 


repeat task.wait() until not Rayfield.Flags["DoorEsp"].CurrentValue 
addconnect:Disconnect() 

for i,v in pairs(esptable.doors) do 
v.delete() 
end 
end 
end 
}) 

VisualsTab:CreateToggle({ 
Name = "Mobs ESP", 
CurrentValue = false, 
Flag = "MobsEsp", 
Callback = function() end 
}) 

VisualsTab:CreateToggle({ 
Name = "New Key and Lever ESP", 
CurrentValue = false, 
Flag = "KeyAndLeverEsp", 
Callback = function(Value) 
if Value then 
local HConnection 
local function check(v) 
if v:IsA("Model") and (v.Name == "LeverForGate" or v.Name == "KeyObtain") then 
task.wait(0.1) 
if v.Name == "KeyObtain" then 
local hitbox = v:WaitForChild("Hitbox") 
local prompt = v:WaitForChild("ModulePrompt") 

local nText = TextEsp("Key", Color3.fromRGB(255, 255, 255), hitbox) 
local Outline = OutlineEsp(Color3.fromRGB(255, 255, 255), v) 
table.insert(esptable.keys,nText) 
table.insert(esptable.keys,Outline) 
HConnection = RunService.RenderStepped:Connect(function() 
Outline.delete() 
Outline = OutlineEsp(Color3.fromRGB(255, 255, 255), v) 
table.insert(esptable.keys,Outline) 
end) 

elseif v.Name == "LeverForGate" then 
local nText = TextEsp("Lever", Color3.fromRGB(255, 255, 255), v.PrimaryPart) 
local Outline = OutlineEsp(Color3.fromRGB(255, 255, 255), v) 
table.insert(esptable.keys,nText) 
table.insert(esptable.keys,Outline) 
HConnection = RunService.RenderStepped:Connect(function() 
Outline.delete() 
Outline = OutlineEsp(Color3.fromRGB(255, 255, 255), v) 
table.insert(esptable.keys,Outline) 
end) 
end 
end 
end 

local function setup(room) 
local assets = room:WaitForChild("Assets") 

assets.DescendantAdded:Connect(function(v) 
check(v) 
end) 

for i,v in pairs(assets:GetDescendants()) do 
check(v) 
end 
end 

local addconnect 
addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room) 
setup(room) 
end) 

for i,room in pairs(workspace.CurrentRooms:GetChildren()) do 
if room:FindFirstChild("Assets") then 
setup(room) 
end 
end 

repeat task.wait() until not Rayfield.Flags["KeyAndLeverEsp"].CurrentValue 
addconnect:Disconnect() 
HConnection:Disconnect() 

for i,v in pairs(esptable.keys) do 
v.delete() 
end 
end 
end 
}) 

VisualsTab:CreateToggle({ 
Name = "Items ESP", 
CurrentValue = false, 
Flag = "ItemsEsp", 
Callback = function(Value) 
if Value then 
local HConnection 
local function check(v) 
if v:IsA("Model") then 
task.wait(0.1) 
for _, itemName in next, ItemsNames do 
if v.Name:match(itemName) then 
if v.Name == "CrucifixOnTheWall" then return end 
local nText = TextEsp(itemName, Color3.fromRGB(255, 255, 255), v.PrimaryPart) 
local Outline = OutlineEsp(Color3.fromRGB(255, 255, 255), v) 
table.insert(esptable.keys,nText) 
table.insert(esptable.keys,Outline) 
HConnection = RunService.RenderStepped:Connect(function() 
Outline.delete() 
Outline = OutlineEsp(Color3.fromRGB(255, 255, 255), v) 
table.insert(esptable.keys,Outline) 
end) 
end 
end 
end 
end 

local function setup(room) 
local assets = room:WaitForChild("Assets") 

assets.DescendantAdded:Connect(function(v) 
check(v) 
end) 

for i,v in pairs(assets:GetDescendants()) do 
check(v) 
end 
end 

local addconnect 
addconnect = workspace.CurrentRooms.ChildAdded:Connect(function(room) 
setup(room) 
end) 

for i,room in pairs(workspace.CurrentRooms:GetChildren()) do 
if room:FindFirstChild("Assets") then 
setup(room) 
end 
end 

repeat task.wait() until not Rayfield.Flags["ItemsEsp"].CurrentValue 
addconnect:Disconnect() 
HConnection:Disconnect() 

for i,v in pairs(esptable.items) do 
v.delete() 
end 
end 
end 
}) 


local ESPSettingsSection = VisualsTab:CreateSection("ESP Settings") 
VisualsTab:CreateToggle({ 
Name = "Outlines", 
CurrentValue = false, 
Flag = "OutlineSetting", 
Callback = function() end 
}) 
--[[ 
VisualsTab:CreateToggle({ 
Name = "Outlines", 
CurrentValue = false, 
Flag = "OutlineSettingEsp", 
Callback = function() end 
}) ]] 


-- Game Tab 

GameTab:CreateToggle({ 
Name = "Instant Interact", 
CurrentValue = false, 
Flag = "InstantToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps 
Callback = function() 
end 
}) 

GameTab:CreateToggle({ 
Name = "Notify when Items spawns", 
CurrentValue = false, 
Flag = "ItemsToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps 
Callback = function() 
end 
}) 

GameTab:CreateToggle({ 
Name = "Notify when Mob spawns", 
CurrentValue = false, 
Flag = "MobToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps 
Callback = function() 
end 
}) 

GameTab:CreateToggle({ 
Name = "Remove Screech", 
CurrentValue = false, 
Flag = "ScreechToggle", 
Callback = function(Value) 
if Value then 
ModuleScripts.MainGame.RemoteListener.Modules.Screech.Name = "MyBallsIsTiny" 
else 
ModuleScripts.MainGame.RemoteListener.Modules.MyBallsIsTiny.Name = "Screech" 
end 
end 
}) 

GameTab:CreateButton({ 
Name = "Enable Rooms Door Prompt", 
Callback = function() 
for i, v in pairs(workspace.CurrentRooms:GetDescendants()) do 
if v.Name == "RoomsDoor_Entrance" then 
v.Door.EnterPrompt.Enabled = true 
end 
end 
end, 
}) 

GameTab:CreateButton({ 
Name = "Join Private Server", 
Callback = function() 
(queue_on_teleport or syn and syn.queue_on_teleport)("loadstring(game:HttpGet\"https://raw.githubusercontent.com/DeividComSono/Scripts/main/6839171747.lua\")()") 
game.ReplicatedStorage.EntityInfo.PlayAgain:FireServer() 
end, 
}) 

GameTab:CreateButton({ 
Name = "Join Random Public Server (Server Hop)", 
Callback = function() 
local tb = game:GetService("HttpService"):JSONDecode(game:HttpGet(("https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=Asc&limit=100"):format(tostring(game.PlaceId)))); 
(queue_on_teleport or syn and syn.queue_on_teleport)("loadstring(game:HttpGet\"https://raw.githubusercontent.com/DeividComSono/Scripts/main/6839171747.lua\")()") 
game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, tb.data[math.random(1, #tb.data)].id, game.Players.LocalPlayer) 
end 
}) 


-- Rooms Tab 

RoomsTab:CreateToggle({ 
Name = "Automatically recharge flashlight", 
CurrentValue = false, 
Callback = function(Value) 
while Value == true do 
task.wait(1.125) 
if Plr.Character:FindFirstChild("Shakelight", true) then 
game.Players.LocalPlayer.Character.Shakelight.Remote:FireServer() 
end 
end 
end 
}) 

RoomsTab:CreateToggle({ 
Name = "Remove A-90", 
CurrentValue = false, 
Flag = "A90Toggle", 
Callback = function(Value) 
if Value then 
ModuleScripts.MainGame.RemoteListener.Modules["A90"].Name = "YourMomIsHot" 
else 
ModuleScripts.MainGame.RemoteListener.Modules.YourMomIsHot.Name = "A90" 
end 
end 
}) 

RoomsTab:CreateToggle({ 
Name = "Remove FogEnd", 
CurrentValue = false, 
Flag = "FogEndToggle", 
Callback = function() 
end 
}) 


-- Codes 

RunService.RenderStepped:Connect(function() 
if _G.SpeedHack and not require(ModuleScripts.MainGame).chase then 
Plr.Character.Humanoid:SetAttribute("SpeedBoostBehind", _G.CurrentSpeed) 
end 
if _G.FOVHack then 
workspace.CurrentCamera.FieldOfView = _G.CurrentFov 
end 
if Char:FindFirstChild("HumanoidRootPart") then 
Char.HumanoidRootPart.CanCollide = not _G.NoClip 
Char.Collision.CanCollide = not _G.NoClip 

if _G.NoClipBypass then 
local HrpCFrame = Char.HumanoidRootPart.CFrame 

local ray = Ray.new(HrpCFrame.Position, HrpCFrame.LookVector * 0.5) 
local part = workspace:FindPartOnRay(ray) 
if part and part.CanCollide == true then 
Char.HumanoidRootPart.Anchored = true 
Char:PivotTo(Char.HumanoidRootPart.CFrame * CFrame.new(0, 1000, 0)) 
task.wait() 
Char:PivotTo(Char.HumanoidRootPart.CFrame * CFrame.new(0, 0, -3.75)) 
task.wait() 
Char:PivotTo(Char.HumanoidRootPart.CFrame * CFrame.new(0, -1000, 0)) 
task.wait(0.1) 
Char.HumanoidRootPart.Anchored = false 
end 
end 
end 

if _G.FullBright then 
game.Lighting.Ambient = Color3.fromRGB(255, 255, 255) 
end 
if Rayfield.Flags["FogEndToggle"].CurrentValue == true then 
game.Lighting.FogEnd = 99999 
end 
end) 

game.Lighting:GetPropertyChangedSignal("Ambient"):Connect(function() 
if _G.FullBright then 
game.Lighting.Ambient = Color3.fromRGB(255, 255, 255) 
end 
end) 

game.Lighting:GetPropertyChangedSignal("FogEnd"):Connect(function() 
if Rayfield.Flags["FogEndToggle"].CurrentValue == true then 
game.Lighting.FogEnd = 99999 
end 
end) 

game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(prompt) 
if Rayfield.Flags["InstantToggle"].CurrentValue == true then 
fireproximityprompt(prompt) 
end 
end) 

workspace.CurrentRooms.DescendantAdded:Connect(function(child) 
for _, mobName in next, MobsNames do 
if child:IsA("Model") and child.Name:match(mobName) then 
if Rayfield.Flags["MobsEsp"].CurrentValue == true then 
TextEsp(v, Color3.fromRGB(255, 0, 0), child.PrimaryPart) 
end 
end 
end 
for _, itemName in next, ItemsNames do 
if child:IsA("Model") and child.Name:match(itemName) then 
if child:GetAttribute("JeffShop") == true then return end 
if child.Name == "CrucifixOnTheWall" then return end 
if Rayfield.Flags["ItemsToggle"].CurrentValue == true then 
Rayfield:Notify({ 
Title = "Warning!", 
Content = itemName .. " has spawned!", 
Duration = 5 
}) 
end 
end 
end 
end) 

workspace.ChildAdded:Connect(function(child) 
task.wait() 
if child:IsA("Model") and Plr:DistanceFromCharacter(child.PrimaryPart.Position) <= 5000 then 
for _, v in next, MobsNames do 
if child.Name:match(v) then 
if Rayfield.Flags["MobsEsp"].CurrentValue == true then 
TextEsp(v, Color3.fromRGB(255, 0, 0), child.PrimaryPart) 
end 
if Rayfield.Flags["MobToggle"].CurrentValue == true then 
Rayfield:Notify({ 
Title = "Warning!", 
Content = v .. " has spawned!", 
Duration = 5 
}) 
end 

end 
end 
end 
end) 

function TextEsp(text, color, obj) 
local bill 
if text then 
bill = Instance.new("BillboardGui",game.CoreGui) 
bill.AlwaysOnTop = true 
bill.Size = UDim2.new(0,400,0,100) 
bill.Adornee = obj 
bill.MaxDistance = 2000 
--[[ 
local mid = Instance.new("Frame",bill) 
mid.AnchorPoint = Vector2.new(0.5,0.5) 
mid.BackgroundColor3 = color 
mid.Size = UDim2.new(0,6,0,6) 
mid.Position = UDim2.new(0.5,0,0.5,0) 
Instance.new("UICorner",mid).CornerRadius = UDim.new(1,0) 
Instance.new("UIStroke",mid) 
]] 
local txt = Instance.new("TextLabel",bill) 
txt.AnchorPoint = Vector2.new(0.5,0.5) 
txt.BackgroundTransparency = 1 
txt.BackgroundColor3 = color 
txt.TextColor3 = color 
txt.Size = UDim2.new(1,0,0,50) 
txt.Position = UDim2.new(0.5,0,0.5,0) 
txt.Text = text 
Instance.new("UIStroke",txt) 

task.spawn(function() 
while bill do 
if bill.Adornee == nil or not bill.Adornee:IsDescendantOf(workspace) then 
bill.Enabled = false 
bill.Adornee = nil 
bill:Destroy() 
end 
task.wait() 
end 
end) 
end 

local ret = {} 

ret.delete = function() 
if bill then 
bill.Enabled = false 
bill.Adornee = nil 
bill:Destroy() 
end 
end 

return ret 
end 

function NewTextTest(text, color, obj) 
local newText = Drawing.new("Text") 
newText.Text = text 
newText.Visible = false 
newText.Center = true 
newText.Outline = true 
newText.Font = 0 
newText.Color = color 
newText.Size = 16 

local c1 = RunService.Heartbeat:Connect(function() 
local obj_pos, obj_onscreen = Camera:WorldToViewportPoint(obj.Position) 
if obj_onscreen then 
newText.Position = Vector2.new(obj_pos.X, obj_pos.Y) 
newText.Visible = true 
else 
newText.Visible = false 
end 
end) 



local ret = {} 

ret.delete = function() 
newText.Visible = false 
newText:Remove() 
if c1 then 
c1:Disconnect() 
c1 = nil 
end 

end 

return ret 
end 

function OutlineEsp(color, obj) 
--if not Rayfield.Flags["OutlineSetting"].CurrentValue then return end 
local totalOutline 

if obj:FindFirstChildOfClass("Highlight") then 
totalOutline = obj:FindFirstChildOfClass("Highlight") 
totalOutline.OutlineColor = color 
totalOutline.FillColor = color 
totalOutline.FillTransparency = 0.75 
else 
totalOutline = Instance.new("Highlight", obj) 
totalOutline.Enabled = true 
totalOutline.OutlineColor = color 
totalOutline.FillColor = color 
totalOutline.FillTransparency = 0.75 
end 

local ret = {} 

ret.delete = function() 
totalOutline:Destroy() 
end 

return ret 
end 

Rayfield:LoadConfiguration()

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.Active = true
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 5.000
Frame.Position = UDim2.new(0, 0, 0.378649592, 0)
Frame.Size = UDim2.new(0, 1436, 0, 189)

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 6.000
TextLabel.Position = UDim2.new(-0.0139275761, 0, -0.00529084727, 0)
TextLabel.Size = UDim2.new(0, 1456, 0, 192)
TextLabel.Font = Enum.Font.FredokaOne
TextLabel.Text = "Made by okayy#3051"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextTransparency = 0.940
TextLabel.TextWrapped = true

TextLabel_2.Parent = Frame
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 6.000
TextLabel_2.Position = UDim2.new(-0.0236768797, 0, 0.380952567, 0)
TextLabel_2.Size = UDim2.new(0, 1456, 0, 192)
TextLabel_2.Font = Enum.Font.FredokaOne
TextLabel_2.Text = "https://discord.gg/Tf2yXfkB8S"
TextLabel_2.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.TextSize = 60.000
TextLabel_2.TextTransparency = 0.940
TextLabel_2.TextWrapped = true
