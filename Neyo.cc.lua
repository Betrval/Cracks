local startTick = tick()


local library =
    loadstring(game:HttpGet("https://raw.githubusercontent.com/muzscripter/ui-librarys/main/Source/Octohook.lua"))({cheatname = "neyo.cc", gamename = "Da Hood"} --
)
library:init()
local utility = library.utility
local signal = library.signal

local menu = library.NewWindow({title = library.cheatname .. " - Private | " ..   library.gamename, size = UDim2.new(0, 500, 0.5, 20)}) 

local Aiming = loadstring(game:HttpGet("https://pastebin.com/raw/YHjivuHu"))()
local m = loadstring(game:HttpGet("https://pastebin.com/raw/Avdzc0TJ", true))();

Aiming.TeamCheck(false)



local Workspace = game:GetService("Workspace")

local Players = game:GetService("Players")

local RunService = game:GetService("RunService")

local UserInputService = game:GetService("UserInputService")



local LocalPlayer = Players.LocalPlayer

local Mouse = LocalPlayer:GetMouse()

local CurrentCamera = Workspace.CurrentCamera



local DaHoodSettings = {

    SilentAim = true,

    AimLock = false,

    Prediction = 0.1,

    AimLockKeybind = Enum.KeyCode.E,

    Resolver = false,

}

getgenv().DaHoodSettings = DaHoodSettings



local GunSettings = {

    ["Double-Barrel SG"] = { 

        ["FOV"] = 40

    },

    ["Revolver"] = {

        ["FOV"] = 42

    },

    ["SMG"] = {

        ["FOV"] = 33

    },

    ["TacticalShotgun"] = {

        ["FOV"] = 45

    },

    ["Silencer"] = {

        ["FOV"] = 25

    },


    ["Shotgun"] = {

        ["FOV"] = 30

    }

}


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--> Tabs <-- 



local CombatTab = menu:AddTab("Combat")

local SettingsTab = library:CreateSettingsTab(menu)
--> sections <-- 
local Aimbotsec = CombatTab:AddSection("Aim-Assist", 1)
local bulletstrafe = CombatTab:AddSection("Bullet-Strafe", 2)
local gunfov = CombatTab:AddSection("Gun FOV Configuration", 2)

getgenv().Settings = {
    Main = {
        Enable = true,
        
        HoldKey = false,
        ToggleKey = true,
        
        UseKeyBoardKey = true,
        KeyBoardKey = Enum.KeyCode.C, -- https://create.roblox.com/docs/reference/engine/enums/KeyCode
        
        UseMouseKey = false,
        MouseKey = Enum.UserInputType.MouseButton2, -- https://create.roblox.com/docs/reference/engine/enums/UserInputType
        
        ThirdPerson = true,
        FirstPerson = true,
        
        AutoPingSets = false,
        
        UseCircleRadius = false,
        DisableOutSideCircle = false,
        
        UseShake = false,
        ShakePower = 0,
        
        CheckForWalls = false,
    },
    Check = {
        CheckIfKo = false, -- This Is For Da Hood
        DisableOnTargetDeath = false,
        DisableOnPlayerDeath = false,
    },
    Horizontal = {
        PredictMovement = false,
        PredictionVelocity = 0.17221418,
    },
    Smooth = {
        Smoothness = true,
        SmoothnessAmount = 0.019,
        EasingStyle = Enum.EasingStyle.Circular,
        EasingDirection = Enum.EasingDirection.InOut,
    },
    Part = {
        AimPart = "Head",
        CheckIfJumpedAimPart = "HumanoidRootPart",
        CheckIfJumped = false,
        GetClosestPart = false,
    },
    Visual = {
        ShowFov = false,
        FovRadius = 60,
    },
    Spoofer = {
        MemorySpoofer = false,
        MemoryMost = 85000,
        MemoryLeast = 80000,
        
        PingSpoofer = false,
        PingTabColor = Color3.fromRGB(211, 88, 33),
        PingMost = 2000,
        PingLeast = 1000,
    }
}

local aimwwwwbottoggle = Aimbotsec:AddToggle(
    {
      
        state = false;
        tooltip = 'this is a tooltip!';
        risky = false,
        text = "Enabled",
        flag = "testflag",
        callback = function(state)
            getgenv().Settings.Main.Enable = state
    end 
    }
)

aimwwwwbottoggle:AddBind(
    {
        tooltip = 'this is a tooltip!';
        text = "Aimbot",
         mode = "toggle",
          risky = true,
        flag = "Aimbotkeybind",
        nomouse = false,
        noindicator = false,
        bind = Enum.KeyCode.C,
        callback = function(state)
            getgenv().Settings.Main.KeyBoardKey = state
        end
    }
)

local aimbottoggle = Aimbotsec:AddToggle(
    {
      
        state = false;
        tooltip = 'this is a tooltip!';
        risky = false,
        text = "Smoothness",
        flag = "testflag",
        callback = function(state)
            getgenv().Settings.Smooth.Smoothness = state
    end 
    }
)

