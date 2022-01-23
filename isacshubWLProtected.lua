-- for sure, why are you here? We trust each other you know.
local ExecutedTime = os.clock()
for _,v in pairs(game.Workspace:GetDescendants()) do
    if v.ClassName == "Seat" then
        v.Disabled = true
    end
end
local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/UI%20Library%202.0.lua'))();
Library:Notify("Loading UI")
if game.Players.LocalPlayer.PlayerScripts:FindFirstChild("LocalScript") then
    game.Players.LocalPlayer.PlayerScripts.LocalScript:Destroy()
end
if game.ReplicatedStorage.Storage["Scripts"]:FindFirstChild("CrashItem") then
    game.ReplicatedStorage.Storage.Scripts.CrashItem:Destroy()
end
game.Workspace.Events.AFK:FireServer("afkno")
local someRemoteInfo
local mt = getrawmetatable(game)
local namecall = mt.__namecall
setreadonly(mt,false)
OldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
    local args = {...}
    local method = getnamecallmethod()
    
    if tostring(self) == "LogPlayer" or tostring(self) == "Check" and method == "FireServer" or method == "InvokeServer" then
        return
    end
return OldNamecall(self, ...)
end)
Library:Notify("Anti Cheat Bypassed Successfully (Anti Log)")
Library:SetWatermark("isaa'c HUB | Public Build");
local UI = Library:CreateWindow("isaa'c HUB | RR 2 | Public Build | By:.V!ndor");
local ESPlib = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))()
ESPlib["Boxes"] = false
ESPlib["Enabled"] = true
ESPlib["Names"] = false
ESPlib["TeamColor"] = false
local TracerSettings = {
        ["IsTracers"] = false,
        ["TracerColor"] = Color3.fromRGB(252, 0, 0),
        ["Top"] = Vector2.new(game.Workspace.Camera.ViewportSize.X / 2, 0),
        ["Middle"] = Vector2.new(game.Workspace.Camera.ViewportSize.X / 2, game.Workspace.Camera.ViewportSize.Y / 2),
        ["Bottom"] = Vector2.new(game.Workspace.Camera.ViewportSize.X / 2, 1000),
        ["SelectedFrom"] = "Top"
}
local skyyy = Instance.new("Sky",game.Lighting)
    
local Skyboxes = {
    ["nebula"] = {
            SkyboxLf = "rbxassetid://159454286",
            SkyboxBk = "rbxassetid://159454299",
            SkyboxDn = "rbxassetid://159454296",
            SkyboxFt = "rbxassetid://159454293",
            SkyboxLf = "rbxassetid://159454286",
            SkyboxRt = "rbxassetid://159454300",
            SkyboxUp = "rbxassetid://159454288",
        },
        ["vaporwave"] = {
            SkyboxLf = "rbxassetid://1417494402",
            SkyboxBk = "rbxassetid://1417494030",
            SkyboxDn = "rbxassetid://1417494146",
            SkyboxFt = "rbxassetid://1417494253",
            SkyboxLf = "rbxassetid://1417494402",
            SkyboxRt = "rbxassetid://1417494499",
            SkyboxUp = "rbxassetid://1417494643",
        },
        ["clouds"] = {
            SkyboxLf = "rbxassetid://570557620",
            SkyboxBk = "rbxassetid://570557514",
            SkyboxDn = "rbxassetid://570557775",
            SkyboxFt = "rbxassetid://570557559",
            SkyboxLf = "rbxassetid://570557620",
            SkyboxRt = "rbxassetid://570557672",
            SkyboxUp = "rbxassetid://570557727",
        },
        ["twilight"] = {
            SkyboxLf = "rbxassetid://264909758",
            SkyboxBk = "rbxassetid://264908339",
            SkyboxDn = "rbxassetid://264907909",
            SkyboxFt = "rbxassetid://264909420",
            SkyboxLf = "rbxassetid://264909758",
            SkyboxRt = "rbxassetid://264908886",
            SkyboxUp = "rbxassetid://264907379",
        },
        ["cloudy"] = {
            SkyboxLf = "rbxassetid://366317794",
            SkyboxBk = "rbxassetid://366317731",
            SkyboxDn = "rbxassetid://366317751",
            SkyboxFt = "rbxassetid://366317771",
            SkyboxLf = "rbxassetid://366317794",
            SkyboxRt = "rbxassetid://366317814",
            SkyboxUp = "rbxassetid://366317824",
        },
        ["sunny"] = {
            SkyboxLf = "rbxassetid://244668716",
            SkyboxBk = "rbxassetid://244668548",
            SkyboxDn = "rbxassetid://244668645",
            SkyboxFt = "rbxassetid://244668671",
            SkyboxLf = "rbxassetid://244668716",
            SkyboxRt = "rbxassetid://244668771",
            SkyboxUp = "rbxassetid://244668836",
    }
}
local SlientAimSettings={
    IsSlientAim = false,
    IsCircle = false,
    CircleColor = Color3.fromRGB(0,0,0),
    CircleSize = 50,
    Thickness = 3
    
}
local Mouse = game.Players.LocalPlayer:GetMouse()
local Camera = workspace.CurrentCamera
    
