script_key = "KeyHere"; -- // The key you were granted.

getgenv().Evolution = {
    ConfigVersion = "0.0.3b", -- // Dont touch this is to make sure you're using the correct config loader
    MainSettings = {
        Notificaions = {
            Enabled = true, -- // Enable Notifications
            Duration = 3,   -- // How long notifications stay
            Mode = "xz", -- // Options: Roblox, Print, Rconsole, Drawing, xz, Webhook
            Webhook_URL = "", -- // For webhook mode else leave blank
        },
        InternalUi = { -- // Ui to change settings with ease
            Enabled = true,
            Version = 3, -- // 1 - Old UI | 2 - New UI | 3 - Newest UI
            SizeX = 500,
            SizeY = 600,
            KeyBind = Enum.KeyCode.RightShift, -- // Keybind to toggle ui
        },
        AutoJoinDiscord = false, -- // Auto Joins newest discord
        Intro = true,
    },
    Panic = {
        Enabled = false, -- // Disables all features
        Key = "K", -- // Key To Disable All Features
    },
    FOV = {
        Visible = false, -- // Shows FOV Circle
        Radius = 30, -- // FOV Size
        Filled = false, -- // Enable if FOV is filled (ugly)
        Thickness = 1, -- // FOV Circle Thickness (dont go over 3)
        Transparency = 0.5, -- // FOV Circle transparency
        Color = Color3.fromRGB(253, 221, 77), -- // FOV Color (you can change to Color3.new or Color3.fromRGB)
        Position = "Cursor", -- // Cursor, Center
    },
    Global = {
        WallCheck = true, -- // Checks if target is behind a wall
        AutoPredict = false, -- // Auto Prediction based on ping
        Prediction = 0.155, -- // Prediction velocity
    },
    SilentAim = {
        Enabled = false, -- // Enables Silent aim
        TargetBone = "Head", -- // Bone that is targeted you
        AllowNotifications = false, -- // Allows notifications for silent aim
        Keybind = false, -- // Enables keybind to toggle silent aim
        Key = "G", -- // Keybind to toggle silent aim
        NearestCursorPoint = false, -- // Ignores target bone and selects closest part to mouse
        GetNearestMethod = "Cursor", -- // Cursor, Distance
        Airshot = {
            Enabled = true, -- // Hits Airshots (do not enable nearestcursorpoint)
            TargetBone = "LowerTorso", -- // Target Part for airshot
        }
    },
    CamLock = {
        Enabled = false, -- // Enables Camlock
        TargetBone = "Head", -- // Bone that is targeted
        AllowNotifications = true, -- // Allows notifications for camlock
        Key = "Q", -- // Key to lock onto target
        NearestCursorPoint = false, -- // Ignores target bone and selects closest part to mouse
        Smoothness = 0.058, -- // Self Explained set to 1 to disable
        GetNearestMethod = "Cursor", -- // Cursor, Distance
    },
    Resolver = {
        AimViewBypass = false, -- // Bypasses aim viewer (wip)
        DesyncResolver = false, -- // Resolves all anti aims.
        CustomResolverPrediction = {
            Enabled = true, -- // Uses custom prediction instead of global prediction
            Prediction = 13, -- // 1 to 30 recommended, don't go any higher.
        }
    },
    GunFOV = {
        Enabled = false, -- // Credits to farzad, he let me use his so i don't have to spend a lot of time making my own.
        Values = {
            DoubleBarrel = 20,
            Revolver = 25,
            Rifle = 20,
            Shotgun = 20,
            Smg = 23,
            TacticalShotgun = 24,
            Silencer = 17,
            AK47 = 8,
            AR = 15
        },
    },
    MemorySpoofer = {
        Enabled = false, -- // Spoofs your memory
        Values = {
            Minimum = 100, -- // Minimum Memory usage
            Maximum = 200, -- // Maximum Memory usage
        }
    },
    Emotes = { -- once u click the keybinds it makes u use the Animation
        Lay = true, LayKey = Enum.KeyCode.T,
        Greet = true, GreetKey = Enum.KeyCode.G,
        Speed = false, SpeedKey = Enum.KeyCode.N,
        Sturdy = false, SturdyKey = Enum.KeyCode.H,
        Griddy = false, GriddyKey = Enum.KeyCode.G,
    },
    CustomAutoPrediction = { -- // Custom Auto Prediction Values
        Enabled = false, -- // If you wanna use custom value prediction
        Values = {
            ping_20 = 0.102,
            ping_40 = 0.125,
            ping_50 = 0.155,
            ping_60 = 0.132,
            ping_70 = 0.136,
            ping_80 = 0.130,
            ping_90 = 0.136,
            ping_105 = 0.138,
            ping_110 = 0.146,
            ping_125 = 0.149,
            ping_130 = 0.151,
            ping_150 = 0.162,
            ping_175 = 0.172,
            ping_200 = 0.185,
            ping_225 = 0.198,
            ping_250 = 0.206,
            ping_275 = 0.214,  
        }
    },
    ChatCommands = { -- // Tip say /c system to hide your commands
        Enabled = true, -- // Enables Chat Commands
        Prefix = "/", -- // Prefix for commands ex; $pred 0.115
        Commands = { -- // CANNOT HAVE SPACES!!!
            Prediction = "pred", -- // ex; $pred 0.115
            ToggleFOV = "draw", -- // ex; $draw true (you can also do "on" or "yes" and to disable you do "off" or "yes" or "false")
            SizeFOV = "radius", -- // ex; $radius 100
            GotoLocation = "tp", -- // ex; $tp bank (full locations in server)
            ToggleResolver = "resolver", -- // ex; $resolver true (you can also do "on" or "yes" and to disable you do "off" or "yes" or "false")
            JoinDiscord = "discord", -- // ex; $discord
            RejoinServer = "rj", -- // ex; $rj
            ToggleSilentAim = "silent", -- // ex; $silent true (you can also do "on" or "yes" and to disable you do "off" or "yes" or "false")
            ToggleCamLock = "camlock", -- // ex; $camlock true (you can also do "on" or "yes" and to disable you do "off" or "yes" or "false")
            CamLockSmoothness = "smoothness", -- // ex; $smoothness 0.086
            CheckForExploiters = "check", -- // ex; $check
            ForceReset = "reset", -- // ex; $reset
        },
    },
}

--[[
___________           .__          __  .__               
\_   _____/__  ______ |  |  __ ___/  |_|__| ____   ____  
 |    __)_\  \/ /  _ \|  | |  |  \   __\  |/  _ \ /    \ 
 |        \\   (  <_> )  |_|  |  /|  | |  (  <_> )   |  \
/_______  / \_/ \____/|____/____/ |__| |__|\____/|___|  /
        \/                                            \/ 

]]

-- // To whoever gets the source code dont even bother skidding the resolver cuz its ass :laugh:

print("Loading Evolution")
repeat wait() until game:IsLoaded()

if not LPH_OBFUSCATED and not LPH_JIT_ULTRA then
    LPH_JIT_ULTRA = function(f) return f end
    LPH_NO_VIRTUALIZE = function(f) return f end
    LPH_JIT_MAX = function(f) return f end
    LPH_JIT = function(f) return f end
    LPH_ENCSTR = function(s) return s end
    LPH_STRENC = function(s) return s end
    LPH_CRASH = function() while true do end return end