local aimbottoggle = Aimbotsec:AddToggle(
    {
      
        state = false;
        tooltip = 'this is a tooltip!';
        risky = false,
        text = "Prediction",
        flag = "testflag",
        callback = function(state)
            getgenv().Settings.Horizontal.PredictMovement = state
    end 
    }
)

local aimbottoggle = Aimbotsec:AddToggle(
    {
      
        state = false;
        tooltip = 'this is a tooltip!';
        risky = false,
        text = "Check If KO",
        flag = "testflag",
        callback = function(state)
            getgenv().Settings.Check.CheckIfKo = state
    end 
    }
)

local aimbottoggle = Aimbotsec:AddToggle(
    {
      
        state = false;
        tooltip = 'this is a tooltip!';
        risky = false,
        text = "Ping Based",
        flag = "testflag",
        callback = function(state)
            getgenv().Settings.Main.AutoPingSets = state
    end 
    }
)

local aimbottoggle = Aimbotsec:AddToggle(
    {
      
        state = false;
        tooltip = 'this is a tooltip!';
        risky = false,
        text = "Disable On Target Death",
        flag = "testflag",
        callback = function(state)
            getgenv().Settings.Check.DisableOnTargetDeath = state
    end 
    }
)

local aimbottoggle = Aimbotsec:AddToggle(
    {
      
        state = false;
        tooltip = 'this is a tooltip!';
        risky = false,
        text = "Disable On Player Death",
        flag = "testflag",
        callback = function(state)
            getgenv().Settings.Check.DisableOnPlayerDeath = state
    end 
    }
)

local hweqheqwhqw = Aimbotsec:AddToggle(
    {
      
        state = false;
        tooltip = 'this is a tooltip!';
        risky = false,
        text = "Shake",
        flag = "testflag",
        callback = function(state)
            getgenv().Settings.Main.UseShake = state
    end 
    }
)

local aimbottoggle = Aimbotsec:AddToggle(
    {
      
        state = false;
        tooltip = 'this is a tooltip!';
        risky = false,
        text = "Check For Walls",
        flag = "testflag",
        callback = function(state)
            getgenv().Settings.Main.CheckForWalls = state
    end 
    }
)

local aimbottoggle = Aimbotsec:AddToggle(
    {
      
        state = false;
        tooltip = 'this is a tooltip!';
        risky = false,
        text = "Show Field Of View",
        flag = "testflag",
        callback = function(state)
            getgenv().Settings.Visual.ShowFov = state
    end 
    }
)

local aimbottoggle = Aimbotsec:AddToggle(
    {
      
        state = false;
        tooltip = 'this is a tooltip!';
        risky = false,
        text = "Get Closest Part",
        flag = "testflag",
        callback = function(state)
            getgenv().Settings.Part.GetClosestPart = state
    end 
    }
)

local aimbottoggle = Aimbotsec:AddToggle(
    {
      
        state = false;
        tooltip = 'this is a tooltip!';
        risky = false,
        text = "Disable Outside Circle Radius",
        flag = "testflag",
        callback = function(state)
            getgenv().Settings.Main.DisableOutSideCircle = state
    end 
    }
)

Aimbotsec:AddList(
    {
        text = "Assist Hit-Part",
        flag = "",
         selected = {'Head'};
        multi = false,
        values = { 
            "Head",
            "UpperTorso",
            "HumanoidRootPart",
             "LowerTorso", 
             "LeftLowerArm",
             "RightLowerArm",
             "LeftUpperArm",
             "RightUpperArm",
             "LeftLowerLeg",
             "LeftUpperLeg",
             "RightLowerLeg",
             "RightUpperLeg"
        },
    --   
        callback = function(state)
            getgenv().Settings.Part.AimPart = state
        end
    }
)

Aimbotsec:AddList(
    {
        text = "Assist Jump Hit-Part",
        flag = "",
         selected = {'HumanoidRootPart'};
        multi = false,
        values = { 
            "Head",
            "UpperTorso",
            "HumanoidRootPart",
             "LowerTorso", 
             "LeftLowerArm",
             "RightLowerArm",
             "LeftUpperArm",
             "RightUpperArm",
             "LeftLowerLeg",
             "LeftUpperLeg",
             "RightLowerLeg",
             "RightUpperLeg"
        },
    --   
        callback = function(state)
            getgenv().Settings.Part.CheckIfJumpedAimPart = state
        end
    }
)

Aimbotsec:AddSlider(
    {
        text = "Smoothness",
        flag = '"',
        suffix = "°",
        min = 0,
        max = 0.1,
        increment = 0.001,
        callback = function(state)
            getgenv().Smooth.SmoothnessAmount = state
        end
    }
)