local noclipping = false
game:GetService("RunService").RenderStepped:Connect(function()
    if noclipping == true then
        game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
    end
end)
    
-- ESP Tabok stb
local ESP_Tab = UI:AddTab("Visuals");
local PlayerRESP_Box = ESP_Tab:AddLeftTabbox()
local PlayerRelatedESP = PlayerRESP_Box:AddTab("Player Related")
local NPCectRESP = PlayerRESP_Box:AddTab("Other Related")
-- actual things
    
-----
PlayerRelatedESP:AddToggle('BoxESP', { Text = 'Box ESP', Default = false}):AddColorPicker("BoxESPColor", { Default = Color3.fromRGB(252, 0, 0) })
PlayerRelatedESP:AddToggle('NamESP', { Text = 'Name/Info ESP', Default = false})
Toggles.BoxESP:OnChanged(function()
    ESPlib["Boxes"] = Toggles.BoxESP.Value
end)
Options.BoxESPColor:OnChanged(function()
    ESPlib["Color"] = Options.BoxESPColor.Value
end)
Toggles.NamESP:OnChanged(function()
    ESPlib["Names"] = Toggles.NamESP.Value
end)
---
    
-----
PlayerRelatedESP:AddToggle('PlayerRTracers', { Text = 'Tracers', Default = false}):AddColorPicker("PlayerRTracersColor", { Default = Color3.fromRGB(252, 0, 0) })
PlayerRelatedESP:AddDropdown('TracerFrom', { Text = 'Tracers From', Default = "Top", Values = {"Top","Middle","Bottom"} });
Toggles.PlayerRTracers:OnChanged(function()
    TracerSettings.IsTracers = Toggles.PlayerRTracers.Value
end)
Options.PlayerRTracersColor:OnChanged(function()
    TracerSettings.TracerColor = Options.PlayerRTracersColor.Value
end)
Options.TracerFrom:OnChanged(function()
    TracerSettings.SelectedFrom = Options.TracerFrom.Value
end)
    -----
    
    
for i,v in pairs(game.Players:GetChildren()) do
    local Tracer = Drawing.new("Line")
    Tracer.Visible = false
    Tracer.Color = Color3.new(1,1,1)
    Tracer.Thickness = 1
    Tracer.Transparency = 1
    
    function lineesp()
        game:GetService("RunService").RenderStepped:Connect(function()
            if v.Name ~= game.Players.LocalPlayer.Name and v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
                local Vector, OnScreen = game.Workspace.Camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)
                if OnScreen then
                    Tracer.From = TracerSettings[TracerSettings["SelectedFrom"]]
                    Tracer.To = Vector2.new(Vector.X, Vector.Y)
                    Tracer.Visible = TracerSettings.IsTracers
                    Tracer.Color = TracerSettings.TracerColor
                else
                    Tracer.Color = TracerSettings.TracerColor
                    Tracer.Visible = false
                end
            else
                Tracer.Visible = false
            end
        end)
    end
    coroutine.wrap(lineesp)()
end
    