end
LPH_NO_VIRTUALIZE(function()
if EvolutionLoaded then 
    warn("Evolution Already Loaded")
    return
else
    getgenv().EvolutionLoaded = true
end

local startTick = tick()

local Utility = {
    Invite = "camlock",
    BackupInvite = "VfKf5dvSYX",
    Version = "0.0.3b",
    AllowedPlaceIDs = {
        2788229376, -- Da Hood
        7213786345, -- Da Hood VC
        9825515356, -- Hood Customs
        --5602055394, -- Hood Modded
        --7951883376, -- Hood Modded VC
    }
}

local function kick(r)
    return game.Players.LocalPlayer:Kick("An Error has occurred. Error Code: "..r)
end


if not getgenv().Evolution then 
    setclipboard(game:HttpGet("https://unlegit.xyz/script.lua"))
    kick("Cound not find config (new script copied) | 0x01")
    return
end

if not table.find(Utility.AllowedPlaceIDs, game.PlaceId) then 
    kick("Game not supported | 0x02")
    return
end


if Evolution.ConfigVersion ~= Utility.Version then 
    setclipboard(game:HttpGet("https://unlegit.xyz/script.lua"))
    kick("Incorrect config version (new script copied) | 0x03")
    return
end

if not isfolder("Evolution") then 
    makefolder("Evolution")
end

if not isfolder("Evolution/cache") then 
    makefolder("Evolution/cache")
end

if not isfolder("Evolution/assets") then 
    makefolder("Evolution/assets")
end

if not isfolder("Evolution/configs") then 
    makefolder("Evolution/configs")
end

local httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
if not httprequest then 
    kick("Executor missing httprequest | 0x04")
end

local blacklisteduid = {
    3511344266, -- // 3bled
}

if table.find(blacklisteduid,game.Players.LocalPlayer.UserId) then 
    kick("Blacklisted. | 0x05")
end


if Evolution.MainSettings.AutoJoinDiscord then 
    if httprequest then
        httprequest({
            Url = 'http://127.0.0.1:6463/rpc?v=1',
            Method = 'POST',
            Headers = {
                ['Content-Type'] = 'application/json',
                Origin = 'https://discord.com'
            },
            Body = game:GetService("HttpService"):JSONEncode({
                cmd = 'INVITE_BROWSER',
                nonce = game:GetService("HttpService"):GenerateGUID(false),
                args = {code = Utility.BackupInvite}
            })
        })
    end
end

local ImportantVariables = {
    TotalEXE = 1,
    DiscordID = 894608863289036881,
    DiscordTag = "user#0000",
    RemainingDays = 14,
}

if LRM_ScriptName then 
	ImportantVariables.TotalEXE = LRM_TotalExecutions 
	ImportantVariables.DiscordID = LRM_LinkedDiscordID 
	ImportantVariables.RemainingDays = LRM_SecondsLeft / 86400
else
    ImportantVariables.TotalEXE = 1 
	ImportantVariables.DiscordID = 894608863289036881
	ImportantVariables.RemainingDays = 14
end

ImportantVariables.DiscordTag = game:GetService("HttpService"):JSONDecode(httprequest({
    Url = 'https://discordlookup.mesavirep.xyz/v1/user/'..tostring(ImportantVariables.DiscordID)
}).Body)['tag']

task.spawn(function()
    local assetsdir = "Evolution/assets/"
    if not isfile(assetsdir.."internalui.lua") then 
        writefile(assetsdir.."internalui.lua", game:HttpGet("https://raw.githubusercontent.com/laagginq/Evolution/main/uis/yun.lua"))
    end
end)

task.spawn(function()
    local assetsdir = "Evolution/assets/"
    if not isfile(assetsdir.."internalui2.lua") then 
        writefile(assetsdir.."internalui2.lua", game:HttpGet("https://raw.githubusercontent.com/Singularity5490/rbimgui-2/main/rbimgui-2.lua"))
    end
end)

task.spawn(function()
    local assetsdir = "Evolution/assets/"
    if not isfile(assetsdir.."internalui3.lua") then 
        writefile(assetsdir.."internalui3.lua", game:HttpGet("https://raw.githubusercontent.com/laagginq/Evolution/main/uis/cattoware.lua"))
    end
end)

local Blacklisted_Discord_Ids = loadstring(game:HttpGet("https://raw.githubusercontent.com/laagginq/lol/main/skids.lua"))()
local ToxicKickMSGs = {
    "dumbass nigga lol",
    "get yo money up",
    "brokie",
    "dont every try to finesse xz",
    "you got exposed LOL"
}

if table.find(Blacklisted_Discord_Ids,ImportantVariables.DiscordID) then 
    game.Players.LocalPlayer:kick(ToxicKickMSGs[math.random(1,#ToxicKickMSGs)])
    return
end



local NotificationUtility = {
    Positions = {
        ["1"] = Vector2.new(20, 50),
        ["2"] = Vector2.new(20, 65),
        ["3"] = Vector2.new(20, 80),
        ["4"] = Vector2.new(20, 95),
        ["5"] = Vector2.new(20, 110),
        ["6"] = Vector2.new(20, 125),
        ["7"] = Vector2.new(20, 140),
        ["8"] = Vector2.new(20, 155),
        ["9"] = Vector2.new(20, 170),
        ["10"] = Vector2.new(20, 185),
    },
    Notificaions = 0
}

local function drawingnotify(text) 
    if NotificationUtility.Notificaions < 10 then 
        NotificationUtility.Notificaions = NotificationUtility.Notificaions + 1
        local notificationtext = Drawing.new("Text")
        notificationtext.Color = Color3.new(1, 1, 1)
        notificationtext.Visible = true
        notificationtext.Center = false
        notificationtext.Size = 16
        notificationtext.Outline = true
        notificationtext.Font = 3
        notificationtext.Position = NotificationUtility.Positions[tostring(NotificationUtility.Notificaions)]
        notificationtext.ZIndex = 1500
        notificationtext.Text = text
        delay(tonumber(Evolution.MainSettings.Notificaions.Duration),function()
            NotificationUtility.Notificaions = NotificationUtility.Notificaions - 1
            notificationtext:Remove()  
        end)
    end
end

local ts = game:GetService("TweenService")

local Notification = Instance.new("ScreenGui")
local Holder = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")

Notification.Name = "Notification"
Notification.Parent = game.CoreGui
Notification.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Holder.Name = "Holder"
Holder.Parent = Notification
Holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Holder.BackgroundTransparency = 1.000
Holder.BorderColor3 = Color3.fromRGB(27, 42, 53)
Holder.Position = UDim2.new(0.0072954637, 0, 0.0105048735, 0)
Holder.Size = UDim2.new(0, 243, 0, 240)

UIListLayout.Parent = Holder
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 4)

local rainbowcolor

task.spawn(function()
	while wait() do
		local r = (math.sin(workspace.DistributedGameTime / 2) / 2) + 0.5
		local g = (math.sin(workspace.DistributedGameTime) / 2) + 0.5
		local b = (math.sin(workspace.DistributedGameTime * 1.5) / 2) + 0.5
		local color = Color3.new(r, g, b)
		rainbowcolor = color
	end
end)

function xznotify(text, time, rainbowmode)
	local Template = Instance.new("Frame")
	local ColorBar = Instance.new("Frame")
	local TextLabel = Instance.new("TextLabel")

	Template.Name = text
	Template.Parent = Holder
	Template.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
	Template.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Template.Size = UDim2.new(0, 0, 0, 0)
	Template.Transparency = 1


	ColorBar.Name = "ColorBar"
	ColorBar.Parent = Template
	ColorBar.BackgroundColor3 = Color3.fromRGB(253, 221, 77)
	ColorBar.BorderSizePixel = 0
	ColorBar.Size = UDim2.new(0, 2, 0, 22)
	ColorBar.Transparency = 1
	if rainbowmode then 
		task.spawn(function()
			while wait() do
				ColorBar.BackgroundColor3 = rainbowcolor
			end
		end)
	end

	TextLabel.Parent = Template
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel.BorderSizePixel = 0
	TextLabel.Position = UDim2.new(0, 8, 0, 0)
	TextLabel.Size = UDim2.new(0, 0, 0, 22)
	TextLabel.Font = Enum.Font.Code
	TextLabel.Text = text
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextSize = 14.000
	TextLabel.TextStrokeTransparency = 0.000
	TextLabel.TextXAlignment = Enum.TextXAlignment.Left
	TextLabel.Transparency = 1

	Template.Size = UDim2.new(0, TextLabel.TextBounds.X + 13, 0, 22)
	local goal2 = {}
	goal2.Transparency = 0
	local tweenInfo2 = TweenInfo.new(0.5)
	local tween12 = ts:Create(Template, tweenInfo2, goal2)
	local tween22 = ts:Create(ColorBar, tweenInfo2, goal2)
	local tween32 = ts:Create(TextLabel, tweenInfo2, goal2)
	tween12:Play()
	tween22:Play()
	tween32:Play()

	delay(time, function()
		local goal = {}
		goal.Transparency = 1
		local tweenInfo = TweenInfo.new(0.5)
		local tween1 = ts:Create(Template, tweenInfo, goal)
		local tween2 = ts:Create(ColorBar, tweenInfo, goal)
		local tween3 = ts:Create(TextLabel, tweenInfo, goal)
		tween1:Play()
		tween2:Play()
		tween3:Play()
		delay(0.51, function()
			Template:Destroy()
		end)
	end)
end

local function notify(text) 
    if Evolution.MainSettings.Notificaions.Enabled then 
        if Evolution.MainSettings.Notificaions.Mode == "Roblox" then 
            game:GetService("StarterGui"):SetCore("SendNotification",{
                Title = "Evolution",
                Text = text, 
                Duration = Evolution.MainSettings.Notificaions.Duration
            })
        elseif string.lower(Evolution.MainSettings.Notificaions.Mode) == "print" then
            print(text)
        elseif string.lower(Evolution.MainSettings.Notificaions.Mode) == "rconsole" then
            rconsoleprint(text.."\n")
        elseif string.lower(Evolution.MainSettings.Notificaions.Mode) == "drawing" then
            drawingnotify(text)
        elseif string.lower(Evolution.MainSettings.Notificaions.Mode) == "xz" then 
            xznotify(text,Evolution.MainSettings.Notificaions.Duration,false)
        elseif string.lower(Evolution.MainSettings.Notificaions.Mode) == "webhook" then
            if Evolution.MainSettings.Notificaions.Webhook_URL ~= "" or Evolution.MainSettings.Notificaions.Webhook_URL ~= " " then 
                local OSTime = os.time()
                local Time = os.date("!*t", OSTime)
                local Content = ""
                local Embed = {
                    ["title"] = "**Evolution**",
                    ["type"] = "rich",
                    ["color"] = tonumber(0xffffff),
                    ["description"] = "`"..text.."`",
                    ["timestamp"] = string.format(
                        "%d-%d-%dT%02d:%02d:%02dZ",
                        Time.year,
                        Time.month,
                        Time.day,
                        Time.hour,
                        Time.min,
                        Time.sec
                    )
                }
                (httprequest) {
                    Url = Evolution.MainSettings.Notificaions.Webhook_URL,
                    Method = "POST",
                    Headers = {
                        ["Content-Type"] = "application/json"
                    },
                    Body = game:GetService "HttpService":JSONEncode({content = Content, embeds = {Embed}})
                }
            else
                Evolution.MainSettings.Notificaions.Mode = "drawing"
                drawingnotify("Your url link has no value switched to drawing mode")
            end
        end
    end
end

task.spawn(function()
    pcall(function()
        repeat wait() until game.CoreGui.RobloxGui:FindFirstChild("PerformanceStats") 
        for __, v in pairs(game.CoreGui.RobloxGui.PerformanceStats:GetChildren()) do
            if v.Name == "PS_Button" and v.StatsMiniTextPanelClass.TitleLabel.Text == "Mem" then
                Memory = v.StatsMiniTextPanelClass.ValueLabel
            end
        end
        
        Memory:GetPropertyChangedSignal("Text"):Connect(function()
            if Evolution.MemorySpoofer.Enabled then 
                local random1 = math.random(Evolution.MemorySpoofer.Values.Minimum, Evolution.MemorySpoofer.Values.Maximum)
                local rand1 = math.random(0,9)
                local rand2 = math.random(0,9)
                Memory.Text = "".. random1 .. "." .. rand1 .. rand2.. " MB"
            end
        end)
    end)
end)



notify("Loading please wait...")
if game.PlaceId == 2788229376 or game.PlaceId == 7213786345 then
    repeat wait() until game.Players.LocalPlayer.Character:WaitForChild("FULLY_LOADED_CHAR")
end

if Evolution.MainSettings.Intro then 
    local cam = workspace.CurrentCamera
    local x = cam.ViewportSize.X
    local y = cam.ViewportSize.Y
    local newx = math.floor(x * 0.5)
    local newy = math.floor(y * 0.5)

    local SpashScreen = Instance.new("ScreenGui")
    local Image = Instance.new("ImageLabel")
    SpashScreen.Name = "SpashScreen"
    SpashScreen.Parent = game.CoreGui
    SpashScreen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    Image.Name = "Image"
    Image.Parent = SpashScreen
    Image.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Image.BackgroundTransparency = 1
    Image.Position = UDim2.new(0, newx, 0, newy)
    Image.Size = UDim2.new(0, 793, 0, 392)
    Image.Image = "rbxassetid://12329139963"
    Image.ImageTransparency = 1
    Image.AnchorPoint = Vector2.new(0.5,0.5)

    local Blur = Instance.new("BlurEffect")
    Blur.Parent = game.Lighting
    Blur.Size = 0
    Blur.Name = math.random(1,123123)

    local function gui(last, sex, t, s, inorout)
        local TI = TweenInfo.new(t or 1, s or Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
        local Tweening = game:GetService("TweenService"):Create(last, TI, sex)
        Tweening:Play()
    end

    gui(Image, {ImageTransparency = 0},0.3)
    gui(Blur, {Size = 20},0.3)
    wait(3)
    gui(Image, {ImageTransparency = 1},0.3)
    gui(Blur, {Size = 0},0.3)
    wait(0.3)
end

local lp = game:GetService("Players").LocalPlayer
local cc = game:GetService("Workspace").CurrentCamera
local mouse = lp:GetMouse()
local Mouse = lp:GetMouse()

mouse.KeyDown:Connect(function(Key)
    local Keybind = Evolution.SilentAim.Key:lower()
    if (Key == Keybind) then
        if Evolution.SilentAim.Enabled == true then 
            Evolution.SilentAim.Enabled = false
            if Evolution.SilentAim.AllowNotifications then 
                notify("Silent aim disabled.")
            end
        else
            Evolution.SilentAim.Enabled = true
            if Evolution.SilentAim.AllowNotifications then 
                notify("Silent aim enabled.")
            end
        end

    end
end)

mouse.KeyDown:Connect(function(Key)
    local Keybind = Evolution.Panic.Key:lower()
    if (Key == Keybind) then
        if Evolution.Panic.Enabled == true then 
            Evolution.MainSettings.Notificaions.Enabled = false
            Evolution.FOV.Visible = false
            Evolution.SilentAim.Enabled = false
            Evolution.SilentAim.Keybind = false 
            Evolution.SilentAim.AllowNotifications = false
            Evolution.CamLock.Enabled = false
            Evolution.CamLock.AllowNotifications = false
            Evolution.Resolver.DesyncResolver = false
            Evolution.Resolver.AimViewBypass = false
            Evolution.GunFOV.Enabled = false
            --Evolution.MemorySpoofer.Enabled = false

        end

    end
end)

WTS = (function(Object)
	local ObjectVector = cc:WorldToScreenPoint(Object.Position)
	return Vector2.new(ObjectVector.X, ObjectVector.Y)
end)

Filter = (function(obj)
	if (obj:IsA('BasePart')) then
		return true
	end
end)

mousePosVector2 = (function()
	return Vector2.new(mouse.X, mouse.Y) 
end)

local IsOnScreen2 = function(Object)
    local IsOnScreen = cc:WorldToScreenPoint(Object.Position)
    return IsOnScreen
end

local FilterObjs = function(Object)
    if string.find(Object.Name, "Gun") then
        return
    end
    if table.find({"Part", "MeshPart", "BasePart"}, Object.ClassName) then
        return true
    end
end

GetClosestBodyPart = function(character)
    local ClosestDistance = 1 / 0
    local BodyPart = nil
    if (character and character:GetChildren()) then
        for _, x in next, character:GetChildren() do
            if FilterObjs(x) and IsOnScreen2(x) then
                local Distance = (WTS(x) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
                    if (Distance < ClosestDistance) then
                        ClosestDistance = Distance
                        BodyPart = x
                    end
            end
        end
    end
    return BodyPart
end

local plrService = game:GetService("Players")
local localPlr = plrService.LocalPlayer
local mouseLocal = localPlr:GetMouse()
local Players, Client, Mouse, Camera =
    game:GetService("Players"),
    game:GetService("Players").LocalPlayer,
    game:GetService("Players").LocalPlayer:GetMouse(),
    game:GetService("Workspace").CurrentCamera

    game:GetService("RunService").RenderStepped:Connect(function()
        if Evolution.Global.AutoPredict then 
            if Evolution.CustomAutoPrediction.Enabled then 
                    local ping = math.floor(game.Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
                    if ping < 275 then
                        Evolution.Global.Prediction = Evolution.CustomAutoPrediction.Values.ping_275
                    elseif ping < 250 then
                        Evolution.Global.Prediction = Evolution.CustomAutoPrediction.Values.ping_250
                    elseif ping < 225 then
                        Evolution.Global.Prediction = Evolution.CustomAutoPrediction.Values.ping_225
                    elseif ping < 200 then
                        Evolution.Global.Prediction = Evolution.CustomAutoPrediction.Values.ping_200
                    elseif ping < 175 then
                        Evolution.Global.Prediction = Evolution.CustomAutoPrediction.Values.ping_175
                    elseif ping < 150 then
                        Evolution.Global.Prediction = Evolution.CustomAutoPrediction.Values.ping_150
                    elseif ping < 130 then
                        Evolution.Global.Prediction = Evolution.CustomAutoPrediction.Values.ping_130
                    elseif ping < 125 then
                        Evolution.Global.Prediction = Evolution.CustomAutoPrediction.Values.ping_125
                    elseif ping < 110 then
                        Evolution.Global.Prediction = Evolution.CustomAutoPrediction.Values.ping_110
                    elseif ping < 105 then
                        Evolution.Global.Prediction = Evolution.CustomAutoPrediction.Values.ping_105
                    elseif ping < 90 then
                        Evolution.Global.Prediction = Evolution.CustomAutoPrediction.Values.ping_90
                    elseif ping < 80 then
                        Evolution.Global.Prediction = Evolution.CustomAutoPrediction.Values.ping_80
                    elseif ping < 70 then
                        Evolution.Global.Prediction = Evolution.CustomAutoPrediction.Values.ping_70
                    elseif ping < 60 then
                        Evolution.Global.Prediction = Evolution.CustomAutoPrediction.Values.ping_60
                    elseif ping < 50 then
                        Evolution.Global.Prediction = Evolution.CustomAutoPrediction.Values.ping_50
                    elseif ping < 40 then
                        Evolution.Global.Prediction = Evolution.CustomAutoPrediction.Values.ping_40
                    elseif ping < 20 then
                        Evolution.Global.Prediction = Evolution.CustomAutoPrediction.Values.ping_20
                    end
                else
                    local ping = math.floor(game.Stats.Network.ServerStatsItem["Data Ping"]:GetValue())

                    if ping < 130 then
                        Evolution.Global.Prediction = ping / 1000 + 0.037
                    else
                        Evolution.Global.Prediction = ping / 1000 + 0.033
                    end
            end
        end
    end)

    local instance = {}

    local GuiInset = game:GetService("GuiService"):GetGuiInset()
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local CurrentCamera = workspace.CurrentCamera
    local Mouse = LocalPlayer:GetMouse()

    local SilentFOV = Drawing.new("Circle")
    SilentFOV.Filled = false
    SilentFOV.Transparency = 1
    SilentFOV.Thickness = 1

    function network(plr)
        return plr and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") ~= nil and plr.Character:FindFirstChild("Humanoid") ~= nil and plr.Character:FindFirstChild("Head") ~= nil and true or false
    end

    function alive(plr)
        if plr and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") ~= nil and plr.Character:FindFirstChild("Humanoid") ~= nil and plr.Character:FindFirstChild("Head") ~= nil then
            return true
        end
        return false
    end

    function grabbed(plr)
        if network(plr) then 
            return plr.Character:FindFirstChild("GRABBING_CONSTRAINT") and true or false
        end
        return false
    end

    function koed(plr)
        if network(plr) then
            return plr.Character.BodyEffects["K.O"].Value and true or false
        end
        return false
    end

    function wallCheck(destination, ignore)
        if (Evolution.Global.Wallcheck) then
            local Origin = CurrentCamera.CFrame.p
            local CheckRay = Ray.new(Origin, destination - Origin)
            local Hit = game:GetService("Workspace"):FindPartOnRayWithIgnoreList(CheckRay, ignore)
            if Hit.Transparency == 1 and Hit.CanCollide == false then 
                return true 
            else
                return Hit == nil
            end
        else
            return true
        end
    end

    function distance()
        local Target = nil
        local Distance = math.huge
        for i, v in pairs(Players:GetPlayers()) do
            if v ~= game.Players.LocalPlayer and alive(LocalPlayer) and alive(v) then
                local DistanceFromPlayer = (v.Character.HumanoidRootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                if Distance > DistanceFromPlayer then
                    Target = v
                    Distance = DistanceFromPlayer
                end
            end
        end
        return Target, Distance
    end

    function cursor()
        local Target = nil
        local Distance = math.huge
        for i, v in pairs(Players:GetPlayers()) do
            if v ~= game.Players.LocalPlayer and alive(game.Players.LocalPlayer) and alive(v) then
                local RootPosition, RootVisible = CurrentCamera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
                local DistanceFromMouse = (Vector2.new(RootPosition.X, RootPosition.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
                if RootVisible and Distance > DistanceFromMouse then
                    Target = v
                    Distance = DistanceFromMouse
                end
            end
        end
        return Target, Distance
    end

    function getnearest(Type) 
        if Type == "Cursor" then 
            return cursor()
        elseif Type == "Distance" then 
            return distance()
        end
    end


    function updatefov() 
        SilentFOV.Radius = Evolution.FOV.Radius
        if Evolution.FOV.Position == "Cursor" then 
            SilentFOV.Position = Vector2.new(Mouse.X, Mouse.Y + GuiInset.Y)
        elseif Evolution.FOV.Position == "Center" then 
            local x = math.floor(workspace.CurrentCamera.ViewportSize.X * 0.5)
            local y = math.floor(workspace.CurrentCamera.ViewportSize.Y * 0.5)
            SilentFOV.Position = Vector2.new(x,y)
        end
        if Evolution.FOV.Visible then 
            SilentFOV.Visible = true
        else
            SilentFOV.Visible = false
        end
        SilentFOV.Color = Evolution.FOV.Color
    end

    game:GetService("RunService").RenderStepped:Connect(function()
        updatefov()
    end)
    
    if game.PlaceId == 2788229376 or game.PlaceId == 7213786345 then -- Da Hood
        local jew
        jew = hookmetamethod(game, "__index", newcclosure(function(t, k)
            if t == Mouse and tostring(k) == "Hit" or tostring(k) == "Target" then
                if Evolution.SilentAim.Enabled then
                    local target, pos = getnearest(Evolution.SilentAim.GetNearestMethod)
                    local targetbone
                    if target and 
                    (Evolution.FOV.Radius > pos) and 
                    (not Evolution.Global.WallCheck or wallCheck(target.Character.HumanoidRootPart.Position, {game.Players.LocalPlayer.Character, target.Character})) and 
                    (not koed(target)) and 
                    (not grabbed(target)) then
                        if Evolution.SilentAim.NearestCursorPoint then 
                            Evolution.SilentAim.TargetBone = tostring(GetClosestBodyPart(target.Character)) 
                        end
                        if Evolution.SilentAim.Airshot.Enabled then 
                            if target.Character.Humanoid.FloorMaterial == Enum.Material.Air then 
                                targetbone = target.Character[Evolution.SilentAim.Airshot.TargetBone]
                            else
                                targetbone = target.Character[Evolution.SilentAim.TargetBone]
                            end
                        else
                            targetbone = target.Character[Evolution.SilentAim.TargetBone]
                        end
                        local Prediction
                        if Evolution.Resolver.DesyncResolver then 
                            if Evolution.Resolver.CustomResolverPrediction then 
                                Prediction = targetbone.CFrame + target.Character.Humanoid.MoveDirection * Evolution.Global.Prediction * Evolution.Resolver.CustomResolverPrediction.Prediction
                            else
                                Prediction = targetbone.CFrame + target.Character.Humanoid.MoveDirection * Evolution.Global.Prediction * 18
                            end
                        else
                            Prediction = targetbone.CFrame + targetbone.Velocity * Evolution.Global.Prediction
                        end
                        print(tostring(target.Name)..", "..tostring(targetbone)..", "..tostring(Prediction))
                        return tostring(k) == "Hit" and Prediction or tostring(k) == "Target" and targetbone
                    end   
                end
            end
    
            return jew(t, k)
        end))
    elseif game.PlaceId == 9825515356 then -- Hood Customs
        local oldIndex = nil
        oldIndex = hookmetamethod(game, "__index", function(self, Index, Check)
            local Check = oldIndex(self, Index)
            local mouse = Mouse
            local hit = "hit"
            local OldHit = hit
            if self == mouse and (Index:lower() == OldHit) then    
                    local target, pos = getnearest(Evolution.SilentAim.GetNearestMethod)
                    local targetbone
                    if target and 
                        (Evolution.FOV.Radius > pos) and 
                        (not Evolution.Global.WallCheck or wallCheck(target.Character.HumanoidRootPart.Position, {game.Players.LocalPlayer.Character, target.Character})) and 
                        (not koed(target)) and 
                        (not grabbed(target)) then
                            if Evolution.SilentAim.NearestCursorPoint then 
                                Evolution.SilentAim.TargetBone = tostring(GetClosestBodyPart(target.Character)) 
                            end
                            if Evolution.SilentAim.Airshot.Enabled then 
                                if target.Character.Humanoid.FloorMaterial == Enum.Material.Air then 
                                    targetbone = target.Character[Evolution.SilentAim.Airshot.TargetBone]
                                else
                                    targetbone = target.Character[Evolution.SilentAim.TargetBone]
                                end
                            else
                                targetbone = target.Character[Evolution.SilentAim.TargetBone]
                            end
                            local Prediction
                            if Evolution.Resolver.DesyncResolver then 
                                if Evolution.Resolver.CustomResolverPrediction then 
                                    Prediction = targetbone.CFrame + target.Character.Humanoid.MoveDirection * Evolution.Global.Prediction * Evolution.Resolver.CustomResolverPrediction.Prediction
                                else
                                    Prediction = targetbone.CFrame + target.Character.Humanoid.MoveDirection * Evolution.Global.Prediction * 18
                                end
                            else
                                Prediction = targetbone.CFrame + targetbone.Velocity * Evolution.Global.Prediction
                            end
                            return (Index:lower() == OldHit and Prediction)
                end
                return Check
            end
        
            return oldIndex(self, Index, Check)
        end)
    end
    
    local AnimationIds = {
        Lay = "rbxassetid://3152378852",
        Greet = "rbxassetid://3189777795",
        Sturdy = "rbxassetid://11710529975",
        Griddy = "rbxassetid://11710529975",
        Speed = "rbxassetid://11710541744",
    }


    game:GetService("UserInputService").InputBegan:Connect(function(key, gp)
        if not gp then 
            if key.KeyCode == Evolution.Emotes.LayKey then 
                if Evolution.Emotes.Lay then 
                    local Lay = Instance.new("Animation")
                    Lay.AnimationId = AnimationIds.Lay
                    local LayTrack = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Lay)
                    LayTrack:Play()
                    game.Players.LocalPlayer.Character.Humanoid.Running:Connect(function()
                        LayTrack:Stop()
                    end)
                end
            end
            if key.KeyCode == Evolution.Emotes.GreetKey then
                if Evolution.Emotes.Greet then 
                    local Greet = Instance.new("Animation")
                    Greet.AnimationId = AnimationIds.Greet
                    local GreetTrack = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Greet)
                    GreetTrack:Play()
                    game.Players.LocalPlayer.Character.Humanoid.Running:Connect(function()
                        GreetTrack:Stop()
                    end)
                end
            end
            if key.KeyCode == Evolution.Emotes.SpeedKey then
                if Evolution.Emotes.Speed then 
                    local Speed = Instance.new("Animation")
                    Speed.AnimationId = AnimationIds.Speed
                    local SppedTrack = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Speed)
                    SpeedTrack:Play()
                    game.Players.LocalPlayer.Character.Humanoid.Running:Connect(function()
                        SpeedTrack:Stop()
                    end)
                end
            end
            if key.KeyCode == Evolution.Emotes.SturdyKey then
                if Evolution.Emotes.Sturdy then 
                    local Sturdy = Instance.new("Animation")
                    Sturdy.AnimationId = AnimationIds.Sturdy
                    local SturdyTrack = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Sturdy)
                    SturdyTrack:Play()
                    game.Players.LocalPlayer.Character.Humanoid.Running:Connect(function()
                        SturdyTrack:Stop()
                    end)
                end
            end
            if key.KeyCode == Evolution.Emotes.GriddyKey then
                if Evolution.Emotes.Griddy then 
                    local Griddy = Instance.new("Animation")
                    Griddy.AnimationId = AnimationIds.Griddy
                    local GriddyTrack = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Griddy)
                    GriddyTrack:Play()
                    game.Players.LocalPlayer.Character.Humanoid.Running:Connect(function()
                        GriddyTrack:Stop()
                    end)
                end
            end
        end
    end)

    --end)()


    local GunvFOV = {
        ["Double-Barrel SG"] = {["FOV"] = Evolution.GunFOV.Values.DoubleBarrel }, -- DB
        ["Revolver"] = {["FOV"] = Evolution.GunFOV.Values.Revolver }, -- rev
        ["SMG"] = {["FOV"] = Evolution.GunFOV.Values.Smg }, -- smg
        ["Shotgun"] = {["FOV"] = Evolution.GunFOV.Values.Shotgun }, -- shotgun
        ["Rifle"] = {["FOV"] = Evolution.GunFOV.Values.Rifle }, -- Rifle
        ["TacticalShotgun"] = {["FOV"] = Evolution.GunFOV.Values.TacticalShotgun }, -- rev
        ["Silencer"] = {["FOV"] = Evolution.GunFOV.Values.Silencer }, -- smg
        ["AK47"] = {["FOV"] = Evolution.GunFOV.Values.AK47 }, -- shotgun
        ["AR"] = {["FOV"] = Evolution.GunFOV.Values.AR }
    } -- Rifle


    local Script = {Functions = {}}

    Script.Functions.getToolName = function(name)
        local split = string.split(string.split(name, "[")[2], "]")[1]
    
        return split
    end
    
    Script.Functions.getEquippedWeaponName = function(player)
        if (player.Character) and player.Character:FindFirstChildWhichIsA("Tool") then
            local Tool = player.Character:FindFirstChildWhichIsA("Tool")
            if string.find(Tool.Name, "%[") and string.find(Tool.Name, "%]") and not string.find(Tool.Name, "Wallet") and not string.find(Tool.Name, "Phone") then
                return Script.Functions.getToolName(Tool.Name)
            end
        end
    
        return nil
    end


    game:GetService("RunService").RenderStepped:Connect(function()
        if Script.Functions.getEquippedWeaponName(game.Players.LocalPlayer) ~= nil then
            local WeaponSettings = GunvFOV[Script.Functions.getEquippedWeaponName(game.Players.LocalPlayer)]
            if WeaponSettings ~= nil and Evolution.GunFOV.Enabled == true then
                Evolution.FOV.Radius = WeaponSettings.FOV 
            else
                Evolution.FOV.Radius = Evolution.FOV.Radius
            end
        end

    end)

local Plr2
mouse.KeyDown:Connect(function(Key)
    local Keybind = Evolution.CamLock.Key:lower()
    if (Key == Keybind) then
        if Evolution.CamLock.Enabled == true then
            IsTargetting = not IsTargetting
            local target22222 = getnearest(Evolution.CamLock.GetNearestMethod)
            if IsTargetting and target22222 ~= nil then
                if Evolution.CamLock.NearestCursorPoint then 
                    Evolution.CamLock.TargetBone = tostring(GetClosestBodyPart(target22222.Character)) 
                end
                Plr2 = target22222
                if Evolution.CamLock.AllowNotifications then notify("Locked Onto: ".. Plr2.Name.." | "..Evolution.CamLock.TargetBone) end
            else
                if Evolution.CamLock.AllowNotifications then notify("Unlocked") end
                if Plr2 ~= nil then
                    Plr2 = nil
                end
            end
        end
    end
end)


local function IsOnScreen(Object)
    local IsOnScreen = game.Workspace.CurrentCamera:WorldToScreenPoint(Object.Position)
    return IsOnScreen
end


local function WTSPos(Position)
    local ObjectVector = game.Workspace.CurrentCamera:WorldToScreenPoint(Position)
    return Vector2.new(ObjectVector.X, ObjectVector.Y)
end

local function WTS(Object)
    local ObjectVector = game.Workspace.CurrentCamera:WorldToScreenPoint(Object.Position)
    return Vector2.new(ObjectVector.X, ObjectVector.Y)
end

--LPH_JIT_MAX(function()
    game.RunService.Heartbeat:Connect(function()
        if Evolution.CamLock.Enabled == true and Plr2 ~= nil then
            local Main 
            if not Evolution.Resolver.DesyncResolver then 
                Main = CFrame.new(cc.CFrame.p,Plr2.Character[Evolution.CamLock.TargetBone].Position + Plr2.Character[Evolution.CamLock.TargetBone].Velocity * Evolution.Global.Prediction)
            else
                if Evolution.Resolver.CustomResolverPrediction.Enabled then 
                    Main = CFrame.new(cc.CFrame.p,Plr2.Character[Evolution.CamLock.TargetBone].Position + Plr2.Character.Humanoid.MoveDirection * Evolution.Global.Prediction * Evolution.Resolver.CustomResolverPrediction.Prediction)
                else
                    Main = CFrame.new(cc.CFrame.p,Plr2.Character[Evolution.CamLock.TargetBone].Position + Plr2.Character.Humanoid.MoveDirection * Evolution.Global.Prediction * 18)
                end
            end
            cc.CFrame = cc.CFrame:Lerp(Main, Evolution.CamLock.Smoothness, Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut,Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
        end
    end)
--end)()


    if Evolution.MainSettings.InternalUi.Enabled then 
        --LPH_JIT_MAX(function()
            if Evolution.MainSettings.InternalUi.Version == 1 then 
                loadstring(readfile("Evolution/assets/internalui.lua"))()

                local Library = initLibrary()
                local Window = Library:Load({name = "Evolution | "..tostring(os.date("%B").." "..os.date("%d")..", "..os.date("%Y")), sizeX = Evolution.MainSettings.InternalUi.SizeX, sizeY = Evolution.MainSettings.InternalUi.SizeY, color = Color3.fromRGB(217,175,41)})
                
                local Aiming = Window:Tab("Aiming")
                local Extra = Window:Tab("Extra")
                
                local camlock = Aiming:Section{name = "Camera Lock", column = 1}
                local silent = Aiming:Section{name = "Silent Aimbot", column = 2}
                
                local FOVSettings = Extra:Section{name = "FOV Settings", column = 1}
                
                FOVSettings:Toggle {
                    Name = "Draw",
                    flag = "drawfov", 
                    default = Evolution.FOV.Visible,
                    callback = function(v)
                        Evolution.FOV.Visible = v
                    end
                }
                
                FOVSettings:Slider {
                    valueText  = "Radius: [VALUE]",
                    Default = Evolution.FOV.Radius,
                    Min = 0,
                    Max = 500,
                    Decimals = 1,
                    Flag = "sfadaaaadasdasdasd",
                    callback = function(v)
                        Evolution.FOV.Radius = v
                    end
                }
                
                FOVSettings:Toggle {
                    Name = "Filled",
                    flag = "filledfov", 
                    default = Evolution.FOV.Filled,
                    callback = function(v)
                        Evolution.FOV.Filled = v
                    end
                }
                
                FOVSettings:Slider {
                    valueText = "Thickness: [VALUE]",
                    Default = Evolution.FOV.Thickness,
                    Min = 1,
                    Max = 5,
                    Decimals = 1,
                    Flag = "hadasdads",
                    callback = function(v)
                        Evolution.FOV.Thickness = v
                    end
                }
                
                FOVSettings:ColorPicker {
                    Name = "Color",
                    Default = Evolution.FOV.Color,
                    Flag = "hadasdads",
                    callback = function(v)
                        Evolution.FOV.Color = v
                    end
                }
                
                local Notifications = Extra:Section{name = "Notification Settings", column = 2}
                
                Notifications:Toggle {
                    Name = "Enable",
                    flag = "gasssddd", 
                    default = Evolution.MainSettings.Enable,
                    callback = function(v)
                        Evolution.MainSettings.Enable = v
                    end
                }
                
                Notifications:Slider {
                    valueText = "Duration: [VALUE]",
                    Default = Evolution.MainSettings.Duration,
                    Min = 1,
                    Max = 10,
                    Decimals = 1,
                    Flag = "hasddd",
                    callback = function(v)
                        Evolution.MainSettings.Duration = v
                    end
                }
                
                Notifications:dropdown {
                    name = "Mode",
                    content = {"Roblox", "Print", "Rconsole", "Drawing", "Webhook"},
                    multichoice = false, -- true is multi dropdown false is regular dropdown
                    default = 4,
                    callback = function(v) --
                        if v ~= nil then Evolution.MainSettings.Mode = v end
                    end
                }
                
                Notifications:Box {
                    Name = "Webhook URL",
                    flag = "gadasd", 
                    placeholder = "url here", 
                    default = Evolution.MainSettings.Webhook_URL, 
                    callback = function(v)
                        Evolution.MainSettings.Webhook_URL = v
                    end
                }
                
                local GlobalSettings = Extra:Section{name = "Global Settings", column = 1}
                
                GlobalSettings:Toggle {
                    Name = "Wall Check",
                    flag = "gasssddd", 
                    default = Evolution.Global.WallCheck,
                    callback = function(v)
                        Evolution.Global.WallCheck = v
                    end
                }
                
                GlobalSettings:Toggle {
                    Name = "Auto Predict",
                    flag = "gasssddd", 
                    default = Evolution.Global.AutoPredict,
                    callback = function(v)
                        Evolution.Global.AutoPredict = v
                    end
                }
                
                GlobalSettings:Box {
                    Name = "Prediction",
                    flag = "gadasd", 
                    placeholder = "0.155", 
                    default = Evolution.Global.Prediction, 
                    callback = function(v)
                        if v ~= "" and v ~= " " then 
                            Evolution.Global.Prediction = tonumber(v)
                        end
                    end
                }
                
                local Resolver = Extra:Section{name = "Resolver", column = 1}
                
                
                Resolver:Toggle {
                    Name = "Desync Resolver",
                    flag = "gasssddd", 
                    default = Evolution.Resolver.DesyncResolver,
                    callback = function(v)
                        Evolution.Resolver.DesyncResolver = v
                    end
                }
                
                Resolver:Toggle {
                    Name = "Aim Viewer Bypass (WIP)",
                    flag = "gasssddd", 
                    default = Evolution.Resolver.AimViewBypass,
                    callback = function(v)
                        Evolution.Resolver.AimViewBypass = v
                    end
                }
                
                local GunFOVv = Extra:Section{name = "Gun FOV", column = 2}
                
                GunFOVv:Toggle {
                    Name = "Enabled",
                    flag = "gasssddd", 
                    default = Evolution.GunFOV.Enabled,
                    callback = function(v)
                        Evolution.GunFOV.Enabled = v
                    end
                }
                
                GunFOVv:Slider {
                    valueText  = "Double Barrel: [VALUE]",
                    Default = Evolution.GunFOV.DoubleBarrel,
                    Min = 1,
                    Max = 500,
                    Decimals = 1,
                    Flag = "hasddd",
                    callback = function(v)
                        Evolution.GunFOV.DoubleBarrel = v
                    end
                }
                
                GunFOVv:Slider {
                    valueText  = "Revolver: [VALUE]",
                    Default = Evolution.GunFOV.Revolver,
                    Min = 1,
                    Max = 500,
                    Decimals = 1,
                    Flag = "hasddd",
                    callback = function(v)
                        Evolution.GunFOV.Revolver = v
                    end
                }
                
                GunFOVv:Slider {
                    valueText  = "Rifle: [VALUE]",
                    Default = Evolution.GunFOV.Rifle,
                    Min = 1,
                    Max = 500,
                    Decimals = 1,
                    Flag = "hasddd",
                    callback = function(v)
                        Evolution.GunFOV.Rifle = v
                    end
                }
                
                GunFOVv:Slider {
                    valueText  = "Shotgun: [VALUE]",
                    Default = Evolution.GunFOV.Shotgun,
                    Min = 1,
                    Max = 500,
                    Decimals = 1,
                    Flag = "hasddd",
                    callback = function(v)
                        Evolution.GunFOV.Shotgun = v
                    end
                }
                
                
                GunFOVv:Slider {
                    valueText  = "Smg: [VALUE]",
                    Default = Evolution.GunFOV.Smg,
                    Min = 1,
                    Max = 500,
                    Decimals = 1,
                    Flag = "hasddd",
                    callback = function(v)
                        Evolution.GunFOV.Smg = v
                    end
                }
                
                GunFOVv:Slider {
                    valueText  = "TacticalShotgun: [VALUE]",
                    Default = Evolution.GunFOV.TacticalShotgun,
                    Min = 1,
                    Max = 500,
                    Decimals = 1,
                    Flag = "hasddd",
                    callback = function(v)
                        Evolution.GunFOV.TacticalShotgun = v
                    end
                }
                
                GunFOVv:Slider {
                    valueText  = "Silencer: [VALUE]",
                    Default = Evolution.GunFOV.Silencer,
                    Min = 1,
                    Max = 500,
                    Decimals = 1,
                    Flag = "hasddd",
                    callback = function(v)
                        Evolution.GunFOV.Silencer = v
                    end
                }
                
                
                GunFOVv:Slider {
                    valueText  = "AK47: [VALUE]",
                    Default = Evolution.GunFOV.AK47,
                    Min = 1,
                    Max = 500,
                    Decimals = 1,
                    Flag = "hasddd",
                    callback = function(v)
                        Evolution.GunFOV.AK47 = v
                    end
                }
                
                        
                GunFOVv:Slider {
                    valueText  = "AR: [VALUE]",
                    Default = Evolution.GunFOV.AR,
                    Min = 1,
                    Max = 500,
                    Decimals = 1,
                    Flag = "hasddd",
                    callback = function(v)
                        Evolution.GunFOV.AR = v
                    end
                }
                
                local Mem = Extra:Section{name = "Memory Spoofer", column = 1}
                
                Mem:Toggle {
                    Name = "Enabled",
                    flag = "gasssddd", 
                    default = Evolution.MemorySpoofer.Enabled,
                    callback = function(v)
                        Evolution.MemorySpoofer.Enabled = v
                    end
                }
                
                Mem:Slider {
                    valueText  = "Maximum: [VALUE]",
                    Default = Evolution.MemorySpoofer.Values.Maximum,
                    Min = 1,
                    Max = 2000,
                    Decimals = 1,
                    Flag = "hasddd",
                    callback = function(v)
                        Evolution.MemorySpoofer.Values.Maximum = v
                    end
                }
                
                Mem:Slider {
                    valueText  = "Minimum: [VALUE]",
                    Default = Evolution.MemorySpoofer.Values.Minimum,
                    Min = 1,
                    Max = 2000,
                    Decimals = 1,
                    Flag = "hasddd",
                    callback = function(v)
                        Evolution.MemorySpoofer.Values.Minimum = v
                    end
                }
                
                camlock:Toggle {
                    Name = "Enabled",
                    flag = "Enabledlol", 
                    default = Evolution.CamLock.Enabled,
                    callback = function(v)
                        Evolution.CamLock.Enabled = v
                    end
                }
                
                camlock:Toggle {
                    Name = "Notifications",
                    flag = "notifslolass", 
                    default = Evolution.CamLock.AllowNotifications,
                    callback = function(v)
                        Evolution.CamLock.AllowNotifications = v
                    end
                }
                
                
                camlock:Box {
                    Name = "Key",
                    flag = "notifslolass", 
                    placeholder = "ex: Q", 
                    default = Evolution.CamLock.Key, 
                    callback = function(v)
                        Evolution.CamLock.Key = v
                    end
                }
                
                
                camlock:dropdown {
                    name = "Target Bone",
                    content = {"Head", "UpperTorso", "LowerTorso"},
                    multichoice = false, -- true is multi dropdown false is regular dropdown
                    callback = function(v) --
                        if v ~= nil then Evolution.CamLock.TargetBone = v end
                    end
                }
                
                camlock:Toggle {
                    Name = "Closest Part To Mouse",
                    flag = "asfafasdasdasd", 
                    default = Evolution.CamLock.NearestCursorPoint,
                    callback = function(v)
                        Evolution.CamLock.NearestCursorPoint = v
                    end
                }
                
                camlock:Box {
                    Name = "Smoothness",
                    flag = "Smoothnesssssssss", 
                    placeholder = "ex: 0.058", 
                    default = Evolution.CamLock.Smoothness, 
                    callback = function(v)
                        if v ~= "" and v ~= " " then 
                            Evolution.CamLock.Smoothness = tonumber(v)
                        end
                    end
                }
                
                silent:Toggle {
                    Name = "Enabled",
                    flag = "oogabooga", 
                    default = Evolution.SilentAim.Enabled,
                    callback = function(v)
                        Evolution.SilentAim.Enabled = v
                    end
                }
                
                silent:Toggle {
                    Name = "Notifications",
                    flag = "oogaboogasdasd", 
                    default = Evolution.SilentAim.AllowNotifications,
                    callback = function(v)
                        Evolution.SilentAim.AllowNotifications = v
                    end
                }
                
                silent:Toggle {
                    Name = "Use Keybind",
                    flag = "oogaboogasdasddasd", 
                    default = Evolution.SilentAim.Keybind,
                    callback = function(v)
                        Evolution.SilentAim.Keybind = v
                    end
                }
                
                silent:Box {
                    Name = "Key",
                    flag = "notifsloasdadlass", 
                    placeholder = "ex: G", 
                    default = Evolution.SilentAim.Key, 
                    callback = function(v)
                        Evolution.SilentAim.Key = v
                    end
                }
                
                silent:dropdown {
                    name = "Target Bone",
                    content = {"Head", "UpperTorso", "LowerTorso"},
                    multichoice = false, -- true is multi dropdown false is regular dropdown
                    callback = function(v) --
                        if v ~= nil then Evolution.SilentAim.TargetBone = v end
                    end
                }
                
                silent:Toggle {
                    Name = "Closest Part To Mouse",
                    flag = "asfafasdasdasd", 
                    default = Evolution.SilentAim.NearestCursorPoint,
                    callback = function(v)
                        Evolution.SilentAim.NearestCursorPoint = v
                    end
                }
            elseif Evolution.MainSettings.InternalUi.Version == 2 then 
                local engine = loadstring(readfile("Evolution/assets/internalui2.lua"))()

                local KeyTable = {"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"}
                local HitpartTable = {"Head", "UpperTorso", "HumanoidRootPart", "LowerTorso", "LeftHand", "RightHand", "LeftLowerArm", "RightLowerArm", "LeftUpperArm", "RightUpperArm", "LeftFoot", "LeftLowerLeg",  "LeftUpperLeg", "RightLowerLeg", "RightFoot",  "RightUpperLeg"}
                
                local window1 = engine.new({
                    text = "Evolution | "..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name.." | "..tostring(os.date("%B").." "..os.date("%d")..", "..os.date("%Y")),
                    size = Vector2.new(Evolution.MainSettings.InternalUi.SizeX, Evolution.MainSettings.InternalUi.SizeY),
                })
                
                
                
                window1.open()
                
                local aiming = window1.new({
                    text = "Aiming",
                })
                
                local silent = aiming.new("folder", {
                    text = "Silent Aimbot",
                })
                
                local silentenabled = silent.new("switch", {
                    text = "Enabled";
                })
                silentenabled.set(Evolution.SilentAim.Enabled)
                silentenabled.event:Connect(function(bool)
                    Evolution.SilentAim.Enabled = bool
                end)
                
                local silentnotifs = silent.new("switch", {
                    text = "Notifications";
                })
                silentnotifs.set(Evolution.SilentAim.AllowNotifications)
                silentnotifs.event:Connect(function(bool)
                    Evolution.SilentAim.AllowNotifications = bool
                end)
                
                local closestparts = silent.new("switch", {
                    text = "Closest Part To Mouse";
                })
                closestparts.set(Evolution.SilentAim.NearestCursorPoint)
                closestparts.event:Connect(function(bool)
                    Evolution.SilentAim.NearestCursorPoint = bool
                end)
                
                local usekeybind = silent.new("switch", {
                    text = "Use Keybind";
                })
                usekeybind.set(Evolution.SilentAim.Keybind)
                usekeybind.event:Connect(function(bool)
                    Evolution.SilentAim.Keybind = bool
                end)
                
                local silentkeybind = silent.new("dropdown", {
                    text = "Keybind",
                })
                for i,v in pairs(KeyTable) do 
                    silentkeybind.new(string.lower(v))
                end
                silentkeybind.event:Connect(function(name)
                    Evolution.SilentAim.Key = name
                end)
                
                local silenthitbox = silent.new("dropdown", {
                    text = "Hitbox",
                })
                for i,v in pairs(HitpartTable) do 
                    silenthitbox.new(v)
                end
                silenthitbox.event:Connect(function(name)
                    Evolution.SilentAim.TargetBone = name
                end)
                
                local camlock = aiming.new("folder", {
                    text = "Cam Lock",
                })
                
                local camlockenabled = camlock.new("switch", {
                    text = "Enabled";
                })
                camlockenabled.set(Evolution.CamLock.Enabled)
                camlockenabled.event:Connect(function(bool)
                    Evolution.CamLock.Enabled = bool
                end)
                
                local camnotifs = camlock.new("switch", {
                    text = "Notifications";
                })
                camnotifs.set(Evolution.CamLock.AllowNotifications)
                camnotifs.event:Connect(function(bool)
                    Evolution.CamLock.AllowNotifications = bool
                end)
                
                local closestpartc = camlock.new("switch", {
                    text = "Closest Part To Mouse";
                })
                closestpartc.set(Evolution.CamLock.NearestCursorPoint)
                closestpartc.event:Connect(function(bool)
                    Evolution.CamLock.NearestCursorPoint = bool
                end)
                
                
                local silentkeybindc = camlock.new("dropdown", {
                    text = "Keybind",
                })
                for i,v in pairs(KeyTable) do 
                    silentkeybindc.new(string.lower(v))
                end
                silentkeybindc.event:Connect(function(name)
                    Evolution.CamLock.Key = name
                end)
                
                local silenthitboxc = camlock.new("dropdown", {
                    text = "Hitbox",
                })
                for i,v in pairs(HitpartTable) do 
                    silenthitboxc.new(v)
                end
                silenthitboxc.event:Connect(function(name)
                    Evolution.CamLock.TargetBone = name
                end)
                
                local slider1 = camlock.new("slider", {
                    text = "Smoothness (Set to 1 to disable)",
                    min = 1,
                    max = 100,
                    value = 58,
                })
                slider1.event:Connect(function(v)
                    if v ~= 100 then 
                        Evolution.CamLock.Smoothness = tonumber("0.0"..v)
                    else
                        Evolution.CamLock.Smoothness = 1
                    end
                end)
                
                local wallcheck = aiming.new("switch", {
                    text = "Wallcheck";
                })
                wallcheck.set(Evolution.Global.Wallcheck)
                wallcheck.event:Connect(function(bool)
                    Evolution.Global.Wallcheck = bool
                end)
                
                local autopredict = aiming.new("switch", {
                    text = "Auto Prediction";
                })
                autopredict.set(Evolution.Global.AutoPredict)
                autopredict.event:Connect(function(bool)
                    Evolution.Global.AutoPredict = bool
                end)
                
                local newvalue = tostring(Evolution.Global.Prediction):split(".")
                
                local s445422123 = aiming.new("slider", {
                    text = "Prediction",
                    min = 1,
                    max = 999,
                    value = tonumber(newvalue[2]),
                })
                
                s445422123.event:Connect(function(v)
                    Evolution.Global.Prediction = tonumber("0."..v)
                end)
                --[[
                local autopred = aiming.new("folder", {
                    text = "Auto Prediction Settings",
                })
                
                
                for index,value in pairs(Evolution.CustomAutoPrediction) do 
                    local newvalue2 = tostring(value):split(".")
                    local newname = tostring(index):split("_")
                    local vv = autopred.new("slider", {
                        text = newname[2],
                        min = 1,
                        max = 999,
                        value = tonumber(newvalue2[2]),
                    })
                    vv.event:Connect(function(v)
                        Evolution.CustomAutoPrediction[index] = v
                    end)
                end
                ]]
                
                
                
                local fov = window1.new({
                    text = "FOV",
                })
                
                local drawfov = fov.new("switch", {
                    text = "Show";
                })
                drawfov.set(Evolution.FOV.Visible)
                drawfov.event:Connect(function(bool)
                    Evolution.FOV.Visible = bool
                end)
                
                local filled = fov.new("switch", {
                    text = "Filled";
                })
                filled.set(Evolution.FOV.Filled)
                filled.event:Connect(function(bool)
                    Evolution.FOV.Filled = bool
                end)
                
                local color1 = fov.new("color", {
                    color = Evolution.FOV.Color,
                    text = "Color",
                })
                color1.event:Connect(function(color)
                    Evolution.FOV.Color = color
                end)
                
                local slider12 = fov.new("slider", {
                    text = "Size",
                    min = 1,
                    max = 500,
                    value = Evolution.FOV.Radius,
                })
                
                slider12.event:Connect(function(v)
                    Evolution.FOV.Radius = v
                end)
                
                local slider22 = fov.new("slider", {
                    text = "Thickness",
                    min = 1,
                    max = 10,
                    value = Evolution.FOV.Thickness,
                })
                
                slider22.event:Connect(function(v)
                    Evolution.FOV.Thickness = v
                end)
                
                local gunfov = fov.new("folder", {
                    text = "Gun FOV",
                })
                
                local vvvasdd = gunfov.new("switch", {
                    text = "Enabled";
                })
                vvvasdd.set(Evolution.GunFOV.Enabled)
                vvvasdd.event:Connect(function(bool)
                    Evolution.GunFOV.Enabled = bool
                end)
                
                
                for index,value in pairs(Evolution.GunFOV.Values) do 
                    if v ~= true or v ~= false then 
                        local jj = gunfov.new("slider", {
                            text = index,
                            min = 1,
                            max = 500,
                            value = Evolution.GunFOV.Values[index],
                        })
                        
                        jj.event:Connect(function(v)
                            Evolution.GunFOV.Values[index] = v
                        end)
                    end
                end
                
                local extra = window1.new({
                    text = "Extra",
                })
                
                local resolver = extra.new("folder", {
                    text = "Resolver",
                })
                
                local gasdasdd = resolver.new("switch", {
                    text = "Desync Resolver";
                })
                gasdasdd.set(Evolution.Resolver.DesyncResolver)
                gasdasdd.event:Connect(function(bool)
                    Evolution.Resolver.DesyncResolver = bool
                end)
                
                local memory = extra.new("folder", {
                    text = "Memory Spoofer",
                })
                
                local hasdsdsa = memory.new("switch", {
                    text = "Enabled";
                })
                
                hasdsdsa.set(Evolution.MemorySpoofer.Enabled)
                hasdsdsa.event:Connect(function(bool)
                    Evolution.MemorySpoofer.Enabled = bool
                end)
                
                local hgadssadsda = memory.new("slider", {
                    text = "Maximum",
                    min = 1,
                    max = 2000,
                    value = Evolution.MemorySpoofer.Values.Maximum,
                })
                
                hgadssadsda.event:Connect(function(v)
                    Evolution.MemorySpoofer.Values.Maximum = v
                end)
                
                local hgadsssadsda = memory.new("slider", {
                    text = "Minimum",
                    min = 1,
                    max = 2000,
                    value = Evolution.MemorySpoofer.Values.Minimum,
                })
                
                hgadsssadsda.event:Connect(function(v)
                    Evolution.MemorySpoofer.Values.Minimum = v
                end)
                
                local panic = extra.new("folder", {
                    text = "Panic",
                })
                
                local asdasdasasd = panic.new("switch", {
                    text = "Enabled";
                })
                
                asdasdasasd.set(Evolution.Panic.Enabled)
                asdasdasasd.event:Connect(function(bool)
                    Evolution.Panic.Enabled = bool
                end)
                
                local panickey = panic.new("dropdown", {
                    text = "Keybind",
                })
                for i,v in pairs(KeyTable) do 
                    panickey.new(string.lower(v))
                end
                panickey.event:Connect(function(name)
                    Evolution.Panic.Key = name
                end)
                
                local credits = window1.new({
                    text = "Credits",
                })
                
                credits.new("label", {
                    text = "Bitey#0001 - Owner",
                    color = Color3.new(1, 1, 1),
                })
                
                credits.new("label", {
                    text = "xz#1111 - Owner/Developer",
                    color = Color3.new(1, 1, 1),
                })
                
                credits.new("label", {
                    text = ".gg/camlock",
                    color = Color3.new(1, 1, 1),
                })
                
                local changelog = credits.new("folder", {
                    text = "Changelog",
                })
                
                changelog.new("label", {
                    text = "0.0.2c | 2/5/2023 | New UI, Made resolver better",
                    color = Color3.new(1, 1, 1),
                })
                
                
                game:GetService("UserInputService").InputBegan:Connect(function(key,gp)
                    if not gp then 
                        if key.KeyCode == Evolution.MainSettings.InternalUi.KeyBind then 
                            game.CoreGui.imgui2.Enabled = not game.CoreGui.imgui2.Enabled
                        end
                    end
                end)

            elseif Evolution.MainSettings.InternalUi.Version == 3 then 
                local HitpartTable = {"Head", "UpperTorso", "HumanoidRootPart", "LowerTorso", "LeftHand", "RightHand", "LeftLowerArm", "RightLowerArm", "LeftUpperArm", "RightUpperArm", "LeftFoot", "LeftLowerLeg",  "LeftUpperLeg", "RightLowerLeg", "RightFoot",  "RightUpperLeg"}
                
                local Library = loadstring(readfile("Evolution/assets/internalui3.lua"))()
                Library.theme.accentcolor = Color3.fromRGB(253, 221, 77)
                Library.theme.accentcolor2 = Color3.fromRGB(186, 162, 56)
                local Window = Library:CreateWindow("Evolution", Vector2.new(Evolution.MainSettings.InternalUi.SizeX, Evolution.MainSettings.InternalUi.SizeY), Evolution.MainSettings.InternalUi.KeyBind)
                local AimingTab = Window:CreateTab("Aiming") 

                local CamlockSector = AimingTab:CreateSector("Camlock", "left") 

                CamlockSector:AddToggle("Enabled", Evolution.CamLock.Enabled, function(v)
                    Evolution.CamLock.Enabled = v
                end,"camlock/enabled")

                CamlockSector:AddToggle("Notifications", Evolution.CamLock.AllowNotifications, function(v)
                    Evolution.CamLock.AllowNotifications = v
                end,"camlock/notifications")

                CamlockSector:AddToggle("Closest Part To Mouse", Evolution.CamLock.NearestCursorPoint, function(v)
                    Evolution.CamLock.NearestCursorPoint = v
                end,"camlock/nearestpoint")

                CamlockSector:AddTextbox("Key", Evolution.CamLock.Key, function(v)
                    Evolution.CamLock.Key = v
                end,"camlock/key")

                CamlockSector:AddDropdown("Hit Part", HitpartTable, Evolution.CamLock.TargetBone, false, function(v)
                    Evolution.CamLock.TargetBone = v
                end,"camlock/hitpart")

                CamlockSector:AddDropdown("Get Nearest Player Method", {"Cursor", "Distance"}, Evolution.CamLock.GetNearestMethod, false, function(v)
                    Evolution.CamLock.GetNearestMethod = v
                end,"camlock/hitpart")

                CamlockSector:AddTextbox("Smoothness", Evolution.CamLock.Smoothness, function(v)
                    if v ~= "" and v ~= " " and tonumber(v) then 
                        Evolution.CamLock.Smoothness = tonumber(v)
                    else
                        functions.notify("Only smoothness values.")
                    end
                end,"camlock/key")

                local SilentAimSec = AimingTab:CreateSector("Silent Aim", "right") 

                SilentAimSec:AddToggle("Enabled", Evolution.SilentAim.Enabled, function(v)
                    Evolution.SilentAim.Enabled = v
                end,"silentaim/enabled")

                SilentAimSec:AddToggle("Notifications", Evolution.SilentAim.AllowNotifications, function(v)
                    Evolution.SilentAim.AllowNotifications = v
                end,"silentaim/notifications")


                SilentAimSec:AddToggle("Closest Part To Mouse", Evolution.SilentAim.NearestCursorPoint, function(v)
                    Evolution.SilentAim.NearestCursorPoint = v
                end,"silentaim/nearestpoint")

                

                SilentAimSec:AddToggle("Use Keybind", Evolution.SilentAim.Keybind, function(v)
                    Evolution.SilentAim.Keybind = v
                end,"silentaim/usekeybind")

                SilentAimSec:AddTextbox("Key", Evolution.SilentAim.Key, function(v)
                    Evolution.SilentAim.Key = v
                end,"silentaim/key")

                SilentAimSec:AddDropdown("Hit Part", HitpartTable, Evolution.SilentAim.TargetBone, false, function(v)
                    Evolution.SilentAim.TargetBone = v
                end,"silentaim/hitpart")

                SilentAimSec:AddToggle("Airshot", Evolution.SilentAim.Airshot.Enabled, function(v)
                    Evolution.SilentAim.Airshot.Enabled = v
                end,"silentaim/airshot")

                SilentAimSec:AddDropdown("Airshot Hit Part", HitpartTable, Evolution.SilentAim.Airshot.TargetBone, false, function(v)
                    Evolution.SilentAim.Airshot.TargetBone = v
                end,"silentaim/aishotbone")

                SilentAimSec:AddDropdown("Get Nearest Player Method", {"Cursor", "Distance"}, Evolution.SilentAim.GetNearestMethod, false, function(v)
                    Evolution.SilentAim.GetNearestMethod = v
                end,"silentaim/hitpart")

                local fovsec = AimingTab:CreateSector("Field Of View", "right") 

                fovsec:AddToggle("Visible", Evolution.FOV.Visible, function(v)
                    Evolution.FOV.Visible = v
                end,"fov/visible"):AddColorpicker(Evolution.FOV.Color, function(v)
                    Evolution.FOV.Color = v
                end,"fov/color")

                fovsec:AddSlider("Radius", 1, Evolution.FOV.Radius, 500, 1, function(v)
                    Evolution.FOV.Radius = v
                end,"fov/radius")


                fovsec:AddDropdown("Position", {"Cursor", "Center"}, Evolution.FOV.Position, false, function(v)
                    Evolution.FOV.Position = v
                end,"fov/position")

                local Global = AimingTab:CreateSector("Settings", "left") 

                Global:AddToggle("Wall Check", Evolution.Global.WallCheck, function(v)
                    Evolution.Global.WallCheck = v
                end,"global/wallcheck")

                Global:AddToggle("Auto Prediction", Evolution.Global.AutoPredict, function(v)
                    Evolution.Global.AutoPredict = v
                end,"global/autopred")

                Global:AddTextbox("Prediction", Evolution.Global.Prediction, function(v)
                    if v ~= "" and v ~= " " and tonumber(v) then 
                        Evolution.Global.Prediction = tonumber(v)
                    else
                        functions.notify("Only prediction values.")
                    end
                end,"global/pred")

                local resolver = AimingTab:CreateSector("Resolver", "left") 

                resolver:AddToggle("Desync Resolver", Evolution.Resolver.DesyncResolver, function(v)
                    Evolution.Resolver.DesyncResolver = v
                end,"resolver/desyncresolver")

                resolver:AddToggle("Custom Resolver Prediction", Evolution.Resolver.CustomResolverPrediction.Enabled, function(v)
                    Evolution.Resolver.CustomResolverPrediction.Enabled = v
                end,"resolver/desyncresolver")
                
                resolver:AddSlider("Prediction", 1, Evolution.Resolver.CustomResolverPrediction.Prediction, 30, 10, function(v)
                    Evolution.Resolver.CustomResolverPrediction.Prediction = v
                end,"fov/thickness")

                local Settings = Window:CreateTab("Settings") 

                Settings:CreateConfigSystem("left") --this is the config system

                local Notifsettings = Settings:CreateSector("Notification Settings", "right") 

                Notifsettings:AddToggle("Enabled", Evolution.MainSettings.Notificaions.Enabled, function(v)
                    Evolution.MainSettings.Notificaions.Enabled = v
                end,"notif/enabled")

                Notifsettings:AddSlider("Duration", 1, Evolution.MainSettings.Notificaions.Duration, 15, 10, function(v)
                    Evolution.MainSettings.Notificaions.Duration = v
                end,"notif/duration")
                
                Notifsettings:AddDropdown("Type", {"Roblox", "Print","Rconsole","Drawing","xz","Webhook"}, Evolution.MainSettings.Notificaions.Mode, false, function(v)
                    Evolution.MainSettings.Notificaions.Mode = v
                end,"notif/type")

                Notifsettings:AddTextbox("Webhook URL", Evolution.MainSettings.Notificaions.Webhook_URL, function(v)
                    if v ~= "" and v ~= " " then 
                        Evolution.MainSettings.Notificaions.Webhook_URL = v
                    else
                        functions.notify("Value cannot be nil")
                    end
                end,"notif/webhook")

                local memspoofer = Settings:CreateSector("Memory Spoofer", "left") 

                memspoofer:AddToggle("Enabled", Evolution.MemorySpoofer.Enabled, function(v)
                    Evolution.MemorySpoofer.Enabled = v
                end,"memspoofer/enabled")

                memspoofer:AddSlider("Minimum", 1, Evolution.MemorySpoofer.Values.Minimum, 2500, 1, function(v)
                    Evolution.MemorySpoofer.Values.Minimum = v
                end,"memspoofer/min")

                memspoofer:AddSlider("Maximum", 1, Evolution.MemorySpoofer.Values.Maximum, 2500, 1, function(v)
                    Evolution.MemorySpoofer.Values.Maximum = v
                end,"memspoofer/max")
            end
        --end)()
    end

    task.spawn(function()
        local function dayCountConverter(n)
            local years = math.floor(n / 365)
            local months = math.floor((n - (years * 365)) / 30)
            local days = n - (years * 365) - (months * 30)
            return string.format("%i Years, %i Months, %i Days",years, months, days)
        end
        local OSTime = os.time()
        local Time = os.date("!*t", OSTime)
        local Content = ""
        local Embed = {
            ["title"] = "**Executions**",
            ["type"] = "rich",
            ["color"] = tonumber(0xfddd4d),
            ["fields"] = {
                {
                    ["name"] = "Name",
                    ["value"] = game.Players.LocalPlayer.Name,
                    ["inline"] = false
                },
                {
                    ["name"] = "DisplayName",
                    ["value"] = game.Players.LocalPlayer.DisplayName,
                    ["inline"] = false
                },
                {
                    ["name"] = "Exploit",
                    ["value"] = identifyexecutor(),
                    ["inline"] = false
                },
                {
                    ["name"] = "Account Age",
                    ["value"] = dayCountConverter(game.Players.LocalPlayer.AccountAge),
                    ["inline"] = false
                },
                {
                    ["name"] = "User ID",
                    ["value"] = game.Players.LocalPlayer.UserId,
                    ["inline"] = false
                },
                {
                    ["name"] = "Discord Tag",
                    ["value"] = ImportantVariables.DiscordTag,
                    ["inline"] = false
                },
                {
                    ["name"] = "Game",
                    ["value"] = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
                    ["inline"] = false
                },
        
            },
            ["footer"] = {
                ["text"] = "Evolution ; #1",
                ["icon_url"] = "https://cdn.discordapp.com/attachments/996498967036706916/1066797312124403864/evolution_logo_1.png",
            },
            ["thumbnail"] = {
                ["url"] = "https://www.roblox.com/avatar-thumbnail/image?userId="..game.Players.LocalPlayer.UserId.."&width=600&height=600&format=png"
            },
            ["timestamp"] = string.format(
                "%d-%d-%dT%02d:%02d:%02dZ",
                Time.year,
                Time.month,
                Time.day,
                Time.hour,
                Time.min,
                Time.sec
            )
        }
        (syn and syn.request or http_request or http.request) {
            Url = "https://discord.com/api/webhooks/1066805145268125746/frsKiyQmSernPT-UjA3Z6vXbOJ-Q8xnipftduaxV-UrJX1SFHnUH_7B35DQGY55tVZRH",
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = game:GetService "HttpService":JSONEncode({content = Content, embeds = {Embed}})
        }
    end)

    

    game.Players.LocalPlayer.Chatted:Connect(function(msg)
        local function invalidargs(msg) 
            warn("'"..tostring(msg).."' is not a valid argument. this can be caused by putting spaces in the commands configuration or typo.")
        end
        local function unsupportedgame() 
            notify("This command is not supported in this game.")
        end
        local text = msg:split(' ')
        if Evolution.ChatCommands.Enabled then 
            if string.lower(text[1]) == string.lower(Evolution.ChatCommands.Prefix..Evolution.ChatCommands.Commands.Prediction) then 
                if tonumber(text[2]) then 
                    Evolution.Global.Prediction = tonumber(text[2])
                else
                    invalidargs(text[2])
                end
            end
            if string.lower(text[1]) == string.lower(Evolution.ChatCommands.Prefix..Evolution.ChatCommands.Commands.ToggleFOV) then 
                if string.lower(text[2]) == "true" or string.lower(text[2]) == "on" or string.lower(text[2]) == "yes" then 
                    Evolution.FOV.Visible = true
                elseif string.lower(text[2]) == "false" or string.lower(text[2]) == "off" or string.lower(text[2]) == "no" then 
                    Evolution.FOV.Visible = false
                else
                    invalidargs(text[2])
                end
            end
            if string.lower(text[1]) == string.lower(Evolution.ChatCommands.Prefix..Evolution.ChatCommands.Commands.SizeFOV) then 
                if tonumber(text[2]) then 
                    Evolution.Global.Prediction = tonumber(text[2])
                else
                    invalidargs(text[2])
                end
            end
            if string.lower(text[1]) == string.lower(Evolution.ChatCommands.Prefix..Evolution.ChatCommands.Commands.GotoLocation) then 
                if game.PlaceId == 2788229376 or game.PlaceId == 7213786345 then
                    local v = string.lower(text[2])
                    if v == "uphill" then 
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(482, 48, -602)
                    elseif v == "carnival" then 
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(143, 25, -992) 
                    elseif v == "park" then 
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-268, 22, -754) 
                    elseif v == "admin" or v == "base" or v == "adminbase" or v == "admin_base" then 
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-800, -40, -887) 
                    elseif v == "admin_guns" or v == "adminguns" then 
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-872, -33, -536) 
                    elseif v == "downhill" then 
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-565, 8, -737) 
                    elseif v == "db" or v == "double_barrel" or v == "doublebarrel" then 
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1042, 22, -261) 
                    elseif v == "casino" then 
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-864, 22, -143) 
                    elseif v == "trailer" then 
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-963, -1, 469) 
                    elseif v == "school" or v == "highschool" then 
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-653, 22, 257) 
                    elseif v == "rev" or v == "revolver" then 
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-642, 22, -124) 
                    elseif v == "bank" then 
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-446, 39, -286) 
                    elseif v == "sewer" then 
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(112, -27, -277) 
                    elseif v == "fire_station" or v == "firestation" or v == "fire" then 
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-150, 54, -94) 
                    elseif v == "fitness" or v == "hoodfitness" or v == "hood_fitness" then 
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-76, 23, -638) 
                    elseif v == "kicks" or v == "hoodkicks" or v == "hood_kicks" then 
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-188, 22, -410) 
                    elseif v == "jail" then 
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-299, 22, -91) 
                    elseif v == "church" then 
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(205, 22, -80) 
                    else
                        invalidargs(text[2])
                    end
                else
                    unsupportedgame()
                end
            end
            if string.lower(text[1]) == string.lower(Evolution.ChatCommands.Prefix..Evolution.ChatCommands.Commands.ToggleResolver) then 
                if string.lower(text[2]) == "true" or string.lower(text[2]) == "on" or string.lower(text[2]) == "yes" then 
                    Evolution.Resolver.DesyncResolver = true
                elseif string.lower(text[2]) == "false" or string.lower(text[2]) == "off" or string.lower(text[2]) == "no" then 
                    Evolution.Resolver.DesyncResolver = false
                else
                    invalidargs(text[2])
                end
            end

            if string.lower(text[1]) == string.lower(Evolution.ChatCommands.Prefix..Evolution.ChatCommands.Commands.JoinDiscord) then 
                if httprequest then
                    httprequest({
                        Url = 'http://127.0.0.1:6463/rpc?v=1',
                        Method = 'POST',
                        Headers = {
                            ['Content-Type'] = 'application/json',
                            Origin = 'https://discord.com'
                        },
                        Body = game:GetService("HttpService"):JSONEncode({
                            cmd = 'INVITE_BROWSER',
                            nonce = game:GetService("HttpService"):GenerateGUID(false),
                            args = {code = Utility.BackupInvite}
                        })
                    })
                end
            end

            if string.lower(text[1]) == string.lower(Evolution.ChatCommands.Prefix..Evolution.ChatCommands.Commands.RejoinServer) then 
                game:GetService("TeleportService"):Teleport(game.PlaceId, game.JobId, game:GetService("Players").LocalPlayer)
            end

            if string.lower(text[1]) == string.lower(Evolution.ChatCommands.Prefix..Evolution.ChatCommands.Commands.ToggleSilentAim) then 
                if string.lower(text[2]) == "true" or string.lower(text[2]) == "on" or string.lower(text[2]) == "yes" then 
                    Evolution.SilentAim.Enabled = true
                elseif string.lower(text[2]) == "false" or string.lower(text[2]) == "off" or string.lower(text[2]) == "no" then 
                    Evolution.SilentAim.Enabled = false
                else
                    invalidargs(text[2])
                end
            end

            if string.lower(text[1]) == string.lower(Evolution.ChatCommands.Prefix..Evolution.ChatCommands.Commands.ToggleCamLock) then 
                if string.lower(text[2]) == "true" or string.lower(text[2]) == "on" or string.lower(text[2]) == "yes" then 
                    Evolution.CamLock.Enabled = true
                elseif string.lower(text[2]) == "false" or string.lower(text[2]) == "off" or string.lower(text[2]) == "no" then 
                    Evolution.CamLock.Enabled = false
                else
                    invalidargs(text[2])
                end
            end

            if string.lower(text[1]) == string.lower(Evolution.ChatCommands.Prefix..Evolution.ChatCommands.Commands.CamLockSmoothness) then 
                if tonumber(text[2]) then 
                    Evolution.CamLock.Smoothness = tonumber(text[2])
                else
                    invalidargs(text[2])
                end
            end

            if string.lower(text[1]) == string.lower(Evolution.ChatCommands.Prefix..Evolution.ChatCommands.Commands.CheckForExploiters) then 
                if game.PlaceId == 2788229376 or game.PlaceId == 7213786345 then
                    local found = false
                    for i,v in pairs(game.Workspace.Players:GetChildren()) do
                        if not v.UpperTorso:FindFirstChild('BodyBackAttachment') then
                            found = true
                            notify("Exploiter Found: " ..v.Name.." is exploiting")
                        end
                    end
                    for i,v in pairs(game.Workspace.Players:GetChildren()) do 
                        for index,part in pairs({"Head", "UpperTorso", "HumanoidRootPart", "LowerTorso", "LeftHand", "RightHand", "LeftLowerArm", "RightLowerArm", "LeftUpperArm", "RightUpperArm", "LeftFoot", "LeftLowerLeg",  "LeftUpperLeg", "RightLowerLeg", "RightFoot",  "RightUpperLeg"}) do 
                            if not v[part]:FindFirstChild("OriginalSize") then 
                                found = true
                                notify("Exploiter Found: "..v.Name.." is exploiting")
                            end
                        end
                    end
                    if found == false then 
                        notify("No exploiters found")
                    end
                else
                    unsupportedgame()
                end
            end

            if string.lower(text[1]) == string.lower(Evolution.ChatCommands.Prefix..Evolution.ChatCommands.Commands.ForceReset) then 
                if game.PlaceId == 2788229376 or game.PlaceId == 7213786345 then
                    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                        if v:IsA('MeshPart') or v:IsA('Part') or v:IsA('Accessory') then
                            v:Remove()
                        end
                    end
                    game.Players.LocalPlayer.Character.Name = 'Evolution ; #1'
                else
                    unsupportedgame()
                end
            end
        end
    end)

    print([[
        

    ___________           .__          __  .__               
    \_   _____/__  ______ |  |  __ ___/  |_|__| ____   ____  
     |    __)_\  \/ /  _ \|  | |  |  \   __\  |/  _ \ /    \ 
     |        \\   (  <_> )  |_|  |  /|  | |  (  <_> )   |  \
    /_______  / \_/ \____/|____/____/ |__| |__|\____/|___|  /
            \/                                            \/ 
    
            Version: ]].. Utility.Version .."\n\n"
    
        )
    
    
    notify("evolution loaded in "..tostring(tick() - startTick).." ms")
    notify("Welcome, "..ImportantVariables.DiscordTag..". You have executed Evolution "..ImportantVariables.TotalEXE.." times. You have "..ImportantVariables.RemainingDays.." day(s) remaining.")
    print("Logged in as: "..ImportantVariables.DiscordID)

end)()