Aimbotsec:AddSlider(
    {
        text = "Shake",
        flag = '"',
        suffix = "°",
        min = 0,
        max = 100,
        increment = .1,
        callback = function(state)
            getgenv().Settings.Main.ShakePower = state
        end
    }
)

Aimbotsec:AddSlider(
    {
        text = "Prediction",
        flag = '"',
        suffix = "°",
        min = 0,
        max = 2,
        increment = .01,
        callback = function(state)
            getgenv().Settings.Horizontal.PredictionVelocity = state
        end
    }
)

Aimbotsec:AddSlider(
    {
        text = "Radius",
        flag = '"',
        suffix = "°",
        min = 10,
        max = 500,
        increment = .1,
        callback = function(state)
            getgenv().Settings.Visual.FovRadius = state
        end
    }
)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local aimbottoggle = bulletstrafe:AddToggle(
    {
      
        state = false;
        tooltip = 'this is a tooltip!';
        risky = false,
        text = "Enabled",
        flag = "testflag",
        callback = function(state)
            DaHoodSettings.SilentAim = state
    end 
    }
)

local aimbotsstoggle = bulletstrafe:AddToggle(
    {
      
        state = false;
        tooltip = 'this is a tooltip!';
        risky = false,
        text = "Visualize Field Of View",
        flag = "testflag",
        callback = function(state)
            getgenv().Aiming.ShowFOV = state
    end 
    }
)

aimbotsstoggle:AddColor(
    {
        text = "Color",
          color = Color3.new(1,1,1);
          tooltip = '';
        flag = "",
        callback = function(state)
            getgenv().Aiming.FOVColour = state
        end
    }
)

local aimbottoggle = bulletstrafe:AddToggle(
    {
      
        state = false;
        tooltip = 'this is a tooltip!';
        risky = false,
        text = "Resolve Anti-Aim",
        flag = "testflag",
        callback = function(state)
            DaHoodSettings.Resolver = state
    end 
    }
)

local aimbottoggle = bulletstrafe:AddToggle(
    {
      
        state = false;
        tooltip = 'this is a tooltip!';
        risky = false,
        text = "Nearby Check",
        flag = "testflag",
        callback = function(state)
            getgenv().Aiming.VisibleCheck = state
    end 
    }
)

bulletstrafe:AddSlider(
    {
        text = "Field Of View Radius",
        flag = '"',
        suffix = "°",
        min = 1,
        max = 500,
        increment = .1,
        callback = function(state)
            getgenv().Aiming.FOV = state
        end
    }
)

bulletstrafe:AddSlider(
    {
        text = "Prediction",
        flag = '"',
        suffix = "°",
        min = 0,
        max = 2,
        increment = .01,
        callback = function(state)
            DaHoodSettings.Prediction = state
        end
    }
)

bulletstrafe:AddList(
    {
        text = "Strafe Hit-Part",
        flag = "",
         selected = {"Head", "UpperTorso", "HumanoidRootPart", "LowerTorso", "LeftHand", "RightHand", "LeftLowerArm", "RightLowerArm", "LeftUpperArm", "RightUpperArm", "LeftFoot", "LeftLowerLeg",  "LeftUpperLeg", "RightLowerLeg", "RightFoot",  "RightUpperLeg"};
        multi = true,
        values = { 
            "Head",
            "UpperTorso",
            "HumanoidRootPart",
             "LowerTorso", 
             "LeftLowerArm",
             "RightLowerArm",
             "LeftUpperArm",
             "RightUpperArm",
             "LeftLowerLeg",
             "LeftUpperLeg",
             "RightLowerLeg",
             "RightUpperLeg"
        },
    --   
        callback = function(state)
            getgenv().Aiming.TargetPart = state
        end
    }
)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

gunfov:AddSlider(
    {
        text = "Double Barrel",
        flag = '"',
        suffix = "°",
        min = 0,
        max = 500,
        increment = .1,
        callback = function(state)
            Print(state)
        end
    }
)

gunfov:AddSlider(
    {
        text = "Revolver",
        flag = '"',
        suffix = "°",
        min = 0,
        max = 500,
        increment = .1,
        callback = function(state)
            Print(state)
        end
    }
)

gunfov:AddSlider(
    {
        text = "Silencer",
        flag = '"',
        suffix = "°",
        min = 0,
        max = 500,
        increment = .1,
        callback = function(state)
            Print(state)
        end
    }
)

gunfov:AddSlider(
    {
        text = "Shotgun",
        flag = '"',
        suffix = "°",
        min = 0,
        max = 500,
        increment = .1,
        callback = function(state)
            Print(state)
        end
    }
)

gunfov:AddSlider(
    {
        text = "Tactical Shotgun",
        flag = '"',
        suffix = "°",
        min = 0,
        max = 500,
        increment = .1,
        callback = function(state)
            Print(state)
        end
    }
)