game.Players.PlayerAdded:Connect(function(v)
    local Tracer = Drawing.new("Line")
    Tracer.Visible = false
        
    Tracer.Thickness = 1
    Tracer.Transparency = 1
    
    function lineesp()
        game:GetService("RunService").RenderStepped:Connect(function()
                
            if v.Name ~= game.Players.LocalPlayer.Name and v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health > 0 then
                local Vector, OnScreen = game.Workspace.Camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)
    
                if OnScreen then
                    Tracer.From = TracerSettings[TracerSettings["SelectedFrom"]]
                    Tracer.To = Vector2.new(Vector.X, Vector.Y)
                    Tracer.Color = TracerSettings.TracerColor
                    Tracer.Visible = TracerSettings.IsTracers
                else
                    Tracer.Color = TracerSettings.TracerColor
                    Tracer.Visible = false
                end
            else
                Tracer.Visible = false
            end
        end)
    end
    coroutine.wrap(lineesp)()
end)
    
--
    
local DealerFolder = game.workspace.Dealers
local droppeditemsfolder = game.workspace.DroppedItems
local DealerESPSettings = {
    IsESP = false,
    color = Color3.fromRGB(3, 247, 255)
}
    
local DroppedItemsSettings = {
    IsESP = false,
        olor = Color3.fromRGB(204, 153, 0)
}

--DroppedItems
local function DealerESP(part,text)
    local DropText = Drawing.new("Text")
    DropText.Visible = false
    DropText.Center = true
    DropText.Outline = true
    DropText.Font = 2
    DropText.Size = 13
    DropText.Color = Color3.new(1,1,1)
    DropText.Text = text
    
    local function UPDATER()
        local c
        c = game:GetService("RunService").RenderStepped:Connect(function()
            if part.Parent ~= nil then
                
                local dropvector, onscreen = game.workspace.Camera:WorldToViewportPoint(part.Position)
                if onscreen then
                    DropText.Position = Vector2.new(dropvector.X, dropvector.Y)
                    DropText.Visible = DealerESPSettings.IsESP
                    DropText.Color = DealerESPSettings.color
                else
                    DropText.Visible = false
                end

            else
                DropText.Visible = false
                DropText:Remove()
                c:Disconnect()
            end
        end)
    end
    coroutine.wrap(UPDATER)()
end
    
-- NPC ESP
NPCectRESP:AddToggle('DealerESP', { Text = 'Dealer ESP', Default = false}):AddColorPicker("DealerESPColor", { Default = Color3.fromRGB(204, 153, 0)})
Toggles.DealerESP:OnChanged(function()
    DealerESPSettings.IsESP = Toggles.DealerESP.Value
    if Toggles.DealerESP.Value == true then
        for _,v in pairs(DealerFolder:GetChildren()) do
            if v.ClassName == "Model" and v:FindFirstChild("Bot") then
                DealerESP(v.Head,"Dealer")
            end
        end
    end
end)
    
Options.DealerESPColor:OnChanged(function()
    DealerESPSettings.color = Options.DealerESPColor.Value
end)
    
DealerFolder.ChildAdded:connect(function(a)
    if Toggles.DealerESP.Value == true and a.ClassName == "Model" and a:FindFirstChild("Bot") then
        DealerESP(v.Head,"Dealer")
    end
end)
    
local function DroppedESP(part,text)
    local DropText = Drawing.new("Text")
    DropText.Visible = false
    DropText.Center = true
    DropText.Outline = true
    DropText.Font = 2
    DropText.Size = 13
    DropText.Color = Color3.new(1,1,1) --> or any color, using FromRGB
    DropText.Text = text

    local function UPDATER()
        local c
        c = game:GetService("RunService").RenderStepped:Connect(function()
            if part.Parent ~= nil and Toggles.DroppedItemESP.Value == true and part.Parent.Parent.Name == "DroppedItems" then
                
                local dropvector, onscreen = game.workspace.Camera:WorldToViewportPoint(part.Position)

                if onscreen then
                    DropText.Position = Vector2.new(dropvector.X, dropvector.Y)
                    DropText.Visible = DroppedItemsSettings.IsESP
                    DropText.Color = DroppedItemsSettings.color
                else
                    DropText.Visible = false
                end

            else
                DropText.Visible = false
                DropText:Remove()
                c:Disconnect()
            end
        end)
    end
    coroutine.wrap(UPDATER)()