gunfov:AddSlider(
    {
        text = "Glock",
        flag = '"',
        suffix = "°",
        min = 0,
        max = 500,
        increment = .1,
        callback = function(state)
            Print(state)
        end
    }
)




function Aiming.Check()

    if not (Aiming.Enabled == true and Aiming.Selected ~= LocalPlayer and Aiming.SelectedPart ~= nil) then

        return false

    end

    local Character = Aiming.Character(Aiming.Selected)

    local Grabbed = Character:FindFirstChild("GRABBING_CONSTRAINT") ~= nil

    if (KOd or Grabbed) then

        return false

    end

    return true

end



task.spawn(function()

    while task.wait() do

        if DaHoodSettings.Resolver and Aiming.Selected ~= nil and (Aiming.Selected.Character)  then

            local oldVel = game.Players[Aiming.Selected.Name].Character.HumanoidRootPart.Velocity

            game.Players[Aiming.Selected.Name].Character.HumanoidRootPart.Velocity = Vector3.new(oldVel.X, -0, oldVel.Z)

        end 

    end

end)



local Script = {Functions = {}}



Script.Functions.getToolName = function(name)

    local split = string.split(string.split(name, "[")[2], "]")[1]

    return split

end



Script.Functions.getEquippedWeaponName = function(player)

   if (player.Character) and player.Character:FindFirstChildWhichIsA("Tool") then

      local Tool =  player.Character:FindFirstChildWhichIsA("Tool")

      if string.find(Tool.Name, "%[") and string.find(Tool.Name, "%]") and not string.find(Tool.Name, "Wallet") and not string.find(Tool.Name, "Phone") then 

         return Script.Functions.getToolName(Tool.Name)

      end

   end

   return nil

end



game:GetService("RunService").RenderStepped:Connect(function()

    if Script.Functions.getEquippedWeaponName(game.Players.LocalPlayer) ~= nil then

        local WeaponSettings = GunSettings[Script.Functions.getEquippedWeaponName(game.Players.LocalPlayer)]

        if WeaponSettings ~= nil then

            Aiming.FOV = WeaponSettings.FOV

        else

            Aiming.FOV = 5

        end

    end    

end)



local __index

__index = hookmetamethod(game, "__index", function(t, k)

    if (t:IsA("Mouse") and (k == "Hit" or k == "Target") and Aiming.Check()) then

        local SelectedPart = Aiming.SelectedPart

        if (DaHoodSettings.SilentAim and (k == "Hit" or k == "Target")) then

            local Hit = SelectedPart.CFrame + (SelectedPart.Velocity * DaHoodSettings.Prediction)

            return (k == "Hit" and Hit or SelectedPart)

        end

    end



    return __index(t, k)

end)



RunService:BindToRenderStep("AimLock", 0, function()

    if (DaHoodSettings.AimLock and Aiming.Check() and UserInputService:IsKeyDown(DaHoodSettings.AimLockKeybind)) then

        local SelectedPart = Aiming.SelectedPart

        local Hit = SelectedPart.CFrame + (SelectedPart.Velocity * DaHoodSettings.Prediction)

        CurrentCamera.CFrame = CFrame.lookAt(CurrentCamera.CFrame.Position, Hit.Position)

    end
 end)

wait(3)

local Players, Uis, RService, Inset, CurrentCamera =
game:GetService("Players"),
game:GetService("UserInputService"),
game:GetService("RunService"),
game:GetService("GuiService"):GetGuiInset().Y,
game:GetService("Workspace").CurrentCamera

local Client = Players.LocalPlayer

local Mouse, Camera = Client:GetMouse(), workspace.CurrentCamera

local Circle = Drawing.new("Circle")

local CF, RNew, Vec3, Vec2 = CFrame.new, Ray.new, Vector3.new, Vector2.new

local OldAimPart = getgenv().Settings.Part.AimPart

local AimlockTarget, MousePressed, CanNotify = nil, false, false


-- // Fov
getgenv().UpdateFOV = function()
if (not Circle) then
    return (Circle)
end
Circle.Color = Color3.fromRGB(255, 255, 255)
Circle.Visible = Settings.Visual.ShowFov
Circle.Radius = Settings.Visual.FovRadius
Circle.Thickness = 1
Circle.Position = Vec2(Mouse.X, Mouse.Y + Inset)
return (Circle)
end

RService.Heartbeat:Connect(UpdateFOV)

-- // Functions

getgenv().WallCheck = function(destination, ignore)
local Origin = Camera.CFrame.p
local CheckRay = RNew(Origin, destination - Origin)
local Hit = game.workspace:FindPartOnRayWithIgnoreList(CheckRay, ignore)
return Hit == nil
end

getgenv().WTS = function(Object)
local ObjectVector = Camera:WorldToScreenPoint(Object.Position)
return Vec2(ObjectVector.X, ObjectVector.Y)
end

getgenv().IsOnScreen = function(Object)
local IsOnScreen = Camera:WorldToScreenPoint(Object.Position)
return IsOnScreen
end

getgenv().FilterObjs = function(Object)
if string.find(Object.Name, "Gun") then
    return
end
if table.find({"Part", "MeshPart", "BasePart"}, Object.ClassName) then
    return true
end
end

getgenv().GetClosestBodyPart = function(character)
local ClosestDistance = 1 / 0
local BodyPart = nil
if (character and character:GetChildren()) then
    for _, x in next, character:GetChildren() do
        if FilterObjs(x) and IsOnScreen(x) then
            local Distance = (WTS(x) - Vec2(Mouse.X, Mouse.Y)).Magnitude
            if (Circle.Radius > Distance and Distance < ClosestDistance) then
                ClosestDistance = Distance
                BodyPart = x
            end
        end
    end
end
return BodyPart
end

getgenv().WorldToViewportPoint = function(P)
return Camera:WorldToViewportPoint(P)
end

getgenv().WorldToScreenPoint = function(P)
return Camera.WorldToScreenPoint(Camera, P)
end

getgenv().GetObscuringObjects = function(T)
if T and T:FindFirstChild(getgenv().Settings.Part.AimPart) and Client and Client.Character:FindFirstChild("Head") then
    local RayPos =
        workspace:FindPartOnRay(RNew(T[getgenv().Settings.Part.AimPart].Position, Client.Character.Head.Position))
    if RayPos then
        return RayPos:IsDescendantOf(T)
    end
end
end

getgenv().GetNearestTarget = function()
local AimlockTarget, Closest = nil, 1 / 0

for _, v in pairs(game:GetService("Players"):GetPlayers()) do
    if (v.Character and v ~= Client and v.Character:FindFirstChild("HumanoidRootPart")) then
        local Position, OnScreen = Camera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
        local Distance = (Vec2(Position.X, Position.Y) - Vec2(Mouse.X, Mouse.Y)).Magnitude
        if Settings.Main.CheckForWalls then
            if
                (Circle.Radius > Distance and Distance < Closest and OnScreen and
                    getgenv().WallCheck(v.Character.HumanoidRootPart.Position, {Client, v.Character}))
             then
                Closest = Distance
                AimlockTarget = v
            end
        elseif Settings.Main.UseCircleRadius then
            if
                (Circle.Radius > Distance and Distance < Closest and OnScreen and
                    getgenv().WallCheck(v.Character.HumanoidRootPart.Position, {Client, v.Character}))
             then
                Closest = Distance
                AimlockTarget = v
            end
        else
            if (Circle.Radius > Distance and Distance < Closest and OnScreen) then
                Closest = Distance
                AimlockTarget = v
            end
        end
    end
end
return AimlockTarget
end

-- // Use KeyBoardKey Function

Uis.InputBegan:connect(
function(input)
    if
        input.KeyCode == Settings.Main.KeyBoardKey and Settings.Main.UseKeyBoardKey == true and
            getgenv().Settings.Main.Enable == true and
            AimlockTarget == nil and
            getgenv().Settings.Main.HoldKey == true
     then
        pcall(
            function()
                MousePressed = true
                AimlockTarget = GetNearestTarget()
            end
        )
    end
end
)
Uis.InputEnded:connect(
function(input)
    if
        input.KeyCode == Settings.Main.KeyBoardKey and getgenv().Settings.Main.HoldKey == true and
            Settings.Main.UseKeyBoardKey == true and
            getgenv().Settings.Main.Enable == true and
            AimlockTarget ~= nil
     then
        AimlockTarget = nil
        MousePressed = false
    end
end
)

Uis.InputBegan:Connect(
function(keyinput, stupid)
    if
        keyinput.KeyCode == Settings.Resolver.UnderGroundKey and getgenv().Settings.Main.Enable == true and
            Settings.Resolver.UseUnderGroundKeybind == true
     then
        if Settings.Resolver.UnderGround == true then
            Settings.Resolver.UnderGround = false
            if getgenv().Settings.Resolver.SendNotification then
                game.StarterGui:SetCore(
                    "SendNotification",
                    {
                        Title = " ",
                        Text = "Disabled UnderGround Resolver",
                        Icon = "rbxassetid://11394475200",
                        Duration = 1
                    }
                )
            end
        else
            Settings.Resolver.UnderGround = true
            if getgenv().Settings.Resolver.SendNotification then
                game.StarterGui:SetCore(
                    "SendNotification",
                    {
                        Title = " ",
                        Text = "Enabled UnderGround Resolver",
                        Icon = "rbxassetid://11394475200",
                        Duration = 1
                    }
                )
            end
        end
    end
end
)