end
NPCectRESP:AddToggle('DroppedItemESP', { Text = 'Dropped Item ESP', Default = false}):AddColorPicker("DroppedESPColor", { Default = Color3.fromRGB(3, 247, 255)})
Toggles.DroppedItemESP:OnChanged(function()
    DroppedItemsSettings.IsESP = Toggles.DroppedItemESP.Value
    if Toggles.DroppedItemESP.Value == true then
        for _,v in pairs(droppeditemsfolder:GetChildren()) do
            if v.ClassName == "Tool" and v:FindFirstChild("Handle") then
                DroppedESP(v.Handle,v.Name)
            end
        end
    end
end)
droppeditemsfolder.ChildAdded:connect(function(a)
    if Toggles.DroppedItemESP.Value == true and a.ClassName == "Tool" and a:FindFirstChild("Handle") then
        DroppedESP(v.Handle,a.Name)
    end
end)
Options.DroppedESPColor:OnChanged(function()
    DroppedItemsSettings.color = Options.DroppedESPColor.Value
end)
    
----
local Weapon_Tab = UI:AddTab("Weapons");
local WeaponTabLeft_Box = Weapon_Tab:AddLeftTabbox()
local ActuallWeponBox = WeaponTabLeft_Box:AddTab("Gun Stuff here")
    
    
ActuallWeponBox:AddToggle('infiniteammo', { Text = 'Infinite Ammo', Default = false})
Toggles.infiniteammo:OnChanged(function()
    for _,v in pairs(game.Players.LocalPlayer.Backpack:GetDescendants()) do
        if v.ClassName == "NumberValue" and v.Name == "MaxAmmo" and v.Parent.ClassName == "Tool" then
            v.Value = 9999
        end 
    end
    for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
        if v.ClassName == "NumberValue" and v.Name == "MaxAmmo" and v.Parent.ClassName == "Tool" then
            v.Value = 9999
        end 
    end
end)
game.Players.LocalPlayer.Backpack.ChildAdded:connect(function()
    if Toggles.infiniteammo.Value == true then
        for _,v in pairs(game.Players.LocalPlayer.Backpack:GetDescendants()) do
            if v.ClassName == "NumberValue" and v.Name == "MaxAmmo" and v.Parent.ClassName == "Tool" then
                v.Value = 9999
            end 
        end
        for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if v.ClassName == "NumberValue" and v.Name == "MaxAmmo" and v.Parent.ClassName == "Tool" then
                v.Value = 9999
            end 
        end
    end
end)
    ---
local function TweenTeleportToPlayerPos(part)
    if part then
        local New_CFrame = part.CFrame
        local HRP = game.Players.LocalPlayer.Character.HumanoidRootPart
        local ti = TweenInfo.new(5, Enum.EasingStyle.Linear)
        local tp = {CFrame = New_CFrame * CFrame.new(0,5,0)}
        noclipping = true
        game:GetService("TweenService"):Create(HRP, ti, tp):Play()
        wait(5)
        noclipping = false
    end
end
local char = game.Players.LocalPlayer.Character
--
function tpforsalary()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(13.962219238281, 4.1898503303528, -201.90191650391)
end
function tpforbroom()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(13.962219238281, 4.1898503303528, -201.90191650391)
    wait(2)
    workspace.Events.Shop:FireServer("JobItems",0,"Broom",game:GetService("Players").LocalPlayer.PlayerGui.StaplersBusinessDialogue.Shop,game:GetService("Players").LocalPlayer.PlayerGui.StaplersBusinessDialogue.Shop.Validate)