Uis.InputBegan:Connect(
function(keyinput, stupid)
    if
        keyinput.KeyCode == Settings.Resolver.DetectDesyncKey and getgenv().Settings.Main.Enable == true and
            Settings.Resolver.UseDetectDesyncKeybind == true
     then
        if Settings.Resolver.DetectDesync == true then
            Settings.Resolver.DetectDesync = false
            if getgenv().Settings.Resolver.SendNotification then
                game.StarterGui:SetCore(
                    "SendNotification",
                    {
                        Title = "Sanky Box",
                        Text = "Disabled Desync Resolver",
                        Icon = "rbxassetid://11394475200",
                        Duration = 1
                    }
                )
            end
        else
            Settings.Resolver.DetectDesync = true
            if getgenv().Settings.Resolver.SendNotification then
                game.StarterGui:SetCore(
                    "SendNotification",
                    {
                        Title = "Sanky Box",
                        Text = "Enabled Desync Resolver",
                        Icon = "rbxassetid://11394475200",
                        Duration = 1
                    }
                )
            end
        end
    end
end
)

Uis.InputBegan:Connect(
function(keyinput, stupid)
    if
        keyinput.KeyCode == Settings.Main.KeyBoardKey and Settings.Main.UseKeyBoardKey == true and
            getgenv().Settings.Main.Enable == true and
            AimlockTarget == nil and
            getgenv().Settings.Main.ToggleKey == true
     then
        pcall(
            function()
                MousePressed = true
                AimlockTarget = GetNearestTarget()
            end
        )
    elseif
        keyinput.KeyCode == Settings.Main.KeyBoardKey and Settings.Main.UseKeyBoardKey == true and
            getgenv().Settings.Main.Enable == true and
            AimlockTarget ~= nil
     then
        AimlockTarget = nil
        MousePressed = false
    end
end
)

-- // Use MouseKey Function

Uis.InputBegan:connect(
function(input)
    if
        input.UserInputType == Settings.Main.MouseKey and Settings.Main.UseMouseKey == true and
            getgenv().Settings.Main.Enable == true and
            AimlockTarget == nil and
            getgenv().Settings.Main.HoldKey == true
     then
        pcall(
            function()
                MousePressed = true
                AimlockTarget = GetNearestTarget()
            end
        )
    end
end
)
Uis.InputEnded:connect(
function(input)
    if
        input.UserInputType == Settings.Main.MouseKey and getgenv().Settings.Main.HoldKey == true and
            Settings.Main.UseMouseKey == true and
            getgenv().Settings.Main.Enable == true and
            AimlockTarget ~= nil
     then
        AimlockTarget = nil
        MousePressed = false
    end
end
)

Uis.InputBegan:Connect(
function(keyinput, stupid)
    if
        keyinput.UserInputType == Settings.Main.MouseKey and Settings.Main.UseMouseKey == true and
            getgenv().Settings.Main.Enable == true and
            AimlockTarget == nil and
            getgenv().Settings.Main.ToggleKey == true
     then
        pcall(
            function()
                MousePressed = true
                AimlockTarget = GetNearestTarget()
            end
        )
    elseif
        keyinput.UserInputType == Settings.Main.MouseKey and Settings.Main.UseMouseKey == true and
            getgenv().Settings.Main.Enable == true and
            AimlockTarget ~= nil
     then
        AimlockTarget = nil
        MousePressed = false
    end
end
)

-- // Main Functions. RunService HeartBeat.

task.spawn(
function()
    while task.wait() do
        if MousePressed == true and getgenv().Settings.Main.Enable == true then
            if AimlockTarget and AimlockTarget.Character then
                if getgenv().Settings.Part.GetClosestPart == true then
                    getgenv().Settings.Part.AimPart = tostring(GetClosestBodyPart(AimlockTarget.Character))
                end
            end
            if getgenv().Settings.Main.DisableOutSideCircle == true and AimlockTarget and AimlockTarget.Character then
                if
                    Circle.Radius <
                        (Vec2(
                            Camera:WorldToScreenPoint(AimlockTarget.Character.HumanoidRootPart.Position).X,
                            Camera:WorldToScreenPoint(AimlockTarget.Character.HumanoidRootPart.Position).Y
                        ) - Vec2(Mouse.X, Mouse.Y)).Magnitude
                 then
                    AimlockTarget = nil
                end
            end
        end
    end
end
)

RService.Heartbeat:Connect(
function()
    if getgenv().Settings.Main.Enable == true and MousePressed == true then
        if getgenv().Settings.Resolver.UnderGround == true and AimlockTarget and AimlockTarget.Character then
            pcall(
                function()
                    local TargetVelv2 = AimlockTarget.Character[getgenv().Settings.Part.AimPart]
                    TargetVelv2.Velocity = Vec3(TargetVelv2.Velocity.X, 0, TargetVelv2.Velocity.Z)
                    TargetVelv2.AssemblyLinearVelocity = Vec3(TargetVelv2.Velocity.X, 0, TargetVelv2.Velocity.Z)
                end
            )
        end
        if
            getgenv().Settings.Resolver.DetectDesync == true and AimlockTarget and AimlockTarget.Character and
                AimlockTarget.Character:WaitForChild("HumanoidRootPart").Velocity.magnitude >
                    getgenv().Settings.Resolver.Detection
         then
            pcall(
                function()
                    local TargetVel = AimlockTarget.Character[getgenv().Settings.Part.AimPart]
                    TargetVel.Velocity = Vec3(0, 0, 0)
                    TargetVel.AssemblyLinearVelocity = Vec3(0, 0, 0)
                end
            )
        end
        if getgenv().Settings.Main.ThirdPerson == true and getgenv().Settings.Main.FirstPerson == true then
            if
                (Camera.Focus.p - Camera.CoordinateFrame.p).Magnitude > 1 or
                    (Camera.Focus.p - Camera.CoordinateFrame.p).Magnitude <= 1
             then
                CanNotify = true
            else
                CanNotify = false
            end
        elseif getgenv().Settings.Main.ThirdPerson == true and getgenv().Settings.Main.FirstPerson == false then
            if (Camera.Focus.p - Camera.CoordinateFrame.p).Magnitude > 1 then
                CanNotify = true
            else
                CanNotify = false
            end
        elseif getgenv().Settings.Main.ThirdPerson == false and getgenv().Settings.Main.FirstPerson == true then
            if (Camera.Focus.p - Camera.CoordinateFrame.p).Magnitude <= 1 then
                CanNotify = true
            else
                CanNotify = false
            end
        end
        if getgenv().Settings.Main.AutoPingSets == true and getgenv().Settings.Horizontal.PredictionVelocity then
            local pingvalue = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
            local split = string.split(pingvalue, "(")
            local ping = tonumber(split[1])
            if ping > 190 then
                getgenv().Settings.Horizontal.PredictionVelocity = 0.206547
            elseif ping > 180 then
                getgenv().Settings.Horizontal.PredictionVelocity = 0.19284
            elseif ping > 170 then
                getgenv().Settings.Horizontal.PredictionVelocity = 0.1923111
            elseif ping > 160 then
                getgenv().Settings.Horizontal.PredictionVelocity = 0.1823111
            elseif ping > 150 then
                getgenv().Settings.Horizontal.PredictionVelocity = 0.171
            elseif ping > 140 then
                getgenv().Settings.Horizontal.PredictionVelocity = 0.165773
            elseif ping > 130 then
                getgenv().Settings.Horizontal.PredictionVelocity = 0.1223333
            elseif ping > 120 then
                getgenv().Settings.Horizontal.PredictionVelocity = 0.143765
            elseif ping > 110 then
                getgenv().Settings.Horizontal.PredictionVelocity = 0.1455
            elseif ping > 100 then
                getgenv().Settings.Horizontal.PredictionVelocity = 0.130340
            elseif ping > 90 then
                getgenv().Settings.Horizontal.PredictionVelocity = 0.136
            elseif ping > 80 then
                getgenv().Settings.Horizontal.PredictionVelocity = 0.1347
            elseif ping > 70 then
                getgenv().Settings.Horizontal.PredictionVelocity = 0.119
            elseif ping > 60 then
                getgenv().Settings.Horizontal.PredictionVelocity = 0.12731
            elseif ping > 50 then
                getgenv().Settings.Horizontal.PredictionVelocity = 0.127668
            elseif ping > 40 then
                getgenv().Settings.Horizontal.PredictionVelocity = 0.125
            elseif ping > 30 then
                getgenv().Settings.Horizontal.PredictionVelocity = 0.11
            elseif ping > 20 then
                getgenv().Settings.Horizontal.PredictionVelocity = 0.12588
            elseif ping > 10 then
                getgenv().Settings.Horizontal.PredictionVelocity = 0.9
            end
        end
        if getgenv().Settings.Check.CheckIfKo == true and AimlockTarget and AimlockTarget.Character then
            local KOd = AimlockTarget.Character:WaitForChild("BodyEffects")["K.O"].Value
            local Grabbed = AimlockTarget.Character:FindFirstChild("GRABBING_CONSTRAINT") ~= nil
            if AimlockTarget.Character.Humanoid.health < 1 or KOd or Grabbed then
                if MousePressed == true then
                    AimlockTarget = nil
                    MousePressed = false
                end
            end
        end
        if
            getgenv().Settings.Check.DisableOnTargetDeath == true and AimlockTarget and
                AimlockTarget.Character:FindFirstChild("Humanoid")
         then
            if AimlockTarget.Character.Humanoid.health < 1 then
                if MousePressed == true then
                    AimlockTarget = nil
                    MousePressed = false
                end
            end
        end
        if
            getgenv().Settings.Check.DisableOnPlayerDeath == true and Client.Character and
                Client.Character:FindFirstChild("Humanoid") and
                Client.Character.Humanoid.health < 1
         then
            if MousePressed == true then
                AimlockTarget = nil
                MousePressed = false
            end
        end
        if getgenv().Settings.Part.CheckIfJumped == true and getgenv().Settings.Part.GetClosestPart == false then
            if AimlockTarget and AimlockTarget.Character then
                if AimlockTarget.Character.Humanoid.FloorMaterial == Enum.Material.Air then
                    getgenv().Settings.Part.AimPart = getgenv().Settings.Part.CheckIfJumpedAimPart
                else
                    getgenv().Settings.Part.AimPart = OldAimPart
                end
            end
        end
        if
            AimlockTarget and AimlockTarget.Character and
                AimlockTarget.Character:FindFirstChild(getgenv().Settings.Part.AimPart)
         then
            if getgenv().Settings.Main.FirstPerson == true then
                if CanNotify == true then
                    if getgenv().Settings.Horizontal.PredictMovement == true then
                        if getgenv().Settings.Smooth.Smoothness == true then
                            local Main =
                                CF(
                                Camera.CFrame.p,
                                AimlockTarget.Character[getgenv().Settings.Part.AimPart].Position +
                                    AimlockTarget.Character[getgenv().Settings.Part.AimPart].Velocity *
                                        getgenv().Settings.Horizontal.PredictionVelocity
                            )

                            Camera.CFrame =
                                Camera.CFrame:Lerp(
                                Main,
                                getgenv().Settings.Smooth.SmoothnessAmount,
                                getgenv().Settings.Smooth.EasingStyle,
                                getgenv().Settings.Smooth.EasingDirection
                            )
                        else
                            Camera.CFrame =
                                CF(
                                Camera.CFrame.p,
                                AimlockTarget.Character[getgenv().Settings.Part.AimPart].Position +
                                    AimlockTarget.Character[getgenv().Settings.Part.AimPart].Velocity *
                                        getgenv().Settings.Horizontal.PredictionVelocity +
                                    Vector3
                            )
                        end
                    elseif getgenv().Settings.Horizontal.PredictMovement == false then
                        if getgenv().Settings.Smooth.Smoothness == true then
                            local Main =
                                CF(
                                Camera.CFrame.p,
                                AimlockTarget.Character[getgenv().Settings.Part.AimPart].Position
                            )
                            Camera.CFrame =
                                Camera.CFrame:Lerp(
                                Main,
                                getgenv().Settings.Smooth.SmoothnessAmount,
                                getgenv().Settings.Smooth.EasingStyle,
                                getgenv().Settings.Smooth.EasingDirection
                            )
                        end
                    end
                end
            end
        end
        if
            getgenv().Settings.Main.UseShake == true and AimlockTarget and AimlockTarget.Character and
                AimlockTarget.Character:FindFirstChild(getgenv().Settings.Part.AimPart)
         then
            if CanNotify == true then
                local Main =
                    CF(
                    Camera.CFrame.p,
                    AimlockTarget.Character[getgenv().Settings.Part.AimPart].Position +
                        Vec3(
                            math.random(-getgenv().Settings.Main.ShakePower, getgenv().Settings.Main.ShakePower),
                            math.random(-getgenv().Settings.Main.ShakePower, getgenv().Settings.Main.ShakePower),
                            math.random(-getgenv().Settings.Main.ShakePower, getgenv().Settings.Main.ShakePower)
                        ) *
                            0.1
                )

                Camera.CFrame = Camera.CFrame:Lerp(Main, getgenv().Settings.Smooth.SmoothnessAmount)
            end
        end
    end
end
)