end
local AutoFarm_Tab = UI:AddTab("Auto Farming");
local AutoFarmLeftBox_Box = AutoFarm_Tab:AddLeftTabbox()
local ActuallAutoFarmBoxCleaning= AutoFarmLeftBox_Box:AddTab("Cleaning AutoFarm")
ActuallAutoFarmBoxCleaning:AddButton('Teleport To NPC', tpforsalary);
ActuallAutoFarmBoxCleaning:AddButton('Teleport And Get Broom', tpforbroom);
ActuallAutoFarmBoxCleaning:AddToggle('autoeatlol', { Text = 'Auto Buy Food when starving', Default = false})
ActuallAutoFarmBoxCleaning:AddToggle('tpfastclean', { Text = 'TP Methood', Default = false})
ActuallAutoFarmBoxCleaning:AddToggle('fastspillclean', { Text = 'Tween Methood', Default = false})
local getting_Food = false
local isfoodneded = game.Players.LocalPlayer.PlayerGui.Stats.Warning
--13.962219238281, 4.1898503303528, -201.90191650391
--Toggles.autoeatlol.Value
    
    
    --0x31
local spill = nil
function AutoFarmFast()
    wait(0.5)
    if Toggles.fastspillclean.Value == true and game.Players.LocalPlayer.Backpack:FindFirstChild("Broom") and isfoodneded.Visible == false then
        --char.Humanoid:UnequipTools()
        local spill = nil
        repeat 
            wait(0.1)
            spill = game.Workspace.Job:GetChildren()[math.random(1, #game.Workspace.Job:GetChildren())]
        until spill:FindFirstChild("Script") == nil and spill.Decal.Transparency == 0
        if spill then
            --char.Humanoid:UnequipTools()
            TweenTeleportToPlayerPos(spill)  
            wait(1)
            --char.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Broom"))
            --game.Players.LocalPlayer.Backpack.Broom.Parent = char
            keypress(0x31)
            wait(0.2)
            keyrelease(0x31)
            wait(3)
            --char.Broom.Parent = game.Players.LocalPlayer.Backpack
            --char.Humanoid:UnequipTools()
            keypress(0x31)
            wait(0.2)
            keyrelease(0x31)
            spill = nil
            AutoFarmFast()
        end
    end
    if isfoodneded.Visible == true and Toggles.fastspillclean.Value == true and Toggles.autoeatlol.Value == true then
        wait(1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-182.83912658691, 3.9712247848511, 209.74925231934)
        wait(1)
        workspace.Events.Shop:FireServer("Food",4,"Chips",game:GetService("Players").LocalPlayer.PlayerGui.MegamartMegaMart.Shop,game:GetService("Players").LocalPlayer.PlayerGui.MegamartMegaMart.Shop.Validate)
        wait(0.3)
        workspace.Events.Shop:FireServer("Food",4,"Chips",game:GetService("Players").LocalPlayer.PlayerGui.MegamartMegaMart.Shop,game:GetService("Players").LocalPlayer.PlayerGui.MegamartMegaMart.Shop.Validate)
        wait(0.3)
        workspace.Events.Shop:FireServer("Food",4,"Chips",game:GetService("Players").LocalPlayer.PlayerGui.MegamartMegaMart.Shop,game:GetService("Players").LocalPlayer.PlayerGui.MegamartMegaMart.Shop.Validate)
        wait(0.5)
        keypress(0x32)
        wait(0.3)
        keyrelease(0x32)
        wait(0.1)
        mouse1click()
        wait(1.5)
        keypress(0x33)
        wait(0.3)
        keyrelease(0x33)
        wait(0.1)
        mouse1click()
        wait(1.5)
        keypress(0x34)
        wait(0.3)
        keyrelease(0x34)
         wait(0.1)
        mouse1click()
        wait(1.5)
        if Toggles.tpfastclean.Value == true then
            AutoFarmFast()
        end
    end
end
    function AutoFarmFastTP()
    wait(0.5)
        --char.Humanoid:UnequipTools()
    if Toggles.tpfastclean.Value == true and game.Players.LocalPlayer.Backpack:FindFirstChild("Broom") and isfoodneded.Visible == false then
            --char.Humanoid:UnequipTools()
            
        repeat 
            wait(0.1)
            spill = game.Workspace.Job:GetChildren()[math.random(1, #game.Workspace.Job:GetChildren())]
        until spill.Decal.Transparency == 0 and spill:FindFirstChild("Script") == nil
        if spill then
            -- char.Humanoid:UnequipTools()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = spill.CFrame * CFrame.new(0,4,0)  
            wait(1)
            --char.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Broom"))
            --game.Players.LocalPlayer.Backpack.Broom.Parent = char
            keypress(0x31)
            wait(0.2)
            keyrelease(0x31)
            wait(3)
            --char.Broom.Parent = game.Players.LocalPlayer.Backpack
            --char.Humanoid:UnequipTools()
            keypress(0x31)
            wait(0.2)
            keyrelease(0x31)
                spill = nil
            wait(0.2)
            AutoFarmFastTP()
        end
    end
    if isfoodneded.Visible == true and Toggles.tpfastclean.Value == true and Toggles.autoeatlol.Value == true then
        wait(1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-182.83912658691, 3.9712247848511, 209.74925231934)
        wait(1)
        workspace.Events.Shop:FireServer("Food",4,"Chips",game:GetService("Players").LocalPlayer.PlayerGui.MegamartMegaMart.Shop,game:GetService("Players").LocalPlayer.PlayerGui.MegamartMegaMart.Shop.Validate)
        wait(0.3)
        workspace.Events.Shop:FireServer("Food",4,"Chips",game:GetService("Players").LocalPlayer.PlayerGui.MegamartMegaMart.Shop,game:GetService("Players").LocalPlayer.PlayerGui.MegamartMegaMart.Shop.Validate)
        wait(0.3)
        workspace.Events.Shop:FireServer("Food",4,"Chips",game:GetService("Players").LocalPlayer.PlayerGui.MegamartMegaMart.Shop,game:GetService("Players").LocalPlayer.PlayerGui.MegamartMegaMart.Shop.Validate)
        wait(0.5)
        keypress(0x32)
        wait(0.3)
        keyrelease(0x32)
        wait(0.1)
        mouse1click()
        wait(1.5)
        keypress(0x33)
        wait(0.3)
        keyrelease(0x33)
        wait(0.1)
        mouse1click()
        wait(1.5)
        keypress(0x34)
        wait(0.3)
        keyrelease(0x34)
        wait(0.1)
        mouse1click()
        wait(1.5)
        if Toggles.tpfastclean.Value == true then
            AutoFarmFastTP()
        end
    end
end
--tpfastclean
Toggles.fastspillclean:OnChanged(function()
   if Toggles.fastspillclean.Value == true then
       AutoFarmFast()
   end
end)
Toggles.tpfastclean:OnChanged(function()
    if Toggles.tpfastclean.Value == true then
        AutoFarmFastTP()
    end
end)
----
    
local LocalPlayer_Tab = UI:AddTab("Local Player");
local LocalPlayerLeft_Box = LocalPlayer_Tab:AddLeftTabbox()
local LocalPlayerRight_Box = LocalPlayer_Tab:AddRightTabbox()
local LightingRightBox= LocalPlayerRight_Box:AddTab("Lighting Stuff")
local ActuallyLocalPlayerLeft= LocalPlayerLeft_Box:AddTab("Player Settings")

LightingRightBox:AddSlider("funnybrightness", { Text = 'Brightness', Default = game.Lighting.Brightness, Min = 0, Max = 10, Rounding = 0, Suffix = "" });
LightingRightBox:AddLabel("Ambient Color"):AddColorPicker("aimbentcolor", {Default = Color3.fromRGB(0,0,0)})
LightingRightBox:AddDropdown('selectedskybox', { Text = 'Skybox', Default = "sunny", Values = {"nebula","vaporwave","clouds","twilight","cloudy","sunny"} });
Options.selectedskybox:OnChanged(function()
    game.Lighting.Sky.SkyboxLf = Skyboxes[Options.selectedskybox.Value].SkyboxLf
    game.Lighting.Sky.SkyboxBk = Skyboxes[Options.selectedskybox.Value].SkyboxBk
    game.Lighting.Sky.SkyboxDn = Skyboxes[Options.selectedskybox.Value].SkyboxDn
    game.Lighting.Sky.SkyboxFt = Skyboxes[Options.selectedskybox.Value].SkyboxFt
    game.Lighting.Sky.SkyboxRt = Skyboxes[Options.selectedskybox.Value].SkyboxRt
    game.Lighting.Sky.SkyboxUp = Skyboxes[Options.selectedskybox.Value].SkyboxUp
end)
    
Options.aimbentcolor:OnChanged(function()
    game.Lighting.Ambient = Options.aimbentcolor.Value
end)
Options.funnybrightness:OnChanged(function()
    game.Lighting.Brightness = Options.funnybrightness.Value
end)
function getdroppeditems()
     for _,v in pairs(game.Workspace.DroppedItems:GetDescendants()) do
        if v:IsA("TouchTransmitter") then
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
            wait()
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1)
        end
    end
end
function NameTagRemove()
    for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
        if v:IsA("BillboardGui") then
            v:Destroy()
        end
    end
end
ActuallyLocalPlayerLeft:AddButton("Remove NameTag (FE)", NameTagRemove);
ActuallyLocalPlayerLeft:AddSlider("funnywalkspeed", { Text = 'WalkSpeed', Default = 10, Min = 0, Max = 500, Rounding = 0, Suffix = "" });
ActuallyLocalPlayerLeft:AddSlider("funnyjumpower", { Text = 'JumpPower', Default = 50, Min = 0, Max = 500, Rounding = 0, Suffix = "" });
ActuallyLocalPlayerLeft:AddButton('Pick Up Dropped Items', getdroppeditems);
ActuallyLocalPlayerLeft:AddToggle('autopickupdroppeditems', { Text = 'Auto Pick Up Dropped Times', Default = false})
Toggles.autopickupdroppeditems:OnChanged(function()
    if Toggles.autopickupdroppeditems.Value == true then
        for _,v in pairs(game.Workspace.DroppedItems:GetDescendants()) do
            if v:IsA("TouchTransmitter") then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
                wait()
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1)
            end
        end
    end
end)
    
game.Workspace.DroppedItems.ChildAdded:connect(function()
    if Toggles.autopickupdroppeditems.Value == true then
        for _,v in pairs(game.Workspace.DroppedItems:GetDescendants()) do
            if v:IsA("TouchTransmitter") then
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
                wait()
                firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1)
            end
        end
    end
end)
Options.funnywalkspeed:OnChanged(function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Options.funnywalkspeed.Value
end)
Options.funnyjumpower:OnChanged(function()
   game.Players.LocalPlayer.Character.Humanoid.JumpPower = Options.funnyjumpower.Value
end)
local VU=game:service'VirtualUser'
game:service'Players'.LocalPlayer.Idled:connect(function()
    VU:CaptureController()
    VU:ClickButton2(Vector2.new())
end)
    
local Troll_Tab = UI:AddTab("Troll");
local TrollRight_Box = Troll_Tab:AddLeftTabbox()
local TrollRightBox= TrollRight_Box:AddTab("Troll da server")
function crashserver()
    if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool"):FindFirstChild("FireEffects") then
        game:GetService("RunService").RenderStepped:connect(function()
            wait()
            game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").BulletCrack:FireServer()
            game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").FireEffects:FireServer(game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool"))
        end)
    end
end
function killServer()
    if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool"):FindFirstChild("Damage") then
        for count = 1, 3 do
            for _,v in pairs(game.Players:GetChildren()) do
                if v.Name ~= game.Players.LocalPlayer.Name then
                    game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").BulletCrack:FireServer()
                    game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").FireEffects:FireServer(game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool"))
                    game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Damage:FireServer(v.Character.Humanoid,999,math.random(100,1000),v.Character.UpperTorso)
                end
            end
            wait(0.1)
        end
    end
end
TrollRightBox:AddButton("Crash Server", crashserver)
TrollRightBox:AddButton("Kill Server", killServer)
    
Library:Notify("Report bugs to me if there is any")
Library:Notify("For Cleaning Auto Farm you must have broom, IN SLOT 1")
Library:Notify("And nothing in the other 8 slots")
Library:Notify("UI Loaded in "..os.clock()-ExecutedTime.." MS")