-- IK THIS IS SHITTY BRUH

local PerformanceStats = game:GetService("CoreGui"):WaitForChild("RobloxGui"):WaitForChild("PerformanceStats")

local MemLabel
for I, Child in next, PerformanceStats:GetChildren() do
if Child.StatsMiniTextPanelClass.TitleLabel.Text == "Mem" then
    MemLabel = Child.StatsMiniTextPanelClass.ValueLabel
    break
end
end
MemLabel:GetPropertyChangedSignal("Text"):Connect(
function()
    if Settings.Spoofer.MemorySpoofer == true then
        MemLabel.Text = math.random(Settings.Spoofer.MemoryLeast, Settings.Spoofer.MemoryMost) / 100 .. " MB"
    end
end
)

local PingLabel
for I, Child in next, PerformanceStats:GetChildren() do
if Child.StatsMiniTextPanelClass.TitleLabel.Text == "Ping" then
    PingLabel = Child.StatsMiniTextPanelClass.ValueLabel
    break
end
end
PingLabel:GetPropertyChangedSignal("Text"):Connect(
function()
    if Settings.Spoofer.PingSpoofer == true then
        local textrandom = math.random(Settings.Spoofer.PingLeast, Settings.Spoofer.PingMost) / 100
        PingLabel.Text = textrandom .. " ms"
        if game.PlaceId == 9825515356 then
            game:GetService("ReplicatedStorage").MainEvent:FireServer("GetPing", textrandom)
        end
    end
end
)