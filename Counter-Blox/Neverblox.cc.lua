-- neverblox.cc
-- discord: https://discord.gg/RmkGgakQbw

game:GetService("Players").LocalPlayer.PlayerGui.GUI.Spectate.PlayerBox.GreyPart.PHealth.Position = UDim2.new(0, 5, 0, 0)
game:GetService("Players").LocalPlayer.PlayerGui.GUI.Spectate.PlayerBox.GreyPart.Plus.ImageTransparency = 1
game:GetService("Players").LocalPlayer.PlayerGui.GUI.Circle.Transparency = 0.6
game:GetService("Players").LocalPlayer.PlayerGui.GUI.Vitals.Transparency = 1
game:GetService("Players").LocalPlayer.PlayerGui.GUI.Buymenu.Base.ImageTransparency = 0.8
game:GetService("Players").LocalPlayer.PlayerGui.GUI.Inventory.Item1.bk.ImageTransparency = 1
game:GetService("Players").LocalPlayer.PlayerGui.GUI.Inventory.Item2.bk.ImageTransparency = 1
game:GetService("Players").LocalPlayer.PlayerGui.GUI.Inventory.Item3.bk.ImageTransparency = 1
game:GetService("Players").LocalPlayer.PlayerGui.GUI.Inventory.Item4.bk.ImageTransparency = 1
game:GetService("Players").LocalPlayer.PlayerGui.GUI.Inventory.Item5.bk.ImageTransparency = 1
game:GetService("Players").LocalPlayer.PlayerGui.GUI.Inventory.Item6.bk.ImageTransparency = 1
game:GetService("Players").LocalPlayer.PlayerGui.GUI.CTWin.Transparency = 0
game:GetService("Players").LocalPlayer.PlayerGui.GUI.CTWin.Color.Transparency = 0
game:GetService("Players").LocalPlayer.PlayerGui.GUI.CTWin.Info.Transparency = 0
game:GetService("Players").LocalPlayer.PlayerGui.GUI.TWin.Transparency = 0
game:GetService("Players").LocalPlayer.PlayerGui.GUI.TWin.Color.Transparency = 0
game:GetService("Players").LocalPlayer.PlayerGui.GUI.TWin.Info.Transparency = 0
game:GetService("Players").LocalPlayer.PlayerGui.GUI.Inventory.Item7.bk.ImageTransparency = 1
game:GetService("Players").LocalPlayer.PlayerGui.GUI.Vitals.bk.ImageTransparency = 1
game:GetService("Players").LocalPlayer.PlayerGui.GUI.AmmoGUI.bk.ImageTransparency = 1
game:GetService("Players").LocalPlayer.PlayerGui.GUI.UpperInfo.Transparency = 0.6
game:GetService("Players").LocalPlayer.PlayerGui.GUI.TeamSelection.Transparency = 0.4
game:GetService("Players").LocalPlayer.PlayerGui.GUI.TeamSelection.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
game:GetService("Players").LocalPlayer.PlayerGui.GUI.TeamSelection.Blue.Label.Text = "NEVER"
game:GetService("Players").LocalPlayer.PlayerGui.GUI.TeamSelection.Red.Label.Text = "BLOX"
game:GetService("Players").LocalPlayer.PlayerGui.GUI.Cash.BuyZone.ImageTransparency = 1
game:GetService("Players").LocalPlayer.PlayerGui.GUI.Cash.BuyZone.Size = UDim2.new(0, 0, 0, 0)
game:GetService("Players").LocalPlayer.PlayerGui.GUI.Cash.Size = UDim2.new(0, 206, 0, 40)
game:GetService("Players").LocalPlayer.PlayerGui.GUI.Cash.Position = UDim2.new(0, 6, 0, 230)
game:GetService("Players").LocalPlayer.PlayerGui.GUI.Cash.TextSize = 26.000
game:GetService("Players").LocalPlayer.PlayerGui.GUI.Cash.Font = Enum.Font.Gotham
game:GetService("Players").LocalPlayer.PlayerGui.GUI.Vitals.Health.Font = Enum.Font.Gotham
game:GetService("Players").LocalPlayer.PlayerGui.GUI.Vitals.Armor.Font = Enum.Font.Gotham
game:GetService("Players").LocalPlayer.PlayerGui.GUI.Vitals.APlus:Destroy()
game:GetService("Players").LocalPlayer.PlayerGui.GUI.Vitals.Plus:Destroy()
game:GetService("Players").LocalPlayer.PlayerGui.GUI.Spectate.Controls.Text = "neverblox.cc"
game:GetService("Players").LocalPlayer.PlayerGui.GUI.UpperInfo.CTScore.Font = Enum.Font.Gotham
game:GetService("Players").LocalPlayer.PlayerGui.GUI.UpperInfo.Timer.Font = Enum.Font.Gotham
game:GetService("Players").LocalPlayer.PlayerGui.GUI.UpperInfo.TScore.Font = Enum.Font.Gotham
game:GetService("Players").LocalPlayer.PlayerGui.GUI.AmmoGUI.AmmoClip.Font = Enum.Font.Gotham
game:GetService("Players").LocalPlayer.PlayerGui.GUI.AmmoGUI.AmmoReserve.Font = Enum.Font.Gotham
game:GetService("Players").LocalPlayer.PlayerGui.GUI.AmmoGUI.AmmoClip.TextColor3 = Color3.fromRGB(255, 255, 255)
game:GetService("Players").LocalPlayer.PlayerGui.GUI.AmmoGUI.Slash.Font = Enum.Font.Gotham
game:GetService("Players").LocalPlayer.PlayerGui.GUI.Notify.ImageTransparency = 0.6
game:GetService("Players").LocalPlayer.PlayerGui.GUI.Notify.TextLabel.Font = Enum.Font.Gotham
game:GetService("Players").LocalPlayer.PlayerGui.GUI.Notify.Icon.Font = Enum.Font.Gotham
game:GetService("Players").LocalPlayer.PlayerGui.GUI.MapVote.TextLabel.Text = "Map vote"
game:GetService("Players").LocalPlayer.PlayerGui.GUI.MapVote.TextLabel.Font = Enum.Font.Gotham
game:GetService("Players").LocalPlayer.PlayerGui.GUI.Defusal.Defusing.Font = Enum.Font.Gotham
game:GetService("Players").LocalPlayer.PlayerGui.GUI.Defusal.Time.Font = Enum.Font.Gotham
game:GetService("Players").LocalPlayer.PlayerGui.GUI.UpperInfo.Timer.Size = UDim2.new(1, 0, 0, 36)
game:GetService("Players").LocalPlayer.PlayerGui.GUI.UpperInfo.Scaler:Destroy()

getgenv().values = {}
local r15Dummy = game:GetObjects("rbxassetid://9093079622")[1]
local library = {}
local Signal = loadstring(game:HttpGet("https://raw.githubusercontent.com/Quenty/NevermoreEngine/version2/Modules/Shared/Events/Signal.lua"))()
local ConfigSave = Signal.new("ConfigSave")
local ConfigLoad = Signal.new("ConfigLoad")

local txt = game:GetService("TextService")
local TweenService = game:GetService("TweenService")
function library:Tween(...) TweenService:Create(...):Play() end
local cfglocation = "nvbcfg/"
makefolder("nvbcfg")

function rgbtotbl(rgb)
	return {R = rgb.R, G = rgb.G, B = rgb.B}
end
function tbltorgb(tbl)
	return Color3.new(tbl.R, tbl.G, tbl.B)
end
local function deepCopy(original)
	local copy = {}
	for k, v in next, original do
		if type(v) == "table" then
			v = deepCopy(v)
		end
		copy[k] = v
	end
	return copy
end
function library:ConfigFix(cfg)
	local copy = game:GetService("HttpService"):JSONDecode(readfile(cfglocation..cfg..".txt"))
	for i,Tabs in next, copy do
		for i,Sectors in next, Tabs do
			for i,Elements in next, Sectors do
				if Elements.Color ~= nil then
					local a = Elements.Color
					Elements.Color = tbltorgb(a)
				end
			end
		end
	end
	return copy
end
function library:SaveConfig(cfg)
	local copy = deepCopy(values)
	for i,Tabs in next, copy do
		for i,Sectors in next, Tabs do
			for i,Elements in next, Sectors do
				if Elements.Color ~= nil then
					Elements.Color = {R=Elements.Color.R, G=Elements.Color.G, B=Elements.Color.B}
				end
			end
		end
	end
	writefile(cfglocation..cfg..".txt", game:GetService("HttpService"):JSONEncode(copy))
end

function library:New(name)
	local menu = {}

	local Npt = Instance.new("ScreenGui")
	local Menu = Instance.new("ImageLabel")
	local TextLabel = Instance.new("TextLabel")
	local TabButtons = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")
	local Tabs = Instance.new("Frame")
	local Logo = Instance.new("ImageLabel")
	local pol_left_one = Instance.new("Frame")
	local UIGradient_left_one = Instance.new("UIGradient")
	local pol_right_one = Instance.new("Frame")
	local UIGradient_right_one = Instance.new("UIGradient")
	local pol_left_two = Instance.new("Frame")
	local UIGradient_left_two = Instance.new("UIGradient")
	local pol_right_two = Instance.new("Frame")
	local UIGradient_right_two = Instance.new("UIGradient")

	Npt.Name = "electric boogalo"
	Npt.ResetOnSpawn = false
	Npt.ZIndexBehavior = "Global"
	Npt.DisplayOrder = 420133769

	local UIScale = Instance.new("UIScale")
	UIScale.Parent = Npt

	function menu:SetScale(scale)
		UIScale.Scale = scale
	end

	local but = Instance.new("TextButton")
	but.Modal = true
	but.Text = ""
	but.BackgroundTransparency = 1
	but.Parent = Npt

	local cursor = Instance.new("ImageLabel")
	cursor.Name = "cursor"
	cursor.Parent = Npt
	cursor.BackgroundTransparency = 1
	cursor.Size = UDim2.new(0,17,0,17)
	cursor.Image = "rbxassetid://518398610"
	cursor.ZIndex = 1000
	cursor.ImageColor3 = Color3.fromRGB(255, 255, 255)

	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer
	local Mouse = LocalPlayer:GetMouse()

	game:GetService("RunService").Heartbeat:connect(function()
		cursor.Visible = Npt.Enabled
		cursor.Position = UDim2.new(0,Mouse.X-3,0,Mouse.Y+1)
	end)

	Menu.Name = "Menu"
	Menu.Parent = Npt
	Menu.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
	Menu.Position = UDim2.new(0.5, -373, 0.5, -300)
	Menu.Size = UDim2.new(0, 746, 0, 600)
	Menu.BorderSizePixel = 0
	Menu.Image = "rbxassetid://8208562023"
	Menu.BackgroundTransparency = 0.3

	Logo.Name = "Logo"
	Logo.Parent = Menu
	Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Logo.BackgroundTransparency = 1
	Logo.BorderSizePixel = 0
	Logo.Position = UDim2.new(0, 0, 0, 0)
	Logo.Size = UDim2.new(0, 161, 0, 59)
	Logo.Image = "http://www.roblox.com/asset/?id=8447572377"

		pol_left_one.Name = "pol_left_one"
		pol_left_one.Parent = Menu
		pol_left_one.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		pol_left_one.BackgroundTransparency = 0.7
		pol_left_one.BorderColor3 = Color3.fromRGB(10, 14, 20)
		pol_left_one.BorderSizePixel = 0
		pol_left_one.Position = UDim2.new(0, 6, 0, 56)
		pol_left_one.Size = UDim2.new(0, 75, 0, 3)

			UIGradient_left_one.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(14, 24, 35)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(80, 160, 255))}
			UIGradient_left_one.Rotation = 0
			UIGradient_left_one.Parent = pol_left_one

		pol_right_one.Name = "pol_right_one"
		pol_right_one.Parent = Menu
		pol_right_one.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		pol_right_one.BackgroundTransparency = 0.7
		pol_right_one.BorderColor3 = Color3.fromRGB(10, 14, 20)
		pol_right_one.BorderSizePixel = 0
		pol_right_one.Position = UDim2.new(0, 81, 0, 56)
		pol_right_one.Size = UDim2.new(0, 75, 0, 3)

			UIGradient_right_one.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(20, 41, 43)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(80, 160, 255))}
			UIGradient_right_one.Rotation = 180
			UIGradient_right_one.Parent = pol_right_one

	local Watermark = Instance.new("ScreenGui")
	local watermark = Instance.new("Frame")
	local UIGaay = Instance.new("UIGradient")
	local neverblox = Instance.new("ImageLabel")
	local line_1 = Instance.new("Frame")
	local timee = Instance.new("TextLabel")
	local line_2 = Instance.new("Frame")
	local fps = Instance.new("TextLabel")
	local line_3 = Instance.new("Frame")
	local player = Instance.new("TextLabel")

	Watermark.Name = "Watermark"
	Watermark.Parent = game.CoreGui
	Watermark.Enabled = false

		watermark.Name = "watermark"
		watermark.Parent = Watermark
		watermark.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		watermark.BackgroundTransparency = 0.1
		watermark.BorderColor3 = Color3.fromRGB(118, 232, 255)
		watermark.Position = UDim2.new(0.79, 0, 0, -30)
		watermark.Size = UDim2.new(0, 376, 0, 26)

			UIGaay.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(20, 40, 80)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(10, 20, 30))}
			UIGaay.Rotation = 90
			UIGaay.Parent = watermark

			neverblox.Name = "neverblox"
			neverblox.Parent = watermark
			neverblox.BackgroundTransparency = 1
			neverblox.Position = UDim2.new(0, 1, 0, 0)
			neverblox.Size = UDim2.new(0, 80, 0, 26)
			neverblox.Image = "http://www.roblox.com/asset/?id=8447572377"

			line_1.Name = "line_1"
			line_1.Parent = watermark
			line_1.BackgroundColor3 = Color3.fromRGB(59, 116, 135)
			line_1.BackgroundTransparency = 0.5
			line_1.BorderSizePixel = 0
			line_1.Position = UDim2.new(0, 81, 0, 0)
			line_1.Size = UDim2.new(0, 1, 0, 26)

			timee.Name = "timee"
			timee.Parent = watermark
			timee.BackgroundTransparency = 1
			timee.Position = UDim2.new(0, 82, 0, 0)
			timee.Size = UDim2.new(0, 80, 0, 26)
			timee.Font = Enum.Font.GothamSemibold
			timee.Text = "00:04:20"
			timee.TextColor3 = Color3.fromRGB(255, 255, 255)
			timee.TextSize = 14

			line_2.Name = "line_2"
			line_2.Parent = watermark
			line_2.BackgroundColor3 = Color3.fromRGB(59, 116, 135)
			line_2.BackgroundTransparency = 0.5
			line_2.BorderSizePixel = 0
			line_2.Position = UDim2.new(0, 162, 0, 0)
			line_2.Size = UDim2.new(0, 1, 0, 26)

			fps.Name = "fps"
			fps.Parent = watermark
			fps.BackgroundTransparency = 1
			fps.Position = UDim2.new(0, 163, 0, 0)
			fps.Size = UDim2.new(0, 80, 0, 26)
			fps.Font = Enum.Font.GothamSemibold
			fps.Text = "FPS: 420"
			fps.TextColor3 = Color3.fromRGB(255, 255, 255)
			fps.TextSize = 14

			line_3.Name = "line_3"
			line_3.Parent = watermark
			line_3.BackgroundColor3 = Color3.fromRGB(59, 116, 135)
			line_3.BackgroundTransparency = 0.5
			line_3.BorderSizePixel = 0
			line_3.Position = UDim2.new(0, 243, 0, 0)
			line_3.Size = UDim2.new(0, 1, 0, 26)

			player.Name = "player"
			player.Parent = watermark
			player.BackgroundTransparency = 1
			player.Position = UDim2.new(0, 249, 0, 0)
			player.Size = UDim2.new(0, 120, 0, 26)
			player.Font = Enum.Font.GothamSemibold
			player.Text = "neverblox"
			player.TextColor3 = Color3.fromRGB(255, 255, 255)
			player.TextSize = 12
			player.TextScaled = true

	local function ZBZX_fake_script()
		local script = Instance.new('LocalScript', timee)

		local mo = "A.M."
		local mont = nil
		while wait() do
			local l = math.fmod(tick(),86400)
			local h = math.floor(l/3600)
			local m = math.floor(l/60-h*60)
			local s = math.floor(math.fmod(l,60))
			local y = math.floor(1970+tick()/31579200)
			local mon = {{"January",31,31},{"February",59,28},{"March",90,31},{"April",120,30},{"May",151,31},{"June",181,30},{"July",212,31},{"August",243,31},{"September",273,30},{"October",304,31},{"November",334,30},{"December",365,31}}
			if y%4 == 0 then
				mon[2][3] = 29
				for i,v in next, mon do
					if i ~= 1 then
						v[2] = v[2] + 1
					end
				end
			end
			local d = math.floor(tick()/86400%365.25+1)
			for i,v in next, mon do
				if v[2]-v[3]<=d then
					mont = i
				end
			end
			d = d + mon[mont][3]-mon[mont][2]
			if m <= 9 then
				m = "0" ..m
			end
			if s <= 9 then
				s = "0" ..s
			end
			if h >= 12 then
				mo = "P.M."
			else
				mo = "A.M."
			end
			if h > 12 then
				h = h - 12
			end
			script.Parent.Text = "" ..h.. ":" ..m.. ":" ..s.. " "
		end
	end

	coroutine.wrap(ZBZX_fake_script)()

	local function POWDOGC_fake_script()
		local script = Instance.new('LocalScript', watermark)

		local gui = script.Parent

		gui.Draggable = true
		gui.Active = true
	end

	coroutine.wrap(POWDOGC_fake_script)()

	local function IPHCOC_fake_script()
		local script = Instance.new('LocalScript', player)

		local plr = game.Players.LocalPlayer

		script.Parent.Text = ""..plr.Name.."."
	end

	coroutine.wrap(IPHCOC_fake_script)()

	local function GQPYEQL_fake_script()
		local script = Instance.new('LocalScript', fps)

		local RunService = game:GetService("RunService")
		local FpsLabel = script.Parent
		local TimeFunction = RunService:IsRunning() and time or os.clock

		local LastIteration, Start
		local FrameUpdateTable = {}

		local function HeartbeatUpdate()
			LastIteration = TimeFunction()
			for Index = #FrameUpdateTable, 1, -1 do
				FrameUpdateTable[Index + 1] = FrameUpdateTable[Index] >= LastIteration - 1 and FrameUpdateTable[Index] or nil
			end

			FrameUpdateTable[1] = LastIteration
			FpsLabel.Text = "FPS: "..tostring(math.floor(TimeFunction() - Start >= 1 and #FrameUpdateTable or #FrameUpdateTable / (TimeFunction() - Start)))
		end

		Start = TimeFunction()
		RunService.Heartbeat:Connect(HeartbeatUpdate)
	end

	coroutine.wrap(GQPYEQL_fake_script)()

	library.uiopen = true

	game:GetService("UserInputService").InputBegan:Connect(function(key)
		if key.KeyCode == Enum.KeyCode.Insert then
			Npt.Enabled = not Npt.Enabled
			library.uiopen = Npt.Enabled
		end
	end)

	local KeybindList = Instance.new("ScreenGui")
	do
		local dhauawdh = Instance.new("Frame")
		local TextLabel = Instance.new("TextLabel")
		local imagee = Instance.new("ImageLabel")
		local Frame = Instance.new("Frame")
		local UIListLayout = Instance.new("UIListLayout")
		local UIGradient = Instance.new("UIGradient")

		KeybindList.Name = "KeybindList"
		KeybindList.ZIndexBehavior = Enum.ZIndexBehavior.Global
		KeybindList.Enabled = false
		
		dhauawdh.Parent = KeybindList
		dhauawdh.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		dhauawdh.BackgroundTransparency = 0.1
		dhauawdh.BorderColor3 = Color3.fromRGB(118, 232, 255)
		dhauawdh.Position = UDim2.new(0, 1, 0.45, 0)
		dhauawdh.Size = UDim2.new(0, 212, 0, 24)
		
			UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(20, 40, 80)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(10, 20, 30))}
			UIGradient.Rotation = 90
			UIGradient.Parent = dhauawdh
			
		TextLabel.Parent = KeybindList
		TextLabel.BackgroundTransparency = 1.000
		TextLabel.Position = UDim2.new(0, 2, 0.45, 0)
		TextLabel.Size = UDim2.new(0, 212, 0, 24)
		TextLabel.Font = Enum.Font.GothamSemibold
		TextLabel.Text = "keybinds"
		TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.TextSize = 16
		
		imagee.Name = "imagee"
		imagee.Parent = TextLabel
		imagee.BackgroundTransparency = 1
		imagee.Position = UDim2.new(0, 2, 0, 0)
		imagee.Size = UDim2.new(0, 24, 0, 24)
		imagee.Image = "http://www.roblox.com/asset/?id=8546631654"

		Frame.Parent = TextLabel
		Frame.BackgroundTransparency = 1.000
		Frame.Position = UDim2.new(0, -1, 1, 1)
		Frame.Size = UDim2.new(1, 0, 1, 0)

		UIListLayout.Parent = Frame
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

		KeybindList.Parent = game.CoreGui
	end 

	function keybindadd(text) 
		if not KeybindList.TextLabel.Frame:FindFirstChild(text) then 
			local TextLabel = Instance.new("TextLabel") 
			
			TextLabel.BackgroundColor3 = Color3.fromRGB(10, 20, 30)
			TextLabel.BackgroundTransparency = 1
			TextLabel.BorderSizePixel = 0
			TextLabel.Size = UDim2.new(0, 212, 0, 24)
			TextLabel.Font = Enum.Font.GothamSemibold 
			TextLabel.Text = text 
			TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
			TextLabel.TextSize = 14
			TextLabel.Name = text 
			TextLabel.Parent = KeybindList.TextLabel.Frame
		end 
	end 

	local PrimodialSpec = Instance.new("ScreenGui")
	local Niggers = Instance.new("Frame")
	local UIGay = Instance.new("UIGradient")
	local Players = Instance.new("TextLabel")
	local Feelka_who_are_u = Instance.new("TextLabel")
	local imagee = Instance.new("ImageLabel")

	PrimodialSpec.Name = "PrimodialSpec"
	PrimodialSpec.Parent = game.CoreGui
	PrimodialSpec.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	PrimodialSpec.Enabled = false

		Niggers.Name = "Niggers"
		Niggers.Parent = PrimodialSpec
		Niggers.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Niggers.BackgroundTransparency = 0.1
		Niggers.BorderColor3 = Color3.fromRGB(118, 232, 255)
		Niggers.Position = UDim2.new(0, 1, 0.27, 0)
		Niggers.Size = UDim2.new(0, 212, 0, 24)
		
				UIGay.Name = "UIGay"
				UIGay.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(20, 40, 80)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(10, 20, 30))}
				UIGay.Rotation = 90
				UIGay.Parent = Niggers
		
		Players.Name = "Players"
		Players.Parent = Niggers
		Players.BackgroundColor3 = Color3.fromRGB(10, 20, 30)
		Players.BackgroundTransparency = 1
		Players.BorderSizePixel = 0
		Players.Position = UDim2.new(0, 0, 0, 25)
		Players.Size = UDim2.new(0, 212, 0, 24)
		Players.Font = Enum.Font.GothamSemibold
		Players.Text = ""
		Players.AutomaticSize = Enum.AutomaticSize.XY
		Players.TextColor3 = Color3.fromRGB(220, 220, 220)
		Players.TextSize = 14

		Feelka_who_are_u.Name = "Feelka_who_are_u"
		Feelka_who_are_u.Parent = Niggers
		Feelka_who_are_u.BackgroundTransparency = 1
		Feelka_who_are_u.Size = UDim2.new(0, 212, 0, 24)
		Feelka_who_are_u.Font = Enum.Font.GothamSemibold
		Feelka_who_are_u.Text = "spectators"
		Feelka_who_are_u.TextColor3 = Color3.fromRGB(255, 255, 255)
		Feelka_who_are_u.TextSize = 16
		
		imagee.Name = "imagee"
		imagee.Parent = Feelka_who_are_u
		imagee.BackgroundTransparency = 1
		imagee.Position = UDim2.new(0, 2, 0, 0)
		imagee.Size = UDim2.new(0, 24, 0, 24)
		imagee.Image = "http://www.roblox.com/asset/?id=8545057420"

	function GetSpectators()
		local CurrentSpectators = ""
		for i,v in next, game.Players:GetChildren() do 
			pcall(function()
				if v ~= game.Players.LocalPlayer then
					if not v.Character then 
						if (v.CameraCF.Value.p - game.Workspace.CurrentCamera.CFrame.p).Magnitude < 10 then 
							if CurrentSpectators == "" then
								CurrentSpectators = v.Name
							else
								CurrentSpectators = CurrentSpectators.. "\n" ..v.Name
							end
						end
					end
				end
			end)
		end
		return CurrentSpectators
	end

	spawn(function()
		while wait(0.1) do
			if PrimodialSpec.Enabled then
				Players.Text = GetSpectators()
				if Players.Text == "" then
					Players.BackgroundTransparency = 1
				end
			end
		end
	end)

	function keybindremove(text) 
		if KeybindList.TextLabel.Frame:FindFirstChild(text) then 
			KeybindList.TextLabel.Frame:FindFirstChild(text):Destroy() 
		end 
	end 

	function library:SetKeybindVisible(Joe) 
		KeybindList.Enabled = Joe 
	end 
	
	function library:SetWatermarkVisible(DoggoCute)
		Watermark.Enabled = DoggoCute
	end
	
	function library:SetSpectatorsVisible(LaOffice)
		PrimodialSpec.Enabled = LaOffice
	end

	library.dragging = false 
	do 
		local UserInputService = game:GetService("UserInputService") 
		local a = Menu 
		local dragInput 
		local dragStart 
		local startPos 
		local function update(input) 
			local delta = input.Position - dragStart 
			a.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y) 
		end 
		a.InputBegan:Connect(function(input) 
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then 
				library.dragging = true 
				dragStart = input.Position 
				startPos = a.Position 

				input.Changed:Connect(function() 
					if input.UserInputState == Enum.UserInputState.End then 
						library.dragging = false 
					end 
				end) 
			end 
		end) 
		a.InputChanged:Connect(function(input) 
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then 
				dragInput = input 
			end 
		end) 
		UserInputService.InputChanged:Connect(function(input) 
			if input == dragInput and library.dragging then 
				update(input) 
			end 
		end) 
	end 

	TextLabel.Parent = Menu 
	TextLabel.BackgroundColor3 = Color3.fromRGB(1, 1, 1) 
	TextLabel.BackgroundTransparency = 1 
	TextLabel.Position = UDim2.new(0, 13, 0, 43) 
	TextLabel.Size = UDim2.new(0, 0, 0, 29) 
	TextLabel.Size = UDim2.new(0, txt:GetTextSize(name, 15, Enum.Font.GothamSemibold, Vector2.new(590, TextLabel.AbsoluteSize.Y)).X, 0, 29) 
	TextLabel.Font = Enum.Font.GothamSemibold 
	TextLabel.Text = "" 
	TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.TextStrokeTransparency = 0
	TextLabel.TextSize = 23
	TextLabel.TextXAlignment = Enum.TextXAlignment.Left 

	TabButtons.Name = "TabButtons" 
	TabButtons.Parent = Menu 
	TabButtons.BackgroundColor3 = Color3.fromRGB(1, 1, 1) 
	TabButtons.BackgroundTransparency = 1 
	TabButtons.Position = UDim2.new(0, 4, 0, 66)
	TabButtons.Size = UDim2.new(0, 50, 0, 50) 

	UIListLayout.Parent = TabButtons 
	UIListLayout.FillDirection = Enum.FillDirection.Vertical 
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder 
	UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Top

	Tabs.Name = "Tabs" 
	Tabs.Parent = Menu 
	Tabs.BackgroundColor3 = Color3.fromRGB(10, 14, 20) 
	Tabs.BorderSizePixel = 0
	Tabs.Position = UDim2.new(0, 161, 0, 0) 
	Tabs.Size = UDim2.new(0, 585, 0, 600) 
	
	local bckgrndinfo = Instance.new("Frame")
	local mgprofile = Instance.new("ImageLabel")
	local UICorner2 = Instance.new("UICorner")
	local nckname = Instance.new("TextLabel")
	local tilltext = Instance.new("TextLabel")
	local dt = Instance.new("TextLabel")
	
	bckgrndinfo.Name = "bckgrndinfo"
	bckgrndinfo.Parent = Menu
	bckgrndinfo.BackgroundTransparency = 1
	bckgrndinfo.Position = UDim2.new(0, 5, 0, 555)
	bckgrndinfo.Size = UDim2.new(0, 115, 0, 40)
	
		mgprofile.Name = "mgprofile"
		mgprofile.Parent = bckgrndinfo
		mgprofile.BackgroundTransparency = 1
		mgprofile.Position = UDim2.new(0, 0, 0, 0)
		mgprofile.Size = UDim2.new(0, 40, 0, 40)
		mgprofile.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"

        UICorner2.CornerRadius = UDim.new(1, 0)
        UICorner2.Parent = mgprofile


local function FXTCIF_fake_script()
	local script = Instance.new('LocalScript', mgprofile)
	local frame = script.Parent
	local player = game.Players.LocalPlayer
	local userId = player.UserId
	local thumbType = Enum.ThumbnailType.AvatarBust
	local thumbSize = Enum.ThumbnailSize.Size420x420
	local content, isReady = game.Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)
	
	frame.Image = content
	
	local tweenService = game:GetService("TweenService")
	local uiCorner = script.Parent.UICorner
	local frame = uiCorner.Parent
	local square = tweenService:Create(uiCorner, TweenInfo.new(1), {CornerRadius = UDim.new(0,15)})
	local circle = tweenService:Create(uiCorner, TweenInfo.new(1), {CornerRadius = UDim.new(1,0)})
	
	frame.MouseEnter:Connect(function()
		square:Play()
	end)
	frame.MouseLeave:Connect(function()
		circle:Play()
	end)
end
coroutine.wrap(FXTCIF_fake_script)()
		
		nckname.Name = "nckname"
		nckname.Parent = bckgrndinfo
		nckname.BackgroundTransparency = 1
		nckname.Position = UDim2.new(0.445, 0, 0, 0)
		nckname.Size = UDim2.new(0, 100, 0, 20)
		nckname.Font = Enum.Font.GothamSemibold
		nckname.Text = "neptunium"
		nckname.TextColor3 = Color3.fromRGB(200, 200, 200)
		nckname.TextSize = 9
		nckname.TextXAlignment = Enum.TextXAlignment.Left
		nckname.TextScaled = true
		
		tilltext.Name = "tilltext"
		tilltext.Parent = bckgrndinfo
		tilltext.BackgroundTransparency = 1
		tilltext.Position = UDim2.new(0.46, 0, 0.5, 0)
		tilltext.Size = UDim2.new(0, 20, 0, 20)
		tilltext.Font = Enum.Font.GothamSemibold
		tilltext.Text = "Till:"
		tilltext.TextColor3 = Color3.fromRGB(190, 190, 190)
		tilltext.TextTransparency = 0.2
		tilltext.TextSize = 14
		tilltext.TextXAlignment = Enum.TextXAlignment.Center
		
		dt.Name = "dt"
		dt.Parent = bckgrndinfo
		dt.BackgroundTransparency = 1
		dt.Position = UDim2.new(0.78, 0, 0.5, 0)
		dt.Size = UDim2.new(0, 45, 0, 20)
		dt.Font = Enum.Font.GothamSemibold
		dt.Text = "10:10:10"
		dt.TextColor3 = Color3.fromRGB(28, 193, 255)
		dt.TextTransparency = 0.2
		dt.TextSize = 14
		dt.TextXAlignment = Enum.TextXAlignment.Left
		
			pol_left_two.Name = "pol_left_two" 
			pol_left_two.Parent = bckgrndinfo 
			pol_left_two.BackgroundColor3 = Color3.fromRGB(255, 255, 255) 
			pol_left_two.BackgroundTransparency = 0.7
			pol_left_two.BorderColor3 = Color3.fromRGB(10, 14, 20) 
			pol_left_two.BorderSizePixel = 0 
			pol_left_two.Position = UDim2.new(0, 1, 0, -8) 
			pol_left_two.Size = UDim2.new(0, 75, 0, 3) 
				
				UIGradient_left_two.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(14, 24, 35)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(80, 160, 255))}
				UIGradient_left_two.Rotation = 0
				UIGradient_left_two.Parent = pol_left_two

			pol_right_two.Name = "pol_right_two" 
			pol_right_two.Parent = bckgrndinfo 
			pol_right_two.BackgroundColor3 = Color3.fromRGB(255, 255, 255) 
			pol_right_two.BackgroundTransparency = 0.7
			pol_right_two.BorderColor3 = Color3.fromRGB(10, 14, 20) 
			pol_right_two.BorderSizePixel = 0 
			pol_right_two.Position = UDim2.new(0, 76, 0, -8) 
			pol_right_two.Size = UDim2.new(0, 75, 0, 3) 
				
				UIGradient_right_two.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(20, 41, 43)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(80, 160, 255))}
				UIGradient_right_two.Rotation = 180
				UIGradient_right_two.Parent = pol_right_two

	local first = true 
	local currenttab 

local function ZBZX_fake_script()
	local script = Instance.new('LocalScript', dt)

	local mo = "A.M."
	local mont = nil
	while wait() do
		local l = math.fmod(tick(),86400)
		local h = math.floor(l/3600)
		local m = math.floor(l/60-h*60)
		local s = math.floor(math.fmod(l,60))
		local y = math.floor(1970+tick()/31579200)
		local mon = {{"January",31,31},{"February",59,28},{"March",90,31},{"April",120,30},{"May",151,31},{"June",181,30},{"July",212,31},{"August",243,31},{"September",273,30},{"October",304,31},{"November",334,30},{"December",365,31}}
		if y%4 == 0 then
			mon[2][3] = 29
			for i,v in next, mon do
				if i ~= 1 then
					v[2] = v[2] + 1
				end
			end
		end
		local d = math.floor(tick()/86400%365.25+1)
		for i,v in next, mon do
			if v[2]-v[3]<=d then
				mont = i
			end
		end
		d = d + mon[mont][3]-mon[mont][2]
		if m <= 9 then
			m = "0" ..m
		end
		if s <= 9 then
			s = "0" ..s
		end
		if h >= 12 then
			mo = "P.M."
		else
			mo = "A.M."
		end
		if h > 12 then
			h = h - 12
		end
		script.Parent.Text = "" ..h.. ":" ..m.. ":" ..s.. " "
	end
end
	
coroutine.wrap(ZBZX_fake_script)()

local function IPHCOC_fake_script()
	local script = Instance.new('LocalScript', nckname)

	local plr = game.Players.LocalPlayer

	script.Parent.Text = ""..plr.Name..""
end
	
coroutine.wrap(IPHCOC_fake_script)()

	function menu:Tab(text, image) 
		local tabname 
		tabname = text 
		local Tab = {} 
		values[tabname] = {} 

		local TextButton = Instance.new("TextButton") 
		TextButton.BackgroundColor3 = Color3.fromRGB(28, 193, 255) 
		TextButton.BackgroundTransparency = 1
		TextButton.BorderSizePixel = 0
		TextButton.Size = UDim2.new(0, 153, 0, 32)
		TextButton.Font = Enum.Font.GothamSemibold 
		TextButton.Text = "" 
		TextButton.TextColor3 = Color3.fromRGB(200, 200, 200) 
		TextButton.TextSize = 14
		TextButton.Parent = TabButtons 
			
			local UICorner = Instance.new("UICorner")
			UICorner.CornerRadius = UDim.new(0.1, 0)
			UICorner.Parent = TextButton
        	
        	local ImageLabel = Instance.new("ImageLabel")
		ImageLabel.Parent = TextButton
		ImageLabel.BackgroundTransparency = 1
		ImageLabel.Position = UDim2.new(0, 6, 0, 6)
		ImageLabel.Size = UDim2.new(0, 20, 0, 20)
		ImageLabel.Image = image
		ImageLabel.ImageTransparency = 0.3
		
		local TextLabel = Instance.new("TextLabel")
		TextLabel.Parent = TextButton
		TextLabel.BackgroundTransparency = 1
		TextLabel.Position = UDim2.new(0, 32, 0, 0)
		TextLabel.Size = UDim2.new(0, 50, 0, 30)
		TextLabel.Font = Enum.Font.GothamSemibold
		TextLabel.Text = text
		TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
		TextLabel.TextSize = 14
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left

		local TabGui = Instance.new("Frame") 
		local Left = Instance.new("ScrollingFrame") 
		local UIListLayout = Instance.new("UIListLayout") 
		local Right = Instance.new("ScrollingFrame") 
		local UIListLayout_2 = Instance.new("UIListLayout") 

		TabGui.Name = "TabGui" 
		TabGui.Parent = Tabs 
		TabGui.BackgroundColor3 = Color3.fromRGB(111, 222, 255) 
		TabGui.BackgroundTransparency = 1.000 
		TabGui.Size = UDim2.new(1, 0, 1, 0) 
		TabGui.Visible = false 

		Left.Name = "Left" 
		Left.Parent = TabGui 
		Left.BackgroundColor3 = Color3.fromRGB(111, 222, 255) 
		Left.BackgroundTransparency = 1.000 
		Left.ScrollBarThickness = 4
		Left.ScrollBarImageTransparency = 1
		Left.Position = UDim2.new(0, 9, 0, 16) 
		Left.Size = UDim2.new(0, 283, 0, 543) 

		UIListLayout.Parent = Left 
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder 
		UIListLayout.Padding = UDim.new(0, 10) 

		Right.Name = "Right" 
		Right.Parent = TabGui 
		Right.BackgroundColor3 = Color3.fromRGB(111, 222, 255) 
		Right.BackgroundTransparency = 1.000 
		Right.ScrollBarThickness = 4
		Right.ScrollBarImageTransparency = 1
		Right.Position = UDim2.new(0, 297, 0, 16) 
		Right.Size = UDim2.new(0, 283, 0, 543) 

		UIListLayout_2.Parent = Right 
		UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center 
		UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder 
		UIListLayout_2.Padding = UDim.new(0, 10) 

		if first then 
			TextButton.TextColor3 = Color3.fromRGB(111, 222, 255) 
			currenttab = text 
			TabGui.Visible = true 
			first = false 
		end 

		TextButton.MouseButton1Down:Connect(function() 
			if currenttab ~= text then 
				for i,v in next, TabButtons:GetChildren() do 
					if v:IsA("TextButton") then 
						library:Tween(v, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1}) 
					end 
				end 
				for i,v in next, Tabs:GetChildren() do 
					v.Visible = false 
				end 
				library:Tween(TextButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0.7}) 
				currenttab = text 
				TabGui.Visible = true 
			end 
		end) 

		function Tab:MSector(text, side) 
			local sectorname = text 
			local MSector = {} 
			values[tabname][text] = {} 

			local Section = Instance.new("Frame") 
			local SectionText = Instance.new("TextLabel") 
			local pol_left = Instance.new("Frame") 
			local UIGradient_left = Instance.new("UIGradient")
			local pol_right = Instance.new("Frame") 
			local UIGradient_right = Instance.new("UIGradient")
			local Inner = Instance.new("Frame") 
			local sectiontabs = Instance.new("Frame") 
			local UIListLayout_2 = Instance.new("UIListLayout") 

			Section.Name = "Section" 
			Section.Parent = TabGui[side] 
			Section.BackgroundColor3 = Color3.fromRGB(9, 15, 28) 
			Section.BorderColor3 = Color3.fromRGB(10, 14, 20) 
			Section.BorderSizePixel = 0 
			Section.Position = UDim2.new(0.00358422939, 0, 0, 0) 
			Section.Size = UDim2.new(1, 0, 0, 49) 

			SectionText.Name = "SectionText" 
			SectionText.Parent = Section 
			SectionText.BackgroundColor3 = Color3.fromRGB(111, 222, 255) 
			SectionText.BackgroundTransparency = 1.000 
			SectionText.Position = UDim2.new(0, 10, 0, 8) 
			SectionText.Size = UDim2.new(0, 270, 0, 19) 
			SectionText.ZIndex = 2 
			SectionText.Font = Enum.Font.GothamSemibold 
			SectionText.Text = text 
			SectionText.TextColor3 = Color3.fromRGB(200, 200, 200) 
			SectionText.TextSize = 16.000 
			SectionText.TextXAlignment = Enum.TextXAlignment.Left 
			
				pol_left.Name = "pol_left" 
				pol_left.Parent = SectionText 
				pol_left.BackgroundColor3 = Color3.fromRGB(255, 255, 255) 
				pol_left.BorderColor3 = Color3.fromRGB(10, 14, 20) 
				pol_left.BorderSizePixel = 0 
				pol_left.Position = UDim2.new(0, 5, 0, 22) 
				pol_left.Size = UDim2.new(0, 130, 0, 3) 
				
					UIGradient_left.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(9, 15, 28)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(29, 56, 95))}
					UIGradient_left.Rotation = 0
					UIGradient_left.Parent = pol_left

				pol_right.Name = "pol_right" 
				pol_right.Parent = SectionText 
				pol_right.BackgroundColor3 = Color3.fromRGB(255, 255, 255) 
				pol_right.BorderColor3 = Color3.fromRGB(10, 14, 20) 
				pol_right.BorderSizePixel = 0 
				pol_right.Position = UDim2.new(0, 135, 0, 22) 
				pol_right.Size = UDim2.new(0, 130, 0, 3) 
				
					UIGradient_right.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(9, 15, 28)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(29, 56, 95))}
					UIGradient_right.Rotation = 180
					UIGradient_right.Parent = pol_right

			Inner.Name = "Inner" 
			Inner.Parent = Section 
			Inner.BackgroundColor3 = Color3.fromRGB(9, 15, 28) 
			Inner.BorderColor3 = Color3.fromRGB(10, 14, 20) 
			Inner.BackgroundTransparency = 1.000
			Inner.BorderSizePixel = 0 
			Inner.Position = UDim2.new(0, 1, 0, 33) 
			Inner.Size = UDim2.new(1, -2, 1, -2)  

			sectiontabs.Name = "sectiontabs" 
			sectiontabs.Parent = Section 
			sectiontabs.BackgroundColor3 = Color3.fromRGB(111, 222, 255) 
			sectiontabs.BackgroundTransparency = 1.000 
			sectiontabs.Position = UDim2.new(0, 0, 0, 37) 
			sectiontabs.Size = UDim2.new(1, 0, 0, 22) 

			local pol_left_tri = Instance.new("Frame") 
			local UIGradient_left_tri = Instance.new("UIGradient")
			local pol_right_tri = Instance.new("Frame") 
			local UIGradient_right_tri = Instance.new("UIGradient")
			
				pol_left_tri.Name = "pol_left_tri" 
				pol_left_tri.Parent = Section 
				pol_left_tri.BackgroundColor3 = Color3.fromRGB(255, 255, 255) 
				pol_left_tri.BackgroundTransparency = 0.5
				pol_left_tri.BorderColor3 = Color3.fromRGB(10, 14, 20) 
				pol_left_tri.BorderSizePixel = 0 
				pol_left_tri.Position = UDim2.new(0, 35, 0, 60) 
				pol_left_tri.Size = UDim2.new(0, 100, 0, 3) 
				
					UIGradient_left_tri.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(9, 15, 28)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(29, 56, 95))}
					UIGradient_left_tri.Rotation = 0
					UIGradient_left_tri.Parent = pol_left_tri

				pol_right_tri.Name = "pol_right_tri" 
				pol_right_tri.Parent = Section 
				pol_right_tri.BackgroundColor3 = Color3.fromRGB(255, 255, 255) 
				pol_right_tri.BackgroundTransparency = 0.5
				pol_right_tri.BorderColor3 = Color3.fromRGB(10, 14, 20) 
				pol_right_tri.BorderSizePixel = 0 
				pol_right_tri.Position = UDim2.new(0, 135, 0, 60) 
				pol_right_tri.Size = UDim2.new(0, 100, 0, 3) 
				
					UIGradient_right_tri.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(9, 15, 28)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(29, 56, 95))}
					UIGradient_right_tri.Rotation = 180
					UIGradient_right_tri.Parent = pol_right_tri

			UIListLayout_2.Parent = sectiontabs 
			UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal 
			UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center 
			UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder 
			UIListLayout_2.Padding = UDim.new(0,4) 

			local firs = true 
			local selected 
			function MSector:Tab(text) 
				local tab = {} 
				values[tabname][sectorname][text] = {} 
				local tabtext = text 

				local tabsize = UDim2.new(1, 0, 0, 38) 

				local tab1 = Instance.new("Frame") 
				local UIPadding = Instance.new("UIPadding") 
				local UIListLayout = Instance.new("UIListLayout") 
				local TextButton = Instance.new("TextButton") 

				tab1.Name = text 
				tab1.Parent = Inner 
				tab1.BackgroundColor3 = Color3.fromRGB(9, 15, 28) 
				tab1.BorderColor3 = Color3.fromRGB(10, 14, 20) 
				tab1.BorderSizePixel = 0 
				tab1.Position = UDim2.new(0, 0, 0, 35) 
				tab1.Size = UDim2.new(1, 0, 1, -21) 
				tab1.Name = text 
				tab1.Visible = false 

				UIPadding.Parent = tab1 
				UIPadding.PaddingTop = UDim.new(0, 0) 

				UIListLayout.Parent = tab1 
				UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
				UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder 
				UIListLayout.Padding = UDim.new(0, 1) 

				TextButton.Parent = sectiontabs 
				TextButton.BackgroundColor3 = Color3.fromRGB(111, 222, 255) 
				TextButton.BackgroundTransparency = 1.000 
				TextButton.Size = UDim2.new(0, txt:GetTextSize(text, 14, Enum.Font.GothamSemibold, Vector2.new(700,700)).X + 2, 1, 0) 
				TextButton.Font = Enum.Font.GothamSemibold 
				TextButton.Text = text 
				TextButton.TextColor3 = Color3.fromRGB(200, 200, 200) 
				TextButton.TextSize = 13.000 
				TextButton.Name = text 

				TextButton.MouseButton1Down:Connect(function() 
					for i,v in next, Inner:GetChildren() do 
						v.Visible = false 
					end 
					for i,v in next, sectiontabs:GetChildren() do 
						if v:IsA("TextButton") then 
							library:Tween(v, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(200, 200, 200)}) 
						end 
					end 
					Section.Size = tabsize 
					tab1.Visible = true 
					library:Tween(TextButton, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(111, 222, 255)}) 
				end) 

				function tab:Element(type, text, data, callback) 
					local Element = {} 
					data = data or {} 
					callback = callback or function() end 
					values[tabname][sectorname][tabtext][text] = {} 

					if type == "Jumbobox" then 
						tabsize = tabsize + UDim2.new(0,0,0, 16) 
						Element.value = {Jumbobox = {}} 
						data.options = data.options or {} 

						local Dropdown = Instance.new("Frame") 
						local Button = Instance.new("TextButton") 
						local TextLabel = Instance.new("TextLabel") 
						local Drop = Instance.new("ScrollingFrame") 
						local Button_2 = Instance.new("TextButton") 
						local TextLabel_2 = Instance.new("TextLabel") 
						local UIListLayout = Instance.new("UIListLayout") 
						local ImageLabel = Instance.new("ImageLabel") 
						local TextLabel_3 = Instance.new("TextLabel") 

						Dropdown.Name = "Dropdown" 
						Dropdown.Parent = tab1 
						Dropdown.BackgroundColor3 = Color3.fromRGB(200, 0, 0) 
						Dropdown.BackgroundTransparency = 1.000 
						Dropdown.Position = UDim2.new(0, 0, 0.255102038, 0) 
						Dropdown.Size = UDim2.new(1, 0, 0, 15) 

						Button.Name = "Button" 
						Button.Parent = Dropdown 
						Button.BackgroundColor3 = Color3.fromRGB(10, 14, 20)  
						Button.BorderColor3 = Color3.fromRGB(59, 116, 135) 
						Button.Position = UDim2.new(0, 115, 0, -1) 
						Button.Size = UDim2.new(0, 160, 0, 12) 
						Button.AutoButtonColor = false 
						Button.Font = Enum.Font.Gotham 
						Button.Text = "" 
						Button.TextColor3 = Color3.fromRGB(10, 11, 13) 
						Button.TextSize = 13.000 

						TextLabel.Parent = Button 
						TextLabel.BackgroundColor3 = Color3.fromRGB(111, 222, 255) 
						TextLabel.BackgroundTransparency = 1.000 
						TextLabel.BorderColor3 = Color3.fromRGB(10, 14, 20) 
						TextLabel.Position = UDim2.new(0, 5, 0, 0) 
						TextLabel.Size = UDim2.new(-0.21714285, 208, 1, 0) 
						TextLabel.Font = Enum.Font.GothamSemibold 
						TextLabel.Text = ". . ." 
						TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200) 
						TextLabel.TextSize = 13.000 
						TextLabel.TextXAlignment = Enum.TextXAlignment.Left 

						local abcd = TextLabel 

						Drop.Name = "Drop" 
						Drop.Parent = Button 
						Drop.Active = true 
						Drop.BackgroundColor3 = Color3.fromRGB(10, 14, 20)  
						Drop.BorderColor3 = Color3.fromRGB(59, 116, 135) 
						Drop.Position = UDim2.new(0, 0, 1, 1) 
						Drop.Size = UDim2.new(1, 0, 0, 20) 
						Drop.Visible = false 
						Drop.BottomImage = "http://www.roblox.com/asset/?id=6724808282" 
						Drop.CanvasSize = UDim2.new(1, 1, 1, 1) 
						Drop.ScrollBarThickness = 0 
						Drop.TopImage = "http://www.roblox.com/asset/?id=6724808282" 
						Drop.MidImage = "http://www.roblox.com/asset/?id=6724808282" 
						Drop.AutomaticCanvasSize = "Y" 
						Drop.ZIndex = 5 
						Drop.ScrollBarImageColor3 = Color3.fromRGB(111, 222, 255) 

						UIListLayout.Parent = Drop 
						UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
						UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder 

						values[tabname][sectorname][tabtext][text] = Element.value 
						local num = #data.options 
						if num > 5 then 
							Drop.Size = UDim2.new(1, 0, 0, 85) 
						else 
							Drop.Size = UDim2.new(1, 0, 0, 17*num) 
						end 
						local first = true 

						local function updatetext() 
							local old = {} 
							for i,v in next, data.options do 
								if table.find(Element.value.Jumbobox, v) then 
									table.insert(old, v) 
								else 
								end 
							end 
							local str = "" 

							if #old == 0 then 
								str = "..." 
							else 
								if #old == 1 then 
									str = old[1] 
								else 
									for i,v in next, old do 
										if i == 1 then 
											str = v 
										else 
											if i > 2 then 
												if i < 4 then 
													str = str..",  ..." 
												end 
											else 
												str = str..",  "..v 
											end 
										end 
									end 
								end 
							end 

							abcd.Text = str 
						end 
						for i,v in next, data.options do 
							do 
								local Button = Instance.new("TextButton") 
								local TextLabel = Instance.new("TextLabel") 

								Button.Name = v 
								Button.Parent = Drop 
								Button.BackgroundColor3 = Color3.fromRGB(10, 14, 20) 
								Button.BorderColor3 = Color3.fromRGB(10, 14, 20) 
								Button.Position = UDim2.new(0, 30, 0, 16) 
								Button.Size = UDim2.new(0, 160, 0, 17) 
								Button.AutoButtonColor = false 
								Button.Font = Enum.Font.Gotham 
								Button.Text = "" 
								Button.TextColor3 = Color3.fromRGB(10, 11, 13)  
								Button.TextSize = 13.000 
								Button.BorderSizePixel = 0 
								Button.ZIndex = 6 

								TextLabel.Parent = Button 
								TextLabel.BackgroundColor3 = Color3.fromRGB(10, 14, 20)  
								TextLabel.BackgroundTransparency = 1.000 
								TextLabel.BorderColor3 = Color3.fromRGB(10, 14, 20) 
								TextLabel.Position = UDim2.new(0, -5, 0, -1) 
								TextLabel.Size = UDim2.new(-0.21714285, 208, 1, 0) 
								TextLabel.Font = Enum.Font.GothamSemibold 
								TextLabel.Text = v 
								TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200) 
								TextLabel.TextSize = 13.000 
								TextLabel.TextXAlignment = Enum.TextXAlignment.Center 
								TextLabel.ZIndex = 6 

								Button.MouseButton1Down:Connect(function() 
									if table.find(Element.value.Jumbobox, v) then 
										for i,a in next, Element.value.Jumbobox do 
											if a == v then 
												table.remove(Element.value.Jumbobox, i) 
											end 
										end 
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(200, 200, 200)}) 
									else 
										table.insert(Element.value.Jumbobox, v) 
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255, 255, 255)}) 
									end 
									updatetext() 

									values[tabname][sectorname][tabtext][text] = Element.value 
									callback(Element.value) 
								end) 
								Button.MouseEnter:Connect(function() 
									if not table.find(Element.value.Jumbobox, v) then 
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(200, 200, 200)}) 
									end 
								end) 
								Button.MouseLeave:Connect(function() 
									if not table.find(Element.value.Jumbobox, v) then 
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(200, 200, 200)}) 
									end 
								end) 

								first = false 
							end 
						end 
						function Element:SetValue(val) 
							Element.value = val 
							for i,v in next, Drop:GetChildren() do 
								if v.Name ~= "UIListLayout" then 
									if table.find(val.Jumbobox, v.Name) then 
										v.TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200) 
									else 
										v.TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200) 
									end 
								end 
							end 
							updatetext() 
							values[tabname][sectorname][tabtext][text] = Element.value 
							callback(val) 
						end 
						if data.default then 
							Element:SetValue(data.default) 
						end 

						ImageLabel.Parent = Button 
						ImageLabel.BackgroundColor3 = Color3.fromRGB(111, 222, 255) 
						ImageLabel.BackgroundTransparency = 1.000 
						ImageLabel.Position = UDim2.new(0, 145, 0, 4) 
						ImageLabel.Size = UDim2.new(0, 6, 0, 4) 
						ImageLabel.Image = "http://www.roblox.com/asset/?id=6724771531" 

						TextLabel_3.Parent = Dropdown 
						TextLabel_3.BackgroundColor3 = Color3.fromRGB(200, 0, 0) 
						TextLabel_3.BackgroundTransparency = 1.000 
						TextLabel_3.Position = UDim2.new(0, 15, 0, 3) 
						TextLabel_3.Size = UDim2.new(0.111913361, 208, 0.382215232, 0) 
						TextLabel_3.Font = Enum.Font.GothamSemibold 
						TextLabel_3.Text = text 
						TextLabel_3.TextColor3 = Color3.fromRGB(200, 200, 200) 
						TextLabel_3.TextSize = 13.000 
						TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left 

						Button.MouseButton1Down:Connect(function() 
							Drop.Visible = not Drop.Visible 
							if not Drop.Visible then 
								Drop.CanvasPosition = Vector2.new(0,0) 
							end 
						end) 
						local indrop = false 
						local ind = false 
						Drop.MouseEnter:Connect(function() 
							indrop = true 
						end) 
						Drop.MouseLeave:Connect(function() 
							indrop = false 
						end) 
						Button.MouseEnter:Connect(function() 
							ind = true 
						end) 
						Button.MouseLeave:Connect(function() 
							ind = false 
						end) 
						game:GetService("UserInputService").InputBegan:Connect(function(input) 
							if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then 
								if Drop.Visible == true and not indrop and not ind then 
									Drop.Visible = false 
									Drop.CanvasPosition = Vector2.new(0,0) 
								end 
							end 
						end) 
					elseif type == "Toggle" then 
						tabsize = tabsize + UDim2.new(0,0,0,16) 
						Element.value = {Toggle = data.default and data.default.Toggle or false} 

						local Toggle = Instance.new("Frame") 
						local Button = Instance.new("TextButton") 
						local Color = Instance.new("ImageLabel") 
						local TextLabel = Instance.new("TextLabel") 

						Toggle.Name = "Toggle" 
						Toggle.Parent = tab1 
						Toggle.BackgroundColor3 = Color3.fromRGB(111, 222, 255) 
						Toggle.BackgroundTransparency = 1.000 
						Toggle.Size = UDim2.new(1, 0, 0, 15) 

						Button.Name = "Button" 
						Button.Parent = Toggle 
						Button.BackgroundColor3 = Color3.fromRGB(111, 222, 255) 
						Button.BackgroundTransparency = 1.000 
						Button.Size = UDim2.new(0, 27, 0, 13) 
						Button.Position = UDim2.new(0, 248, 0.5, -8)
						Button.Font = Enum.Font.Gotham 
						Button.Text = "" 
						Button.TextColor3 = Color3.fromRGB(10, 11, 13) 
						Button.TextSize = 13.000 
						Button.ZIndex = 10

						Color.Name = "Color" 
						Color.Parent = Button 
						Color.BackgroundColor3 = Color3.fromRGB(255, 255, 255) 
						Color.BackgroundTransparency = 1
						Color.BorderSizePixel = 0
						Color.Position = UDim2.new(0, 0, 0, 0) 
						Color.Size = UDim2.new(0, 27, 0, 13) 
						Color.Image = "http://www.roblox.com/asset/?id=8447573665"

						TextLabel.Parent = Button 
						TextLabel.BackgroundColor3 = Color3.fromRGB(111, 222, 255) 
						TextLabel.BackgroundTransparency = 1.000 
						TextLabel.Position = UDim2.new(0, -233, 0, -1) 
						TextLabel.Size = UDim2.new(0.111913361, 208, 1, 0) 
						TextLabel.Font = Enum.Font.GothamSemibold 
						TextLabel.Text = text 
						TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200) 
						TextLabel.TextSize = 13.000 
						TextLabel.TextXAlignment = Enum.TextXAlignment.Left 

						local function update() 
							if Element.value.Toggle then 
								tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageColor3 = Color3.fromRGB(255, 255, 255)}) 
								Color.Image = "http://www.roblox.com/asset/?id=8447574633"
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(200, 200, 200)}) 
							else 
								keybindremove(text) 
								tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageColor3 = Color3.fromRGB(255, 255, 255)}) 
								Color.Image = "http://www.roblox.com/asset/?id=8447573665"
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(200, 200, 200)}) 
							end 
							values[tabname][sectorname][tabtext][text] = Element.value 
						end 

						Button.MouseButton1Down:Connect(function() 
							Element.value.Toggle = not Element.value.Toggle 
							update() 
							values[tabname][sectorname][tabtext][text] = Element.value 
							callback(Element.value) 
						end) 
						if data.default then 
							update() 
						end 
						values[tabname][sectorname][tabtext][text] = Element.value 
						function Element:SetValue(value) 
							Element.value = value 
							values[tabname][sectorname][tabtext][text] = Element.value 
							update() 
							callback(Element.value) 
						end 
					elseif type == "Dropdown" then 
						tabsize = tabsize + UDim2.new(0,0,0,16) 
						Element.value = {Dropdown = data.options[1]} 

						local Dropdown = Instance.new("Frame") 
						local Button = Instance.new("TextButton") 
						local TextLabel = Instance.new("TextLabel") 
						local Drop = Instance.new("ScrollingFrame") 
						local Button_2 = Instance.new("TextButton") 
						local TextLabel_2 = Instance.new("TextLabel") 
						local UIListLayout = Instance.new("UIListLayout") 
						local ImageLabel = Instance.new("ImageLabel") 
						local TextLabel_3 = Instance.new("TextLabel") 

						Dropdown.Name = "Dropdown" 
						Dropdown.Parent = tab1 
						Dropdown.BackgroundColor3 = Color3.fromRGB(111, 222, 255) 
						Dropdown.BackgroundTransparency = 1.000 
						Dropdown.Position = UDim2.new(0, 0, 0.255102038, 0) 
						Dropdown.Size = UDim2.new(1, 0, 0, 15) 

						Button.Name = "Button" 
						Button.Parent = Dropdown 
						Button.BackgroundColor3 = Color3.fromRGB(10, 14, 20)  
						Button.BorderColor3 = Color3.fromRGB(59, 116, 135) 
						Button.Position = UDim2.new(0, 115, 0, -1) 
						Button.Size = UDim2.new(0, 160, 0, 12) 
						Button.AutoButtonColor = false 
						Button.Font = Enum.Font.Gotham 
						Button.Text = "" 
						Button.TextColor3 = Color3.fromRGB(10, 11, 13) 
						Button.TextSize = 13.000 

						TextLabel.Parent = Button 
						TextLabel.BackgroundColor3 = Color3.fromRGB(111, 222, 255) 
						TextLabel.BackgroundTransparency = 1.000 
						TextLabel.BorderColor3 = Color3.fromRGB(10, 14, 20) 
						TextLabel.Position = UDim2.new(0, 5, 0, 0) 
						TextLabel.Size = UDim2.new(-0.21714285, 208, 1, 0) 
						TextLabel.Font = Enum.Font.GothamSemibold 
						TextLabel.Text = Element.value.Dropdown 
						TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200) 
						TextLabel.TextSize = 13.000 
						TextLabel.TextXAlignment = Enum.TextXAlignment.Left 

						local abcd = TextLabel 

						Drop.Name = "Drop" 
						Drop.Parent = Button 
						Drop.Active = true 
						Drop.BackgroundColor3 = Color3.fromRGB(10, 14, 20)  
						Drop.BorderColor3 = Color3.fromRGB(59, 116, 135) 
						Drop.Position = UDim2.new(0, 0, 1, 1) 
						Drop.Size = UDim2.new(1, 0, 0, 20) 
						Drop.Visible = false 
						Drop.BottomImage = "http://www.roblox.com/asset/?id=6724808282" 
						Drop.CanvasSize = UDim2.new(1, 1, 1, 1) 
						Drop.ScrollBarThickness = 0 
						Drop.MidImage = "http://www.roblox.com/asset/?id=6724808282" 
						Drop.TopImage = "http://www.roblox.com/asset/?id=6724808282" 
						Drop.AutomaticCanvasSize = "Y" 
						Drop.ZIndex = 5 
						Drop.ScrollBarImageColor3 = Color3.fromRGB(111, 222, 255) 

						UIListLayout.Parent = Drop 
						UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
						UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder 

						local num = #data.options 
						if num > 5 then 
							Drop.Size = UDim2.new(1, 0, 0, 85) 
						else 
							Drop.Size = UDim2.new(1, 0, 0, 17*num) 
						end 
						Drop.CanvasSize = UDim2.new(1, 0, 0, 17*num) 
						local first = true 
						for i,v in next, data.options do 
							do 
								local Button = Instance.new("TextButton") 
								local TextLabel = Instance.new("TextLabel") 

								Button.Name = v 
								Button.Parent = Drop 
								Button.BackgroundColor3 = Color3.fromRGB(10, 14, 20)  
								Button.BorderColor3 = Color3.fromRGB(59, 116, 135) 
								Button.Position = UDim2.new(0, 30, 0, 16) 
								Button.Size = UDim2.new(0, 160, 0, 17) 
								Button.AutoButtonColor = false 
								Button.Font = Enum.Font.Gotham 
								Button.Text = "" 
								Button.TextColor3 = Color3.fromRGB(200, 200, 200) 
								Button.TextSize = 13.000 
								Button.BorderSizePixel = 0 
								Button.ZIndex = 6 

								TextLabel.Parent = Button 
								TextLabel.BackgroundColor3 = Color3.fromRGB(111, 222, 255)
								TextLabel.BackgroundTransparency = 1.000 
								TextLabel.BorderColor3 = Color3.fromRGB(10, 14, 20) 
								TextLabel.Position = UDim2.new(0, -5, 0, -1) 
								TextLabel.Size = UDim2.new(-0.21714285, 208, 1, 0) 
								TextLabel.Font = Enum.Font.GothamSemibold 
								TextLabel.Text = v 
								TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200) 
								TextLabel.TextSize = 13.000 
								TextLabel.TextXAlignment = Enum.TextXAlignment.Center 
								TextLabel.ZIndex = 6 

								Button.MouseButton1Down:Connect(function() 
									Drop.Visible = false 
									Element.value.Dropdown = v 
									abcd.Text = v 
									values[tabname][sectorname][tabtext][text] = Element.value 
									callback(Element.value) 
									Drop.CanvasPosition = Vector2.new(0,0) 
								end) 
								Button.MouseEnter:Connect(function() 
									library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  Color3.fromRGB(200, 200, 200)}) 
								end) 
								Button.MouseLeave:Connect(function() 
									library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  Color3.fromRGB(200, 200, 200)}) 
								end) 

								first = false 
							end 
						end 

						function Element:SetValue(val) 
							Element.value = val 
							abcd.Text = val.Dropdown 
							values[tabname][sectorname][tabtext][text] = Element.value 
							callback(val) 
						end 

						ImageLabel.Parent = Button 
						ImageLabel.BackgroundColor3 = Color3.fromRGB(111, 222, 255) 
						ImageLabel.BackgroundTransparency = 1.000 
						ImageLabel.Position = UDim2.new(0, 145, 0, 4) 
						ImageLabel.Size = UDim2.new(0, 6, 0, 4) 
						ImageLabel.Image = "http://www.roblox.com/asset/?id=6724771531" 

						TextLabel_3.Parent = Dropdown 
						TextLabel_3.BackgroundColor3 = Color3.fromRGB(111, 222, 255) 
						TextLabel_3.BackgroundTransparency = 1.000 
						TextLabel_3.Position = UDim2.new(0, 15, 0, 3) 
						TextLabel_3.Size = UDim2.new(0.111913361, 208, 0.382215232, 0) 
						TextLabel_3.Font = Enum.Font.GothamSemibold 
						TextLabel_3.Text = text 
						TextLabel_3.TextColor3 = Color3.fromRGB(200, 200, 200) 
						TextLabel_3.TextSize = 13.000 
						TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left 

						Button.MouseButton1Down:Connect(function() 
							Drop.Visible = not Drop.Visible 
							if not Drop.Visible then 
								Drop.CanvasPosition = Vector2.new(0,0) 
							end 
						end) 
						local indrop = false 
						local ind = false 
						Drop.MouseEnter:Connect(function() 
							indrop = true 
						end) 
						Drop.MouseLeave:Connect(function() 
							indrop = false 
						end) 
						Button.MouseEnter:Connect(function() 
							ind = true 
						end) 
						Button.MouseLeave:Connect(function() 
							ind = false 
						end) 
						game:GetService("UserInputService").InputBegan:Connect(function(input) 
							if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then 
								if Drop.Visible == true and not indrop and not ind then 
									Drop.Visible = false 
									Drop.CanvasPosition = Vector2.new(0,0) 
								end 
							end 
						end) 
						values[tabname][sectorname][tabtext][text] = Element.value 
					elseif type == "Slider" then 

						tabsize = tabsize + UDim2.new(0,0,0,17) 

						local Slider = Instance.new("Frame") 
						local TextLabel = Instance.new("TextLabel") 
						local Button = Instance.new("TextButton") 
						local Frame = Instance.new("Frame") 
						local Imagege = Instance.new("ImageLabel")
						local UIGradient = Instance.new("UIGradient") 
						local Value = Instance.new("TextLabel") 

						Slider.Name = "Slider" 
						Slider.Parent = tab1 
						Slider.BackgroundColor3 = Color3.fromRGB(111, 222, 255) 
						Slider.BackgroundTransparency = 1.000 
						Slider.Position = UDim2.new(0, 0, 0.653061211, 0) 
						Slider.Size = UDim2.new(1, 0, 0, 15) 

						TextLabel.Parent = Slider 
						TextLabel.BackgroundColor3 = Color3.fromRGB(10, 14, 20) 
						TextLabel.BackgroundTransparency = 1.000 
						TextLabel.Position = UDim2.new(0, 15, 0, -2) 
						TextLabel.Size = UDim2.new(0, 100, 0, 15) 
						TextLabel.Font = Enum.Font.GothamSemibold 
						TextLabel.Text = text 
						TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200) 
						TextLabel.TextSize = 13.000 
						TextLabel.TextXAlignment = Enum.TextXAlignment.Left 

						Button.Name = "Button" 
						Button.Parent = Slider 
						Button.BackgroundColor3 = Color3.fromRGB(30, 80, 110) 
						Button.BorderColor3 = Color3.fromRGB(59, 116, 135)  
						Button.BackgroundTransparency = 0.3 
						Button.Position = UDim2.new(0, 160, 0, 4) 
						Button.Size = UDim2.new(0, 80, 0, 3) 
						Button.AutoButtonColor = false 
						Button.Font = Enum.Font.Gotham 
						Button.Text = "" 
						Button.TextColor3 = Color3.fromRGB(12, 12, 12) 
						Button.TextSize = 13.000 

						Frame.Parent = Button 
						Frame.BackgroundColor3 = Color3.fromRGB(111, 222, 255) 
						Frame.BackgroundTransparency = 0.3 
						Frame.BorderSizePixel = 0 
						Frame.Size = UDim2.new(0.5, 0, 1, 0) 
						
						Imagege.Name = "Imagege" 
						Imagege.Parent = Frame 
						Imagege.BackgroundColor3 = Color3.fromRGB(30, 80, 110) 
						Imagege.BorderSizePixel = 0  
						Imagege.Position = UDim2.new(0, -2, 0, -5) 
						Imagege.Size = UDim2.new(0, 13, 0, 13) 
						Imagege.Image = "http://www.roblox.com/asset/?id=8447575366"

						UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(111, 222, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(111, 222, 255))} 
						UIGradient.Rotation = 90 
						UIGradient.Parent = Frame 

						Value.Name = "Value" 
						Value.Parent = Slider 
						Value.BackgroundColor3 = Color3.fromRGB(10, 14, 20) 
						Value.BorderColor3 = Color3.fromRGB(59, 116, 135)
						Value.Position = UDim2.new(0, 250, 0, 0) 
						Value.Size = UDim2.new(0, 25, 0, 11) 
						Value.Font = Enum.Font.GothamSemibold 
						Value.Text = "50" 
						Value.TextColor3 = Color3.fromRGB(200, 200, 200) 
						Value.TextSize = 12
						Value.TextXAlignment = Enum.TextXAlignment.Center 
						local min, max, default = data.min or 0, data.max or 100, data.default or 0 
						Element.value = {Slider = default} 

						function Element:SetValue(value) 
							Element.value = value 
							local a 
							if min > 0 then 
								a = ((Element.value.Slider - min)) / (max-min) 
							else 
								a = (Element.value.Slider-min)/(max-min) 
							end 
							Value.Text = Element.value.Slider 
							Frame.Size = UDim2.new(a,0,1,0) 
							Imagege.Position = UDim2.new(0,((a * 80 ) - 8),0,-5) 
							values[tabname][sectorname][tabtext][text] = Element.value 
							callback(value) 
						end 
						local a 
						if min > 0 then 
							a = ((Element.value.Slider - min)) / (max-min)
						else 
							a = (Element.value.Slider-min)/(max-min)
						end 
						Value.Text = Element.value.Slider 
						Frame.Size = UDim2.new(a,0,1,0) 
						Imagege.Position = UDim2.new(0,((a * 80 ) - 8),0,-5) 
						values[tabname][sectorname][tabtext][text] = Element.value 
						local uis = game:GetService("UserInputService") 
						local mouse = game.Players.LocalPlayer:GetMouse() 
						local val 
						Button.MouseButton1Down:Connect(function() 
							Frame.Size = UDim2.new(0, math.clamp(mouse.X - Frame.AbsolutePosition.X, 0, 80), 0, 3) 
							Imagege.Position = UDim2.new(0, ( math.clamp(mouse.X - Frame.AbsolutePosition.X, 0, 80) - 7 ), 0, -5)
							val = math.floor((((tonumber(max) - tonumber(min)) / 80) * Frame.AbsoluteSize.X) + tonumber(min)) or 0 
							Value.Text = val 
							Element.value.Slider = val 
							values[tabname][sectorname][tabtext][text] = Element.value 
							callback(Element.value) 
							moveconnection = mouse.Move:Connect(function() 
								Frame.Size = UDim2.new(0, math.clamp(mouse.X - Frame.AbsolutePosition.X, 0, 80), 0, 3) 
								Imagege.Position = UDim2.new(0, ( math.clamp(mouse.X - Frame.AbsolutePosition.X, 0, 80) - 7 ), 0, -5)
								val = math.floor((((tonumber(max) - tonumber(min)) / 80) * Frame.AbsoluteSize.X) + tonumber(min)) 
								Value.Text = val 
								Element.value.Slider = val 
								values[tabname][sectorname][tabtext][text] = Element.value 
								callback(Element.value) 
							end) 
							releaseconnection = uis.InputEnded:Connect(function(Mouse) 
								if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then 
									Frame.Size = UDim2.new(0, math.clamp(mouse.X - Frame.AbsolutePosition.X, 0, 80), 0, 3) 
									Imagege.Position = UDim2.new(0, ( math.clamp(mouse.X - Frame.AbsolutePosition.X, 0, 80) - 7 ), 0, -5)
									val = math.floor((((tonumber(max) - tonumber(min)) / 80) * Frame.AbsoluteSize.X) + tonumber(min)) 
									values[tabname][sectorname][tabtext][text] = Element.value 
									callback(Element.value) 
									moveconnection:Disconnect() 
									releaseconnection:Disconnect() 
								end 
							end) 
						end) 
					end 
					ConfigLoad:Connect(function(cfg) 
						local fix = library:ConfigFix(cfg) 
						if fix[tabname][sectorname][tabtext][text] ~= nil then 
							Element:SetValue(fix[tabname][sectorname][tabtext][text]) 
						end 
					end) 

					return Element 
				end 


				if firs then 
					coroutine.wrap(function() 
						game:GetService("RunService").Heartbeat:Wait() 
						Section.Size = tabsize 
					end)() 
					selected = text 
					TextButton.TextColor3 = Color3.fromRGB(200, 200, 200) 
					tab1.Visible = true 
					firs = false 
				end 

				return tab 
			end 

			return MSector 
		end 
		function Tab:Sector(text, side) 
			local sectorname = text 
			local Sector = {} 
			values[tabname][text] = {} 
			local Section = Instance.new("Frame") 
			local SectionText = Instance.new("TextLabel") 
			local pol_left = Instance.new("Frame") 
			local UIGradient_left = Instance.new("UIGradient")
			local pol_right = Instance.new("Frame") 
			local UIGradient_right = Instance.new("UIGradient")
			local Inner = Instance.new("Frame") 
			local UIListLayout = Instance.new("UIListLayout") 

			Section.Name = "Section" 
			Section.Parent = TabGui[side] 
			Section.BackgroundColor3 = Color3.fromRGB(9, 15, 28) 
			Section.BorderColor3 = Color3.fromRGB(10, 14, 20) 
			Section.BorderSizePixel = 0 
			Section.Position = UDim2.new(0.00358422939, 0, 0, 0) 
			Section.Size = UDim2.new(1, 0, 0, 49) 

			SectionText.Name = "SectionText" 
			SectionText.Parent = Section 
			SectionText.BackgroundColor3 = Color3.fromRGB(111, 222, 255) 
			SectionText.BackgroundTransparency = 1.000 
			SectionText.Position = UDim2.new(0, 10, 0, 8) 
			SectionText.Size = UDim2.new(0, 270, 0, 19) 
			SectionText.ZIndex = 2 
			SectionText.Font = Enum.Font.GothamSemibold 
			SectionText.Text = text 
			SectionText.TextColor3 = Color3.fromRGB(200, 200, 200) 
			SectionText.TextSize = 16.000 
			SectionText.TextXAlignment = Enum.TextXAlignment.Left 
			
				pol_left.Name = "pol_left" 
				pol_left.Parent = SectionText 
				pol_left.BackgroundColor3 = Color3.fromRGB(255, 255, 255) 
				pol_left.BorderColor3 = Color3.fromRGB(10, 14, 20) 
				pol_left.BorderSizePixel = 0 
				pol_left.Position = UDim2.new(0, 5, 0, 22) 
				pol_left.Size = UDim2.new(0, 130, 0, 3) 
				
					UIGradient_left.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(9, 15, 28)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(29, 56, 95))}
					UIGradient_left.Rotation = 0
					UIGradient_left.Parent = pol_left

				pol_right.Name = "pol_right" 
				pol_right.Parent = SectionText 
				pol_right.BackgroundColor3 = Color3.fromRGB(255, 255, 255) 
				pol_right.BorderColor3 = Color3.fromRGB(10, 14, 20) 
				pol_right.BorderSizePixel = 0 
				pol_right.Position = UDim2.new(0, 135, 0, 22) 
				pol_right.Size = UDim2.new(0, 130, 0, 3) 
				
					UIGradient_right.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(9, 15, 28)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(29, 56, 95))}
					UIGradient_right.Rotation = 180
					UIGradient_right.Parent = pol_right

			Inner.Name = "Inner" 
			Inner.Parent = Section 
			Inner.BackgroundColor3 = Color3.fromRGB(9, 15, 28) 
			Inner.BorderColor3 = Color3.fromRGB(10, 14, 20) 
			Inner.BackgroundTransparency = 1.000
			Inner.BorderSizePixel = 0 
			Inner.Position = UDim2.new(0, 1, 0, 33) 
			Inner.Size = UDim2.new(1, -2, 1, -2) 

			local UIPadding = Instance.new("UIPadding") 

			UIPadding.Parent = Inner 
			UIPadding.PaddingTop = UDim.new(0, 10) 

			UIListLayout.Parent = Inner 
			UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder 
			UIListLayout.Padding = UDim.new(0,1) 

			function Sector:Element(type, text, data, callback) 
				local Element = {} 
				data = data or {} 
				callback = callback or function() end 
				values[tabname][sectorname][text] = {} 
				if type == "ScrollDrop" then 
					Section.Size = Section.Size + UDim2.new(0,0,0,39) 
					Element.value = {Scroll = {}, Dropdown = ""} 

					for i,v in next, data.options do 
						Element.value.Scroll[i] = v[1] 
					end 

					local joe = {} 
					if data.alphabet then 
						local copy = {} 
						for i,v in next, data.options do 
							table.insert(copy, i) 
						end 
						table.sort(copy, function(a,b) 
							return a < b 
						end) 
						joe = copy 
					else 
						for i,v in next, data.options do 
							table.insert(joe, i) 
						end 
					end 

					local Dropdown = Instance.new("Frame") 
					local Button = Instance.new("TextButton") 
					local TextLabel = Instance.new("TextLabel") 
					local Drop = Instance.new("ScrollingFrame") 
					local Button_2 = Instance.new("TextButton") 
					local TextLabel_2 = Instance.new("TextLabel") 
					local UIListLayout = Instance.new("UIListLayout") 
					local ImageLabel = Instance.new("ImageLabel") 
					local TextLabel_3 = Instance.new("TextLabel") 

					Dropdown.Name = "Dropdown" 
					Dropdown.Parent = Inner 
					Dropdown.BackgroundColor3 = Color3.fromRGB(111, 222, 255) 
					Dropdown.BackgroundTransparency = 1.000 
					Dropdown.Position = UDim2.new(0, 0, 0, 0) 
					Dropdown.Size = UDim2.new(1, 0, 0, 39) 

					Button.Name = "Button" 
					Button.Parent = Dropdown 
					Button.BackgroundColor3 = Color3.fromRGB(10, 14, 20) 
					Button.BorderColor3 = Color3.fromRGB(59, 116, 135) 
					Button.Position = UDim2.new(0, 30, 0, 16) 
					Button.Size = UDim2.new(0, 220, 0, 17) 
					Button.AutoButtonColor = false 
					Button.Font = Enum.Font.Gotham 
					Button.Text = "" 
					Button.TextColor3 = Color3.fromRGB(12, 12, 12) 
					Button.TextSize = 13.000 

					local TextLabel = Instance.new("TextLabel") 

					TextLabel.Parent = Button 
					TextLabel.BackgroundColor3 = Color3.fromRGB(111, 222, 255) 
					TextLabel.BackgroundTransparency = 1.000 
					TextLabel.BorderColor3 = Color3.fromRGB(10, 14, 20) 
					TextLabel.Position = UDim2.new(0, 5, 0, 0) 
					TextLabel.Size = UDim2.new(0, 208, 1, 0) 
					TextLabel.Font = Enum.Font.GothamSemibold 
					TextLabel.Text = "kys" 
					TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200) 
					TextLabel.TextSize = 13.000 
					TextLabel.TextXAlignment = Enum.TextXAlignment.Left 

					local abcd = TextLabel 

					Drop.Name = "Drop" 
					Drop.Parent = Button 
					Drop.Active = true 
					Drop.BackgroundColor3 = Color3.fromRGB(9, 15, 28) 
					Drop.BorderColor3 = Color3.fromRGB(59, 116, 135) 
					Drop.Position = UDim2.new(0, 0, 1, 1) 
					Drop.Size = UDim2.new(1, 0, 0, 20) 
					Drop.Visible = false 
					Drop.BottomImage = "http://www.roblox.com/asset/?id=6724808282" 
					Drop.CanvasSize = UDim2.new(1, 1, 1, 1) 
					Drop.ScrollBarThickness = 0 
					Drop.TopImage = "http://www.roblox.com/asset/?id=6724808282" 
					Drop.MidImage = "http://www.roblox.com/asset/?id=6724808282" 
					Drop.AutomaticCanvasSize = "Y" 
					Drop.ZIndex = 5 
					Drop.ScrollBarImageColor3 = Color3.fromRGB(111, 222, 255) 

					UIListLayout.Parent = Drop 
					UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
					UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder 

					local amount = data.Amount or 6 
					Section.Size = Section.Size + UDim2.new(0,0,0,amount * 16 + 8) 

					local num = #joe 
					if num > 5 then 
						Drop.Size = UDim2.new(1, 0, 0, 85) 
					else 
						Drop.Size = UDim2.new(1, 0, 0, 17*num) 
					end 
					local first = true 
					for i,v in next, joe do 
						do 
							local joell = v 
							local Scroll = Instance.new("Frame") 
							local joe2 = data.options[v] 
							local Button = Instance.new("TextButton") 
							local TextLabel = Instance.new("TextLabel") 

							Button.Name = v 
							Button.Parent = Drop 
							Button.BackgroundColor3 = Color3.fromRGB(10, 14, 20) 
							Button.BorderColor3 = Color3.fromRGB(10, 14, 20) 
							Button.Position = UDim2.new(0, 30, 0, 16) 
							Button.Size = UDim2.new(0, 220, 0, 17) 
							Button.AutoButtonColor = false 
							Button.Font = Enum.Font.Gotham 
							Button.Text = "" 
							Button.TextColor3 = Color3.fromRGB(12, 12, 12) 
							Button.TextSize = 13.000 
							Button.BorderSizePixel = 0      
							Button.ZIndex = 6      

							TextLabel.Parent = Button      
							TextLabel.BackgroundColor3 = Color3.fromRGB(111, 222, 255)      
							TextLabel.BackgroundTransparency = 1.000      
							TextLabel.BorderColor3 = Color3.fromRGB(10, 14, 20)      
							TextLabel.Position = UDim2.new(0, 0, 0, -1)      
							TextLabel.Size = UDim2.new(0, 220, 1, 0)      
							TextLabel.Font = Enum.Font.GothamSemibold      
							TextLabel.Text = v      
							TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200)      
							TextLabel.TextSize = 13.000      
							TextLabel.TextXAlignment = Enum.TextXAlignment.Center      
							TextLabel.ZIndex = 6      

							Button.MouseButton1Down:Connect(function()      
								Drop.Visible = false      
								Drop.CanvasPosition = Vector2.new(0,0)      
								abcd.Text = v      
								for i,v in next, Scroll.Parent:GetChildren() do      
									if v:IsA("Frame") then      
										v.Visible = false      
									end      
								end      
								Element.value.Dropdown = v      
								Scroll.Visible = true      
								callback(Element.value)      
							end)      
							Button.MouseEnter:Connect(function()      
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  Color3.fromRGB(200, 200, 200)})      
							end)      
							Button.MouseLeave:Connect(function()      
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  Color3.fromRGB(200, 200, 200)})      
							end)      

							if first then      
								abcd.Text = v      
								Element.value.Dropdown = v      
							end      
							local Frame = Instance.new("ScrollingFrame")      
							local UIListLayout = Instance.new("UIListLayout")      

							Scroll.Name = "Scroll"      
							Scroll.Parent = Dropdown      
							Scroll.BackgroundColor3 = Color3.fromRGB(111, 222, 255)      
							Scroll.BackgroundTransparency = 1.000      
							Scroll.Position = UDim2.new(0, 0, 0, 0)      
							Scroll.Size = UDim2.new(1, 0, 0, amount * 16 + 8)      
							Scroll.Visible = first      
							Scroll.Name = v      

							Frame.Name = "Frame"      
							Frame.Parent = Scroll      
							Frame.Active = true      
							Frame.BackgroundColor3 = Color3.fromRGB(10, 14, 20)       
							Frame.BorderColor3 = Color3.fromRGB(59, 116, 135)      
							Frame.Position = UDim2.new(0, 30, 0, 40)      
							Frame.Size = UDim2.new(0, 220, 0, 16 * amount)      
							Frame.BottomImage = "http://www.roblox.com/asset/?id=6724808282"      
							Frame.CanvasSize = UDim2.new(1, 1, 1, 1)      
							Frame.MidImage = "http://www.roblox.com/asset/?id=6724808282"      
							Frame.ScrollBarThickness = 0      
							Frame.TopImage = "http://www.roblox.com/asset/?id=6724808282"      
							Frame.AutomaticCanvasSize = "Y"      
							Frame.ScrollBarImageColor3 = Color3.fromRGB(111, 222, 255)      

							UIListLayout.Parent = Frame      
							UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center      
							UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder      
							local joll = true      
							for i,v in next, joe2 do      
								local Button = Instance.new("TextButton")      
								local TextLabel = Instance.new("TextLabel")      

								Button.Name = v      
								Button.Parent = Frame      
								Button.BackgroundColor3 = Color3.fromRGB(10, 14, 20)       
								Button.BorderColor3 = Color3.fromRGB(10, 14, 20)      
								Button.BorderSizePixel = 0      
								Button.Position = UDim2.new(0, 30, 0, 16)      
								Button.Size = UDim2.new(1, 0, 0, 16)      
								Button.AutoButtonColor = false      
								Button.Font = Enum.Font.Gotham      
								Button.Text = ""      
								Button.TextColor3 = Color3.fromRGB(12, 12, 12)      
								Button.TextSize = 13.000      

								TextLabel.Parent = Button      
								TextLabel.BackgroundColor3 = Color3.fromRGB(111, 222, 255)      
								TextLabel.BackgroundTransparency = 1.000      
								TextLabel.BorderColor3 = Color3.fromRGB(10, 14, 20)      
								TextLabel.Position = UDim2.new(0, 5, 0, -1)      
								TextLabel.Size = UDim2.new(1, 1, 1, 1)      
								TextLabel.Font = Enum.Font.GothamSemibold      
								TextLabel.Text = v      
								TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200)      
								TextLabel.TextSize = 13.000      
								TextLabel.TextXAlignment = Enum.TextXAlignment.Left      
								if joll then      
									joll = false      
									TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200)      
								end      

								Button.MouseButton1Down:Connect(function()      

									for i,v in next, Frame:GetChildren() do      
										if v:IsA("TextButton") then      
											library:Tween(v.TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(200, 200, 200)})      
										end      
									end      

									library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255, 255, 255)})      

									Element.value.Scroll[joell] = v      

									values[tabname][sectorname][text] = Element.value      
									callback(Element.value)      
								end)      
								Button.MouseEnter:Connect(function()      
									if Element.value.Scroll[joell] ~= v then      
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(200, 200, 200)})      
									end      
								end)      
								Button.MouseLeave:Connect(function()      
									if Element.value.Scroll[joell] ~= v then      
										library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(200, 200, 200)})      
									end      
								end)      
							end      
							first = false      
						end      
					end      

					ImageLabel.Parent = Button      
					ImageLabel.BackgroundColor3 = Color3.fromRGB(111, 222, 255)      
					ImageLabel.BackgroundTransparency = 1.000      
					ImageLabel.Position = UDim2.new(0, 205, 0, 6)      
					ImageLabel.Size = UDim2.new(0, 6, 0, 4)      
					ImageLabel.Image = "http://www.roblox.com/asset/?id=6724771531"      

					TextLabel_3.Parent = Dropdown      
					TextLabel_3.BackgroundColor3 = Color3.fromRGB(111, 222, 255)      
					TextLabel_3.BackgroundTransparency = 1.000      
					TextLabel_3.Position = UDim2.new(0, 32, 0, -1)      
					TextLabel_3.Size = UDim2.new(0.111913361, 208, 0.382215232, 0)      
					TextLabel_3.Font = Enum.Font.GothamSemibold      
					TextLabel_3.Text = text      
					TextLabel_3.TextColor3 = Color3.fromRGB(200, 200, 200)      
					TextLabel_3.TextSize = 13.000      
					TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left      

					Button.MouseButton1Down:Connect(function()      
						Drop.Visible = not Drop.Visible      
						if not Drop.Visible then      
							Drop.CanvasPosition = Vector2.new(0,0)      
						end      
					end)      
					local indrop = false      
					local ind = false      
					Drop.MouseEnter:Connect(function()      
						indrop = true      
					end)      
					Drop.MouseLeave:Connect(function()      
						indrop = false      
					end)      
					Button.MouseEnter:Connect(function()      
						ind = true      
					end)      
					Button.MouseLeave:Connect(function()      
						ind = false      
					end)      
					game:GetService("UserInputService").InputBegan:Connect(function(input)      
						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then      
							if Drop.Visible == true and not indrop and not ind then      
								Drop.Visible = false      
								Drop.CanvasPosition = Vector2.new(0,0)      
							end      
						end      
					end)      

					function Element:SetValue(tbl)      
						Element.value = tbl      
						abcd.Text = tbl.Dropdown      
						values[tabname][sectorname][text] = Element.value      
						for i,v in next, Dropdown:GetChildren() do      
							if v:IsA("Frame") then      
								if v.Name == Element.value.Dropdown then      
									v.Visible = true      
								else      
									v.Visible = false      
								end      
								for _,bad in next, v.Frame:GetChildren() do      
									if bad:IsA("TextButton") then      
										bad.TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200)      
										if bad.Name == Element.value.Scroll[v.Name] then      
											bad.TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200)      
										end      
									end      
								end      
							end      
						end      
					end      

					if data.default then      
						Element:SetValue(data.default)      
					end      

					values[tabname][sectorname][text] = Element.value      

				elseif type == "Scroll" then      
					local amount = data.Amount or 6      
					Section.Size = Section.Size + UDim2.new(0,0,0,amount * 16 + 8)      
					if data.alphabet then      
						table.sort(data.options, function(a,b)      
							return a < b      
						end)      
					end      
					Element.value = {Scroll = data.default and data.default.Scroll or data.options[1]}      

					local Scroll = Instance.new("Frame")      
					local Frame = Instance.new("ScrollingFrame")      
					local UIListLayout = Instance.new("UIListLayout")      

					Scroll.Name = "Scroll"      
					Scroll.Parent = Inner      
					Scroll.BackgroundColor3 = Color3.fromRGB(111, 222, 255)      
					Scroll.BackgroundTransparency = 1.000      
					Scroll.Position = UDim2.new(0, 0, 00, 0)      
					Scroll.Size = UDim2.new(1, 0, 0, amount * 16 + 8)      

					Frame.Name = "Frame"      
					Frame.Parent = Scroll      
					Frame.Active = true      
					Frame.BackgroundColor3 = Color3.fromRGB(10, 14, 20)       
					Frame.BorderColor3 = Color3.fromRGB(59, 116, 135)      
					Frame.Position = UDim2.new(0, 30, 0, 0)      
					Frame.Size = UDim2.new(0, 220, 0, 16 * amount)      
					Frame.BottomImage = "http://www.roblox.com/asset/?id=6724808282"      
					Frame.CanvasSize = UDim2.new(1, 1, 1, 1)      
					Frame.MidImage = "http://www.roblox.com/asset/?id=6724808282"      
					Frame.ScrollBarThickness = 0      
					Frame.TopImage = "http://www.roblox.com/asset/?id=6724808282"      
					Frame.AutomaticCanvasSize = "Y"      
					Frame.ScrollBarImageColor3 = Color3.fromRGB(10, 14, 20)      

					UIListLayout.Parent = Frame      
					UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center      
					UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder      
					local first = true      
					for i,v in next, data.options do      
						local Button = Instance.new("TextButton")      
						local TextLabel = Instance.new("TextLabel")      

						Button.Name = v      
						Button.Parent = Frame      
						Button.BackgroundColor3 = Color3.fromRGB(10, 14, 20)       
						Button.BorderColor3 = Color3.fromRGB(10, 14, 20)      
						Button.BorderSizePixel = 0      
						Button.Position = UDim2.new(0, 30, 0, 16)      
						Button.Size = UDim2.new(1, 0, 0, 16)      
						Button.AutoButtonColor = false      
						Button.Font = Enum.Font.Gotham      
						Button.Text = ""      
						Button.TextColor3 = Color3.fromRGB(12, 12, 12)      
						Button.TextSize = 13.000      

						TextLabel.Parent = Button      
						TextLabel.BackgroundColor3 = Color3.fromRGB(111, 222, 255)      
						TextLabel.BackgroundTransparency = 1.000      
						TextLabel.BorderColor3 = Color3.fromRGB(10, 14, 20)      
						TextLabel.Position = UDim2.new(0, 4, 0, -1)      
						TextLabel.Size = UDim2.new(1, 1, 1, 1)      
						TextLabel.Font = Enum.Font.GothamSemibold      
						TextLabel.Text = v      
						TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200)      
						TextLabel.TextSize = 13.000      
						TextLabel.TextXAlignment = Enum.TextXAlignment.Left      
						if first then first = false      
							TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200)      
						end      

						Button.MouseButton1Down:Connect(function()      

							for i,v in next, Frame:GetChildren() do      
								if v:IsA("TextButton") then      
									library:Tween(v.TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(200, 200, 200)})      
								end      
							end      

							library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255, 255, 255)})      

							Element.value.Scroll = v      

							values[tabname][sectorname][text] = Element.value      
							callback(Element.value)      
						end)      
						Button.MouseEnter:Connect(function()      
							if Element.value.Scroll ~= v then      
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(200, 200, 200)})      
							end      
						end)      
						Button.MouseLeave:Connect(function()      
							if Element.value.Scroll ~= v then      
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(200, 200, 200)})      
							end      
						end)      
					end      

					function Element:SetValue(val)      
						Element.value = val      

						for i,v in next, Frame:GetChildren() do      
							if v:IsA("TextButton") then      
								library:Tween(v.TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(200, 200, 200)})      
							end      
						end      

						library:Tween(Frame[Element.value.Scroll].TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(200, 200, 200)})      
						values[tabname][sectorname][text] = Element.value      
						callback(Element.value)      
					end      
					values[tabname][sectorname][text] = Element.value      
				elseif type == "Jumbobox" then      
					Section.Size = Section.Size + UDim2.new(0,0,0,16)      
					Element.value = {Jumbobox = {}}      
					data.options = data.options or {}      

					local Dropdown = Instance.new("Frame")      
					local Button = Instance.new("TextButton")      
					local TextLabel = Instance.new("TextLabel")      
					local Drop = Instance.new("ScrollingFrame")      
					local Button_2 = Instance.new("TextButton")      
					local TextLabel_2 = Instance.new("TextLabel")      
					local UIListLayout = Instance.new("UIListLayout")      
					local ImageLabel = Instance.new("ImageLabel")      
					local TextLabel_3 = Instance.new("TextLabel")      

					Dropdown.Name = "Dropdown"      
					Dropdown.Parent = Inner      
					Dropdown.BackgroundColor3 = Color3.fromRGB(10, 14, 20)       
					Dropdown.BackgroundTransparency = 1.000      
					Dropdown.Position = UDim2.new(0, 0, 0.255102038, 0)      
					Dropdown.Size = UDim2.new(1, 0, 0, 15)      

					Button.Name = "Button"      
					Button.Parent = Dropdown      
					Button.BackgroundColor3 = Color3.fromRGB(10, 14, 20)       
					Button.BorderColor3 = Color3.fromRGB(59, 116, 135)      
					Button.Position = UDim2.new(0, 115, 0, -1)      
					Button.Size = UDim2.new(0, 160, 0, 12)      
					Button.AutoButtonColor = false      
					Button.Font = Enum.Font.Gotham      
					Button.Text = ""      
					Button.TextColor3 = Color3.fromRGB(12, 12, 12)      
					Button.TextSize = 13.000      

					TextLabel.Parent = Button      
					TextLabel.BackgroundColor3 = Color3.fromRGB(111, 222, 255)      
					TextLabel.BackgroundTransparency = 1.000      
					TextLabel.BorderColor3 = Color3.fromRGB(10, 14, 20)      
					TextLabel.Position = UDim2.new(0, 5, 0, 0)      
					TextLabel.Size = UDim2.new(-0.21714285, 208, 1, 0)      
					TextLabel.Font = Enum.Font.GothamSemibold      
					TextLabel.Text = ". . ."      
					TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200)      
					TextLabel.TextSize = 13.000      
					TextLabel.TextXAlignment = Enum.TextXAlignment.Left      

					local abcd = TextLabel      

					Drop.Name = "Drop"      
					Drop.Parent = Button      
					Drop.Active = true      
					Drop.BackgroundColor3 = Color3.fromRGB(10, 14, 20)       
					Drop.BorderColor3 = Color3.fromRGB(59, 116, 135)      
					Drop.Position = UDim2.new(0, 0, 1, 1)      
					Drop.Size = UDim2.new(1, 0, 0, 20)      
					Drop.Visible = false      
					Drop.BottomImage = "http://www.roblox.com/asset/?id=6724808282"      
					Drop.CanvasSize = UDim2.new(1, 1, 1, 1)      
					Drop.ScrollBarThickness = 0      
					Drop.TopImage = "http://www.roblox.com/asset/?id=6724808282"      
					Drop.MidImage = "http://www.roblox.com/asset/?id=6724808282"         
					for i,v in next, data.options do      
						Drop.CanvasSize = Drop.CanvasSize + UDim2.new(0, 0, 0, 17)      
					end      
					Drop.ZIndex = 5      
					Drop.ScrollBarImageColor3 = Color3.fromRGB(111, 222, 255)      

					UIListLayout.Parent = Drop      
					UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center      
					UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder      

					values[tabname][sectorname][text] = Element.value      

					local num = #data.options      
					if num > 5 then      
						Drop.Size = UDim2.new(1, 0, 0, 85)      
					else      
						Drop.Size = UDim2.new(1, 0, 0, 17*num)      
					end      
					local first = true      

					local function updatetext()      
						local old = {}      
						for i,v in next, data.options do      
							if table.find(Element.value.Jumbobox, v) then      
								table.insert(old, v)      
							else      
							end      
						end      
						local str = ""      


						if #old == 0 then      
							str = "..."      
						else      
							if #old == 1 then      
								str = old[1]      
							else      
								for i,v in next, old do      
									if i == 1 then      
										str = v      
									else      
										if i > 2 then      
											if i < 4 then      
												str = str..",  ..."      
											end      
										else      
											str = str..",  "..v      
										end      
									end      
								end      
							end      
						end      

						abcd.Text = str      
					end      
					for i,v in next, data.options do      
						do      
							local Button = Instance.new("TextButton")      
							local TextLabel = Instance.new("TextLabel")      

							Button.Name = v      
							Button.Parent = Drop      
							Button.BackgroundColor3 = Color3.fromRGB(10, 14, 20)       
							Button.BorderColor3 = Color3.fromRGB(10, 14, 20)      
							Button.Position = UDim2.new(0, 30, 0, 16)      
							Button.Size = UDim2.new(0, 160, 0, 17)      
							Button.AutoButtonColor = false      
							Button.Font = Enum.Font.Gotham      
							Button.Text = ""      
							Button.TextColor3 = Color3.fromRGB(12, 12, 12)      
							Button.TextSize = 13.000      
							Button.BorderSizePixel = 0      
							Button.ZIndex = 6      

							TextLabel.Parent = Button      
							TextLabel.BackgroundColor3 = Color3.fromRGB(111, 222, 255)      
							TextLabel.BackgroundTransparency = 1.000      
							TextLabel.BorderColor3 = Color3.fromRGB(10, 14, 20)      
							TextLabel.Position = UDim2.new(0, -5, 0, -1)      
							TextLabel.Size = UDim2.new(-0.21714285, 208, 1, 0)      
							TextLabel.Font = Enum.Font.GothamSemibold      
							TextLabel.Text = v      
							TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200)      
							TextLabel.TextSize = 13.000      
							TextLabel.TextXAlignment = Enum.TextXAlignment.Center      
							TextLabel.ZIndex = 6      

							Button.MouseButton1Down:Connect(function()      
								if table.find(Element.value.Jumbobox, v) then      
									for i,a in next, Element.value.Jumbobox do      
										if a == v then      
											table.remove(Element.value.Jumbobox, i)      
										end      
									end      
									library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(200, 200, 200)})      
								else      
									table.insert(Element.value.Jumbobox, v)      
									library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255, 255, 255)})      
								end      
								updatetext()      

								values[tabname][sectorname][text] = Element.value      
								callback(Element.value)      
							end)      
							Button.MouseEnter:Connect(function()      
								if not table.find(Element.value.Jumbobox, v) then      
									library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(200, 200, 200)})      
								end      
							end)      
							Button.MouseLeave:Connect(function()      
								if not table.find(Element.value.Jumbobox, v) then      
									library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(200, 200, 200)})      
								end      
							end)      

							first = false      
						end      
					end      
					function Element:SetValue(val)      
						Element.value = val      
						for i,v in next, Drop:GetChildren() do      
							if v.Name ~= "UIListLayout" then      
								if table.find(val.Jumbobox, v.Name) then      
									v.TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200)      
								else      
									v.TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200)      
								end      
							end      
						end      
						updatetext()      
						values[tabname][sectorname][text] = Element.value      
						callback(val)      
					end      
					if data.default then      
						Element:SetValue(data.default)      
					end      

					ImageLabel.Parent = Button      
					ImageLabel.BackgroundColor3 = Color3.fromRGB(111, 222, 255)      
					ImageLabel.BackgroundTransparency = 1.000      
					ImageLabel.Position = UDim2.new(0, 145, 0, 4)      
					ImageLabel.Size = UDim2.new(0, 6, 0, 4)      
					ImageLabel.Image = "http://www.roblox.com/asset/?id=6724771531"      

					TextLabel_3.Parent = Dropdown      
					TextLabel_3.BackgroundColor3 = Color3.fromRGB(111, 222, 255)      
					TextLabel_3.BackgroundTransparency = 1.000      
					TextLabel_3.Position = UDim2.new(0, 15, 0, 3)      
					TextLabel_3.Size = UDim2.new(0.111913361, 208, 0.382215232, 0)      
					TextLabel_3.Font = Enum.Font.GothamSemibold      
					TextLabel_3.Text = text      
					TextLabel_3.TextColor3 = Color3.fromRGB(200, 200, 200)      
					TextLabel_3.TextSize = 13.000      
					TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left      

					Button.MouseButton1Down:Connect(function()      
						Drop.Visible = not Drop.Visible      
						if not Drop.Visible then      
							Drop.CanvasPosition = Vector2.new(0,0)      
						end      
					end)      
					local indrop = false      
					local ind = false      
					Drop.MouseEnter:Connect(function()      
						indrop = true      
					end)      
					Drop.MouseLeave:Connect(function()      
						indrop = false      
					end)      
					Button.MouseEnter:Connect(function()      
						ind = true      
					end)      
					Button.MouseLeave:Connect(function()      
						ind = false      
					end)      
					game:GetService("UserInputService").InputBegan:Connect(function(input)      
						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then      
							if Drop.Visible == true and not indrop and not ind then      
								Drop.Visible = false      
								Drop.CanvasPosition = Vector2.new(0,0)      
							end      
						end      
					end)      
				elseif type == "ToggleKeybind" then      
					Section.Size = Section.Size + UDim2.new(0,0,0,16)      
					Element.value = {Toggle = data.default and data.default.Toggle or false, Key, Type = "Always", Active = true}      

					local Toggle = Instance.new("Frame")      
					local Button = Instance.new("TextButton")      
					local Color = Instance.new("ImageLabel")      
					local TextLabel = Instance.new("TextLabel")      

					Toggle.Name = "Toggle"      
					Toggle.Parent = Inner      
					Toggle.BackgroundColor3 = Color3.fromRGB(111, 222, 255)      
					Toggle.BackgroundTransparency = 1.000      
					Toggle.Size = UDim2.new(1, 0, 0, 15)      

					Button.Name = "Button" 
					Button.Parent = Toggle 
					Button.BackgroundColor3 = Color3.fromRGB(111, 222, 255) 
					Button.BackgroundTransparency = 1.000 
					Button.Size = UDim2.new(0, 27, 0, 13) 
					Button.Position = UDim2.new(0, 248, 0.5, -8)
					Button.Font = Enum.Font.Gotham 
					Button.Text = "" 
					Button.TextColor3 = Color3.fromRGB(10, 11, 13) 
					Button.TextSize = 13.000 
					Button.ZIndex = 10

					Color.Name = "Color" 
					Color.Parent = Button 
					Color.BackgroundColor3 = Color3.fromRGB(255, 255, 255) 
					Color.BackgroundTransparency = 1
					Color.BorderSizePixel = 0
					Color.Position = UDim2.new(0, 0, 0, 0) 
					Color.Size = UDim2.new(0, 27, 0, 13) 
					Color.Image = "http://www.roblox.com/asset/?id=8447573665"
					
					local binding = false

					TextLabel.Parent = Button      
					TextLabel.BackgroundColor3 = Color3.fromRGB(111, 222, 255)      
					TextLabel.BackgroundTransparency = 1.000      
					TextLabel.Position = UDim2.new(0, -233, 0, -1)      
					TextLabel.Size = UDim2.new(0.111913361, 208, 1, 0)      
					TextLabel.Font = Enum.Font.GothamSemibold      
					TextLabel.Text = text      
					TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200)      
					TextLabel.TextSize = 13.000      
					TextLabel.TextXAlignment = Enum.TextXAlignment.Left      

					local function update() 
						if Element.value.Toggle then 
							tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageColor3 = Color3.fromRGB(255, 255, 255)}) 
							Color.Image = "http://www.roblox.com/asset/?id=8447574633"
							library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(200, 200, 200)}) 
						else 
							keybindremove(text) 
							tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageColor3 = Color3.fromRGB(255, 255, 255)}) 
							Color.Image = "http://www.roblox.com/asset/?id=8447573665"
							library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(200, 200, 200)}) 
						end 
						values[tabname][sectorname][text] = Element.value 
					end     

					Button.MouseButton1Down:Connect(function()      
						if not binding then      
							Element.value.Toggle = not Element.value.Toggle      
							update()      
							values[tabname][sectorname][text] = Element.value      
							callback(Element.value)      
						end      
					end)      
					if data.default then      
						update()      
					end      
					values[tabname][sectorname][text] = Element.value      
					do      
						local Keybind = Instance.new("TextButton")      
						local Frame = Instance.new("Frame")      
						local Always = Instance.new("TextButton")      
						local UIListLayout = Instance.new("UIListLayout")      
						local Hold = Instance.new("TextButton")      
						local Toggle = Instance.new("TextButton")      

							Keybind.Name = "Keybind" 
							Keybind.Parent = Button 
							Keybind.BackgroundColor3 = Color3.fromRGB(10, 14, 20) 
							Keybind.BorderColor3 = Color3.fromRGB(59, 116, 135) 
							Keybind.Position = UDim2.new(0, -10, 0.5, -6) 
							Keybind.Text = "None" 
							Keybind.Size = UDim2.new(0, 43, 0, 12) 
							Keybind.Size = UDim2.new(0,txt:GetTextSize("None", 14, Enum.Font.GothamSemibold, Vector2.new(700, 12)).X + 5,0, 12) 
							Keybind.AutoButtonColor = false 
							Keybind.Font = Enum.Font.GothamSemibold 
							Keybind.TextColor3 = Color3.fromRGB(200, 200, 200) 
							Keybind.TextSize = 13.000 
							Keybind.AnchorPoint = Vector2.new(1,0) 
							Keybind.ZIndex = 3 

							Frame.Parent = Keybind 
							Frame.BackgroundColor3 = Color3.fromRGB(10, 14, 20)  
							Frame.BorderColor3 = Color3.fromRGB(59, 116, 135) 
							Frame.Position = UDim2.new(1, -49, 0, 1) 
							Frame.Size = UDim2.new(0, 49, 0, 49) 
							Frame.Visible = false 
							Frame.ZIndex = 4 

							Always.Name = "Always" 
							Always.Parent = Frame 
							Always.BackgroundColor3 = Color3.fromRGB(10, 14, 20)  
							Always.BackgroundTransparency = 1.000 
							Always.BorderColor3 = Color3.fromRGB(10, 14, 20) 
							Always.Position = UDim2.new(-3.03289485, 231, 0.115384616, -6) 
							Always.Size = UDim2.new(1, 0, 0, 16) 
							Always.AutoButtonColor = false 
							Always.Font = Enum.Font.GothamSemibold 
							Always.Text = "Always" 
							Always.TextColor3 = Color3.fromRGB(59, 116, 135) 
							Always.TextSize = 13.000 
							Always.ZIndex = 5 

							UIListLayout.Parent = Frame 
							UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
							UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder 

							Hold.Name = "Hold" 
							Hold.Parent = Frame 
							Hold.BackgroundColor3 = Color3.fromRGB(10, 14, 20)  
							Hold.BackgroundTransparency = 1.000 
							Hold.BorderColor3 = Color3.fromRGB(10, 14, 20) 
							Hold.Position = UDim2.new(-3.03289485, 231, 0.115384616, -6) 
							Hold.Size = UDim2.new(1, 0, 0, 16) 
							Hold.AutoButtonColor = false 
							Hold.Font = Enum.Font.GothamSemibold 
							Hold.Text = "Hold" 
							Hold.TextColor3 = Color3.fromRGB(200, 200, 200) 
							Hold.TextSize = 13.000 
							Hold.ZIndex = 5

							Toggle.Name = "Toggle" 
							Toggle.Parent = Frame 
							Toggle.BackgroundColor3 = Color3.fromRGB(10, 14, 20)  
							Toggle.BackgroundTransparency = 1.000 
							Toggle.BorderColor3 = Color3.fromRGB(10, 14, 20) 
							Toggle.Position = UDim2.new(-3.03289485, 231, 0.115384616, -6) 
							Toggle.Size = UDim2.new(1, 0, 0, 16) 
							Toggle.AutoButtonColor = false 
							Toggle.Font = Enum.Font.GothamSemibold 
							Toggle.Text = "Toggle" 
							Toggle.TextColor3 = Color3.fromRGB(200, 200, 200) 
							Toggle.TextSize = 13.000 
							Toggle.ZIndex = 5      

							for _,button in next, Frame:GetChildren() do 
								if button:IsA("TextButton") then 
									button.MouseButton1Down:Connect(function() 
										Element.value.Type = button.Text 
										Frame.Visible = false 
										Element.value.Active = Element.value.Type == "Always" and true or false 
										if Element.value.Type == "Always" then 
											keybindadd(text) 
										end 
										for _,button in next, Frame:GetChildren() do 
											if button:IsA("TextButton") and button.Text ~= Element.value.Type then 
												button.Font = Enum.Font.GothamSemibold 
												library:Tween(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(200,200,200)}) 
											end 
										end 
										button.Font = Enum.Font.GothamSemibold 
										button.TextColor3 = Color3.fromRGB(59, 116, 135) 
										values[tabname][sectorname][text] = Element.value 
										callback(Element.value) 
									end) 
									button.MouseEnter:Connect(function() 
										if Element.value.Type ~= button.Text then 
											library:Tween(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(200, 200, 200)}) 
										end 
									end) 
									button.MouseLeave:Connect(function() 
										if Element.value.Type ~= button.Text then 
											library:Tween(button, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(200,200,200)}) 
										end 
									end) 
								end 
							end     
						Keybind.MouseButton1Down:Connect(function()      
							if not binding then      
								wait()      
								binding = true      
								Keybind.Text = "..."      
								Keybind.Size = UDim2.new(0,txt:GetTextSize("...", 14, Enum.Font.GothamSemibold, Vector2.new(700, 12)).X + 4,0, 12)      
							end      
						end)      
						Keybind.MouseButton2Down:Connect(function()      
							if not binding then      
								Frame.Visible = not Frame.Visible      
							end      
						end)      
						local Player = game.Players.LocalPlayer      
						local Mouse = Player:GetMouse()      
						local InFrame = false      
						Frame.MouseEnter:Connect(function()      
							InFrame = true      
						end)      
						Frame.MouseLeave:Connect(function()      
							InFrame = false      
						end)      
						local InFrame2 = false      
						Keybind.MouseEnter:Connect(function()      
							InFrame2 = true      
						end)      
						Keybind.MouseLeave:Connect(function()      
							InFrame2 = false      
						end)      
						game:GetService("UserInputService").InputBegan:Connect(function(input)      
							if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 and not binding then      
								if Frame.Visible == true and not InFrame and not InFrame2 then      
									Frame.Visible = false      
								end      
							end      
							if binding then      
								binding = false      
								Keybind.Text = input.KeyCode.Name ~= "Unknown" and input.KeyCode.Name:upper() or input.UserInputType.Name:upper()      
								Keybind.Size = UDim2.new(0,txt:GetTextSize(Keybind.Text, 14, Enum.Font.GothamSemibold, Vector2.new(700, 12)).X + 5,0, 12)      
								Element.value.Key = input.KeyCode.Name ~= "Unknown" and input.KeyCode.Name or input.UserInputType.Name      
								if input.KeyCode.Name == "Backspace" then      
									Keybind.Text = "None"      
									Keybind.Size = UDim2.new(0,txt:GetTextSize(Keybind.Text, 14, Enum.Font.GothamSemibold, Vector2.new(700, 12)).X + 4,0, 12)      
									Element.value.Key = nil      
									Element.value.Active = true      
								end      
								callback(Element.value)      
							else      
								if Element.value.Key ~= nil then      
									if string.find(Element.value.Key, "Mouse") then      
										if input.UserInputType == Enum.UserInputType[Element.value.Key] then      
											if Element.value.Type == "Hold" then      
												Element.value.Active = true      
												callback(Element.value)      
												if Element.value.Active and Element.value.Toggle then      
													keybindadd(text)      
												else      
													keybindremove(text)      
												end      
											elseif Element.value.Type == "Toggle" then      
												Element.value.Active = not Element.value.Active      
												callback(Element.value)      
												if Element.value.Active and Element.value.Toggle then      
													keybindadd(text)      
												else      
													keybindremove(text)      
												end      
											end      
										end      
									else      
										if input.KeyCode == Enum.KeyCode[Element.value.Key] then      
											if Element.value.Type == "Hold" then      
												Element.value.Active = true      
												callback(Element.value)      
												if Element.value.Active and Element.value.Toggle then      
													keybindadd(text)      
												else      
													keybindremove(text)      
												end      
											elseif Element.value.Type == "Toggle" then      
												Element.value.Active = not Element.value.Active      
												callback(Element.value)      
												if Element.value.Active and Element.value.Toggle then      
													keybindadd(text)      
												else      
													keybindremove(text)      
												end      
											end      
										end      
									end      
								else      
									Element.value.Active = true      
								end      
							end      
							values[tabname][sectorname][text] = Element.value      
						end)      
						game:GetService("UserInputService").InputEnded:Connect(function(input)      
							if Element.value.Key ~= nil then      
								if string.find(Element.value.Key, "Mouse") then      
									if input.UserInputType == Enum.UserInputType[Element.value.Key] then      
										if Element.value.Type == "Hold" then      
											Element.value.Active = false      
											callback(Element.value)      
											if Element.value.Active then      
												keybindadd(text)      
											else      
												keybindremove(text)      
											end      
										end      
									end      
								else      
									if input.KeyCode == Enum.KeyCode[Element.value.Key] then      
										if Element.value.Type == "Hold" then      
											Element.value.Active = false      
											callback(Element.value)      
											if Element.value.Active then      
												keybindadd(text)      
											else      
												keybindremove(text)      
											end      
										end      
									end      
								end      
							end      
							values[tabname][sectorname][text] = Element.value      
						end)      
					end      
					function Element:SetValue(value)      
						Element.value = value      
						update()      
					end      
				elseif type == "Toggle" then      
					Section.Size = Section.Size + UDim2.new(0,0,0,16)      
					Element.value = {Toggle = data.default and data.default.Toggle or false}      

					local Toggle = Instance.new("Frame")      
					local Button = Instance.new("TextButton")      
					local Color = Instance.new("ImageLabel")      
					local TextLabel = Instance.new("TextLabel")      

					Toggle.Name = "Toggle"      
					Toggle.Parent = Inner      
					Toggle.BackgroundColor3 = Color3.fromRGB(111, 222, 255)      
					Toggle.BackgroundTransparency = 1.000      
					Toggle.Size = UDim2.new(1, 0, 0, 15)      

					Button.Name = "Button" 
					Button.Parent = Toggle 
					Button.BackgroundColor3 = Color3.fromRGB(111, 222, 255) 
					Button.BackgroundTransparency = 1.000 
					Button.Size = UDim2.new(0, 27, 0, 13) 
					Button.Position = UDim2.new(0, 248, 0.5, -8)
					Button.Font = Enum.Font.Gotham 
					Button.Text = "" 
					Button.TextColor3 = Color3.fromRGB(10, 11, 13) 
					Button.TextSize = 13.000 
					Button.ZIndex = 10

					Color.Name = "Color" 
					Color.Parent = Button 
					Color.BackgroundColor3 = Color3.fromRGB(255, 255, 255) 
					Color.BackgroundTransparency = 1
					Color.BorderSizePixel = 0
					Color.Position = UDim2.new(0, 0, 0, 0) 
					Color.Size = UDim2.new(0, 27, 0, 13) 
					Color.Image = "http://www.roblox.com/asset/?id=8447573665"

					TextLabel.Parent = Button      
					TextLabel.BackgroundColor3 = Color3.fromRGB(111, 222, 255)      
					TextLabel.BackgroundTransparency = 1.000      
					TextLabel.Position = UDim2.new(0, -233, 0, -1)      
					TextLabel.Size = UDim2.new(0.111913361, 208, 1, 0)      
					TextLabel.Font = Enum.Font.GothamSemibold      
					TextLabel.Text = text      
					TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200)      
					TextLabel.TextSize = 13.000      
					TextLabel.TextXAlignment = Enum.TextXAlignment.Left      

					local function update() 
						if Element.value.Toggle then 
							tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageColor3 = Color3.fromRGB(255, 255, 255)}) 
							Color.Image = "http://www.roblox.com/asset/?id=8447574633"
							library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(200, 200, 200)}) 
						else 
							keybindremove(text) 
							tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageColor3 = Color3.fromRGB(255, 255, 255)}) 
							Color.Image = "http://www.roblox.com/asset/?id=8447573665"
							library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(200, 200, 200)}) 
						end 
						values[tabname][sectorname][text] = Element.value 
					end     

					Button.MouseButton1Down:Connect(function()      
						Element.value.Toggle = not Element.value.Toggle      
						update()      
						values[tabname][sectorname][text] = Element.value      
						callback(Element.value)      
					end)      
					if data.default then      
						update()      
					end      
					values[tabname][sectorname][text] = Element.value      
					function Element:SetValue(value)      
						Element.value = value      
						values[tabname][sectorname][text] = Element.value      
						update()      
						callback(Element.value)      
					end      
				elseif type == "ToggleColor" then      
					Section.Size = Section.Size + UDim2.new(0,0,0,16)      
					Element.value = {Toggle = data.default and data.default.Toggle or false, Color = data.default and data.default.Color or Color3.fromRGB(111, 222, 255)}      

					local Toggle = Instance.new("Frame")      
					local Button = Instance.new("TextButton")      
					local Color = Instance.new("ImageLabel")      
					local TextLabel = Instance.new("TextLabel")      

					Toggle.Name = "Toggle"      
					Toggle.Parent = Inner      
					Toggle.BackgroundColor3 = Color3.fromRGB(111, 222, 255)      
					Toggle.BackgroundTransparency = 1.000      
					Toggle.Size = UDim2.new(1, 0, 0, 15)      

					Button.Name = "Button" 
					Button.Parent = Toggle 
					Button.BackgroundColor3 = Color3.fromRGB(111, 222, 255) 
					Button.BackgroundTransparency = 1.000 
					Button.Size = UDim2.new(0, 27, 0, 13) 
					Button.Position = UDim2.new(0, 248, 0.5, -8)
					Button.Font = Enum.Font.Gotham 
					Button.Text = "" 
					Button.TextColor3 = Color3.fromRGB(10, 11, 13) 
					Button.TextSize = 13.000 
					Button.ZIndex = 10

					Color.Name = "Color" 
					Color.Parent = Button 
					Color.BackgroundColor3 = Color3.fromRGB(255, 255, 255) 
					Color.BackgroundTransparency = 1
					Color.BorderSizePixel = 0
					Color.Position = UDim2.new(0, 0, 0, 0) 
					Color.Size = UDim2.new(0, 27, 0, 13) 
					Color.Image = "http://www.roblox.com/asset/?id=8447573665"

					TextLabel.Parent = Button      
					TextLabel.BackgroundColor3 = Color3.fromRGB(111, 222, 255)      
					TextLabel.BackgroundTransparency = 1.000      
					TextLabel.Position = UDim2.new(0, -233, 0, -1)      
					TextLabel.Size = UDim2.new(0.111913361, 208, 1, 0)      
					TextLabel.Font = Enum.Font.GothamSemibold      
					TextLabel.Text = text      
					TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200)      
					TextLabel.TextSize = 13.000      
					TextLabel.TextXAlignment = Enum.TextXAlignment.Left      

					local function update() 
						if Element.value.Toggle then 
							tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageColor3 = Color3.fromRGB(255, 255, 255)}) 
							Color.Image = "http://www.roblox.com/asset/?id=8447574633"
							library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(200, 200, 200)}) 
						else 
							tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageColor3 = Color3.fromRGB(255, 255, 255)}) 
							Color.Image = "http://www.roblox.com/asset/?id=8447573665"
							library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(200, 200, 200)}) 
						end 
						values[tabname][sectorname][text] = Element.value 
					end     

					local ColorH,ColorS,ColorV      

					local ColorP = Instance.new("TextButton")      
					local Limage = Instance.new("ImageLabel")
					local Frame = Instance.new("Frame")      
					local Colorpick = Instance.new("ImageButton")      
					local ColorDrag = Instance.new("Frame")      
					local Huepick = Instance.new("ImageButton")      
					local Huedrag = Instance.new("Frame")      

					ColorP.Name = "ColorP"      
					ColorP.Parent = Button      
					ColorP.AnchorPoint = Vector2.new(1, 0)      
					ColorP.BackgroundColor3 = Color3.fromRGB(255, 0, 0)      
					ColorP.BorderColor3 = Color3.fromRGB(10, 14, 20)      
					ColorP.Position = UDim2.new(0, -16, 0.5, -4)      
					ColorP.Size = UDim2.new(0, 18, 0, 8)      
					ColorP.AutoButtonColor = false      
					ColorP.Font = Enum.Font.GothamSemibold      
					ColorP.Text = ""      
					ColorP.TextColor3 = Color3.fromRGB(200, 200, 200)      
					ColorP.TextSize = 13.000      
					
					Limage.Name = "Limage"
					Limage.Parent = ColorP
					Limage.BackgroundTransparency = 1
					Limage.Position = UDim2.new(0, 0, 0, 0)
					Limage.Size = UDim2.new(0, 18, 0, 8)
					Limage.Image = "http://www.roblox.com/asset/?id=8447576193"

					Frame.Parent = ColorP      
					Frame.BackgroundColor3 = Color3.fromRGB(10, 14, 20)       
					Frame.BorderColor3 = Color3.fromRGB(10, 14, 20)      
					Frame.Position = UDim2.new(-0.666666687, -170, 1.375, 0)      
					Frame.Size = UDim2.new(0, 200, 0, 170)      
					Frame.Visible = false      
					Frame.ZIndex = 3      

					Colorpick.Name = "Colorpick"      
					Colorpick.Parent = Frame      
					Colorpick.BackgroundColor3 = Color3.fromRGB(255, 255, 255)      
					Colorpick.BorderColor3 = Color3.fromRGB(10, 14, 20)      
					Colorpick.ClipsDescendants = false      
					Colorpick.Position = UDim2.new(0, 40, 0, 10)      
					Colorpick.Size = UDim2.new(0, 150, 0, 150)      
					Colorpick.AutoButtonColor = false      
					Colorpick.Image = "rbxassetid://4155801252"      
					Colorpick.ImageColor3 = Color3.fromRGB(255, 0, 0)      
					Colorpick.ZIndex = 3      

					ColorDrag.Name = "ColorDrag"      
					ColorDrag.Parent = Colorpick      
					ColorDrag.AnchorPoint = Vector2.new(0.5, 0.5)      
					ColorDrag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)      
					ColorDrag.BorderColor3 = Color3.fromRGB(10, 14, 20)      
					ColorDrag.Size = UDim2.new(0, 4, 0, 4)      
					ColorDrag.ZIndex = 3      

					Huepick.Name = "Huepick"      
					Huepick.Parent = Frame      
					Huepick.BackgroundColor3 = Color3.fromRGB(255, 255, 255)      
					Huepick.BorderColor3 = Color3.fromRGB(10, 14, 20)      
					Huepick.ClipsDescendants = false      
					Huepick.Position = UDim2.new(0, 10, 0, 10)      
					Huepick.Size = UDim2.new(0, 20, 0, 150)      
					Huepick.AutoButtonColor = false      
					Huepick.Image = "rbxassetid://3641079629"      
					Huepick.ImageColor3 = Color3.fromRGB(255, 0, 0)      
					Huepick.ImageTransparency = 1      
					Huepick.BackgroundTransparency = 0      
					Huepick.ZIndex = 3      

					local HueFrameGradient = Instance.new("UIGradient")      
					HueFrameGradient.Rotation = 90      
					HueFrameGradient.Name = "HueFrameGradient"      
					HueFrameGradient.Parent = Huepick      
					HueFrameGradient.Color = ColorSequence.new {      
						ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)),      
						ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 0, 255)),      
						ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 0, 255)),      
						ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 255, 255)),      
						ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 255, 0)),      
						ColorSequenceKeypoint.new(0.83, Color3.fromRGB(255, 255, 0)),      
						ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 0))      
					}	      

					Huedrag.Name = "Huedrag"      
					Huedrag.Parent = Huepick      
					Huedrag.BackgroundColor3 = Color3.fromRGB(111, 222, 255)      
					Huedrag.BorderColor3 = Color3.fromRGB(10, 14, 20)      
					Huedrag.Size = UDim2.new(1, 0, 0, 2)      
					Huedrag.ZIndex = 3      

					ColorP.MouseButton1Down:Connect(function()      
						Frame.Visible = not Frame.Visible      
					end)      
					local abc = false      
					local inCP = false      
					ColorP.MouseEnter:Connect(function()      
						abc = true      
					end)      
					ColorP.MouseLeave:Connect(function()      
						abc = false      
					end)      
					Frame.MouseEnter:Connect(function()      
						inCP = true      
					end)      
					Frame.MouseLeave:Connect(function()      
						inCP = false      
					end)      

					ColorH = (math.clamp(Huedrag.AbsolutePosition.Y-Huepick.AbsolutePosition.Y, 0, Huepick.AbsoluteSize.Y)/Huepick.AbsoluteSize.Y)      
					ColorS = 1-(math.clamp(ColorDrag.AbsolutePosition.X-Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X)/Colorpick.AbsoluteSize.X)      
					ColorV = 1-(math.clamp(ColorDrag.AbsolutePosition.Y-Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y)/Colorpick.AbsoluteSize.Y)      

					if data.default and data.default.Color ~= nil then      
						ColorH, ColorS, ColorV = data.default.Color:ToHSV()      

						ColorH = math.clamp(ColorH,0,1)      
						ColorS = math.clamp(ColorS,0,1)      
						ColorV = math.clamp(ColorV,0,1)      
						ColorDrag.Position = UDim2.new(1-ColorS,0,1-ColorV,0)      
						Colorpick.ImageColor3 = Color3.fromHSV(ColorH, 1, 1)      

						ColorP.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)      
						Huedrag.Position = UDim2.new(0, 0, 1-ColorH, -1)      

						values[tabname][sectorname][text] = data.default.Color      
					end      

					local mouse = LocalPlayer:GetMouse()      
					game:GetService("UserInputService").InputBegan:Connect(function(input)      
						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then      
							if not dragging and not abc and not inCP then      
								Frame.Visible = false      
							end      
						end      
					end)      

					local function updateColor()      
						local ColorX = (math.clamp(mouse.X - Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X)/Colorpick.AbsoluteSize.X)      
						local ColorY = (math.clamp(mouse.Y - Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y)/Colorpick.AbsoluteSize.Y)      
						ColorDrag.Position = UDim2.new(ColorX, 0, ColorY, 0)      
						ColorS = 1-ColorX      
						ColorV = 1-ColorY      
						Colorpick.ImageColor3 = Color3.fromHSV(ColorH, 1, 1)      
						ColorP.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)      
						values[tabname][sectorname][text] = Element.value      
						Element.value.Color = Color3.fromHSV(ColorH, ColorS, ColorV)      
						callback(Element.value)      
					end      
					local function updateHue()      
						local y = math.clamp(mouse.Y - Huepick.AbsolutePosition.Y, 0, 148)      
						Huedrag.Position = UDim2.new(0, 0, 0, y)      
						hue = y/148      
						ColorH = 1-hue      
						Colorpick.ImageColor3 = Color3.fromHSV(ColorH, 1, 1)      
						ColorP.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)      
						values[tabname][sectorname][text] = Element.value      
						Element.value.Color = Color3.fromHSV(ColorH, ColorS, ColorV)      
						callback(Element.value)      
					end      
					Colorpick.MouseButton1Down:Connect(function()      
						updateColor()      
						moveconnection = mouse.Move:Connect(function()      
							updateColor()      
						end)      
						releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse)      
							if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then      
								updateColor()      
								moveconnection:Disconnect()      
								releaseconnection:Disconnect()      
							end      
						end)      
					end)      
					Huepick.MouseButton1Down:Connect(function()      
						updateHue()      
						moveconnection = mouse.Move:Connect(function()      
							updateHue()      
						end)      
						releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse)      
							if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then      
								updateHue()      
								moveconnection:Disconnect()      
								releaseconnection:Disconnect()      
							end      
						end)      
					end)      

					Button.MouseButton1Down:Connect(function()      
						Element.value.Toggle = not Element.value.Toggle      
						update()      
						values[tabname][sectorname][text] = Element.value      
						callback(Element.value)      
					end)      
					if data.default then      
						update()      
					end      
					values[tabname][sectorname][text] = Element.value      
					function Element:SetValue(value)      
						Element.value = value      
						local duplicate = Color3.new(value.Color.R, value.Color.G, value.Color.B)      
						ColorH, ColorS, ColorV = duplicate:ToHSV()      
						ColorH = math.clamp(ColorH,0,1)      
						ColorS = math.clamp(ColorS,0,1)      
						ColorV = math.clamp(ColorV,0,1)      

						ColorDrag.Position = UDim2.new(1-ColorS,0,1-ColorV,0)      
						Colorpick.ImageColor3 = Color3.fromHSV(ColorH, 1, 1)      
						ColorP.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)      
						update()      
						Huedrag.Position = UDim2.new(0, 0, 1-ColorH, -1)      

						callback(value)      
					end      
				elseif type == "ToggleTrans" then      
					Section.Size = Section.Size + UDim2.new(0,0,0,16)      
					Element.value = {Toggle = data.default and data.default.Toggle or false, Color = data.default and data.default.Color or Color3.fromRGB(111, 222, 255), Transparency = data.default and data.default.Transparency or 0}      

					local Toggle = Instance.new("Frame")      
					local Button = Instance.new("TextButton")      
					local Color = Instance.new("ImageLabel")      
					local TextLabel = Instance.new("TextLabel")      

					Toggle.Name = "Toggle"      
					Toggle.Parent = Inner      
					Toggle.BackgroundColor3 = Color3.fromRGB(111, 222, 255)      
					Toggle.BackgroundTransparency = 1.000      
					Toggle.Size = UDim2.new(1, 0, 0, 15)      

					Button.Name = "Button" 
					Button.Parent = Toggle 
					Button.BackgroundColor3 = Color3.fromRGB(111, 222, 255) 
					Button.BackgroundTransparency = 1.000 
					Button.Size = UDim2.new(0, 27, 0, 13) 
					Button.Position = UDim2.new(0, 248, 0.5, -8)
					Button.Font = Enum.Font.Gotham 
					Button.Text = "" 
					Button.TextColor3 = Color3.fromRGB(10, 11, 13) 
					Button.TextSize = 13.000 
					Button.ZIndex = 10

					Color.Name = "Color" 
					Color.Parent = Button 
					Color.BackgroundColor3 = Color3.fromRGB(255, 255, 255) 
					Color.BackgroundTransparency = 1
					Color.BorderSizePixel = 0
					Color.Position = UDim2.new(0, 0, 0, 0) 
					Color.Size = UDim2.new(0, 27, 0, 13) 
					Color.Image = "http://www.roblox.com/asset/?id=8447573665"

					TextLabel.Parent = Button      
					TextLabel.BackgroundColor3 = Color3.fromRGB(111, 222, 255)      
					TextLabel.BackgroundTransparency = 1.000      
					TextLabel.Position = UDim2.new(0, -233, 0, -1)      
					TextLabel.Size = UDim2.new(0.111913361, 208, 1, 0)      
					TextLabel.Font = Enum.Font.GothamSemibold      
					TextLabel.Text = text      
					TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200)      
					TextLabel.TextSize = 13.000      
					TextLabel.TextXAlignment = Enum.TextXAlignment.Left      

					local function update() 
						if Element.value.Toggle then 
							tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageColor3 = Color3.fromRGB(255, 255, 255)}) 
							Color.Image = "http://www.roblox.com/asset/?id=8447574633"
							library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(200, 200, 200)}) 
						else 
							tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageColor3 = Color3.fromRGB(255, 255, 255)}) 
							Color.Image = "http://www.roblox.com/asset/?id=8447573665"
							library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(200, 200, 200)}) 
						end 
						values[tabname][sectorname][text] = Element.value 
						callback(Element.value)  
					end       

					local ColorH,ColorS,ColorV      

					local ColorP = Instance.new("TextButton")      
					local Limage = Instance.new("ImageLabel")
					local Frame = Instance.new("Frame")      
					local Colorpick = Instance.new("ImageButton")      
					local ColorDrag = Instance.new("Frame")      
					local Huepick = Instance.new("ImageButton")      
					local Huedrag = Instance.new("Frame")      

					ColorP.Name = "ColorP"      
					ColorP.Parent = Button      
					ColorP.AnchorPoint = Vector2.new(1, 0)      
					ColorP.BackgroundColor3 = Color3.fromRGB(255, 0, 0)      
					ColorP.BorderColor3 = Color3.fromRGB(10, 14, 20)      
					ColorP.Position = UDim2.new(0, -16, 0.5, -4)      
					ColorP.Size = UDim2.new(0, 18, 0, 8)      
					ColorP.AutoButtonColor = false      
					ColorP.Font = Enum.Font.GothamSemibold      
					ColorP.Text = ""      
					ColorP.TextColor3 = Color3.fromRGB(200, 200, 200)      
					ColorP.TextSize = 13.000      
					
					Limage.Name = "Limage"
					Limage.Parent = ColorP
					Limage.BackgroundTransparency = 1
					Limage.Position = UDim2.new(0, 0, 0, 0)
					Limage.Size = UDim2.new(0, 18, 0, 8)
					Limage.Image = "http://www.roblox.com/asset/?id=8447576193"

					Frame.Parent = ColorP      
					Frame.BackgroundColor3 = Color3.fromRGB(10, 14, 20)      
					Frame.BorderColor3 = Color3.fromRGB(10, 14, 20)      
					Frame.Position = UDim2.new(-0.666666687, -170, 1.375, 0)      
					Frame.Size = UDim2.new(0, 200, 0, 190)      
					Frame.Visible = false      
					Frame.ZIndex = 3      

					Colorpick.Name = "Colorpick"      
					Colorpick.Parent = Frame      
					Colorpick.BackgroundColor3 = Color3.fromRGB(200, 200, 200)      
					Colorpick.BorderColor3 = Color3.fromRGB(10, 14, 20)      
					Colorpick.ClipsDescendants = false      
					Colorpick.Position = UDim2.new(0, 40, 0, 10)      
					Colorpick.Size = UDim2.new(0, 150, 0, 150)      
					Colorpick.AutoButtonColor = false      
					Colorpick.Image = "rbxassetid://4155801252"      
					Colorpick.ImageColor3 = Color3.fromRGB(255, 0, 0)      
					Colorpick.ZIndex = 3      

					ColorDrag.Name = "ColorDrag"      
					ColorDrag.Parent = Colorpick      
					ColorDrag.AnchorPoint = Vector2.new(0.5, 0.5)      
					ColorDrag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)      
					ColorDrag.BorderColor3 = Color3.fromRGB(10, 14, 20)      
					ColorDrag.Size = UDim2.new(0, 4, 0, 4)      
					ColorDrag.ZIndex = 3      

					Huepick.Name = "Huepick"      
					Huepick.Parent = Frame      
					Huepick.BackgroundColor3 = Color3.fromRGB(255, 255, 255)      
					Huepick.BorderColor3 = Color3.fromRGB(10, 14, 20)      
					Huepick.ClipsDescendants = true      
					Huepick.Position = UDim2.new(0, 10, 0, 10)      
					Huepick.Size = UDim2.new(0, 20, 0, 150)      
					Huepick.AutoButtonColor = false      
					Huepick.Image = "rbxassetid://3641079629"      
					Huepick.ImageColor3 = Color3.fromRGB(255, 0, 0)      
					Huepick.ImageTransparency = 1      
					Huepick.BackgroundTransparency = 0      
					Huepick.ZIndex = 3      

					local HueFrameGradient = Instance.new("UIGradient")      
					HueFrameGradient.Rotation = 90      
					HueFrameGradient.Name = "HueFrameGradient"      
					HueFrameGradient.Parent = Huepick      
					HueFrameGradient.Color = ColorSequence.new {      
						ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 0)),      
						ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 0, 255)),      
						ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 0, 255)),      
						ColorSequenceKeypoint.new(0.50, Color3.fromRGB(0, 255, 255)),      
						ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 255, 0)),      
						ColorSequenceKeypoint.new(0.83, Color3.fromRGB(255, 255, 0)),      
						ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 0))      
					}	      

					Huedrag.Name = "Huedrag"      
					Huedrag.Parent = Huepick      
					Huedrag.BackgroundColor3 = Color3.fromRGB(111, 222, 255)      
					Huedrag.BorderColor3 = Color3.fromRGB(10, 14, 20)      
					Huedrag.Size = UDim2.new(1, 0, 0, 2)      
					Huedrag.ZIndex = 3      

					local Transpick = Instance.new("ImageButton")      
					local Transcolor = Instance.new("ImageLabel")      
					local Transdrag = Instance.new("Frame")      

					Transpick.Name = "Transpick"      
					Transpick.Parent = Frame      
					Transpick.BackgroundColor3 = Color3.fromRGB(111, 222, 255)      
					Transpick.BorderColor3 = Color3.fromRGB(10, 14, 20)      
					Transpick.Position = UDim2.new(0, 10, 0, 167)      
					Transpick.Size = UDim2.new(0, 180, 0, 15)      
					Transpick.AutoButtonColor = false      
					Transpick.Image = "rbxassetid://3887014957"      
					Transpick.ScaleType = Enum.ScaleType.Tile      
					Transpick.TileSize = UDim2.new(0, 10, 0, 10)      
					Transpick.ZIndex = 3      

					Transcolor.Name = "Transcolor"      
					Transcolor.Parent = Transpick      
					Transcolor.BackgroundColor3 = Color3.fromRGB(111, 222, 255)      
					Transcolor.BackgroundTransparency = 1.000      
					Transcolor.Size = UDim2.new(1, 0, 1, 0)      
					Transcolor.Image = "rbxassetid://3887017050"      
					Transcolor.ImageColor3 = Color3.fromRGB(255, 0, 4)      
					Transcolor.ZIndex = 3      

					Transdrag.Name = "Transdrag"      
					Transdrag.Parent = Transcolor      
					Transdrag.BackgroundColor3 = Color3.fromRGB(111, 222, 255)      
					Transdrag.BorderColor3 = Color3.fromRGB(10, 14, 20)      
					Transdrag.Position = UDim2.new(0, -1, 0, 0)      
					Transdrag.Size = UDim2.new(0, 2, 1, 0)      
					Transdrag.ZIndex = 3      

					ColorP.MouseButton1Down:Connect(function()      
						Frame.Visible = not Frame.Visible      
					end)      
					local abc = false      
					local inCP = false      
					ColorP.MouseEnter:Connect(function()      
						abc = true      
					end)      
					ColorP.MouseLeave:Connect(function()      
						abc = false      
					end)      
					Frame.MouseEnter:Connect(function()      
						inCP = true      
					end)      
					Frame.MouseLeave:Connect(function()      
						inCP = false      
					end)      

					ColorH = (math.clamp(Huedrag.AbsolutePosition.Y-Huepick.AbsolutePosition.Y, 0, Huepick.AbsoluteSize.Y)/Huepick.AbsoluteSize.Y)      
					ColorS = 1-(math.clamp(ColorDrag.AbsolutePosition.X-Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X)/Colorpick.AbsoluteSize.X)      
					ColorV = 1-(math.clamp(ColorDrag.AbsolutePosition.Y-Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y)/Colorpick.AbsoluteSize.Y)      

					if data.default and data.default.Color ~= nil then      
						ColorH, ColorS, ColorV = data.default.Color:ToHSV()      

						ColorH = math.clamp(ColorH,0,1)      
						ColorS = math.clamp(ColorS,0,1)      
						ColorV = math.clamp(ColorV,0,1)      
						ColorDrag.Position = UDim2.new(1-ColorS,0,1-ColorV,0)      
						Colorpick.ImageColor3 = Color3.fromHSV(ColorH, 1, 1)      

						Transcolor.ImageColor3 = Color3.fromHSV(ColorH, 1, 1)      

						ColorP.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)      
						Huedrag.Position = UDim2.new(0, 0, 1-ColorH, -1)      
					end      
					if data.default and data.default.Transparency ~= nil then      
						Transdrag.Position = UDim2.new(data.default.Transparency, -1, 0, 0)      
					end      
					local mouse = LocalPlayer:GetMouse()      
					game:GetService("UserInputService").InputBegan:Connect(function(input)      
						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then      
							if not dragging and not abc and not inCP then      
								Frame.Visible = false      
							end      
						end      
					end)      

					local function updateColor()      
						local ColorX = (math.clamp(mouse.X - Colorpick.AbsolutePosition.X, 0, Colorpick.AbsoluteSize.X)/Colorpick.AbsoluteSize.X)      
						local ColorY = (math.clamp(mouse.Y - Colorpick.AbsolutePosition.Y, 0, Colorpick.AbsoluteSize.Y)/Colorpick.AbsoluteSize.Y)      
						ColorDrag.Position = UDim2.new(ColorX, 0, ColorY, 0)      
						ColorS = 1-ColorX      
						ColorV = 1-ColorY      
						Colorpick.ImageColor3 = Color3.fromHSV(ColorH, 1, 1)      
						ColorP.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)      
						Transcolor.ImageColor3 = Color3.fromHSV(ColorH, 1, 1)      
						values[tabname][sectorname][text] = Element.value      
						Element.value.Color = Color3.fromHSV(ColorH, ColorS, ColorV)      
						callback(Element.value)      
					end      
					local function updateHue()      
						local y = math.clamp(mouse.Y - Huepick.AbsolutePosition.Y, 0, 148)      
						Huedrag.Position = UDim2.new(0, 0, 0, y)      
						hue = y/148      
						ColorH = 1-hue      
						Colorpick.ImageColor3 = Color3.fromHSV(ColorH, 1, 1)      
						Transcolor.ImageColor3 = Color3.fromHSV(ColorH, 1, 1)      
						ColorP.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)      
						values[tabname][sectorname][text] = Element.value      
						Element.value.Color = Color3.fromHSV(ColorH, ColorS, ColorV)      
						callback(Element.value)      
					end      
					local function updateTrans()      
						local x = math.clamp(mouse.X - Transpick.AbsolutePosition.X, 0, 178)      
						Transdrag.Position = UDim2.new(0, x, 0, 0)      
						Element.value.Transparency = (x/178)      
						values[tabname][sectorname][text] = Element.value      
						callback(Element.value)
					end 
					Transpick.MouseButton1Down:Connect(function() 
						updateTrans() 
						moveconnection = mouse.Move:Connect(function() 
							updateTrans() 
						end) 
						releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse) 
							if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then 
								updateTrans() 
								moveconnection:Disconnect() 
								releaseconnection:Disconnect() 
							end 
						end) 
					end) 
					Colorpick.MouseButton1Down:Connect(function() 
						updateColor() 
						moveconnection = mouse.Move:Connect(function() 
							updateColor() 
						end) 
						releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse) 
							if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then 
								updateColor() 
								moveconnection:Disconnect() 
								releaseconnection:Disconnect() 
							end 
						end) 
					end) 
					Huepick.MouseButton1Down:Connect(function() 
						updateHue() 
						moveconnection = mouse.Move:Connect(function() 
							updateHue() 
						end) 
						releaseconnection = game:GetService("UserInputService").InputEnded:Connect(function(Mouse) 
							if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then 
								updateHue() 
								moveconnection:Disconnect() 
								releaseconnection:Disconnect() 
							end 
						end) 
					end) 

					Button.MouseButton1Down:Connect(function() 
						Element.value.Toggle = not Element.value.Toggle 
						update() 
						values[tabname][sectorname][text] = Element.value 
						callback(Element.value) 
					end) 
					if data.default then 
						if Element.value.Toggle then 
							tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(111, 222, 255)}) 
							library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(200, 200, 200)}) 
						else 
							tween = library:Tween(Color, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(10, 14, 20) }) 
							library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(200, 200, 200)}) 
						end 
						values[tabname][sectorname][text] = Element.value 
					end 
					values[tabname][sectorname][text] = Element.value 
					function Element:SetValue(value) 
						Element.value = value 
						local duplicate = Color3.new(value.Color.R, value.Color.G, value.Color.B) 
						ColorH, ColorS, ColorV = duplicate:ToHSV() 
						ColorH = math.clamp(ColorH,0,1) 
						ColorS = math.clamp(ColorS,0,1) 
						ColorV = math.clamp(ColorV,0,1) 

						ColorDrag.Position = UDim2.new(1-ColorS,0,1-ColorV,0) 
						Colorpick.ImageColor3 = Color3.fromHSV(ColorH, 1, 1) 
						ColorP.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV) 
						update() 
						Huedrag.Position = UDim2.new(0, 0, 1-ColorH, -1) 
					end 
				elseif type == "TextBox" then 
					Section.Size = Section.Size + UDim2.new(0,0,0,30) 
					Element.value = {Text = data.default and data.default.text or ""} 

					local Box = Instance.new("Frame") 
					local TextBox = Instance.new("TextBox") 

					Box.Name = "Box" 
					Box.Parent = Inner 
					Box.BackgroundColor3 = Color3.fromRGB(111, 222, 255) 
					Box.BackgroundTransparency = 1.000 
					Box.Position = UDim2.new(0, 0, 0.542059898, 0) 
					Box.Size = UDim2.new(1, 0, 0, 30) 

					TextBox.Parent = Box 
					TextBox.BackgroundColor3 = Color3.fromRGB(10, 14, 20)  
					TextBox.BorderColor3 = Color3.fromRGB(59, 116, 135)  
					TextBox.Position = UDim2.new(0.108303241, 0, 0.224465579, 0) 
					TextBox.Size = UDim2.new(0, 220, 0, 20) 
					TextBox.Font = Enum.Font.Gotham 
					TextBox.PlaceholderText = data.placeholder 
					TextBox.Text = Element.value.Text 
					TextBox.TextColor3 = Color3.fromRGB(200, 200, 200) 
					TextBox.TextSize = 13.000 

					values[tabname][sectorname][text] = Element.value 

					TextBox:GetPropertyChangedSignal("Text"):Connect(function() 
						if string.len(TextBox.Text) > 20 then 
							TextBox.Text = string.sub(TextBox.Text, 1, 20) 
						end 
						Element.value.Text = TextBox.Text 
						values[tabname][sectorname][text] = Element.value 
						callback(Element.value) 
					end) 

					function Element:SetValue(value) 
						Element.value = value 
						values[tabname][sectorname][text] = Element.value 
						TextBox.Text = Element.value.Text 
					end 

				elseif type == "Dropdown" then 
					Section.Size = Section.Size + UDim2.new(0,0,0,16) 
					Element.value = {Dropdown = data.options[1]} 

					local Dropdown = Instance.new("Frame") 
					local Button = Instance.new("TextButton") 
					local TextLabel = Instance.new("TextLabel") 
					local Drop = Instance.new("ScrollingFrame") 
					local Button_2 = Instance.new("TextButton") 
					local TextLabel_2 = Instance.new("TextLabel") 
					local UIListLayout = Instance.new("UIListLayout") 
					local ImageLabel = Instance.new("ImageLabel") 
					local TextLabel_3 = Instance.new("TextLabel") 

					Dropdown.Name = "Dropdown" 
					Dropdown.Parent = Inner 
					Dropdown.BackgroundColor3 = Color3.fromRGB(111, 222, 255) 
					Dropdown.BackgroundTransparency = 1.000 
					Dropdown.Position = UDim2.new(0, 0, 0.255102038, 0) 
					Dropdown.Size = UDim2.new(1, 0, 0, 15) 

					Button.Name = "Button" 
					Button.Parent = Dropdown 
					Button.BackgroundColor3 = Color3.fromRGB(10, 14, 20)  
					Button.BorderColor3 = Color3.fromRGB(59, 116, 135) 
					Button.Position = UDim2.new(0, 115, 0, -1) 
					Button.Size = UDim2.new(0, 160, 0, 12) 
					Button.AutoButtonColor = false 
					Button.Font = Enum.Font.Gotham 
					Button.Text = "" 
					Button.TextColor3 = Color3.fromRGB(12, 12, 12) 
					Button.TextSize = 13.000 

					TextLabel.Parent = Button 
					TextLabel.BackgroundColor3 = Color3.fromRGB(111, 222, 255) 
					TextLabel.BackgroundTransparency = 1.000 
					TextLabel.BorderColor3 = Color3.fromRGB(10, 14, 20) 
					TextLabel.Position = UDim2.new(0, 5, 0, 0) 
					TextLabel.Size = UDim2.new(-0.21714285, 208, 1, 0) 
					TextLabel.Font = Enum.Font.GothamSemibold 
					TextLabel.Text = Element.value.Dropdown 
					TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200) 
					TextLabel.TextSize = 13.000 
					TextLabel.TextXAlignment = Enum.TextXAlignment.Left 

					local abcd = TextLabel 

					Drop.Name = "Drop" 
					Drop.Parent = Button 
					Drop.Active = true 
					Drop.BackgroundColor3 = Color3.fromRGB(10, 14, 20)  
					Drop.BorderColor3 = Color3.fromRGB(59, 116, 135) 
					Drop.Position = UDim2.new(0, 0, 1, 1) 
					Drop.Size = UDim2.new(1, 0, 0, 20) 
					Drop.Visible = false 
					Drop.BottomImage = "http://www.roblox.com/asset/?id=6724808282" 
					Drop.CanvasSize = UDim2.new(1, 1, 1, 1) 
					Drop.ScrollBarThickness = 0 
					Drop.TopImage = "http://www.roblox.com/asset/?id=6724808282" 
					Drop.MidImage = "http://www.roblox.com/asset/?id=6724808282" 
					Drop.AutomaticCanvasSize = "Y" 
					Drop.ZIndex = 5 
					Drop.ScrollBarImageColor3 = Color3.fromRGB(111, 222, 255) 

					UIListLayout.Parent = Drop 
					UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center 
					UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder 

					local num = #data.options 
					if num > 5 then 
						Drop.Size = UDim2.new(1, 0, 0, 85) 
					else 
						Drop.Size = UDim2.new(1, 0, 0, 17*num) 
					end 
					local first = true 
					for i,v in next, data.options do 
						do 
							local Button = Instance.new("TextButton") 
							local TextLabel = Instance.new("TextLabel") 

							Button.Name = v 
							Button.Parent = Drop 
							Button.BackgroundColor3 = Color3.fromRGB(10, 14, 20)  
							Button.BorderColor3 = Color3.fromRGB(59, 116, 135) 
							Button.Position = UDim2.new(0, 30, 0, 16) 
							Button.Size = UDim2.new(0, 160, 0, 17) 
							Button.AutoButtonColor = false 
							Button.Font = Enum.Font.Gotham 
							Button.Text = "" 
							Button.TextColor3 = Color3.fromRGB(12, 12, 12) 
							Button.TextSize = 13.000 
							Button.BorderSizePixel = 0 
							Button.ZIndex = 6 

							TextLabel.Parent = Button 
							TextLabel.BackgroundColor3 = Color3.fromRGB(111, 222, 255) 
							TextLabel.BackgroundTransparency = 1.000 
							TextLabel.BorderColor3 = Color3.fromRGB(10, 14, 20) 
							TextLabel.Position = UDim2.new(0, -5, 0, -1) 
							TextLabel.Size = UDim2.new(-0.21714285, 208, 1, 0) 
							TextLabel.Font = Enum.Font.GothamSemibold 
							TextLabel.Text = v 
							TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200) 
							TextLabel.TextSize = 13.000 
							TextLabel.TextXAlignment = Enum.TextXAlignment.Center 
							TextLabel.ZIndex = 6 

							Button.MouseButton1Down:Connect(function() 
								Drop.Visible = false 
								Element.value.Dropdown = v 
								abcd.Text = v 
								values[tabname][sectorname][text] = Element.value 
								callback(Element.value) 
								Drop.CanvasPosition = Vector2.new(0,0) 
							end) 
							Button.MouseEnter:Connect(function() 
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  Color3.fromRGB(200, 200, 200)}) 
							end) 
							Button.MouseLeave:Connect(function() 
								library:Tween(TextLabel, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 =  Color3.fromRGB(200, 200, 200)}) 
							end) 

							first = false 
						end 
					end 

					function Element:SetValue(val) 
						Element.value = val 
						abcd.Text = val.Dropdown 
						values[tabname][sectorname][text] = Element.value 
						callback(val) 
					end 

					ImageLabel.Parent = Button 
					ImageLabel.BackgroundColor3 = Color3.fromRGB(111, 222, 255) 
					ImageLabel.BackgroundTransparency = 1.000 
					ImageLabel.Position = UDim2.new(0, 145, 0, 4) 
					ImageLabel.Size = UDim2.new(0, 6, 0, 4) 
					ImageLabel.Image = "http://www.roblox.com/asset/?id=6724771531" 

					TextLabel_3.Parent = Dropdown 
					TextLabel_3.BackgroundColor3 = Color3.fromRGB(111, 222, 255) 
					TextLabel_3.BackgroundTransparency = 1.000 
					TextLabel_3.Position = UDim2.new(0, 15, 0, 3) 
					TextLabel_3.Size = UDim2.new(0.111913361, 208, 0.382215232, 0) 
					TextLabel_3.Font = Enum.Font.GothamSemibold 
					TextLabel_3.Text = text 
					TextLabel_3.TextColor3 = Color3.fromRGB(200, 200, 200) 
					TextLabel_3.TextSize = 13.000 
					TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left 

					Button.MouseButton1Down:Connect(function() 
						Drop.Visible = not Drop.Visible 
						if not Drop.Visible then 
							Drop.CanvasPosition = Vector2.new(0,0) 
						end 
					end) 
					local indrop = false 
					local ind = false 
					Drop.MouseEnter:Connect(function() 
						indrop = true 
					end) 
					Drop.MouseLeave:Connect(function() 
						indrop = false 
					end) 
					Button.MouseEnter:Connect(function() 
						ind = true 
					end) 
					Button.MouseLeave:Connect(function() 
						ind = false 
					end) 
					game:GetService("UserInputService").InputBegan:Connect(function(input) 
						if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then 
							if Drop.Visible == true and not indrop and not ind then 
								Drop.Visible = false 
								Drop.CanvasPosition = Vector2.new(0,0) 
							end 
						end 
					end) 
					values[tabname][sectorname][text] = Element.value 
				elseif type == "Slider" then 

					Section.Size = Section.Size + UDim2.new(0,0,0,15) 

					local Slider = Instance.new("Frame") 
					local TextLabel = Instance.new("TextLabel") 
					local Button = Instance.new("TextButton") 
					local Frame = Instance.new("Frame") 
					local Imagege = Instance.new("ImageLabel")
					local UIGradient = Instance.new("UIGradient") 
					local Value = Instance.new("TextLabel") 

					Slider.Name = "Slider" 
					Slider.Parent = Inner 
					Slider.BackgroundColor3 = Color3.fromRGB(111, 222, 255) 
					Slider.BackgroundTransparency = 1.000 
					Slider.Position = UDim2.new(0, 0, 0.653061211, 0) 
					Slider.Size = UDim2.new(1, 0, 0, 15) 

					TextLabel.Parent = Slider 
					TextLabel.BackgroundColor3 = Color3.fromRGB(111, 222, 255) 
					TextLabel.BackgroundTransparency = 1.000 
					TextLabel.Position = UDim2.new(0, 15, 0, -2) 
					TextLabel.Size = UDim2.new(0, 100, 0, 15) 
					TextLabel.Font = Enum.Font.GothamSemibold 
					TextLabel.Text = text 
					TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200) 
					TextLabel.TextSize = 13.000 
					TextLabel.TextXAlignment = Enum.TextXAlignment.Left 

					Button.Name = "Button" 
					Button.Parent = Slider 
					Button.BackgroundColor3 = Color3.fromRGB(30, 80, 110) 
					Button.BorderColor3 = Color3.fromRGB(59, 116, 135)  
					Button.BackgroundTransparency = 0.3 
					Button.Position = UDim2.new(0, 160, 0, 4) 
					Button.Size = UDim2.new(0, 80, 0, 3)
					Button.AutoButtonColor = false 
					Button.Font = Enum.Font.Gotham 
					Button.Text = "" 
					Button.TextColor3 = Color3.fromRGB(12, 12, 12) 
					Button.TextSize = 13.000 

					Frame.Parent = Button 
					Frame.BackgroundColor3 = Color3.fromRGB(111, 222, 255) 
					Frame.BackgroundTransparency = 0.3 
					Frame.BorderSizePixel = 0 
					Frame.Size = UDim2.new(0.5, 0, 1, 0) 
					
					Imagege.Name = "Imagege" 
					Imagege.Parent = Frame 
					Imagege.BackgroundColor3 = Color3.fromRGB(30, 80, 110) 
					Imagege.BorderSizePixel = 0  
					Imagege.Position = UDim2.new(0, -2, 0, -5) 
					Imagege.Size = UDim2.new(0, 13, 0, 13) 
					Imagege.Image = "http://www.roblox.com/asset/?id=8447575366"

					UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(111, 222, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(111, 222, 255))} 
					UIGradient.Rotation = 90 
					UIGradient.Parent = Frame 

					Value.Name = "Value" 
					Value.Parent = Slider 
					Value.BackgroundColor3 = Color3.fromRGB(10, 14, 20) 
					Value.BorderColor3 = Color3.fromRGB(59, 116, 135)
					Value.Position = UDim2.new(0, 250, 0, 0) 
					Value.Size = UDim2.new(0, 25, 0, 11) 
					Value.Font = Enum.Font.GothamSemibold 
					Value.Text = "50" 
					Value.TextColor3 = Color3.fromRGB(200, 200, 200) 
					Value.TextSize = 12
					Value.TextXAlignment = Enum.TextXAlignment.Center 
					local min, max, default = data.min or 0, data.max or 100, data.default or 0 
					Element.value = {Slider = default} 

					function Element:SetValue(value) 
						Element.value = value 
						local a 
						if min > 0 then 
							a = ((Element.value.Slider - min)) / (max-min)
						else 
							a = (Element.value.Slider-min)/(max-min)
						end 
						Value.Text = Element.value.Slider 
						Frame.Size = UDim2.new(a,0,1,0) 
						Imagege.Position = UDim2.new(0,(( a * 80 ) - 8 ),0,-5)
						values[tabname][sectorname][text] = Element.value 
						callback(value) 
					end 
					local a 
					if min > 0 then 
						a = ((Element.value.Slider - min)) / (max-min)
					else 
						a = (Element.value.Slider-min)/(max-min)
					end 
					Value.Text = Element.value.Slider 
					Frame.Size = UDim2.new(a,0,1,0) 
					Imagege.Position = UDim2.new(0,(( a * 80 ) - 8 ),0,-5)
					values[tabname][sectorname][text] = Element.value 
					local uis = game:GetService("UserInputService") 
					local mouse = game.Players.LocalPlayer:GetMouse() 
					local val 
					Button.MouseButton1Down:Connect(function() 
						Frame.Size = UDim2.new(0, math.clamp(mouse.X - Frame.AbsolutePosition.X, 0, 80), 0, 3) 
						Imagege.Position = UDim2.new(0, ( math.clamp(mouse.X - Frame.AbsolutePosition.X, 0, 80) - 7 ), 0, -5)
						val = math.floor((((tonumber(max) - tonumber(min)) / 80) * Frame.AbsoluteSize.X) + tonumber(min)) or 0 
						Value.Text = val 
						Element.value.Slider = val 
						values[tabname][sectorname][text] = Element.value 
						callback(Element.value) 
						moveconnection = mouse.Move:Connect(function() 
							Frame.Size = UDim2.new(0, math.clamp(mouse.X - Frame.AbsolutePosition.X, 0, 80), 0, 3)
							Imagege.Position = UDim2.new(0, ( math.clamp(mouse.X - Frame.AbsolutePosition.X, 0, 80) - 7 ), 0, -5)
							val = math.floor((((tonumber(max) - tonumber(min)) / 80) * Frame.AbsoluteSize.X) + tonumber(min)) 
							Value.Text = val 
							Element.value.Slider = val 
							values[tabname][sectorname][text] = Element.value 
							callback(Element.value) 
						end) 
						releaseconnection = uis.InputEnded:Connect(function(Mouse) 
							if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then 
								Frame.Size = UDim2.new(0, math.clamp(mouse.X - Frame.AbsolutePosition.X, 0, 80), 0, 3) 
								Imagege.Position = UDim2.new(0, ( math.clamp(mouse.X - Frame.AbsolutePosition.X, 0, 80) - 7 ), 0, -5)
								val = math.floor((((tonumber(max) - tonumber(min)) / 80) * Frame.AbsoluteSize.X) + tonumber(min)) 
								values[tabname][sectorname][text] = Element.value 
								callback(Element.value) 
								moveconnection:Disconnect() 
								releaseconnection:Disconnect() 
							end 
						end) 
					end) 
				elseif type == "Button" then 

					Section.Size = Section.Size + UDim2.new(0,0,0,24) 
					local Button = Instance.new("Frame") 
					local Button_2 = Instance.new("TextButton") 
					local TextLabel = Instance.new("TextLabel") 

					Button.Name = "Button" 
					Button.Parent = Inner 
					Button.BackgroundColor3 = Color3.fromRGB(111, 222, 255) 
					Button.BackgroundTransparency = 1.000 
					Button.Position = UDim2.new(0, 0, 0.236059487, 0) 
					Button.Size = UDim2.new(1, 0, 0, 24) 

					Button_2.Name = "Button" 
					Button_2.Parent = Button 
					Button_2.BackgroundColor3 = Color3.fromRGB(10, 14, 20)  
					Button_2.BorderColor3 = Color3.fromRGB(59, 116, 135) 
					Button_2.Position = UDim2.new(0, 30, 0.5, -9) 
					Button_2.Size = UDim2.new(0, 220, 0, 18) 
					Button_2.AutoButtonColor = false 
					Button_2.Font = Enum.Font.Gotham 
					Button_2.Text = "" 
					Button_2.TextColor3 = Color3.fromRGB(12, 12, 12) 
					Button_2.TextSize = 13.000 

					TextLabel.Parent = Button_2 
					TextLabel.BackgroundColor3 = Color3.fromRGB(111, 222, 255) 
					TextLabel.BackgroundTransparency = 1.000 
					TextLabel.BorderColor3 = Color3.fromRGB(10, 14, 20) 
					TextLabel.Size = UDim2.new(1, 0, 1, 0) 
					TextLabel.Font = Enum.Font.GothamSemibold 
					TextLabel.Text = text 
					TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200) 
					TextLabel.TextSize = 13.000 

					function Element:SetValue() 
					end 

					Button_2.MouseButton1Down:Connect(function() 
						TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200) 
						library:Tween(TextLabel, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(200, 200, 200)}) 
						callback() 
					end) 
					Button_2.MouseEnter:Connect(function() 
						library:Tween(TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(200, 200, 200)}) 
					end) 
					Button_2.MouseLeave:Connect(function() 
						library:Tween(TextLabel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(200, 200, 200)}) 
					end) 
				end 
				ConfigLoad:Connect(function(cfg) 
					pcall(function() 
						local fix = library:ConfigFix(cfg) 
						if fix[tabname][sectorname][text] ~= nil then 
							Element:SetValue(fix[tabname][sectorname][text]) 
						end 
					end) 
				end) 

				return Element 
			end 
			return Sector 
		end 

		return Tab 
	end 
	
	function menu:NTab(text) 
		local Frame = Instance.new("Frame") 
		Frame.BackgroundColor3 = Color3.fromRGB(28, 193, 255) 
		Frame.BackgroundTransparency = 1
		Frame.BorderSizePixel = 0
		Frame.Size = UDim2.new(0, 143, 0, 32)
		Frame.Parent = TabButtons  
	
		local TextLabel = Instance.new("TextLabel") 
		TextLabel.BackgroundColor3 = Color3.fromRGB(28, 193, 255) 
		TextLabel.BackgroundTransparency = 1
		TextLabel.BorderSizePixel = 0
		TextLabel.Position = UDim2.new(0, 10, 0, 0)
		TextLabel.Size = UDim2.new(0, 133, 0, 32)
		TextLabel.Font = Enum.Font.GothamSemibold 
		TextLabel.Text = text 
		TextLabel.TextColor3 = Color3.fromRGB(100, 120, 150) 
		TextLabel.TextSize = 14
		TextLabel.Parent = Frame  
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left

		return NTab 
	end 

	Npt.Parent = game.CoreGui 

	return menu 
end 

local UserInputService = game:GetService("UserInputService") 
local ReplicatedStorage = game:GetService("ReplicatedStorage") 
local RunService = game:GetService("RunService") 
local Lighting = game:GetService("Lighting") 
local Players = game:GetService("Players") 
local LocalPlayer = Players.LocalPlayer 
local PlayerGui = LocalPlayer.PlayerGui 
local Mouse = LocalPlayer:GetMouse() 
local Camera = workspace.CurrentCamera 
local ClientScript = LocalPlayer.PlayerGui.Client 
local Client = getsenv(ClientScript) 

repeat RunService.Heartbeat:Wait() until game:IsLoaded() 

local Crosshairs = PlayerGui.GUI.Crosshairs 
local Crosshair = PlayerGui.GUI.Crosshairs.Crosshair 
local oldcreatebullethole = Client.createbullethole 
local LGlove, RGlove, LSleeve, RSleeve, RArm, LArm 
local WeaponObj = {} 
local SelfObj = {} 
local Viewmodels =  ReplicatedStorage.Viewmodels 
local Weapons =  ReplicatedStorage.Weapons 
local ViewmodelOffset = CFrame.new(0,0,0) 
local Smokes = {} 
local Mollies = {} 
local RayIgnore = workspace.Ray_Ignore 
local RageTarget 
local GetIcon = require(game.ReplicatedStorage.GetIcon) 
local BodyVelocity = Instance.new("BodyVelocity") 
BodyVelocity.MaxForce = Vector3.new(math.huge, 0, math.huge) 
local Collision = {Camera, workspace.Ray_Ignore, workspace.Debris} 
local FakelagFolder = Instance.new("Folder", workspace) 
FakelagFolder.Name = "Fakelag" 
local FakeAnim = Instance.new("Animation", workspace) 
FakeAnim.AnimationId = "rbxassetid://0" 
local Gloves = ReplicatedStorage.Gloves 
if Gloves:FindFirstChild("ImageLabel") then 
	Gloves.ImageLabel:Destroy() 
end 
local GloveModels = Gloves.Models 
local Multipliers = { 
	["Head"] = 4, 
	["FakeHead"] = 4, 
	["HeadHB"] = 4, 
	["UpperTorso"] = 1, 
	["LowerTorso"] = 1.25, 
	["LeftUpperArm"] = 1, 
	["LeftLowerArm"] = 1, 
	["LeftHand"] = 1, 
	["RightUpperArm"] = 1, 
	["RightLowerArm"] = 1, 
	["RightHand"] = 1, 
	["LeftUpperLeg"] = 0.75, 
	["LeftLowerLeg"] = 0.75, 
	["LeftFoot"] = 0.75, 
	["RightUpperLeg"] = 0.75, 
	["RightLowerLeg"] = 0.75, 
	["RightFoot"] = 0.75, 
} 
local ChamItems = {} 
local Skyboxes = { 
	["minicraft"] = { 
		SkyboxLf = "rbxassetid://159454286", 
		SkyboxBk = "rbxassetid://71664975", 
		SkyboxDn = "rbxassetid://71669494", 
		SkyboxFt = "rbxassetid://71665049", 
		SkyboxLf = "rbxassetid://71665012", 
		SkyboxRt = "rbxassetid://71665012", 
		SkyboxUp = "rbxassetid://71669447", 
	}, 
	["rickroll"] = { 
		SkyboxLf = "rbxassetid://3617100", 
		SkyboxBk = "rbxassetid://3617100", 
		SkyboxDn = "rbxassetid://3617100", 
		SkyboxFt = "rbxassetid://3617100", 
		SkyboxLf = "rbxassetid://3617100", 
		SkyboxRt = "rbxassetid://3617100", 
		SkyboxUp = "rbxassetid://3617100", 
	}, 
	["cloudy skies"] = {
        SkyboxLf = "rbxassetid://252760980",
        SkyboxBk = "rbxassetid://252760981",
        SkyboxDn = "rbxassetid://252763035",
        SkyboxFt = "rbxassetid://252761439",
        SkyboxRt = "rbxassetid://252760986",
        SkyboxUp = "rbxassetid://252762652",
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
    ["Dababy"] = {
		SkyboxLf = "rbxassetid://7245418472",
		SkyboxBk = "rbxassetid://7245418472",
		SkyboxDn = "rbxassetid://7245418472",
		SkyboxFt = "rbxassetid://7245418472",
		SkyboxLf = "rbxassetid://7245418472",
		SkyboxRt = "rbxassetid://7245418472",
		SkyboxUp = "rbxassetid://7245418472",
	},
    ["MC"] = {
		SkyboxLf = "rbxassetid://1876543392",
		SkyboxBk = "rbxassetid://1876545003",
		SkyboxDn = "rbxassetid://1876544331",
		SkyboxFt = "rbxassetid://1876542941",
		SkyboxLf = "rbxassetid://1876543392",
		SkyboxRt = "rbxassetid://1876543764",
		SkyboxUp = "rbxassetid://1876544642",
	},
	["night"] = {
		SkyboxLf = "rbxassetid://12063984",
		SkyboxBk = "rbxassetid://12064107",
		SkyboxDn = "rbxassetid://12064152",
		SkyboxFt = "rbxassetid://12064121",
		SkyboxLf = "rbxassetid://12063984",
		SkyboxRt = "rbxassetid://12064115",
		SkyboxUp = "rbxassetid://12064131",
	},
	["dusty clouds"] = {
		SkyboxLf = "rbxassetid://151165191",
		SkyboxBk = "rbxassetid://151165214",
		SkyboxDn = "rbxassetid://151165197",
		SkyboxFt = "rbxassetid://151165224",
		SkyboxRt = "rbxassetid://151165206",
		SkyboxUp = "rbxassetid://151165227",
	},
	["nebula"] = {
		SkyboxLf = "rbxassetid://159454286",
		SkyboxBk = "rbxassetid://159454299",
		SkyboxDn = "rbxassetid://159454296",
		SkyboxFt = "rbxassetid://159454293",
		SkyboxRt = "rbxassetid://159454300",
		SkyboxUp = "rbxassetid://159454288",
	},
	["blue nebula"] = {
		SkyboxLf = "rbxassetid://149397684",
		SkyboxBk = "rbxassetid://149397692",
		SkyboxDn = "rbxassetid://149397686",
		SkyboxFt = "rbxassetid://149397697",
		SkyboxRt = "rbxassetid://149397688",
		SkyboxUp = "rbxassetid://149397702",
	},
	["vivid sky"] = {
		SkyboxLf = "rbxassetid://271042310",
		SkyboxBk = "rbxassetid://271042516",
		SkyboxDn = "rbxassetid://271077243",
		SkyboxFt = "rbxassetid://271042556",
		SkyboxRt = "rbxassetid://271042467",
		SkyboxUp = "rbxassetid://271077958",
	},
	["purple sky"] = {
		SkyboxLf = "rbxassetid://264909758",
		SkyboxBk = "rbxassetid://264908339",
	    SkyboxDn = "rbxassetid://264907909",
		SkyboxFt = "rbxassetid://264909420",
		SkyboxRt = "rbxassetid://264908886",
		SkyboxUp = "rbxassetid://264907379",
	},
}
local NewScope 
do 
	local ScreenGui = Instance.new("ScreenGui") 
	local Frame = Instance.new("Frame") 
	local Frame_2 = Instance.new("Frame") 

	ScreenGui.Enabled = false 
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global 
	ScreenGui.IgnoreGuiInset = true 

	Frame.Parent = ScreenGui 
	Frame.BackgroundColor3 = Color3.fromRGB(12, 12, 12) 
	Frame.BorderSizePixel = 0 
	Frame.Position = UDim2.new(0, 0, 0.5, 0) 
	Frame.Size = UDim2.new(1, 0, 0, 1) 

	Frame_2.Parent = ScreenGui 
	Frame_2.BackgroundColor3 = Color3.fromRGB(12, 12, 12) 
	Frame_2.BorderSizePixel = 0 
	Frame_2.Position = UDim2.new(0.5, 0, 0, 0) 
	Frame_2.Size = UDim2.new(0, 1, 1, 0) 

	ScreenGui.Parent = game.CoreGui 

	NewScope = ScreenGui 
end 
local oldSkybox 

local function VectorRGB(RGB) 
	return Vector3.new(RGB.R, RGB.G, RGB.B) 
end 
local function new(name, prop) 
	local obj = Instance.new(name) 
	for i,v in next, prop do 
		if i ~= "Parent" then 
			obj[i] = v 
		end 
	end 
	if prop["Parent"] ~= nil then 
		obj.Parent = prop["Parent"] 
	end 
end 
local function UpdateAccessory(Accessory) 
	Accessory.Material = values.visuals.effects["material "].Dropdown == "Smooth" and "SmoothPlastic" or "ForceField" 
	Accessory.Mesh.VertexColor = VectorRGB(values.visuals.effects["glove chams"].Color) 
	Accessory.Color = values.visuals.effects["glove chams"].Color 
	Accessory.Transparency = values.visuals.effects["glove chams"].Transparency 
	if values.visuals.effects["material "].Dropdown ~= "ForceField" then 
		Accessory.Mesh.TextureId = "" 
	else 
		Accessory.Mesh.TextureId = Accessory.StringValue.Value 
	end 
end
local function UpdateAccessory(Accessory2) 
	Accessory2.Material = values.visuals.effects["material "].Dropdown == "Smooth" and "SmoothPlastic" or "ForceField" 
	Accessory2.Mesh.VertexColor = VectorRGB(values.visuals.effects["glove chams"].Color) 
	Accessory2.Color = values.visuals.effects["glove chams"].Color 
	Accessory2.Transparency = values.visuals.effects["glove chams"].Transparency 
	if values.visuals.effects["material "].Dropdown ~= "ForceField" then
		Accessory2.Mesh.TextureId = "" 
	else 
		Accessory2.Mesh.TextureId = Accessory2.StringValue.Value 
	end 
end 
local function UpdateWeapon(obj) 
	local selected = values.visuals.effects["material   "].Dropdown

	if obj:IsA("MeshPart") and selected == "ForceField" then 
		if values.visuals.effects["forcefield type"].Dropdown == "normal" then
			obj.TextureID = ""
		elseif values.visuals.effects["forcefield type"].Dropdown == "web" then
			obj.TextureID = "rbxassetid://301464986"
		elseif values.visuals.effects["forcefield type"].Dropdown == "swirl" then
			obj.TextureID = "rbxassetid://8133639623"
		end
	else 
		if selected == "Smooth" or selected == "Glass" or selected == "Flat" then obj.TextureID = "" end
	end
	if obj:IsA("Part") and obj:FindFirstChild("Mesh") and not obj:IsA("BlockMesh") then
		obj.Mesh.VertexColor = VectorRGB(values.visuals.effects["weapon chams"].Color)
		if selected == "Smooth" or selected == "Glass" then
			obj.Mesh.TextureId = ""
		else
			pcall(function()
				obj.Mesh.TextureId = obj.Mesh.OriginalTexture.Value
				obj.Mesh.TextureID = obj.Mesh.OriginalTexture.Value
			end)
		end
	end
	obj.Color = values.visuals.effects["weapon chams"].Color
	obj.Material = selected == "Smooth" and "SmoothPlastic" or selected == "Flat" and "Neon" or selected == "ForceField" and "ForceField" or "Glass"
	obj.Reflectance = values.visuals.effects["reflectance"].Slider/10
	obj.Transparency = values.visuals.effects["weapon chams"].Transparency
end
local Skins = ReplicatedStorage.Skins 
local function MapSkin(Gun, Skin, CustomSkin) 
	if CustomSkin ~= nil then 
		for _,Data in next, CustomSkin do 
			local Obj = Camera.Arms:FindFirstChild(Data.Name) 
			if Obj ~= nil and Obj.Transparency ~= 1 then 
				Obj.TextureId = Data.Value 
			end 
		end 
	else 
		local SkinData = Skins:FindFirstChild(Gun):FindFirstChild(Skin) 
		if not SkinData:FindFirstChild("Animated") then 
			for _,Data in next, SkinData:GetChildren() do 
				local Obj = Camera.Arms:FindFirstChild(Data.Name) 
				if Obj ~= nil and Obj.Transparency ~= 1 then 
					if Obj:FindFirstChild("Mesh") then 
						Obj.Mesh.TextureId = v.Value 
					elseif not Obj:FindFirstChild("Mesh") then 
						Obj.TextureID = Data.Value 
					end 
				end 
			end 
		end 
	end 
end 
local function ChangeCharacter(NewCharacter) 
	for _,Part in next, LocalPlayer.Character:GetChildren() do 
		if Part:IsA("Accessory") then 
			Part:Destroy() 
		end 
		if Part:IsA("BasePart") then 
			if NewCharacter:FindFirstChild(Part.Name) then 
				Part.Color = NewCharacter:FindFirstChild(Part.Name).Color 
				Part.Transparency = NewCharacter:FindFirstChild(Part.Name).Transparency 
			end 
			if Part.Name == "FakeHead" then 
				Part.Color = NewCharacter:FindFirstChild("Head").Color 
				Part.Transparency = NewCharacter:FindFirstChild("Head").Transparency 
			end 
		end 

		if (Part.Name == "Head" or Part.Name == "FakeHead") and Part:FindFirstChildOfClass("Decal") and NewCharacter.Head:FindFirstChildOfClass("Decal") then 
			Part:FindFirstChildOfClass("Decal").Texture = NewCharacter.Head:FindFirstChildOfClass("Decal").Texture 
		end 
	end 

	if NewCharacter:FindFirstChildOfClass("Shirt") then 
		if LocalPlayer.Character:FindFirstChildOfClass("Shirt") then 
			LocalPlayer.Character:FindFirstChildOfClass("Shirt"):Destroy() 
		end 
		local Clone = NewCharacter:FindFirstChildOfClass("Shirt"):Clone() 
		Clone.Parent = LocalPlayer.Character 
	end 

	if NewCharacter:FindFirstChildOfClass("Pants") then 
		if LocalPlayer.Character:FindFirstChildOfClass("Pants") then 
			LocalPlayer.Character:FindFirstChildOfClass("Pants"):Destroy() 
		end 
		local Clone = NewCharacter:FindFirstChildOfClass("Pants"):Clone() 
		Clone.Parent = LocalPlayer.Character 
	end 

	for _,Part in next, NewCharacter:GetChildren() do 
		if Part:IsA("Accessory") then 
			local Clone = Part:Clone() 
			for _,Weld in next, Clone.Handle:GetChildren() do 
				if Weld:IsA("Weld") and Weld.Part1 ~= nil then 
					Weld.Part1 = LocalPlayer.Character[Weld.Part1.Name] 
				end 
			end 
			Clone.Parent = LocalPlayer.Character 
		end 
	end 

	if LocalPlayer.Character:FindFirstChildOfClass("Shirt") then 
		local String = Instance.new("StringValue") 
		String.Name = "OriginalTexture" 
		String.Value = LocalPlayer.Character:FindFirstChildOfClass("Shirt").ShirtTemplate 
		String.Parent = LocalPlayer.Character:FindFirstChildOfClass("Shirt") 

		if table.find(values.misc.client.removals.Jumbobox, "clothes") then 
			LocalPlayer.Character:FindFirstChildOfClass("Shirt").ShirtTemplate = "" 
		end 
	end 
	if LocalPlayer.Character:FindFirstChildOfClass("Pants") then 
		local String = Instance.new("StringValue") 
		String.Name = "OriginalTexture" 
		String.Value = LocalPlayer.Character:FindFirstChildOfClass("Pants").PantsTemplate 
		String.Parent = LocalPlayer.Character:FindFirstChildOfClass("Pants") 

		if table.find(values.misc.client.removals.Jumbobox, "clothes") then 
			LocalPlayer.Character:FindFirstChildOfClass("Pants").PantsTemplate = "" 
		end 
	end 
	for i,v in next, LocalPlayer.Character:GetChildren() do 
		if v:IsA("BasePart") and v.Transparency ~= 1 then 
			table.insert(SelfObj, v) 
			local Color = Instance.new("Color3Value") 
			Color.Name = "OriginalColor" 
			Color.Value = v.Color 
			Color.Parent = v 

			local String = Instance.new("StringValue") 
			String.Name = "OriginalMaterial" 
			String.Value = v.Material.Name 
			String.Parent = v 
		elseif v:IsA("Accessory") and v.Handle.Transparency ~= 1 then 
			table.insert(SelfObj, v.Handle) 
			local Color = Instance.new("Color3Value") 
			Color.Name = "OriginalColor" 
			Color.Value = v.Handle.Color 
			Color.Parent = v.Handle 

			local String = Instance.new("StringValue") 
			String.Name = "OriginalMaterial" 
			String.Value = v.Handle.Material.Name 
			String.Parent = v.Handle 
		end 
	end 

	if values.visuals.self["self chams"].Toggle then 
		for _,obj in next, SelfObj do 
			if obj.Parent ~= nil then 
				obj.Material = values.visuals.self["material    "].Dropdown 
				obj.Color = values.visuals.self["self chams"].Color 
			end 
		end 
	end 
end 
local function GetDeg(pos1, pos2) 
	local start = pos1.LookVector 
	local vector = CFrame.new(pos1.Position, pos2).LookVector 
	local angle = math.acos(start:Dot(vector)) 
	local deg = math.deg(angle) 
	return deg 
end 
local Ping = game.Stats.PerformanceStats.Ping:GetValue() 

for i,v in next, Viewmodels:GetChildren() do 
	if v:FindFirstChild("HumanoidRootPart") and v.HumanoidRootPart.Transparency ~= 1 then 
		v.HumanoidRootPart.Transparency = 1 
	end 
end 

local Models = game:GetObjects("rbxassetid://7285197035")[1] 
repeat wait() until Models ~= nil 
local ChrModels = game:GetObjects("rbxassetid://7265740528")[1] 
repeat wait() until ChrModels ~= nil 

local AllKnives = { 
	"CT Knife", 
	"T Knife", 
	"Banana", 
	"Bayonet", 
	"Bearded Axe", 
	"Butterfly Knife", 
	"Cleaver", 
	"Crowbar", 
	"Falchion Knife", 
	"Flip Knife", 
	"Gut Knife", 
	"Huntsman Knife", 
	"Karambit", 
	"Sickle", 
} 

local AllGloves = {} 


for _,fldr in next, Gloves:GetChildren() do 
	if fldr ~= GloveModels and fldr.Name ~= "Racer" then 
		AllGloves[fldr.Name] = {} 
		for _2,modl in next, fldr:GetChildren() do 
			table.insert(AllGloves[fldr.Name], modl.Name) 
		end 
	end 
end 

for i,v in next, Models.Knives:GetChildren() do 
	table.insert(AllKnives, v.Name) 
end 

local AllSkins = {} 
local AllWeapons = {} 
local AllCharacters = {} 

for i,v in next, ChrModels:GetChildren() do 
	table.insert(AllCharacters, v.Name) 
end 

local skins = { 
	{["Weapon"] = "AWP", ["SkinName"] = "Bot", ["Skin"] = {["Scope"] = "6572594838", ["Handle"] = "6572594077"}} 
} 

for _,skin in next, skins do 
	local Folder = Instance.new("Folder") 
	Folder.Name = skin["SkinName"] 
	Folder.Parent = Skins[skin["Weapon"]] 

	for _,model in next, skin["Skin"] do 
		local val = Instance.new("StringValue") 
		val.Name = _ 
		val.Value = "rbxassetid://"..model 
		val.Parent = Folder 
	end 
end 

for i,v in next, Skins:GetChildren() do 
	table.insert(AllWeapons, v.Name) 
end 

table.sort(AllWeapons, function(a,b) 
	return a < b 
end) 

for i,v in next, AllWeapons do 
	AllSkins[v] = {} 
	table.insert(AllSkins[v], "Inventory") 
	for _,v2 in next, Skins[v]:GetChildren() do 
		if not v2:FindFirstChild("Animated") then 
			table.insert(AllSkins[v], v2.Name) 
		end 
	end 
end 

makefolder("nvblua") 

local allluas = {} 

for _,lua in next, listfiles("nvblua") do 
	local luaname = string.gsub(lua, "nvblua\\", "") 
	table.insert(allluas, luaname) 
end 

RunService.Heartbeat:Wait() 

local gui = library:New("NEPTUNIUM") 
local AIMBOT = gui:NTab("Aimbot") 
local legit = gui:Tab("legit", "http://www.roblox.com/asset/?id=8447580878") 
local rage = gui:Tab("rage", "http://www.roblox.com/asset/?id=8447584334") 
local VISUALS = gui:NTab("Visuals")
local visuals = gui:Tab("visuals", "http://www.roblox.com/asset/?id=8447586003") 
local MISCELLANEOUS = gui:NTab("Miscellaneous") 
local misc = gui:Tab("misc", "http://www.roblox.com/asset/?id=8447583523")
local skins = gui:Tab("skins", "http://www.roblox.com/asset/?id=8447578953") 
local custom = gui:Tab("custom", "http://www.roblox.com/asset/?id=8447578633")
local luas = gui:Tab("luas", "http://www.roblox.com/asset/?id=8447585059") 

getgenv().api = {} 
api.newtab = function(name) 
	return gui:Tab(name) 
end 
api.newsection = function(tab, name, side) 
	return tab:Sector(name, side) 
end 
api.newelement = function(section, type, name, data, callback) 
	section:Element(type, name, data, callback) 
end 

local luascripts = luas:Sector("lua scripts", "Left") 
luascripts:Element("Button", "clantag", nil, function()
    local Services = setmetatable({
		LocalPlayer = game:GetService("Players").LocalPlayer,
	 },{
		__index = function(self, idx)
			if game:GetService(idx) then
				return game:GetService(idx)
			elseif rawget(self, idx) then
				return rawget(self, idx)
			end
		end
	 })
	 
	 for i, v in next, Services.LocalPlayer.PlayerGui.GUI.Scoreboard:GetChildren() do 
		if v.Name == "CT" or v.Name == "T" then 
			for k, x in next, v:GetChildren() do 
				if x:IsA("Frame") and x:FindFirstChild("player") then 
					local Tag = x.player 
					local Player = Services.Players:FindFirstChild(Tag.Text) 
					Services.RunService.Heartbeat:Connect(function() 
						if Player and Player.OsPlatform and Player.OsPlatform:find("|") then 
							Tag.Text = Player.OsPlatform:sub(2, Player.OsPlatform:len()).." "..Player.Name 
						end
					end)
				end
			end
			v.ChildAdded:Connect(function(child) 
				if child:IsA("Frame") and child:FindFirstChild("player") then 
					local Tag = child.player 
					local Player  
					repeat wait() 
						Player = Services.Players:FindFirstChild(Tag.Text) 
					until Player ~= "PLAYER" 
					Services.RunService.Heartbeat:Connect(function() 
						if Player and Player.OsPlatform and Player.OsPlatform:find("|") then 
							Tag.Text = Player.OsPlatform:sub(2, Player.OsPlatform:len()).." "..Player.Name
						end
					end)
				end
			end)
		end
	 end
	 
	 local CurrentLetter = 0 
	 local Clantag = "NVB"
	 
	 while wait(0.3) do 
		Services.LocalPlayer.OsPlatform = "|"..Clantag:sub(0, CurrentLetter).." " 
		if CurrentLetter == Clantag:len() then 
			wait(1.3) 
			CurrentLetter = 0 
		end
		CurrentLetter = CurrentLetter + 1 
	 end
end)

luascripts:Element("Button", "rejoin", nil, function()
    local ts = game:GetService("TeleportService")
    local  p= game:GetService("Players").LocalPlayer
    ts:Teleport(game.PlaceId, p)
end)

luascripts:Element("Button", "invisible", nil, function()
    local bY = game.Players.LocalPlayer                                                                                                                                                                                                                                                                                                                                                                                                                                                                            --neverblox.cc
    local c1 = bY.Character.HumanoidRootPart.CFrame
    bY.Character.HumanoidRootPart.CFrame = CFrame.new()
    local c2 = bY.Character.LowerTorso.Root:Clone()
    bY.Character.LowerTorso.Root:Destroy()
    c2.Parent = bY.Character.LowerTorso
    wait()
    bY.Character.HumanoidRootPart.CFrame = c1
end)

luascripts:Element("Button", "shitty graphics", nil, function()
	local a = game
	local b = a.Workspace
	local c = a.Lighting
	local d = b.Terrain

	d.WaterWaveSize = 0
	d.WaterWaveSpeed = 0
	d.WaterReflectance = 0
	d.WaterTransparency = 0

	c.GlobalShadows = false
	c.FogEnd = 9e9
	c.Brightness = 0

	settings().Rendering.QualityLevel = "Level01"

	for e, f in next, a:GetDescendants() do
		if f:IsA("Part") or f:IsA("Union") or f:IsA("CornerWedgePart") or f:IsA("TrussPart") then
			f.Material = "Plastic"
			f.Reflectance = 0
		elseif f:IsA("Decal") or f:IsA("Texture") then
			f.Transparency = 0
		elseif f:IsA("ParticleEmitter") or f:IsA("Trail") then
			f.Lifetime = NumberRange.new(0)
		elseif f:IsA("Explosion") then
			f.BlastPressure = 0
			f.BlastRadius = 0
		elseif f:IsA("Fire") or f:IsA("SpotLight") or f:IsA("Smoke") or f:IsA("Sparkles") then
			f.Enabled = false
		elseif f:IsA("MeshPart") then
			f.Material = "Plastic"
			f.Reflectance = 0
			f.TextureID = 10385902758728957
		end
	end

	for e, g in next, c:GetChildren() do
		if g:IsA("BlurEffect") or g:IsA("SunRaysEffect") or g:IsA("ColorCorrectionEffect") or g:IsA("BloomEffect") or g:IsA("DepthOfFieldEffect") then
			g.Enabled = false
		end
	end

	sethiddenproperty(game.Lighting, "Technology", "Compatibility")
end)

local extraluas = luas:Sector("extra luas", "Right") 
extraluas:Element("Scroll", "lua", {options = allluas, Amount = 5}) 
extraluas:Element("Button", "LOAD", {}, function() 
	loadstring(readfile("nvblua\\"..values.luas["extra luas"].lua.Scroll))() 
end)
	   
local knife = skins:Sector("knife", "Left") 
knife:Element("Toggle", "knife changer") 
knife:Element("Scroll", "model", {options = AllKnives, Amount = 15}) 

local glove = skins:Sector("glove", "Left") 
glove:Element("Toggle", "glove changer") 
glove:Element("ScrollDrop", "model", {options = AllGloves, Amount = 9}) 

local skin = skins:Sector("skins", "Right") 
skin:Element("Toggle", "skin changer") 
skin:Element("ScrollDrop", "skin", {options = AllSkins, Amount = 12, alphabet = true}) 

local characters = skins:Sector("characters", "Right") 
characters:Element("Toggle", "character changer", nil, function(tbl) 
	if tbl.Toggle then 
		if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Gun") then 
			ChangeCharacter(ChrModels:FindFirstChild(values.skins.characters.skin.Scroll)) 
		end 
	end 
end) 
characters:Element("Scroll", "skin", {options = AllCharacters, Amount = 12, alphabet = true}, function(tbl) 
	if values.skins.characters["character changer"].Toggle then 
		if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Gun") then 
			ChangeCharacter(ChrModels:FindFirstChild(tbl.Scroll)) 
		end 
	end 
end) 

local aimbot = legit:Sector("aimbot", "Left") 
aimbot:Element("ToggleKeybind", "aim assist") 
aimbot:Element("ToggleKeybind", "silent aim") 
aimbot:Element("ToggleKeybind", "triggerbot") 

local main = legit:MSector("main", "Left") 
local default = main:Tab("default") 
local pistol = main:Tab("pistol") 
local smg = main:Tab("smg") 
local rifle = main:Tab("rifle") 
local sniper = main:Tab("sniper") 

local function AddLegit(Tab) 
	Tab:Element("Jumbobox", "conditions", {options = {"visible", "standing", "blind", "smoke"}}) 
	Tab:Element("Dropdown", "target", {options = {"crosshair", "health", "distance"}}) 
	Tab:Element("Dropdown", "hitbox", {options = {"closest", "head", "chest"}}) 
	Tab:Element("Slider", "field of view", {min = 30, max = 420, default = 120}) 
	Tab:Element("Slider", "smoothing", {min = 1, max = 50, default = 1}) 
	Tab:Element("Toggle", "silent aim") 
	Tab:Element("Slider", "hitchance", {min = 1, max = 100, default = 100}) 
	Tab:Element("Dropdown", "priority", {options = {"closest", "head", "chest"}}) 
	Tab:Element("Toggle", "triggerbot") 
	Tab:Element("Slider", "delay (ms)", {min = 0, max = 300, default = 200}) 
	Tab:Element("Slider", "minimum dmg", {min = 0, max = 100, default = 15}) 
end 

AddLegit(default) 

pistol:Element("Toggle", "override default") 
AddLegit(pistol) 

smg:Element("Toggle", "override default") 
AddLegit(smg) 

rifle:Element("Toggle", "override default") 
AddLegit(rifle) 

sniper:Element("Toggle", "override default") 
AddLegit(sniper) 

local settings = legit:Sector("settings", "Right") 
settings:Element("Toggle", "free for all") 
settings:Element("Toggle", "forcefield check") 
settings:Element("Toggle", "draw fov") 

local legitmovement = legit:Sector("legit movement", "Right")
legitmovement:Element("Toggle", "velocity graph", {}, function(tbl)
	if tbl.Toggle then
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local CurrentCamera = workspace.CurrentCamera

local graphLines = {}
local standardY = workspace.CurrentCamera.ViewportSize.Y-100
local oldY = standardY
local oldVelo = 0

local VelocityCounter = Drawing.new("Text")
VelocityCounter.Text = ""
VelocityCounter.Center = true
VelocityCounter.Outline = true
VelocityCounter.Color = Color3.new(1,1,1)
VelocityCounter.Font = 3
VelocityCounter.Position = Vector2.new(CurrentCamera.ViewportSize.X/2, CurrentCamera.ViewportSize.Y-90)
VelocityCounter.Size = 20
VelocityCounter.Visible = true

while true do
    RunService.Heartbeat:Wait()

    standardY = CurrentCamera.ViewportSize.Y-100
    VelocityCounter.Position = Vector2.new(CurrentCamera.ViewportSize.X/2,CurrentCamera.ViewportSize.Y-90)

    if LocalPlayer.Character and LocalPlayer.Character.PrimaryPart then
        if #graphLines >= 1 then
            local max = 100
            
            if #graphLines >= max then
                graphLines[1]:Remove()
                
                local counter = 0

                for i=2,6 do
                    counter = counter + 1.8
                    graphLines[i].Transparency = 1 - (counter/10)
                end
                
                graphLines[2].Transparency = 0.1
                graphLines[3].Transparency = 0.2
                graphLines[4].Transparency = 0.4
                graphLines[5].Transparency = 0.6
                graphLines[6].Transparency = 0.8
                
                table.remove(graphLines, 1)
            end
            
            for i,v in next, graphLines do
                v.To = v.To - Vector2.new(2,0)
                v.From = v.From - Vector2.new(2,0)
            end
        end
        
        local totalVelo = (LocalPlayer.Character.PrimaryPart.Velocity * Vector3.new(1, 0, 1)).magnitude
        local graphVelocity = totalVelo * 14.85

        VelocityCounter.Color = Color3.new(1,1,1)
        
        if math.floor(totalVelo) < oldVelo then
            VelocityCounter.Color = Color3.new(1,0.5,0.3)
        end
        
        if math.floor(totalVelo) > oldVelo then
            VelocityCounter.Color = Color3.new(0.5,1,0.3)
        end

        local color = Color3.new(1,1,1)

        local line = Drawing.new("Line")
        
        table.insert(graphLines, line)
        
        line.Color = color
        line.Thickness = 2
        line.From = Vector2.new(CurrentCamera.ViewportSize.X/2 + 98, oldY)
        line.To = Vector2.new(CurrentCamera.ViewportSize.X/2 + 100, standardY - (graphVelocity/6.5))
        line.Transparency = 0
        line.Visible = true
        
        if #graphLines >= 8 then
            graphLines[#graphLines-1].Transparency = graphLines[#graphLines-1].Transparency + 0.2
            graphLines[#graphLines-2].Transparency = graphLines[#graphLines-2].Transparency + 0.2
            graphLines[#graphLines-3].Transparency = graphLines[#graphLines-3].Transparency + 0.2
            graphLines[#graphLines-4].Transparency = graphLines[#graphLines-4].Transparency + 0.2
            graphLines[#graphLines-5].Transparency = graphLines[#graphLines-5].Transparency + 0.2
            graphLines[#graphLines-7].Transparency = 1
        end
        
        VelocityCounter.Text = tostring(math.floor(graphVelocity))
        oldY = standardY - (graphVelocity/6.5)
        oldVelo = math.floor(totalVelo)
    end
end
            else
			VelocityCounter.Visible = false
			graphLines.Visble = false
			end
			end)			
			legitmovement:Element("Toggle", "keystrokes", {}, function(tbl)
				if tbl.Toggle then
						 local ScreenGuiKey = Instance.new("ScreenGui")
			local W = Instance.new("TextLabel")
			local A = Instance.new("TextLabel")
			local S = Instance.new("TextLabel")
			local D = Instance.new("TextLabel")
			local E = Instance.new("TextLabel")
			local R = Instance.new("TextLabel")
			local _ = Instance.new("TextLabel")
			local _2 = Instance.new("TextLabel")
			local _3 = Instance.new("TextLabel")
			local _4 = Instance.new("TextLabel")
			local _5 = Instance.new("TextLabel")
			local _6 = Instance.new("TextLabel")


			ScreenGuiKey.Parent = game.CoreGui
			ScreenGuiKey.Name = "keystrokess"

			W.Name = "W"
			W.Parent = ScreenGuiKey
			W.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			W.BackgroundTransparency = 1.000
			W.Position = UDim2.new(0.488053292, 0, 0.728395104, 0)
			W.Size = UDim2.new(0, 29, 0, 28)
			W.Visible = false
			W.Font = Enum.Font.Code
			W.Text = "W"
			W.TextColor3 = Color3.fromRGB(255, 255, 255)
			W.TextSize = 13.000
			W.TextStrokeTransparency = 0.000
			
			_.Name = "_"
			_.Parent = ScreenGuiKey
			_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			_.BackgroundTransparency = 1.000
			_.Position = UDim2.new(0.488053292, 0, 0.728395104, 0)
			_.Size = UDim2.new(0, 29, 0, 28)
			_.Visible = true
			_.Font = Enum.Font.Code
			_.Text = "_"
			_.TextColor3 = Color3.fromRGB(255, 255, 255)
			_.TextSize = 13.000
			_.TextStrokeTransparency = 0.000

			A.Name = "A"
			A.Parent = ScreenGuiKey
			A.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			A.BackgroundTransparency = 1.000
			A.Position = UDim2.new(0.453584045, 0, 0.777777791, 0)
			A.Size = UDim2.new(0, 29, 0, 28)
			A.Visible = false
			A.Font = Enum.Font.Code
			A.Text = "A"
			A.TextColor3 = Color3.fromRGB(255, 255, 255)
			A.TextSize = 13.000
			A.TextStrokeTransparency = 0.000
			
			_2.Name = "_2"
			_2.Parent = ScreenGuiKey
			_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			_2.BackgroundTransparency = 1.000
			_2.Position = UDim2.new(0.453584045, 0, 0.777777791, 0)
			_2.Size = UDim2.new(0, 29, 0, 28)
			_2.Visible = true
			_2.Font = Enum.Font.Code
			_2.Text = "_"
			_2.TextColor3 = Color3.fromRGB(255, 255, 255)
			_2.TextSize = 13.000
			_2.TextStrokeTransparency = 0.000

			S.Name = "S"
			S.Parent = ScreenGuiKey
			S.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			S.BackgroundTransparency = 1.000
			S.Position = UDim2.new(0.488053292, 0, 0.777777791, 0)
			S.Size = UDim2.new(0, 29, 0, 28)
			S.Visible = false
			S.Font = Enum.Font.Code
			S.Text = "S"
			S.TextColor3 = Color3.fromRGB(255, 255, 255)
			S.TextSize = 13.000
			S.TextStrokeTransparency = 0.000
			
			_3.Name = "_3"
			_3.Parent = ScreenGuiKey
			_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			_3.BackgroundTransparency = 1.000
			_3.Position = UDim2.new(0.488053292, 0, 0.777777791, 0)
			_3.Size = UDim2.new(0, 29, 0, 28)
			_3.Visible = true
			_3.Font = Enum.Font.Code
			_3.Text = "_"
			_3.TextColor3 = Color3.fromRGB(255, 255, 255)
			_3.TextSize = 13.000
			_3.TextStrokeTransparency = 0.000

			D.Name = "D"
			D.Parent = ScreenGuiKey
			D.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			D.BackgroundTransparency = 1.000
			D.Position = UDim2.new(0.522522688, 0, 0.777777791, 0)
			D.Size = UDim2.new(0, 29, 0, 28)
			D.Visible = false
			D.Font = Enum.Font.Code
			D.Text = "D"
			D.TextColor3 = Color3.fromRGB(255, 255, 255)
			D.TextSize = 13.000
			D.TextStrokeTransparency = 0.000
			
			_4.Name = "_4"
			_4.Parent = ScreenGuiKey
			_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			_4.BackgroundTransparency = 1.000
			_4.Position = UDim2.new(0.522522688, 0, 0.777777791, 0)
			_4.Size = UDim2.new(0, 29, 0, 28)
			_4.Visible = true
			_4.Font = Enum.Font.Code
			_4.Text = "_"
			_4.TextColor3 = Color3.fromRGB(255, 255, 255)
			_4.TextSize = 13.000
			_4.TextStrokeTransparency = 0.000

			E.Name = "E"
			E.Parent = ScreenGuiKey
			E.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			E.BackgroundTransparency = 1.000
			E.Position = UDim2.new(0.453584045, 0, 0.728395045, 0)
			E.Size = UDim2.new(0, 29, 0, 28)
			E.Visible = false
			E.Font = Enum.Font.Code
			E.Text = "C"
			E.TextColor3 = Color3.fromRGB(255, 255, 255)
			E.TextSize = 13.000
			E.TextStrokeTransparency = 0.000
			
			_5.Name = "_5"
			_5.Parent = ScreenGuiKey
			_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			_5.BackgroundTransparency = 1.000
			_5.Position = UDim2.new(0.453584045, 0, 0.728395045, 0)
			_5.Size = UDim2.new(0, 29, 0, 28)
			_5.Visible = true
			_5.Font = Enum.Font.Code
			_5.Text = "_"
			_5.TextColor3 = Color3.fromRGB(255, 255, 255)
			_5.TextSize = 13.000
			_5.TextStrokeTransparency = 0.000

			R.Name = "R"
			R.Parent = ScreenGuiKey
			R.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			R.BackgroundTransparency = 1.000
			R.Position = UDim2.new(0.522522688, 0, 0.728395045, 0)
			R.Size = UDim2.new(0, 29, 0, 28)
			R.Visible = false
			R.Font = Enum.Font.Code
			R.Text = "J"
			R.TextColor3 = Color3.fromRGB(255, 255, 255)
			R.TextSize = 13.000
			R.TextStrokeTransparency = 0.000
			
			_6.Name = "_6"
			_6.Parent = ScreenGuiKey
			_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			_6.BackgroundTransparency = 1.000
			_6.Position = UDim2.new(0.522522688, 0, 0.728395045, 0)
			_6.Size = UDim2.new(0, 29, 0, 28)
			_6.Visible = true
			_6.Font = Enum.Font.Code
			_6.Text = "_"
			_6.TextColor3 = Color3.fromRGB(255, 255, 255)
			_6.TextSize = 13.000
			_6.TextStrokeTransparency = 0.000
	 

			local UserInputService = game:GetService("UserInputService")

			local W1Key = Enum.KeyCode.W
			local A1Key = Enum.KeyCode.A
			local S1Key = Enum.KeyCode.S
			local D1Key = Enum.KeyCode.D
			local E1Key = Enum.KeyCode.LeftControl
			local R1Key = Enum.KeyCode.R
			local SpaceKey = Enum.KeyCode.Space

			UserInputService.InputBegan:Connect(function(input)
				if (input.KeyCode == W1Key) then
					W.Visible = true
					_.Visible = false
				elseif (input.KeyCode == A1Key) then
					A.Visible = true
					_2.Visible = false
				elseif (input.KeyCode == S1Key) then
					S.Visible = true
					_3.Visible = false
				elseif (input.KeyCode == D1Key) then
					D.Visible = true
					_4.Visible = false
				elseif (input.KeyCode == E1Key) then
					E.Visible = true
					_5.Visible = false
				elseif (input.KeyCode == SpaceKey) then
					R.Visible = true
					_6.Visible = false
				end
			end)

			UserInputService.InputEnded:Connect(function(input)
				if (input.KeyCode == W1Key) then
					W.Visible = false
					_.Visible = true
				elseif (input.KeyCode == A1Key) then
					A.Visible = false
					_2.Visible = true
				elseif (input.KeyCode == S1Key) then
					S.Visible = false
					_3.Visible = true
				elseif (input.KeyCode == D1Key) then
					D.Visible = false
					_4.Visible = true
				elseif (input.KeyCode == E1Key) then
					E.Visible = false
					_5.Visible = true	
				elseif (input.KeyCode == SpaceKey) then
					R.Visible = false
					_6.Visible = true
				end
			end)		
			else
			game.CoreGui.keystrokess:Destroy()
			end
	    end)

local aimbot = rage:Sector("ragebot", "Left") 
aimbot:Element("Toggle", "enabled")
aimbot:Element("Toggle", "silent aim")
aimbot:Element("Dropdown", "automatic fire", {options = {"off", "standard", "hitpart"}}) 
aimbot:Element("Toggle", "automatic penetration") 
aimbot:Element("Jumbobox", "resolver", {options = {"pitch", "angle", "roll", "forward track", "custom resolver", "animation"}})
aimbot:Element("Toggle", "delay shot") 
aimbot:Element("Toggle", "force hit")
aimbot:Element("Dropdown", "prediction", {options = {"off", "neverblox", "shibagang", "bad"}}) 
aimbot:Element("Toggle", "teammates") 

local resolver = rage:Sector("resolver", "Right")
resolver:Element("Slider", "head x", {min = -25, max = 25, default = 0})
resolver:Element("Slider", "head y", {min = -25, max = 25, default = 0})
resolver:Element("Slider", "head z", {min = -25, max = 25, default = 0})
resolver:Element("Slider", "body x", {min = -25, max = 25, default = 0})
resolver:Element("Slider", "body y", {min = -25, max = 25, default = 0})
resolver:Element("Slider", "body z", {min = -25, max = 25, default = 0})
resolver:Element("Slider", "arms x", {min = -25, max = 25, default = 0})
resolver:Element("Slider", "arms y", {min = -25, max = 25, default = 0})
resolver:Element("Slider", "arms z", {min = -25, max = 25, default = 0})
resolver:Element("Slider", "legs x", {min = -25, max = 25, default = 0})
resolver:Element("Slider", "legs y", {min = -25, max = 25, default = 0})
resolver:Element("Slider", "legs z", {min = -25, max = 25, default = 0})

local antiaim = rage:Sector("angles", "Right") 
antiaim:Element("Toggle", "enabled")
antiaim:Element("Dropdown", "yaw base", {options = {"camera", "targets", "spin", "switch", "double", "defensive", "keybind yaw", "random"}}) 
antiaim:Element("Slider", "yaw offset", {min = -180, max = 180, default = 0}) 
antiaim:Element("ToggleKeybind", "reset yaw")
antiaim:Element('Toggle', 'jitter')
antiaim:Element('Slider', 'jitter offset', {min = -180, max = 180, default = 0})
antiaim:Element('Slider', 'jitter wait (ms)', {min = 0, max = 100, default = 0})
antiaim:Element("Dropdown", "pitch", {options = {"down", "up", "god", "sus_down", "freak", "imposter", "glitch", "zero", "random", "brr", "Bodyarm", "negative", "wtf"}}) 
antiaim:Element("Toggle", "extend pitch")
antiaim:Element("Slider", "extend value", {min = 0, max = 7 , default = 3}) 
antiaim:Element("Toggle", "spin pitch")
antiaim:Element("Dropdown", "body roll", {options = {"off", "180"}}) 
antiaim:Element("Slider", "spin speed", {min = 1, max = 200, default = 4})


local movement = rage:Sector("movement", "Right") 
movement:Element("Toggle", "bunny hop") 
movement:Element("Dropdown", "direction", {options = {"forward", "directional", "directional 2"}}) 
movement:Element("Dropdown", "type", {options = {"cframe", "gyro", "velocity"}}) 
movement:Element("Dropdown", "gyro type", {options = {"no fling", "fling"}})  
movement:Element("Slider", "speed", {min = 15, max = 300, default = 40}) 
movement:Element("ToggleKeybind", "jump bug") 
movement:Element("ToggleKeybind", "edge jump")
movement:Element("Dropdown", "leg movement", {options = {"off", "slide", "freeze"}})  

local exploits = rage:Sector("exploits", "Left")
exploits:Element("ToggleKeybind", "around the world")
exploits:Element("Slider", "height", {min = -100, max = 100, default = 0})
exploits:Element("Slider", "distance", {min = 1, max = 100, default = 1})
exploits:Element("Slider", "speed", {min = 1, max = 100, default = 1})
exploits:Element("ToggleKeybind", "custom tap")
exploits:Element("Slider", "custom tap amount", {min = 1, max = 100, default = 1}) 
local Client = getsenv(game.Players.LocalPlayer.PlayerGui.Client)
fakeduckloop = false  
exploits:Element("Toggle", "fake duck",{},function(tbl)
	fakeduckloop = tbl.Toggle
	while fakeduckloop and syn do
		pcall(function()
			wait(1)
			local Client = getsenv(game.Players.LocalPlayer.PlayerGui.Client)
			local CrouchAnim = nil
			for i,v in next, debug.getupvalues(Client.setcharacter) do
				if type(v) == "userdata" and v.ClassName == "AnimationTrack" and v.Name == "Idle" then
					CrouchAnim = v
				end
			end

			CrouchAnim:Play()
		end)
	end
end)

local loopkillplr = {}
			
local Plr = game:GetService("Players")
	
function update() 
	local CurrentPlayer = 0 
	for i,v in next, Plr:GetPlayers() do 
		CurrentPlayer = CurrentPlayer + 1 
		table.insert(loopkillplr, v.Name)
	end
end
			
Plr.PlayerAdded:connect(update) 
Plr.PlayerRemoving:connect(update)
update()
	
exploits:Element("Dropdown", "player", {options = loopkillplr, Amount = 20})
exploits:Element("Button", "refresh players", nil, function()      
	update()  
end)
exploits:Element("ToggleKeybind", "Loop kill", nil, function(tbl)
	if tbl.Toggle and tbl.Active and LocalPlayer.Character:FindFirstChild("Gun") then
		_G.DisableLoopKill = false
		local loopkill
		loopkill = game:GetService("RunService").Heartbeat:Connect(function()
			if _G.DisableLoopKill then 
				loopkill:Disconnect() 
				return 
			end
			if Players[values.rage["exploits"].player.Dropdown].Character and Players[values.rage["exploits"].player.Dropdown].Team ~= LocalPlayer.Team and Players[values.rage["exploits"].player.Dropdown].Character:FindFirstChild("UpperTorso") and Players.LocalPlayer.Character:FindFirstChild("UpperTorso") then
				local Arguments = {      
					[1] = Players[values.rage["exploits"].player.Dropdown].Character.Head,      
					[2] = Players[values.rage["exploits"].player.Dropdown].Character.Head.Position,      
					[3] = Client.gun.Name,      
					[4] = 4096,      
					[5] = Client.gun, 
					[6] = Vector3.new(),
					[7] = Vector3.new(),
					[8] = 10,      
					[9] = false,      
					[10] = true,      
					[11] = Vector3.new(),      
					[12] = 16868,      
					[13] = Vector3.new()      
				}  
				for i = 1, values.rage.exploits["kill amount"].Slider, 1 do 
					game:GetService("ReplicatedStorage").Events.HitPart:FireServer(unpack(Arguments))
				end
			end
		end)
	else
		_G.DisableLoopKill = true
	end
end)

exploits:Element("ToggleKeybind", "kill all", nil, function(tbl)
	if tbl.Toggle and tbl.Active and LocalPlayer.Character:FindFirstChild("Gun") then
		_G.DisableKillAll = false
		local killall
		killall = game:GetService("RunService").Heartbeat:Connect(function()
			if _G.DisableKillAll then 
				killall:Disconnect() 
				return 
			end
			for i,v in next, Players:GetPlayers() do
				if v.Character and v.Team ~= LocalPlayer.Team and v.Character:FindFirstChild("UpperTorso") and Players.LocalPlayer.Character:FindFirstChild("UpperTorso") then
					local Arguments = {
						[1] = v.Character.Head,
						[2] = v.Character.Head.Position,
						[3] = Client.gun.Name,
						[4] = 4096,
						[5] = Client.Gun,
						[6] = Vector3.new(),
						[7] = Vector3.new(),
						[8] = 10,
						[9] = false,
						[10] = true,
						[11] = Vector3.new(),
						[12] = 16868,
						[13] = Vector3.new()
					}
					for i = 1, values.rage.exploits["kill amount"].Slider, 1 do 
						game:GetService("ReplicatedStorage").Events.HitPart:FireServer(unpack(Arguments))
					end
				end
			end
		end)
	else
		_G.DisableKillAll = true
	end
end)
exploits:Element("Slider", "kill amount", {min = 1, max = 50, default = 1}) 
exploits:Element("Toggle", "remove head")
exploits:Element("ToggleKeybind", "noclip",{},function(tbl)
	if tbl.Toggle and tbl.Active and LocalPlayer.Character then
		Fly = game:GetService("RunService").Stepped:Connect(function()
			spawn(function()
				pcall(function()
					local speed = values.rage.exploits["noclip speed"].Slider * 8
					local velocity = Vector3.new(0, 1, 0)
					if UserInputService:IsKeyDown(Enum.KeyCode.W) then
						velocity = velocity + (Camera.CoordinateFrame.lookVector * speed)
					end
					if UserInputService:IsKeyDown(Enum.KeyCode.A) then
						velocity = velocity + (Camera.CoordinateFrame.rightVector * -speed)
					end
					if UserInputService:IsKeyDown(Enum.KeyCode.S) then
						velocity = velocity + (Camera.CoordinateFrame.lookVector * -speed)
					end
					if UserInputService:IsKeyDown(Enum.KeyCode.D) then
						velocity = velocity + (Camera.CoordinateFrame.rightVector * speed)
					end
						
					LocalPlayer.Character.HumanoidRootPart.Velocity = velocity
					LocalPlayer.Character.Humanoid.PlatformStand = true
				end)
			end)
		end)

		Noclip = game:GetService("RunService").Stepped:Connect(function()
			for i,v in next, LocalPlayer.Character:GetChildren() do
				if v:IsA("BasePart") and v.CanCollide == true then
					v.CanCollide = false
				end
			end
		end)
	else
		pcall(function()
			Fly:Disconnect()
			Noclip:Disconnect()
			LocalPlayer.Character.HumanoidRootPart.Velocity = -2.90707, 0.00781632, -11.7204
			LocalPlayer.Character.Humanoid.PlatformStand = false
			for i,v in next, LocalPlayer.Character:GetChildren() do
				if v:IsA("BasePart") and v.CanCollide == false then
					v.CanCollide = true
				end
			end
		end)
	end
end)
exploits:Element("Slider", "noclip speed", {min = 1, max = 100, default = 1})

local weapons = rage:MSector("weapons", "Left") 
local default = weapons:Tab("default") 
local pistol = weapons:Tab("pistol") 
local rifle = weapons:Tab("rifle") 
local scout = weapons:Tab("scout") 
local awp = weapons:Tab("awp") 
local auto = weapons:Tab("auto") 

local function AddRage(Tab) 
	Tab:Element("Jumbobox", "hitboxes", {options = {"head", "torso", "arms", "legs"}}) 
	Tab:Element("Slider", "minimum damage", {min = -50, max = 100, default = 1})
	Tab:Element("Slider", "damage amount", {min = 1, max = 200, default = 1})
end 

AddRage(default) 

pistol:Element("Toggle", "override default") 
AddRage(pistol) 

rifle:Element("Toggle", "override default") 
AddRage(rifle) 

scout:Element("Toggle", "override default") 
AddRage(scout) 

awp:Element("Toggle", "override default") 
AddRage(awp) 

auto:Element("Toggle", "override default") 
AddRage(auto) 

local players = visuals:Sector("players", "Left") 
players:Element("Toggle", "teammates") 
players:Element("ToggleTrans", "box", {default = {Color = Color3.fromRGB(111, 222, 255)}})
players:Element("ToggleTrans", "visible chams", {default = {Color = Color3.fromRGB(111, 222, 255)}}, function(tbl)
	for _,Player in next, Players:GetPlayers() do
		if Player.Character then
			for _2,Obj in next, Player.Character:GetDescendants() do
				if Obj.Name == "VisibleCham" then
					if tbl.Toggle then
						if values.visuals.players.teammates.Toggle or Player.Team ~= LocalPlayer.Team then
							Obj.Visible = true
						else
							Obj.Visible = false
						end
					else
						Obj.Visible = false
					end
					Obj.Color3 = tbl.Color
				end
			end
		end
	end
end)
players:Element("ToggleTrans", "wall chams", {default = {Color = Color3.fromRGB(0, 0, 0)}}, function(tbl)
	for _,Player in next, Players:GetPlayers() do
		if Player.Character then
			for _2,Obj in next, Player.Character:GetDescendants() do
				if Obj.Name == "WallCham" then
					if tbl.Toggle then
						if values.visuals.players.teammates.Toggle or Player.Team ~= LocalPlayer.Team then
							Obj.Visible = true
						else
							Obj.Visible = false
						end
					else
						Obj.Visible = false
					end
					Obj.Color3 = tbl.Color
				end
			end
		end
	end
end)
players:Element("ToggleTrans", "name", {default = {Color = Color3.fromRGB(111, 222, 255)}}) 
players:Element("ToggleTrans", "health", {default = {Color = Color3.fromRGB(111, 222, 255)}})
players:Element("ToggleTrans", "weapon", {default = {Color = Color3.fromRGB(111, 222, 255)}}) 
players:Element("ToggleTrans", "weapon icon", {default = {Color = Color3.fromRGB(111, 222, 255)}}) 
players:Element("Jumbobox", "indicators", {options = {"armor"}}) 
players:Element("Jumbobox", "outlines", {options = {"drawings", "text"}, default = {Jumbobox = {"drawings", "text"}}}) 
players:Element("Dropdown", "font", {options = {"Plex", "Monospace", "System", "UI"}}) 
players:Element("Slider", "size", {min = 12, max = 16, default = 13})  

local effects = visuals:Sector("effects", "Right") 
effects:Element("ToggleTrans", "weapon chams", {default = {Color = Color3.fromRGB(111, 222, 255), Transparency = 0}}, function(tbl) 
	if WeaponObj == nil then return end 
	if tbl.Toggle then 
		for i,v in next, WeaponObj do 
			UpdateWeapon(v) 
		end 
	else 
		for i,v in next, WeaponObj do 
			if v:IsA("MeshPart") then v.TextureID = v.OriginalTexture.Value end 
			if v:IsA("Part") and v:FindFirstChild("Mesh") and not v:IsA("BlockMesh") then 
				v.Mesh.TextureId = v.Mesh.OriginalTexture.Value 
				v.Mesh.VertexColor = Vector3.new(1,1,1) 
			end 
			v.Color = v.OriginalColor.Value 
			v.Material = v.OriginalMaterial.Value 
			v.Transparency = 0 
		end 
	end 
end) 
effects:Element("Dropdown", "material   ", {options = {"Smooth", "Flat", "ForceField", "Glass"}}, function(tbl) 
	if WeaponObj == nil then return end 
	if values.visuals.effects["weapon chams"].Toggle then 
		for i,v in next, WeaponObj do 
			UpdateWeapon(v) 
		end 
	end 
end)
effects:Element("Dropdown", "forcefield type", {options = {"normal", "web", "swirl"}})
effects:Element("Slider", "reflectance", {min = 0, max = 100, default = 0}, function(tbl) 
	if values.visuals.effects["weapon chams"].Toggle then 
		for i,v in next, WeaponObj do 
			UpdateWeapon(v) 
		end 
	end 
end) 
effects:Element("ToggleTrans", "glove chams", {default = {Color = Color3.fromRGB(111, 222, 255)}}, function(val) 
	if RArm == nil or LArm == nil then return end 
	if val.Toggle then 
		if RGlove ~= nil then 
			UpdateAccessory(RGlove) 
		end
		if LGlove ~= nil then 
			UpdateAccessory(LGlove) 
		end
	else 
		if RGlove then 
			ReverseAccessory(RGlove) 
		end 
		if LGlove then 
			ReverseAccessory(LGlove) 
		end
	end 
end)
effects:Element("Toggle", "sleeve chams", {default = {Color = Color3.fromRGB(111, 222, 255)}}, function(val) 
	if RArm == nil or LArm == nil then return end 
	if val.Toggle then
		if RSleeve ~= nil then 
			UpdateAccessory(RSleeve) 
		end
		if LSleeve ~= nil then 
			UpdateAccessory(LSleeve) 
		end 
	else
		if RSleeve then 
			ReverseAccessory(RSleeve) 
		end 
		if LSleeve then 
			ReverseAccessory(LSleeve) 
		end 
	end 
end)
effects:Element("Dropdown", "material ", {options = {"Smooth","ForceField"}}, function(val) 
	if RArm == nil or LArm == nil then return end 
    if values.visuals.effects["material "].Dropdown == "ForceField" or "Smooth" then
		if RGlove ~= nil then 
			UpdateAccessory(RGlove) 
		end 
		if RSleeve ~= nil then 
			UpdateAccessory(RSleeve) 
		end 
		if LGlove ~= nil then 
			UpdateAccessory(LGlove) 
		end 
		if LSleeve ~= nil then 
			UpdateAccessory(LSleeve) 
		end 
	end 
end) 
effects:Element("ToggleTrans", "arm chams", {default = {Color = Color3.fromRGB(111, 222, 255)}}, function(val) 
	if RArm == nil then return end 
	if LArm == nil then return end 
	if val.Toggle then 
		RArm.Color = val.Color 
		LArm.Color = val.Color 
		RArm.Transparency = val.Transparency 
		LArm.Transparency = val.Transparency 
	else 
		RArm.Color = RArm.Color3Value.Value 
		LArm.Color = RArm.Color3Value.Value 
		RArm.Transparency = 0 
		LArm.Transparency = 0 
	end 
end)
effects:Element("Toggle", "force crosshair")
effects:Element("ToggleTrans", "hitmarker", {default = {Color = Color3.fromRGB(255, 255, 255)}})

local self = visuals:Sector("self", "Right") 
self:Element("ToggleKeybind", "third person", {}, function(tbl) 
	if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then 
		if tbl.Toggle then 
			if tbl.Active then 
				LocalPlayer.CameraMaxZoomDistance = values.visuals.self.distance.Slider 
				LocalPlayer.CameraMinZoomDistance = values.visuals.self.distance.Slider 
				LocalPlayer.CameraMaxZoomDistance = values.visuals.self.distance.Slider 
				LocalPlayer.CameraMinZoomDistance = values.visuals.self.distance.Slider 
			else 
				LocalPlayer.CameraMaxZoomDistance = 0 
				LocalPlayer.CameraMinZoomDistance = 0 
				LocalPlayer.CameraMaxZoomDistance = 0 
				LocalPlayer.CameraMinZoomDistance = 0 
			end 
		else 
			LocalPlayer.CameraMaxZoomDistance = 0 
			LocalPlayer.CameraMinZoomDistance = 0 
		end 
	end 
end) 
self:Element("Slider", "distance", {min = 7, max = 18, default = 10}, function(tbl) 
	if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then 
		if values.visuals.self["third person"].Toggle then 
			if values.visuals.self["third person"].Active then 
				LocalPlayer.CameraMaxZoomDistance = tbl.Slider 
				LocalPlayer.CameraMinZoomDistance = tbl.Slider 
				LocalPlayer.CameraMaxZoomDistance = tbl.Slider 
				LocalPlayer.CameraMinZoomDistance = tbl.Slider 
			else 
				LocalPlayer.CameraMaxZoomDistance = 0 
				LocalPlayer.CameraMinZoomDistance = 0 
			end 
		else 
			LocalPlayer.CameraMaxZoomDistance = 0 
			LocalPlayer.CameraMinZoomDistance = 0 
		end 
	end 
end) 
LocalPlayer:GetPropertyChangedSignal("CameraMinZoomDistance"):Connect(function(current) 
	if values.visuals.self["third person"].Toggle then 
		if values.visuals.self["third person"].Active then 
			if current ~= values.visuals.self.distance.Slider then 
				LocalPlayer.CameraMinZoomDistance = values.visuals.self.distance.Slider 
			end 
		end 
	end 
end) 
self:Element("Slider", "fov changer", {min = 0, max = 120, default = 80}, function(value) 
	RunService.Heartbeat:Wait() 
	if LocalPlayer.Character == nil then return end 
	if fov == value.Slider then return end 
	if values.visuals.self["on scope"].Toggle or not LocalPlayer.Character:FindFirstChild("AIMING") then 
		Camera.FieldOfView = value.Slider 
	end 
end) 
self:Element("Toggle", "visualize silent angle")
self:Element("Toggle", "on scope") 
self:Element("Toggle", "viewmodel changer") 
self:Element("Slider", "viewmodel x", {min = -20, max = 20}, function(val) 
	ViewmodelOffset = CFrame.new(values.visuals.self["viewmodel x"].Slider/7, values.visuals.self["viewmodel y"].Slider/7, values.visuals.self["viewmodel z"].Slider/7)
end) 
self:Element("Slider", "viewmodel y", {min = -20, max = 20}, function(val) 
	ViewmodelOffset = CFrame.new(values.visuals.self["viewmodel x"].Slider/7, values.visuals.self["viewmodel y"].Slider/7, values.visuals.self["viewmodel z"].Slider/7)
end) 
self:Element("Slider", "viewmodel z", {min = -20, max = 20}, function(val) 
	ViewmodelOffset = CFrame.new(values.visuals.self["viewmodel x"].Slider/7, values.visuals.self["viewmodel y"].Slider/7, values.visuals.self["viewmodel z"].Slider/7)
end)
self:Element("ToggleTrans", "self chams", {default = {Color = Color3.fromRGB(111, 222, 255)}}, function(tbl) 
	if tbl.Toggle then 
		for _,obj in next, SelfObj do 
			if obj.Parent ~= nil then 
				obj.Material = values.visuals.self["material    "].Dropdown 
				obj.Color = tbl.Color 
			end 
		end 
	else 
		for _,obj in next, SelfObj do 
			if obj.Parent ~= nil then 
				obj.Material = obj.OriginalMaterial.Value 
				obj.Color = obj.OriginalColor.Value 
			end 
		end 
	end 
end) 

self:Element("Dropdown", "material    ", {options = {"ForceField", "Neon", "Glass"}}, function(val)
	if table.find(val, "ForceField") then
		for _,obj in next, SelfObj do 
			if obj.Parent ~= nil then 
				obj.Material = Enum.Material.ForceField
				obj.Color = tbl.Color
			end
		end
	else
		if table.find(val, "Neon") then
			for _,obj in next, SelfObj do 
				if obj.Parent ~= nil then
					obj.Material = Enum.Material.Neon
					obj.Color = tbl.Color
				end
			end
		else
			if table.find(val, "Glass") then
				for _,obj in next, SelfObj do
					if obj.Parent ~= nil then
						obj.Material = Enum.Material.Glass
						obj.Color = tbl.Color
					end
				end
			end
		end
	end
end)

self:Element("Slider", "scope blend", {min = 0, max = 100, default = 0}) 

local ads = Client.updateads 
Client.updateads = function(self, ...) 
	local args = {...} 
	coroutine.wrap(function() 
		wait() 
		if LocalPlayer.Character ~= nil then 
			for _,part in next, LocalPlayer.Character:GetDescendants() do 
				if part:IsA("Part") or part:IsA("MeshPart") then 
					if part.Transparency ~= 1 then 
						part.Transparency = LocalPlayer.Character:FindFirstChild("AIMING") and values.visuals.self["scope blend"].Slider/100 or 0 
					end 
				end 
				if part:IsA("Accessory") then 
					part.Handle.Transparency = LocalPlayer.Character:FindFirstChild("AIMING") and values.visuals.self["scope blend"].Slider/100 or 0 
				end 
			end 
		end 
	end)() 
	return ads(self, ...) 
end 

local world = visuals:Sector("world", "Left") 
world:Element("ToggleTrans", "molly radius", {default = {Color = Color3.fromRGB(111, 222, 255)}}, function(tbl) 
	if RayIgnore:FindFirstChild("Fires") == nil then return end 
	if tbl.Toggle then 
		for i,fire in next, RayIgnore:FindFirstChild("Fires"):GetChildren() do 
			fire.Transparency = tbl.Transparency 
			fire.Color = tbl.Color 
		end 
	else 
		for i,fire in next, RayIgnore:FindFirstChild("Fires"):GetChildren() do 
			fire.Transparency = 1 
		end 
	end 
end)
		world:Element("ToggleTrans", "bullet tracer color", {default = {Color = Color3.fromRGB(111, 222, 255)}})
		world:Element("Toggle", "bullet tracer ",  nil, function(tbl)
				if tbl.Toggle then
					local nevrblx = true
					if nevrblx == true then
						local Services = {
							Players = game:GetService("Players"),
							UserInputService = game:GetService("UserInputService"),
							RunService = game:GetService("RunService"),
							}

							local Local = {
							Player = Services.Players.LocalPlayer,
							Mouse = Services.Players.LocalPlayer:GetMouse(),
							}

							local Other = {
							Camera = workspace.CurrentCamera,
							BeamPart = Instance.new("Part", workspace)
							}

							Other.BeamPart.Name = "BeamPart"
							Other.BeamPart.Transparency = 1

							local Settings = {
							StartColor = Color3.new(1, 1, 1),
							EndColor = Color3.new(1, 0, 0),
							StartWidth = 1,
							EndWidth = 0.20,
							ShowImpactPoint = false,
							ImpactTransparency = 0,
							ImpactColor = Color3.new(1, 1, 1),
							Time = 0.5,
							}

						local mt = getrawmetatable(game)
						local old = mt.__namecall
						local lp = game:GetService("Players").LocalPlayer
						local rs = game:GetService("RunService").Heartbeat
						local lasthittick = tick()

							local funcs = {}
							local Silent = false

							function funcs:Beam(v1, v2)
								local colorSequence = ColorSequence.new({
									ColorSequenceKeypoint.new(0, Settings.StartColor),
									ColorSequenceKeypoint.new(1, Settings.EndColor),
									})
							local Part = Instance.new("Part", Other.BeamPart)
							Part.Size = Vector3.new(0, 0, 0)
							Part.Transparency = 1
							Part.CanCollide = false
							Part.CFrame = CFrame.new(v1)
							Part.Anchored = true
							local Attachment = Instance.new("Attachment", Part)
							local Part2 = Instance.new("Part", Other.BeamPart)
							Part2.Size = Vector3.new(0, 0, 0)
							Part2.Transparency = ShowImpactPoint and Settings.ImpactTransparency or 1
							Part2.CanCollide = false
							Part2.CFrame = CFrame.new(v2)
							Part2.Anchored = true
							Part2.Color = Settings.ImpactColor
							local Attachment2 = Instance.new("Attachment", Part2)
							local Beam = Instance.new("Beam", Part)
							Beam.FaceCamera = true
							Beam.Texture = "rbxassetid://446111271"
							Beam.TextureLength = 1
							Beam.TextureMode = Enum.TextureMode.Stretch
							Beam.TextureSpeed = 2.4
							Beam.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, values.visuals.world['bullet tracer color'].Color), ColorSequenceKeypoint.new(1, values.visuals.world['bullet tracer color'].Color)}
							Beam.Attachment0 = Attachment
							Beam.Attachment1 = Attachment2
							Beam.LightEmission = 6
							Beam.LightInfluence = 1
							Beam.Width0 = Settings.StartWidth
							Beam.Width1 = Settings.EndWidth
							delay(Settings.Time, function()
							for i = 0.5, 1, 0.02 do
							wait()
							Beam.Transparency = NumberSequence.new(i)
							end
							Part:Destroy()
							Part2:Destroy()
							end)
							end

							setreadonly(mt, false)
						mt.__namecall = newcclosure(function(self, ...)
							local args = {...}
							if getnamecallmethod() == "FireServer" and self.Name == "HitPart" and tick() - lasthittick > 0.005 then
								lasthittick = tick()
								spawn(function()
									local Beam = funcs:Beam(lp.Character.Gun.Flash.CFrame.p, args[2])
									for i = 1, 1 * lifetime do
										rs:Wait()
										Beam.Transparency = i / (1 * lifetime)
									end
									Beam:Destroy()
								end)
							end
							return old(self, ...)
						end)
						setreadonly(mt, true)
				end
			end
			end)
world:Element("ToggleTrans", "impacts", {default = {Color = Color3.fromRGB(111, 222, 255)}})
world:Element("Dropdown", "skybox", {options = {"none", "vivid sky", "blue nebula", "nebula", "cloudy skies", "dusty clouds", "purple sky", "clouds", "night", "minicraft", "rickroll", "Dababy", "MC"}}, function(tbl) 
	local sky = tbl.Dropdown 
	if sky ~= "none" then 
		if Lighting:FindFirstChildOfClass("Sky") then Lighting:FindFirstChildOfClass("Sky"):Destroy() end 
		local skybox = Instance.new("Sky") 
		skybox.SkyboxLf = Skyboxes[sky].SkyboxLf 
		skybox.SkyboxBk = Skyboxes[sky].SkyboxBk 
		skybox.SkyboxDn = Skyboxes[sky].SkyboxDn 
		skybox.SkyboxFt = Skyboxes[sky].SkyboxFt 
		skybox.SkyboxRt = Skyboxes[sky].SkyboxRt 
		skybox.SkyboxUp = Skyboxes[sky].SkyboxUp 
		skybox.Name = "override" 
		skybox.Parent = Lighting 
	else 
		if Lighting:FindFirstChildOfClass("Sky") then Lighting:FindFirstChildOfClass("Sky"):Destroy() end 
		if oldSkybox ~= nil then oldSkybox:Clone().Parent = Lighting end 
	end 
end)
world:Element("Slider", "time changer", {min = 0, max = 12, default = 0}, function(tbl) 
	game.Lighting.ClockTime = tbl.Slider
end)  
world:Element("ToggleTrans", "world color", {default = {Color = Color3.fromRGB(111, 222, 255)}}, function(val) 
	if val.Toggle then 
		Camera.ColorCorrection.TintColor = val.Color 
	else 
		Camera.ColorCorrection.TintColor = Color3.fromRGB(255, 255, 255) 
	end 
end)
world:Element("ToggleTrans", "ambient", {default = {Color = Color3.fromRGB(255,255,255)}}, function(val) 
	if val.Toggle then
		game.Lighting.ColorShift_Bottom = val.Color
		game.Lighting.ColorShift_Top = val.Color
		game.Lighting.OutdoorAmbient = val.Color
		game.Lighting.ColorShift_Bottom = val.Color
		game.Lighting.ColorShift_Top = val.Color
	else
		game.Lighting.ColorShift_Bottom = Color3.fromRGB(255, 255, 255)
		game.Lighting.ColorShift_Top = Color3.fromRGB(255, 255, 255)
		game.Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
		game.Lighting.ColorShift_Bottom = Color3.fromRGB(255, 255, 255)
		game.Lighting.ColorShift_Top = Color3.fromRGB(255, 255, 255)
	end
end)
world:Element("Toggle", "shadowmap technology", nil, function(val) sethiddenproperty(Lighting, "Technology", val.Toggle and "ShadowMap" or "Legacy") end)
local saturation = Instance.new("ColorCorrectionEffect", workspace.CurrentCamera)
world:Element("Toggle", "saturation", {}, function(tbl)
	if tbl.Toggle then
		_G.DisableSaturation = false
		local sat
		sat = game:GetService("RunService").Heartbeat:Connect(function()
			if _G.DisableSaturation then 
				sat:Disconnect() 
				return 
			end
			saturation.Saturation = values.visuals.world["saturation amount"].Slider / 100
		end)
	else
		_G.DisableSaturation = false
		saturation.Saturation = 0
	end
end)
world:Element("Slider", "saturation amount", {min = 0, max = 200, default = 40}) 
local mS = game.Lighting
world:Element("ToggleTrans", "fog effect", {default = {Color = Color3.fromRGB(255,255,255)}}, function(val)
	if tbl.Toggle then
		_G.DisableFog = false
		local fog
		fog = game:GetService("RunService").Heartbeat:Connect(function()
			if _G.DisableFog then 
				fog:Disconnect() 
				return 
			end
			mS.FogEnd = 1000
			mS.FogStart = 0
			mS.FogColor = val.Color
		end)
	else
		_G.DisableFog = true
		mS.FogEnd = 999999
		mS.FogStart = 9999999
	end
end)

local custom = custom:Sector("models", "Left")
custom:Element("Button", "Reset Knives", {}, function(tbl)
	game.ReplicatedStorage.Viewmodels["v_CT Knife"]:Destroy()
	wait()
	local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
	game:GetObjects('rbxassetid://7311308040')[1].Parent = Model1
	Model = game.ReplicatedStorage.Viewmodels.Model
	for _, Child in next, Model:GetChildren() do
		Child.Parent = Model.Parent
	end
	Model:Destroy()
	wait()
	game.ReplicatedStorage.Viewmodels["v_T Knife"]:Destroy()
	wait()
	local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
	game:GetObjects('rbxassetid://7311365626')[1].Parent = Model1
	Model = game.ReplicatedStorage.Viewmodels.Model
	for _, Child in next, Model:GetChildren() do
		Child.Parent = Model.Parent
	end
	Model:Destroy()
end)
custom:Element("Toggle", "Barrett [Auto]", nil, function(tbl)
	if tbl.Toggle then 
	    game.ReplicatedStorage.Viewmodels["v_G3SG1"]:Destroy()
		wait()
		local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
		game:GetObjects('rbxassetid://6477308219')[1].Parent = Model1
		Model = game.ReplicatedStorage.Viewmodels.Model
		for _, Child in next, Model:GetChildren() do
			Child.Parent = Model.Parent
		end
		Model:Destroy()
		game.ReplicatedStorage.Viewmodels["v_Barrett"].Name = "v_G3SG1"
	end
end)
custom:Element("Toggle", "Mosin [AWP]", nil, function(tbl)
	if tbl.Toggle then
	    game.ReplicatedStorage.Viewmodels["v_AWP"]:Destroy()
		wait()
		local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
		game:GetObjects('rbxassetid://6482147359')[1].Parent = Model1
		Model = game.ReplicatedStorage.Viewmodels.Model
		for _, Child in next, Model:GetChildren() do
			Child.Parent = Model.Parent
		end
		Model:Destroy()
		game.ReplicatedStorage.Viewmodels["v_Mosin-Nagant Optical"].Name = "v_AWP"
	end
end)
custom:Element("Toggle", "M1 Garand [Scout]", nil, function(tbl)
	if tbl.Toggle then 
		game.ReplicatedStorage.Viewmodels["v_Scout"]:Destroy()
		wait()
		local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
		game:GetObjects('rbxassetid://6477587469')[1].Parent = Model1
		Model = game.ReplicatedStorage.Viewmodels.Model
		for _, Child in next, Model:GetChildren() do
			Child.Parent = Model.Parent
		end
		Model:Destroy()
		game.ReplicatedStorage.Viewmodels["v_M1 Garand"].Name = "v_Scout"
	end
end)
custom:Element("Toggle", "Dragon [AK-47]", nil, function(tbl)
	if tbl.Toggle then 
	game.ReplicatedStorage.Viewmodels["v_AK47"]:Destroy()
		wait()
		local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
		game:GetObjects('rbxassetid://7161345483')[1].Parent = Model1
		Model = game.ReplicatedStorage.Viewmodels.Model
		for _, Child in next, Model:GetChildren() do
			Child.Parent = Model.Parent
		end
		Model:Destroy()
		game.ReplicatedStorage.Viewmodels["v_AK47drangon"].Name = "v_AK47"
	end
end)
custom:Element("Toggle", "Csgo [AWP]", nil, function(tbl)
	if tbl.Toggle then
        game.ReplicatedStorage.Viewmodels["v_AWP"]:Destroy()
        wait()
        local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
        game:GetObjects('rbxassetid://7161319343')[1].Parent = Model1
        Model = game.ReplicatedStorage.Viewmodels.Model
        for _, Child in next, Model:GetChildren() do
            Child.Parent = Model.Parent
        end
        Model:Destroy()
        game.ReplicatedStorage.Viewmodels["awpAZIM"].Name = "v_AWP"
    end
end)
custom:Element("Toggle", "Csgo [Scout]", nil, function(tbl)
	if tbl.Toggle then 
	game.ReplicatedStorage.Viewmodels["v_Scout"]:Destroy()
		wait()
		local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
		game:GetObjects('rbxassetid://7161407697')[1].Parent = Model1
		Model = game.ReplicatedStorage.Viewmodels.Model
		for _, Child in next, Model:GetChildren() do
			Child.Parent = Model.Parent
		end
		Model:Destroy()
		game.ReplicatedStorage.Viewmodels["v_Scoutfever"].Name = "v_Scout"
	end
end)
custom:Element("Toggle", "Railgun [Scout]", nil, function(tbl)
	if tbl.Toggle then 
	game.ReplicatedStorage.Viewmodels["v_Scout"]:Destroy()
		wait()
		local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
		game:GetObjects('rbxassetid://6477284418')[1].Parent = Model1
		Model = game.ReplicatedStorage.Viewmodels.Model
		for _, Child in next, Model:GetChildren() do
			Child.Parent = Model.Parent
		end
		Model:Destroy()
		game.ReplicatedStorage.Viewmodels["v_Railgun"].Name = "v_Scout"
	end
end)
custom:Element("Toggle", "Codol [AWP]", nil, function(tbl)
	if tbl.Toggle then
        game.ReplicatedStorage.Viewmodels["v_AWP"]:Destroy()
        wait()
        local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
        game:GetObjects('rbxassetid://7161371614')[1].Parent = Model1
        Model = game.ReplicatedStorage.Viewmodels.Model
        for _, Child in next, Model:GetChildren() do
            Child.Parent = Model.Parent
        end
        Model:Destroy()
        game.ReplicatedStorage.Viewmodels["v_codol"].Name = "v_AWP"
    end
end)
custom:Element("Toggle", "Newan [Scout]", nil, function(tbl)
	if tbl.Toggle then 
		game.ReplicatedStorage.Viewmodels["v_Scout"]:Destroy()
		wait()
		local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
		game:GetObjects('rbxassetid://7161433164')[1].Parent = Model1
		Model = game.ReplicatedStorage.Viewmodels.Model
		for _, Child in next, Model:GetChildren() do
			Child.Parent = Model.Parent
		end
		Model:Destroy()
		game.ReplicatedStorage.Viewmodels["v_Scoutnewan"].Name = "v_Scout"
    end
end)
custom:Element("Toggle", "Newan [USP]", nil, function(tbl)
	if tbl.Toggle then 
		game.ReplicatedStorage.Viewmodels["v_USP"]:Destroy()
		wait()
		local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
		game:GetObjects('rbxassetid://7161365495')[1].Parent = Model1
		Model = game.ReplicatedStorage.Viewmodels.Model
		for _, Child in next, Model:GetChildren() do
			Child.Parent = Model.Parent
		end
		Model:Destroy()
		game.ReplicatedStorage.Viewmodels["v_USPnew"].Name = "v_USP"
	end
end)
custom:Element("Toggle", "Bowie [Knife]", nil, function(tbl)
	if tbl.Toggle then 
		game.ReplicatedStorage.Viewmodels["v_CT Knife"]:Destroy()
		game.ReplicatedStorage.Viewmodels["v_T Knife"]:Destroy()
		wait()
		local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
		game:GetObjects('rbxassetid://7161240289')[1].Parent = Model1
		Model = game.ReplicatedStorage.Viewmodels.Model
		for _, Child in next, Model:GetChildren() do
			Child.Parent = Model.Parent
		end
		Model:Destroy()
		wait()
		local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
		game:GetObjects('rbxassetid://7161240289')[1].Parent = Model1
		Model = game.ReplicatedStorage.Viewmodels.Model
		for _, Child in next, Model:GetChildren() do
			Child.Parent = Model.Parent
		end
		Model:Destroy()
		wait()
		game.ReplicatedStorage.Viewmodels["v_bowknife"].Name = "v_CT Knife"
		game.ReplicatedStorage.Viewmodels["v_bowknife"].Name = "v_T Knife"
	end
end)
custom:Element("Toggle", "Netherite Sword [Knife]", nil, function(tbl)
	if tbl.Toggle then 
		game.ReplicatedStorage.Viewmodels["v_CT Knife"]:Destroy()
		game.ReplicatedStorage.Viewmodels["v_T Knife"]:Destroy()
		wait()
		local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
		game:GetObjects('rbxassetid://7917769386')[1].Parent = Model1
		Model = game.ReplicatedStorage.Viewmodels.Model
		for _, Child in next, Model:GetChildren() do
			Child.Parent = Model.Parent
		end
		Model:Destroy()
		wait()
		local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
		game:GetObjects('rbxassetid://7917769386')[1].Parent = Model1
		Model = game.ReplicatedStorage.Viewmodels.Model
		for _, Child in next, Model:GetChildren() do
			Child.Parent = Model.Parent
		end
		Model:Destroy()
		wait()
		game.ReplicatedStorage.Viewmodels["SwordMC"].Name = "v_CT Knife"
		game.ReplicatedStorage.Viewmodels["SwordMC"].Name = "v_T Knife"
		wait()
		game.ReplicatedStorage.Viewmodels["v_CT Knife"].Handle.TextureID = "rbxassetid://7375049028"
		game.ReplicatedStorage.Viewmodels["v_T Knife"].Handle.TextureID = "rbxassetid://7375049028"
	end
end)
custom:Element("Toggle", "Shadow Daggers Fade [Knife]", nil, function(tbl)
	if tbl.Toggle then 
		game.ReplicatedStorage.Viewmodels["v_CT Knife"]:Destroy()
		game.ReplicatedStorage.Viewmodels["v_T Knife"]:Destroy()
		wait()
		local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
		game:GetObjects('rbxassetid://7161082619')[1].Parent = Model1
		Model = game.ReplicatedStorage.Viewmodels.Model
		for _, Child in next, Model:GetChildren() do
			Child.Parent = Model.Parent
		end
		Model:Destroy()
		wait()
		local Model1 = Instance.new("Model", game.ReplicatedStorage.Viewmodels)
		game:GetObjects('rbxassetid://7161082619')[1].Parent = Model1
		Model = game.ReplicatedStorage.Viewmodels.Model
		for _, Child in next, Model:GetChildren() do
			Child.Parent = Model.Parent
		end
		Model:Destroy()
		wait()
		game.ReplicatedStorage.Viewmodels["v_daggers"].Name = "v_CT Knife"
		game.ReplicatedStorage.Viewmodels["v_daggers"].Name = "v_T Knife"
	end
end)
local configs = misc:Sector("configs", "Left") 
configs:Element("TextBox", "config", {placeholder = "config name"}) 
configs:Element("Button", "save", {}, function() if values.misc.configs.config.Text ~= "" then library:SaveConfig(values.misc.configs.config.Text) end end) 
configs:Element("Button", "load", {}, function() if values.misc.configs.config.Text ~= "" then ConfigLoad:Fire(values.misc.configs.config.Text) end end)
configs:Element("Toggle", "keybind list", nil, function(tbl) 
	library:SetKeybindVisible(tbl.Toggle) 
end) 
configs:Element("Toggle", "watermark", nil, function(tbl)
	library:SetWatermarkVisible(tbl.Toggle)
end)
configs:Element("Toggle", "spectator list", nil, function(tbl)
	library:SetSpectatorsVisible(tbl.Toggle)
end)

local crosshaireditor = misc:Sector("crosshair editor", "Right") 
local function UpdateCrosshair() 
	if values.misc["crosshair editor"].enabled.Toggle then 
		local length = values.misc["crosshair editor"].length.Slider 
		Crosshair.LeftFrame.Size = UDim2.new(0, length, 0, 2) 
		Crosshair.RightFrame.Size = UDim2.new(0, length, 0, 2) 
		Crosshair.TopFrame.Size = UDim2.new(0, 2, 0, length) 
		Crosshair.BottomFrame.Size = UDim2.new(0, 2, 0, length) 
		for _,frame in next, Crosshair:GetChildren() do 
			if string.find(frame.Name, "Frame") then 
				frame.BorderColor3 = Color3.new(0,0,0) 
				if values.misc["crosshair editor"].border.Toggle then 
					frame.BorderSizePixel = 1 
				else 
					frame.BorderSizePixel = 0 
				end 
			end 
		end 
	else 
		Crosshair.LeftFrame.Size = UDim2.new(0, 10, 0, 2) 
		Crosshair.RightFrame.Size = UDim2.new(0, 10, 0, 2) 
		Crosshair.TopFrame.Size = UDim2.new(0, 2, 0, 10) 
		Crosshair.BottomFrame.Size = UDim2.new(0, 2, 0, 10) 
		for _,frame in next, Crosshair:GetChildren() do 
			if string.find(frame.Name, "Frame") then 
				frame.BorderSizePixel = 0 
			end 
		end 
	end 
end 
crosshaireditor:Element("Toggle", "enabled", nil, UpdateCrosshair) 
crosshaireditor:Element("Slider", "length", {min = 1, max = 15, default = 10}, UpdateCrosshair) 
crosshaireditor:Element("Toggle", "border", nil, UpdateCrosshair) 

local client = misc:Sector("client", "Right") 
client:Element("Toggle", "infinite cash", nil, function(tbl) 
	if tbl.Toggle then 
		LocalPlayer.Cash.Value = 90000000000 
	end 
end) 
client:Element("Toggle", "infinite crouch") 
client:Element("Jumbobox", "damage bypass", {options = {"fire", "fall"}})
client:Element("Jumbobox", "removals", {options = {"scope", "scope lines", "flash", "smoke", "shadows", "clothes"}}, function(val) 
	local tbl = val.Jumbobox 
	if table.find(tbl, "clothes") then 
		if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("UpperTorso") then 
			if LocalPlayer.Character:FindFirstChild("Shirt") then 
				LocalPlayer.Character:FindFirstChild("Shirt").ShirtTemplate = "" 
			end 
			if LocalPlayer.Character:FindFirstChild("Pants") then 
				LocalPlayer.Character:FindFirstChild("Pants").PantsTemplate = "" 
			end 
		end 
	else 
		if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("UpperTorso") then 
			if LocalPlayer.Character:FindFirstChild("Shirt") then 
				LocalPlayer.Character:FindFirstChild("Shirt").ShirtTemplate = LocalPlayer.Character:FindFirstChild("Shirt").OriginalTexture.Value 
			end 
			if LocalPlayer.Character:FindFirstChild("Pants") then 
				LocalPlayer.Character:FindFirstChild("Pants").PantsTemplate = LocalPlayer.Character:FindFirstChild("Pants").OriginalTexture.Value 
			end 
		end 
	end 
	if table.find(tbl, "scope") and table.find(values.misc.client.removals.Jumbobox, "scope lines") then 
		Crosshairs.Scope.ImageTransparency = 1 
		Crosshairs.Scope.Scope.ImageTransparency = 1 
		Crosshairs.Frame1.Transparency = 1 
		Crosshairs.Frame2.Transparency = 1 
		Crosshairs.Frame3.Transparency = 1 
		Crosshairs.Frame4.Transparency = 1 
	else 
		Crosshairs.Scope.ImageTransparency = 0 
		Crosshairs.Scope.Scope.ImageTransparency = 0 
		Crosshairs.Frame1.Transparency = 0 
		Crosshairs.Frame2.Transparency = 0 
		Crosshairs.Frame3.Transparency = 0 
		Crosshairs.Frame4.Transparency = 0 
	end 
	PlayerGui.Blnd.Enabled = not table.find(tbl, "flash") and true or false 
	Lighting.GlobalShadows = not table.find(tbl, "shadows") and true or false 
	if RayIgnore:FindFirstChild("Smokes") then 
		if table.find(tbl, "smoke") then 
			for i,smoke in next, RayIgnore.Smokes:GetChildren() do 
				smoke.ParticleEmitter.Rate = 0 
			end 
		else 
			for i,smoke in next, RayIgnore.Smokes:GetChildren() do 
				smoke.ParticleEmitter.Rate = smoke.OriginalRate.Value
			end 
		end 
	end 
end)
client:Element("Jumbobox", "gun modifiers", {options = {"recoil", "spread", "ammo", "firerate", "fake hps"}}) 
client:Element("Toggle", "remove killers", {}, function(tbl) 
	if tbl.Toggle then 
		if workspace:FindFirstChild("Map") and workspace:FindFirstChild("Map"):FindFirstChild("Killers") then 
			local clone = workspace:FindFirstChild("Map"):FindFirstChild("Killers"):Clone() 
			clone.Name = "KillersClone" 
			clone.Parent = workspace:FindFirstChild("Map") 

			workspace:FindFirstChild("Map"):FindFirstChild("Killers"):Destroy() 
		end 
	else 
		if workspace:FindFirstChild("Map") and workspace:FindFirstChild("Map"):FindFirstChild("KillersClone") then 
			workspace:FindFirstChild("Map"):FindFirstChild("KillersClone").Name = "Killers" 
		end 
	end 
end)
client:Element("Toggle", "buy any grenade") 
client:Element("Jumbobox", "shop", {options = {"anywhere"}}) 
client:Element("Toggle", "anti spectate")
client:Element("Toggle", "backwards spectate")

local oldgrenadeallowed = Client.grenadeallowed 
Client.grenadeallowed = function(...) 
	if values.misc.client["buy any grenade"].Toggle then
		return true 
	end 

	return oldgrenadeallowed(...) 
end 

local LagTick = 0

local fakelag = misc:Sector("fakelag", "Left") 
fakelag:Element("Toggle", "enabled", {default = {Toggle = false}}, function(tbl) 
	if tbl.Toggle then 
	else 
		FakelagFolder:ClearAllChildren() 
		game:GetService("NetworkClient"):SetOutgoingKBPSLimit(9e9) 
	end 
end) 
fakelag:Element("Dropdown", "amount", {options = {"static", "dynamic"}})      
fakelag:Element("Slider", "limit", {min = 1, max = 16, default = 8})      
fakelag:Element("ToggleTrans", "visualize lag", {default = {Toggle = false, Color = Color3.fromRGB(111, 222, 255)}}, function(tbl) 
	if tbl.Toggle then 
		for _,obj in next, FakelagFolder:GetChildren() do 
			obj.Color = tbl.Color 
		end 
	else 
		FakelagFolder:ClearAllChildren() 
	end 
end) 
fakelag:Element("ToggleKeybind", "ping spike") 
coroutine.wrap(function()      
	while wait(1/16) do      
		LagTick = math.clamp(LagTick + 1, 0, values.misc.fakelag.limit.Slider)      
		if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("UpperTorso") and values.misc.fakelag.enabled.Toggle then    
			if LagTick == (values.misc.fakelag.amount.Dropdown == "static" and values.misc.fakelag.limit.Slider or math.random(1, values.misc.fakelag.limit.Slider)) then      
				game:GetService("NetworkClient"):SetOutgoingKBPSLimit(9e9)      
				FakelagFolder:ClearAllChildren()      
				LagTick = 0      
				if values.misc.fakelag["visualize lag"].Toggle then      
					for _,hitbox in next, LocalPlayer.Character:GetChildren() do      
						if hitbox:IsA("BasePart") and hitbox.Name ~= "HumanoidRootPart" then      
							local part = Instance.new("Part")      
							part.CFrame = hitbox.CFrame      
							part.Anchored = true      
							part.CanCollide = false      
							part.Material = Enum.Material.ForceField       
							part.Color = values.misc.fakelag["visualize lag"].Color      
							part.Name = hitbox.Name      
							part.Transparency = 0      
							part.Size = hitbox.Size      
							part.Parent = FakelagFolder      
						end      
					end      
				end      
			else      
				if values.misc.fakelag.enabled.Toggle then      
					game:GetService("NetworkClient"):SetOutgoingKBPSLimit(1)      
				end      
			end      
		else      
			FakelagFolder:ClearAllChildren()      
			game:GetService("NetworkClient"):SetOutgoingKBPSLimit(9e9)      
		end      
	end      
end)()
fakelag:Element("ToggleKeybind", "freeze clip", nil, function(tbl)
	if tbl.Toggle and tbl.Active then
		local Freto = Instance.new("Part")
		Freto.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity
		Freto.CanCollide = false

		Freto.BottomSurface = Enum.SurfaceType.Smooth
		Freto.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		Freto.Name = "Freto"
		Freto.Size = Vector3.new(30, 1, 30)
		Freto.TopSurface = Enum.SurfaceType.Smooth
		Freto.Parent = game:GetService("Workspace")
		Freto.Transparency = 1

		local Part = Instance.new("Part")
		Part.CanCollide = false
		Part.Anchored = true
		Part.BottomSurface = Enum.SurfaceType.Smooth
		Part.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		Part.Material = Enum.Material.ForceField
		Part.Shape = Enum.PartType.Ball
		Part.Size = Vector3.new(2, 2, 2)
		Part.TopSurface = Enum.SurfaceType.Smooth
		Part.Transparency = 0.3
		Part.Parent = Freto
		Part.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position

		local Weld = Instance.new("Weld", Freto)
		Weld.Parent = Freto
		Weld.Part0 = Freto
		Weld.Part1 = game.Players.LocalPlayer.Character.HumanoidRootPart
	else
		game.Workspace.Freto:Destroy()
	end
end)

local chat = misc:Sector("chat", "Left") 
chat:Element("Toggle", "chat spam", nil, function(tbl) 
	if tbl.Toggle then 
		while values.misc.chat["chat spam"].Toggle do 
			game:GetService("ReplicatedStorage").Events.PlayerChatted:FireServer(values.misc.chat.type.Dropdown == "standard" and "you got neverbloxed" or "Neverblox.cc", false, "Innocent", false, true) 
			wait(values.misc.chat["speed (ms)"].Slider/1000) 
			 
		end 
	end 
end) 
chat:Element("Dropdown", "type", {options = {"standard", "neverblox.cc"}}) 
chat:Element("Slider", "speed (ms)", {min = 15, max = 300, default = 50}) 
chat:Element("Toggle", "kill say") 
chat:Element("TextBox", "message", {placeholder = "message"}) 
chat:Element("Toggle", "no filter")
chat:Element("Toggle", "chat alive")


local audio = misc:Sector("audio", "Right") 
audio:Element("Dropdown", "hitsound", {options = {"none", "neverlose", "headshot", "skeet", "rust", "bag", "squash", "lessgo", "MCOOF", "baimware", "osu", "Tf2", "Slap", "1", "Minecraft", "jojo", "vibe", "supersmash", "epic", "retro", "quek"}}) 
audio:Element("Slider", "sound volume", {min = 1, max = 5, default = 3}) 
audio:Element("Toggle", "gun sounds", nil, function(tbl)
	if tbl.Toggle then
		OldGunSounds = game:GetService("RunService").Heartbeat:Connect(function()
			pcall(function()
				local player = game:GetService("Players").LocalPlayer.Character
				if player.EquippedTool.Value == "AK47" then
					player.Gun.Shoot.SoundId = "rbxassetid://168436671"
				end
		
				if player.EquippedTool.Value == "M4A1" then
					player.Gun.SShoot.SoundId = "rbxassetid://1665639883"
		
				end
		
				if player.EquippedTool.Value == "Glock" then
					player.Gun.Shoot.SoundId = "rbxassetid://1665635507"
		
				end
		
				if player.EquippedTool.Value == "M4A1" then
					player.Gun.Shoot.SoundId = "rbxassetid://223013951"
		
				end
		
				if player.EquippedTool.Value == "Galil" then
					player.Gun.Shoot.SoundId = "rbxassetid://344800912"
				end
		
				if player.EquippedTool.Value == "USP" then
					player.Gun.SShoot.SoundId = "rbxassetid://1112952739"
				end
		
				if player.EquippedTool.Value == "USP" then
					player.Gun.Shoot.SoundId = "rbxassetid://1665652648"
				end
		
				if player.EquippedTool.Value == "DualBerettas" then 
					player.Gun1.Shoot.SoundId = "rbxassetid://251030881"
					player.Gun2.Shoot.SoundId = "rbxassetid://251030881"
				end
		
				if player.EquippedTool.Value == "P250" then
					player.Gun.Shoot.SoundId = "rbxassetid://340365431"
				end
		
				if player.EquippedTool.Value == "DesertEagle" then
					player.Gun.Shoot.SoundId = "rbxassetid://202918645"
				end
		
				if player.EquippedTool.Value == "M249" then
					player.Gun.Shoot.SoundId = "rbxassetid://193868290"
				end
		
				if player.EquippedTool.Value == "MP9" then
					player.Gun.Shoot.SoundId = "rbxassetid://222888810"
				end
		
				if player.EquippedTool.Value == "MP7-SD" then
					player.Gun.Shoot.SoundId = "rbxassetid://2794150850"
				end
		
				if player.EquippedTool.Value == "UMP" then
					player.Gun.Shoot.SoundId = "rbxassetid://206953341"
				end
		
				if player.EquippedTool.Value == "P90" then
					player.Gun.Shoot.SoundId = "rbxassetid://1665644012"
				end
		
				if player.EquippedTool.Value == "Bizon" then
					player.Gun.Shoot.SoundId = "rbxassetid://485606203"
				end
		
				if player.EquippedTool.Value == "Famas" then
					player.Gun.Shoot.SoundId = "rbxassetid://206953280"
				end
		
				if player.EquippedTool.Value == "Scout" then
					player.Gun.Shoot.SoundId = "rbxassetid://7380898789"
				end
		
				if player.EquippedTool.Value == "AUG" then
					player.Gun.Shoot.SoundId = "rbxassetid://1657593449"
				end
		
				if player.EquippedTool.Value == "AWP" then
					player.Gun.Shoot.SoundId = "rbxassetid://2753888131"
					player.Gun.Zoom.PlaybackSpeed = 1
				end
		
				if player.EquippedTool.Value == "G3SG1" then
					player.Gun.Shoot.SoundId = "rbxassetid://340365815"
				end
		
				if player.EquippedTool.Value == "MAC10" then
					player.Gun.Shoot.SoundId = "rbxassetid://242422782"
				end
		
				if player.EquippedTool.Value == "SawedOff" then
					player.Gun.Shoot.SoundId = "rbxassetid://1158047483"
				end
		
				if player.EquippedTool.Value == "CZ" then
					player.Gun.Shoot.SoundId = "rbxassetid://458727115"
				end
		
				if player.EquippedTool.Value == "Nova" then
					player.Gun.Shoot.SoundId = "rbxassetid://206953213"
				end
		
				if player.EquippedTool.Value == "XM" then
					player.Gun.Shoot.SoundId = "rbxassetid://202918888"
				end
		
				if player.EquippedTool.Value == "MAG7" then
					player.Gun.Shoot.SoundId = "rbxassetid://395724758"
				end
		
				if player.EquippedTool.Value == "Negev" then
					player.Gun.Shoot.SoundId = "rbxassetid://396243767"
				end
		
				if player.EquippedTool.Value == "SG" then
					player.Gun.Shoot.SoundId = "rbxassetid://347270113"
				end
		
				if player.EquippedTool.Value == "T Knife" then
					player.Gun.Shoot1.SoundId = "rbxassetid://1665637464"
					player.Gun.Shoot2.SoundId = "rbxassetid://1665637740"
				end
		
				if player.EquippedTool.Value == "CT Knife" then
					player.Gun.Shoot1.SoundId = "rbxassetid://1665637464"
					player.Gun.Shoot2.SoundId = "rbxassetid://1665637740"
				end
		
				if player.EquippedTool.Value == "M4A4" then
					player.Gun.Shoot.SoundId = "rbxassetid://202918741"
				end
		
				if player.EquippedTool.Value == "FiveSevenMoment" then
					player.Gun.Shoot.SoundId = "rbxassetid://212374232"
				end
		
				if player.EquippedTool.Value == "FiveSeven" then
					player.Gun.Shoot.SoundId = "rbxassetid://212374232"
				end
		
				if player.EquippedTool.Value == "Tec9" then
					player.Gun.Shoot.SoundId = "rbxassetid://206953317"
				end
				
				if player.EquippedTool.Value == "P2000" then
					player.Gun.Shoot.SoundId = "rbxassetid://263589107"
				end
				
				if player.EquippedTool.Value == "MP7" then
					player.Gun.Shoot.SoundId = "rbxassetid://2752835613"
				end
			end)
		end)
	else
		OldGunSounds:Disconnect()
	end
end)

local Dance = Instance.new("Animation")
Dance.AnimationId = ""
Dance.Name = 'Dance'

local LoadedAnim 

local animations = misc:Sector("animations", "Right")
animations:Element("Toggle", "enabled", nil)

animations:Element("Slider", "animation speed", {min = 0, max = 100, default = 1}, function()
	pcall(function()
		LoadedAnim:Stop()
	end)
end)

local animationsplay = {
	['crunch'] = 'rbxassetid://4526742158',
	['floss'] = 'rbxassetid://5917459365',
	['default'] = 'rbxassetid://3732699835',
    ["Nothing"] = "rbxassetid://2597335002",
    ["Praisin'"] = "rbxassetid://2804019904",
    ["No Touchin'"] = "rbxassetid://2805054405",
    ["Default"] = "rbxassetid://3732699835",
    ["Thriller"] = "rbxassetid://4174360426",
    ["Showtime Swing"] = "rbxassetid://4802193849",
    ["Skateboard"] = "rbxassetid://3725767158",
    ["Crazy Chainsaw"] = "rbxassetid://5822705079",
    ["Summer Slack"] = "rbxassetid://3226145532",
    ["Fashionable"] =  "rbxassetid://3333331310",
    ["Sleep"] = "rbxassetid://4686925579",
    ["head spin"] = "rbxassetid://4686925579",
    ["air anti aim"] = "rbxassetid://4555782893",
    ["dolphin"] = "rbxassetid://5918726674",
    ["Monkey"] = "rbxassetid://3333499508",
    ["around town"] = "rbxassetid://3303391864",
    ["Baby Dance"] = "rbxassetid://4265725525",
    ["Old Town Road"] = "rbxassetid://5937560570",
    ["Line Dance"] = "rbxassetid://4049037604",
    ["Happy"] = "rbxassetid://4841405708",
    ["Dorky Dance"] = "rbxassetid://4212455378",
    ["Hero Landing"] = "rbxassetid://5104344710",
    ["Jacks"] = "rbxassetid://3338066331",
    ["Clap"] = "rbxassetid://5915693819",
    ["Yoga"] = "rbxassetid://7465981288",
    ["Holiday Dance"] = "rbxassetid://5937558680",
    ["Boxing Punch"] = "rbxassetid://7202863182",
    ["Break Dance"] = "rbxassetid://5915648917",
    ["Rodeo Dance"] = "rbxassetid://5918728267",
    ["Tree"] = "rbxassetid://4049551434",
    ["Disagree"] = "rbxassetid://4841401869",
    ["Agree"] = "rbxassetid://4841397952",
    ["Bodybuilder"] = "rbxassetid://3333387824",
    ["Super Idol"] = "rbxassetid://4101966434",
    ["Sad"] = "rbxassetid://3337994105",
    ["Confused"] = "rbxassetid://4940561610",
    ["Samba"] = "rbxassetid://6869766175",
    ["Twirl"] = "rbxassetid://3334968680",
    ["Swish"] = "rbxassetid://3361481910",
    ["Robot"] = "rbxassetid://3338025566",
    ["Sneaky"] = "rbxassetid://3334424322",
    ["Drum Master"] = "rbxassetid://6531483720",
}

local animlist = {}

for a,b in next, animationsplay do 
	table.insert(animlist, a)
end

animations:Element("Dropdown", "animation", {options = animlist}, function(tbl)
	pcall(function()
		LoadedAnim:Stop()
	end)

	Dance.AnimationId = animationsplay[tbl.Dropdown]
end)

local objects = {} 
local utility = {} 
do 
	utility.default = { 
		Line = { 
			Thickness = 1, 
			Color = Color3.fromRGB(111, 222, 255), 
			Visible = false 
		}, 
		Text = { 
			Size = 13, 
			Center = true, 
			Outline = true, 
			Font = Drawing.Fonts.Plex, 
			Color = Color3.fromRGB(111, 222, 255), 
			Visible = false 
		}, 
		Square = { 
			Thickness = 1, 
			Filled = false, 
			Color = Color3.fromRGB(111, 222, 255), 
			Visible = false 
		}, 
	} 
	function utility.create(type, isOutline) 
		local drawing = Drawing.new(type) 
		for i, v in next, utility.default[type] do 
			drawing[i] = v 
		end 
		if isOutline then 
			drawing.Color = Color3.new(0,0,0) 
			drawing.Thickness = 3 
		end 
		return drawing 
	end 
	function utility.add(plr) 
		if not objects[plr] then 
			objects[plr] = { 
				Name = utility.create("Text"), 
				Weapon = utility.create("Text"), 
				Armor = utility.create("Text"), 
				BoxOutline = utility.create("Square", true), 
				Box = utility.create("Square"), 
				HealthOutline = utility.create("Line", true), 
				Health = utility.create("Line"), 
			} 
		end 
	end 
	for _,plr in next, Players:GetPlayers() do 
		if Player ~= LocalPlayer then 
			utility.add(plr) 
		end 
	end 
	Players.PlayerAdded:Connect(utility.add) 
	Players.PlayerRemoving:Connect(function(plr) 
		wait() 
		if objects[plr] then 
			for i,v in next, objects[plr] do 
				for i2,v2 in next, v do 
					if v then 
						v:Remove() 
					end 
				end 
			end 

			objects[plr] = nil 
		end 
	end) 
end 
local Items = Instance.new("ScreenGui") 
Items.Name = "Items" 
Items.Parent = game.CoreGui 
Items.ResetOnSpawn = false 
Items.ZIndexBehavior = "Global" 
do 
	function add(plr) 
		local ImageLabel = Instance.new("ImageLabel") 
		ImageLabel.BackgroundColor3 = Color3.fromRGB(111, 222, 255) 
		ImageLabel.BackgroundTransparency = 1.000 
		ImageLabel.Size = UDim2.new(0, 62, 0, 25) 
		ImageLabel.Visible = false 
		ImageLabel.Image = "rbxassetid://1784884358" 
		ImageLabel.ScaleType = Enum.ScaleType.Fit 
		ImageLabel.Name = plr.Name 
		ImageLabel.AnchorPoint = Vector2.new(0.5,0.5) 
		ImageLabel.Parent = Items 
	end 
	for _,plr in next, Players:GetPlayers() do 
		if Player ~= LocalPlayer then 
			add(plr) 
		end 
	end 
	Players.PlayerAdded:Connect(add) 
	Players.PlayerRemoving:Connect(function(plr) 
		wait() 
		Items[plr.Name]:Destroy() 
	end) 
end 

local function YROTATION(cframe) 
	local x, y, z = cframe:ToOrientation() 
	return CFrame.new(cframe.Position) * CFrame.Angles(0,y,0) 
end 
local function XYROTATION(cframe) 
	local x, y, z = cframe:ToOrientation() 
	return CFrame.new(cframe.Position) * CFrame.Angles(x,y,0) 
end 
local weps = { 
	Pistol = {"USP", "P2000", "Glock", "DualBerettas", "P250", "FiveSeven", "Tec9", "CZ", "DesertEagle", "R8"}, 
	SMG = {"MP9", "MAC10", "MP7", "UMP", "P90", "Bizon"}, 
	Rifle = {"M4A4", "M4A1", "AK47", "Famas", "Galil", "AUG", "SG"}, 
	Sniper = {"AWP", "Scout", "G3SG1"} 
} 
local weps2 = { 
	Pistol = {"USP", "P2000", "Glock", "DualBerettas", "P250", "FiveSeven", "Tec9", "CZ", "DesertEagle", "R8"}, 
	SMG = {"MP9", "MAC10", "MP7", "UMP", "P90", "Bizon"}, 
	Rifle = {"M4A4", "M4A1", "AK47", "Famas", "Galil", "AUG", "SG"}, 
	Sniper = {"AWP", "Scout", "G3SG1"} 
} 
local function GetWeaponRage(weapon) 
	return table.find(weps.Pistol, weapon) and "pistol" or table.find(weps.Rifle, weapon) and "rifle" or weapon == "AWP" and "awp" or weapon == "G3SG1"  and "auto" or weapon == "Scout" and "scout" or "default" 
end 
local function GetStatsRage(weapon) 
	if weapon == "default" then 
		return values.rage.weapons.default 
	else 
		if values.rage.weapons[weapon]["override default"].Toggle then 
			return values.rage.weapons[weapon] 
		else 
			return values.rage.weapons.default 
		end 
	end 
end 
local function GetWeaponLegit(weapon) 
	return table.find(weps2.Pistol, weapon) and "pistol" or table.find(weps2.Rifle, weapon) and "rifle" or table.find(weps2.SMG, weapon) and "smg" or table.find(weps2.Sniper, weapon) and "sniper" or "default" 
end 
local function GetStatsLegit(weapon) 
	if weapon == "default" then 
		return values.legit.main.default 
	else 
		if values.legit.main[weapon]["override default"].Toggle then 
			return values.legit.main[weapon] 
		else 
			return values.legit.main.default 
		end 
	end 
end 
local Jitter = false 
local Spin = 0 
local RageTarget 
local Filter = false 
local LastStep 
local TriggerDebounce = false 
local DisableAA = false 
local aroundtheworld_value = 0

local Fov = Drawing.new("Circle") 
Fov.Filled = true 
Fov.Color = Color3.fromRGB(15,15,15) 
Fov.Transparency = 0.5 
Fov.Position = Vector2.new(Mouse.X, Mouse.Y + 16) 
Fov.Radius = 120 
RunService.Heartbeat:Connect(function(step) 
	Fov.Visible = false 
	LastStep = step 
	Ping = game.Stats.PerformanceStats.Ping:GetValue() 
	RageTarget = nil 
	local CamCFrame = Camera.CFrame 
	local CamLook = CamCFrame.LookVector 
	local PlayerIsAlive = false 
	local Character = LocalPlayer.Character 
	RageTarget = nil 
	Spin = math.clamp(Spin + values.rage.angles["spin speed"].Slider, 0, 360) 
	if Spin == 360 then Spin = 0 end 
	if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 and LocalPlayer.Character:FindFirstChild("UpperTorso") then 
		PlayerIsAlive = true 
	end 
	for i,v in next, ChamItems do 
		if v.Parent == nil then 
			table.remove(ChamItems, i) 
		end 
	end 
	Fov.Position = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2) 
	if PlayerIsAlive then 
		if values.rage.exploits["around the world"].Toggle and values.rage.exploits["around the world"].Active then 
			for i, v in next, Players:GetChildren() do
				if v ~= LocalPlayer and v.Team ~= LocalPlayer.Team then
					if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
						aroundtheworld_value=aroundtheworld_value + (0.01 * values.rage.exploits["speed"].Slider)
						LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame*CFrame.Angles(0, aroundtheworld_value, 0)*CFrame.new(0, ( values.rage.exploits["height"].Slider * 2 ), ( values.rage.exploits["distance"].Slider * 5 ))
						break
					end
				end
			end
		end		local SelfVelocity = LocalPlayer.Character.HumanoidRootPart.Velocity 
		if values.misc.fakelag["ping spike"].Toggle and values.misc.fakelag["ping spike"].Active then 
			for count = 1, 20  do 
				game:GetService("ReplicatedStorage").Events.RemoteEvent:FireServer({[1] = "createparticle", [2] = "bullethole", [3] = LocalPlayer.Character.Head, [4] = Vector3.new(0,0,0)}) 
			end 
		end 
		if values.misc.animations.enabled.Toggle then
			if LoadedAnim then 
				if savedanimationdance ~= Dance then 
					savedanimationdance = Dance
					LoadedAnim:Stop()
				end
				if not LoadedAnim.IsPlaying then 
					savedanimationdance = Dance
					LoadedAnim = LocalPlayer.Character.Humanoid:LoadAnimation(Dance)
					LoadedAnim.Priority = Enum.AnimationPriority.Action
					LoadedAnim:Play()
					LoadedAnim:AdjustSpeed(values.misc.animations['animation speed'].Slider)
				end
			else 
				savedanimationdance = Dance
				pcall(function()
					LoadedAnim = LocalPlayer.Character.Humanoid:LoadAnimation(Dance)
					LoadedAnim.Priority = Enum.AnimationPriority.Action
					LoadedAnim:Play()
					LoadedAnim:AdjustSpeed(values.misc.animations['animation speed'].Slider)
				end)
			end
		else 
			if LoadedAnim then 
				LoadedAnim:Stop()
			end
		end

		local Root = LocalPlayer.Character.HumanoidRootPart 
		if values.misc.client["infinite crouch"].Toggle then 
			Client.crouchcooldown = -0 
		end 
		if table.find(values.misc.client["gun modifiers"].Jumbobox, "firerate") then 
			Client.DISABLED = false 
		end 
		if table.find(values.misc.client["gun modifiers"].Jumbobox, "fake hps") then 
			Client.gun.Auto.Value = true
			Client.gun.FireRate.Value = 0
		end 
		if table.find(values.misc.client.removals.Jumbobox, "scope lines") and table.find(values.misc.client.removals.Jumbobox, "scope") then 
			NewScope.Enabled = LocalPlayer.Character:FindFirstChild("AIMING") and true or false 
			Crosshairs.Scope.Visible = false 
		else 
			NewScope.Enabled = false 
		end 
		local RageGuy 
		if workspace:FindFirstChild("Map") and Client.gun ~= "none" and Client.gun.Name ~= "C4" then      
			if values.rage.ragebot.enabled.Toggle then      
				local Origin = LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 1.4, 0)
				local Stats = GetStatsRage(GetWeaponRage(Client.gun.Name))      
				for _,Player in next, Players:GetPlayers() do        
					if Player.Character and Player.Character:FindFirstChild("Humanoid") and Player.Character:FindFirstChild("Humanoid").Health > 0 and Player.Team ~= "TTT" and Player ~= LocalPlayer then      
						if table.find(values.rage.ragebot.resolver.Jumbobox, "pitch") then       
							Player.Character.UpperTorso.Waist.C0 = CFrame.Angles(0, 0, 0)   
							Player.Character.LowerTorso.Root.C0 = CFrame.Angles(0, 0, 0) 
							Player.Character.Head.Neck.C0 = CFrame.new(0,1,0) * CFrame.Angles(0, 0, 0) 
						end
						if table.find(values.rage.ragebot.resolver.Jumbobox, "forward track") then     
							Player.Character.UpperTorso.Waist.C0 = CFrame.new(0, 0, 0)
							Player.Character.Head.Neck.C0 = CFrame.new(0, 0, -13)
						end
						if table.find(values.rage.ragebot.resolver.Jumbobox, "custom resolver") then     
							if values.rage.resolver["animation"].Toggle then
								for i, Animation in next, Player.Character.Humanoid:GetPlayingAnimationTracks() do
									Animation:Stop()
								end
							end
							if values.rage.resolver["angle"].Toggle then
								Player.Character.Humanoid.MaxSlopeAngle = 0  
							end
							if values.rage.resolver["roll"].Toggle then
								Player.Character.UpperTorso.Waist.C0 = CFrame.new(0, 0.75, 0) 
							end
							
							Player.Character.Head.Neck.C0 = CFrame.new(values.rage.resolver["head x"].Slider, values.rage.resolver["head y"].Slider, values.rage.resolver["head z"].Slider)
							
							Player.Character.UpperTorso.Waist.C0 = CFrame.new(values.rage.resolver["body x"].Slider, values.rage.resolver["body y"].Slider, values.rage.resolver["body z"].Slider)
							
							local ax = values.rage.resolver["arms x"].Slider
							local ay = values.rage.resolver["arms y"].Slider
							local az = values.rage.resolver["arms z"].Slider
							
							Player.Character.RightUpperArm.RightShoulder.C0 = CFrame.new(ax, ay, az)
							Player.Character.LeftUpperArm.LeftShoulder.C0 = CFrame.new(-ax, ay, -az)
							
							local lx = values.rage.resolver["legs x"].Slider
							local ly = values.rage.resolver["legs y"].Slider
							local lz = values.rage.resolver["legs z"].Slider
							
							Player.Character.RightUpperLeg.RightHip.C0 = CFrame.new(lx, ly, lz)
							Player.Character.LeftUpperLeg.LeftHip.C0 = CFrame.new(-lx, ly, -lz)
							
						end  
					end
					if Player.Character and Player.Character:FindFirstChild("Humanoid") and not Client.DISABLED and Player.Character:FindFirstChild("Humanoid").Health > 0 and Player.Team ~= "TTT" and not Player.Character:FindFirstChildOfClass("ForceField") and Player ~= LocalPlayer then 
						if Player.Team ~= LocalPlayer.Team or values.rage.ragebot.teammates.Toggle and Player:FindFirstChild("Status") and Player.Status.Team.Value ~= LocalPlayer.Status.Team.Value and Player.Status.Alive.Value then 
								local Ignore = {unpack(Collision)} 
								table.insert(Ignore, workspace.Map.Clips) 
								table.insert(Ignore, workspace.Map.SpawnPoints) 
								table.insert(Ignore, LocalPlayer.Character) 
								table.insert(Ignore, Player.Character.HumanoidRootPart) 
								if Player.Character:FindFirstChild("BackC4") then 
									table.insert(Ignore, Player.Character.BackC4) 
								end 
								if Player.Character:FindFirstChild("Gun") then 
									table.insert(Ignore, Player.Character.Gun) 
								end 

								local Hitboxes = {} 
								for _,Hitbox in next, Stats.hitboxes.Jumbobox do 
									if Hitbox == "legs" then 
										table.insert(Hitboxes, Player.Character.LeftUpperLeg) 
										table.insert(Hitboxes, Player.Character.RightUpperLeg)
									end
									if Hitbox == "arms" then
										table.insert(Hitboxes, Player.Character.LeftUpperArm)
										table.insert(Hitboxes, Player.Character.RightUpperArm) 
									end
									if Hitbox == "torso" then 
										table.insert(Hitboxes, Player.Character.UpperTorso) 
									end
									if Hitbox == "head" then 
										table.insert(Hitboxes, Player.Character.Head) 
									end 
								end

								for _,Hitbox in next, Hitboxes do 
									local Ignore2 = {unpack(Ignore)} 
									for _,Part in next, Player.Character:GetChildren() do 
										if Part ~= Hitbox then table.insert(Ignore2, Part) end 
									end 
									if values.rage.ragebot["automatic penetration"].Toggle then 
										local Hits = {} 
										local EndHit, Hit, Pos 
										local Penetration = Client.gun.Penetration.Value * 0.01
										local Ray1 = Ray.new(Origin, (Hitbox.Position - Origin).unit * (Hitbox.Position - Origin).magnitude) 
										repeat 
											Hit, Pos = workspace:FindPartOnRayWithIgnoreList(Ray1, Ignore2, false, true) 
											if Hit ~= nil and Hit.Parent ~= nil then 
												if Hit and Multipliers[Hit.Name] ~= nil then 
													EndHit = Hit 
												else 
													table.insert(Ignore2, Hit) 
													table.insert(Hits, {["Position"] = Pos,["Hit"] = Hit}) 
												end 
											end 
										until EndHit ~= nil or #Hits >= 4 or Hit == nil 
										if EndHit ~= nil and Multipliers[EndHit.Name] ~= nil and #Hits <= 4 then 
											if #Hits == 0 then 
												local Damage = Client.gun.DMG.Value * Multipliers[EndHit.Name] 
												Damage = Damage * (Client.gun.RangeModifier.Value/100 ^ ((Origin - EndHit.Position).Magnitude/500))/100 
												if Damage >= Stats["minimum damage"].Slider * Stats["damage amount"].Slider then 
													RageGuy = EndHit 
													RageTarget = EndHit 
													if not values.rage.ragebot["silent aim"].Toggle then 
														Camera.CFrame = CFrame.new(CamCFrame.Position, EndHit.Position) 
													end 
												    Filter = true      
													if values.rage.ragebot["automatic fire"].Dropdown == "hitpart" then 
														local Arguments = {      
															[1] = EndHit,      
															[2] = EndHit.Position,      
															[3] = Client.gun.Name,      
															[4] = 4096,      
															[5] = Client.gun,
															[6] = Vector3.new(),
															[7] = Vector3.new(),
															[8] = 10,      
															[9] = false,      
															[10] = true,      
															[11] = Vector3.new(),      
															[12] = 16868,      
															[13] = Vector3.new()      
														}   
														for i = 1,values.rage.exploits["custom tap amount"].Slider,1 do         
															game.ReplicatedStorage.Events.HitPart:FireServer(unpack(Arguments))  
														end           
													elseif values.rage.ragebot["automatic fire"].Dropdown == "standard" then            
														for i = 1,values.rage.exploits["custom tap amount"].Slider,1 do 
															Client.firebullet()  
														end 
													end
													Filter = false 
													break 
												end 
											else 
												local penetration = Client.gun.Penetration.Value * 0.01
												local limit = 0 
												local dmgmodifier = 1 
												for i = 1, #Hits do 
													local data = Hits[i] 
													local part = data["Hit"] 
													local pos = data["Position"] 
													local modifier = 1
													if part.Material == Enum.Material.DiamondPlate then 
														modifier = 3
													end 
													if part.Material == Enum.Material.CorrodedMetal or part.Material == Enum.Material.Metal or part.Material == Enum.Material.Brick or part.Material == Enum.Material.Concrete then 
														modifier = 2.2
													end
													if part.Name == "Grate" or part.Material == Enum.Material.Wood or part.Material == Enum.Material.WoodPlanks then 
														modifier = 0.1 
													end 
													if part.Name == "nowallbang" then 
														modifier = 100 
													end 
													if part:FindFirstChild("PartModifier") then 
														modifier = part.PartModifier.Value 
													end 
													if part.Transparency == 1 or part.CanCollide == false or part.Name == "Glass" or part.Name == "Cardboard" then 
														modifier = 0 
													end 
													local direction = (Hitbox.Position - pos).unit * math.clamp(Client.gun.Range.Value, 1, 100) 
													local ray = Ray.new(pos + direction * 1, direction * -2) 
													local _,endpos = workspace:FindPartOnRayWithWhitelist(ray, {part}, true) 
													local thickness = (endpos - pos).Magnitude 
													thickness = thickness * modifier 
													limit = math.min(penetration, limit + thickness) 
													dmgmodifier = 1 - limit / penetration 
												end
												local Damage = Client.gun.DMG.Value * Multipliers[EndHit.Name] * dmgmodifier 
												Damage = Damage * (Client.gun.RangeModifier.Value/100 ^ ((Origin - EndHit.Position).Magnitude/500))/100 
												if Damage >= Stats["minimum damage"].Slider  * Stats["damage amount"].Slider then 
													RageGuy = EndHit 
													RageTarget = EndHit 
													if not values.rage.ragebot["silent aim"].Toggle then 
														Camera.CFrame = CFrame.new(CamCFrame.Position, EndHit.Position) 
													end 
													Filter = true 
													if values.rage.ragebot["automatic fire"].Dropdown == "hitpart" then 
														local Arguments = {      
															[1] = EndHit,      
															[2] = EndHit.Position,      
															[3] = Client.gun.Name,      
															[4] = 4096,      
															[5] = Client.gun,
															[6] = Vector3.new(),
															[7] = Vector3.new(),
															[8] = 10,      
															[9] = false,      
															[10] = true,      
															[11] = Vector3.new(),      
															[12] = 16868,      
															[13] = Vector3.new()      
														}  
														for i = 1,values.rage.exploits["custom tap amount"].Slider,1 do          
															game.ReplicatedStorage.Events.HitPart:FireServer(unpack(Arguments))  
														end          
													elseif values.rage.ragebot["automatic fire"].Dropdown == "standard" then            
														for i = 1,values.rage.exploits["custom tap amount"].Slider,1 do 
															Client.firebullet()  
														end 
													end
													Filter = false 
													break 
												end 
											end 
										end 
									else 
										local Ray = Ray.new(Origin, (Hitbox.Position - Origin).unit * (Hitbox.Position - Origin).magnitude) 
										local Hit, Pos = workspace:FindPartOnRayWithIgnoreList(Ray, Ignore2, false, true) 
										if Hit and Multipliers[Hit.Name] ~= nil then 
											local Damage = Client.gun.DMG.Value * Multipliers[Hit.Name] 
											Damage = Damage * (Client.gun.RangeModifier.Value/100 ^ ((Origin - Hit.Position).Magnitude/500))/100 
											if Damage >= Stats["minimum damage"].Slider then 
												RageGuy = Hit 
												RageTarget = Hit 
												if not values.rage.ragebot["silent aim"].Toggle then 
													Camera.CFrame = CFrame.new(CamCFrame.Position, Hit.Position) 
												end 
												Filter = true 
													if values.rage.ragebot["automatic fire"].Dropdown == "hitpart" then 
														local Arguments = {      
															[1] = EndHit,      
															[2] = EndHit.Position,      
															[3] = Client.gun.Name,      
															[4] = 4096,      
															[5] = Client.gun,
															[6] = Vector3.new(),
															[7] = Vector3.new(),
															[8] = 10,      
															[9] = false,      
															[10] = true,      
															[11] = Vector3.new(),      
															[12] = 16868,      
															[13] = Vector3.new()      
														}  
														for i = 1,values.rage.exploits["custom tap amount"].Slider,1 do 
															game.ReplicatedStorage.Events.HitPart:FireServer(unpack(Arguments))  
														end            
													elseif values.rage.ragebot["automatic fire"].Dropdown == "standard" then            
														for i = 1,values.rage.exploits["custom tap amount"].Slider,1 do 
															Client.firebullet()  
														end 
													end 
												Filter = false 
												break 
											end 
										end 
									end 
								end 
						end 
					end 
				end 
			elseif values.legit.aimbot["aim assist"].Toggle and values.legit.aimbot["aim assist"].Active and not library.uiopen then 
				local Stats = GetStatsLegit(GetWeaponLegit(Client.gun.Name)) 
				local Ignore = {LocalPlayer.Character, Camera, workspace.Map.Clips, workspace.Map.SpawnPoints, workspace.Debris} 
				local Closest = 9999 
				local Target 

				Fov.Radius = Stats["field of view"].Slider 
				Fov.Visible = values.legit.settings["draw fov"].Toggle 
				Fov.Color = Color3.fromRGB(111, 222, 255)

				if not table.find(Stats.conditions.Jumbobox, "smoke") then 
					table.insert(Ignore, workspace.Ray_Ignore) 
				end 

				if not table.find(Stats.conditions.Jumbobox, "blind") or LocalPlayer.PlayerGui.Blnd.Blind.BackgroundTransparency > 0.9 then 
					if not table.find(Stats.conditions.Jumbobox, "standing") or SelfVelocity.Magnitude < 3 then 
						for _,Player in next, Players:GetPlayers() do 
							if Player.Character and Player.Character:FindFirstChild("Humanoid") and Player.Character:FindFirstChild("Humanoid").Health > 0 then 
								if not values.legit.settings["forcefield check"].Toggle or not Player.Character:FindFirstChildOfClass("ForceField") then 
									if Player.Team ~= LocalPlayer.Team or values.legit.settings["free for all"].Toggle then 
										local Pos, onScreen = Camera:WorldToViewportPoint(Player.Character.HumanoidRootPart.Position) 
										if onScreen then 
											local Magnitude = (Vector2.new(Pos.X, Pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude 
											if Magnitude < Stats["field of view"].Slider then 
												local Hitbox = Stats.hitbox.Dropdown == "head" and Player.Character.Head or Stats.hitbox.Dropdown == "chest" and Player.Character.UpperTorso 
												if Stats.hitbox.Dropdown == "closest" then 
													local HeadPos = Camera:WorldToViewportPoint(Player.Character.Head.Position) 
													local TorsoPos = Camera:WorldToViewportPoint(Player.Character.UpperTorso.Position) 
													local HeadDistance = (Vector2.new(HeadPos.X, HeadPos.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude 
													local TorsoDistance = (Vector2.new(TorsoPos.X, TorsoPos.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude 
													if HeadDistance < TorsoDistance then 
														Hitbox = Player.Character.Head 
													else 
														Hitbox = Player.Character.UpperTorso 
													end 
												end 
												if Hitbox ~= nil then 
													if not table.find(Stats.conditions.Jumbobox, "visible") then 
														Target = Hitbox 
													else 
														local Ray1 = Ray.new(Camera.CFrame.Position, (Hitbox.Position - Camera.CFrame.Position).unit * (Hitbox.Position - Camera.CFrame.Position).magnitude) 
														local Hit, Pos = workspace:FindPartOnRayWithIgnoreList(Ray1, Ignore, false, true) 
														if Hit and Hit:FindFirstAncestor(Player.Name) then 
															Target = Hitbox 
														end 
													end 
												end 
											end 
										end 
									end 
								end 
							end 
						end 
					end 
				end 

				if Target ~= nil then 
					local Pos = Camera:WorldToScreenPoint(Target.Position) 
					local Magnitude = Vector2.new(Pos.X - Mouse.X, Pos.Y - Mouse.Y) 
					mousemoverel(Magnitude.x/Stats.smoothing.Slider, Magnitude.y/Stats.smoothing.Slider) 
				end 
			end 
			if not values.rage.ragebot.enabled.Toggle and values.legit.aimbot["triggerbot"].Toggle and values.legit.aimbot["triggerbot"].Active and not TriggerDebounce then 
				local Stats = GetStatsLegit(GetWeaponLegit(Client.gun.Name)) 
				if Stats.triggerbot.Toggle then 
					if not table.find(Stats.conditions.Jumbobox, "blind") or LocalPlayer.PlayerGui.Blnd.Blind.BackgroundTransparency > 0.9 then 
						if not table.find(Stats.conditions.Jumbobox, "standing") or SelfVelocity.Magnitude < 3 then 
							if Mouse.Target and Mouse.Target.Parent and Players:GetPlayerFromCharacter(Mouse.Target.Parent) and Multipliers[Mouse.Target.Name] ~= nil and Client.gun.DMG.Value * Multipliers[Mouse.Target.Name] >= Stats["minimum dmg"].Slider then 
								local OldTarget = Mouse.Target 
								local Player = Players:GetPlayerFromCharacter(Mouse.Target.Parent) 
								if Player.Team ~= LocalPlayer.Team or values.legit.settings["free for all"].Toggle then 
									coroutine.wrap(function() 
										TriggerDebounce = true 
										wait(Stats["delay (ms)"].Slider/1000) 
										repeat RunService.Heartbeat:Wait() 
											if not Client.DISABLED then 
												Client.firebullet() 
											end 
										until Mouse.Target == nil or Player ~= Players:GetPlayerFromCharacter(Mouse.Target.Parent) 
										TriggerDebounce = false 
									end)() 
								end 
							end 
						end 
					end 
				end 
			end 
		end 
		BodyVelocity:Destroy() 
		BodyVelocity = Instance.new("BodyVelocity") 
		BodyVelocity.MaxForce = Vector3.new(math.huge,0,math.huge) 
		if UserInputService:IsKeyDown("Space") and values.rage.movement["bunny hop"].Toggle then 
			local add = 0 
			if values.rage.movement.direction.Dropdown == "directional" or values.rage.movement.direction.Dropdown == "directional 2" then 
				if UserInputService:IsKeyDown("A") then add = 90 end 
				if UserInputService:IsKeyDown("S") then add = 180 end 
				if UserInputService:IsKeyDown("D") then add = 270 end 
				if UserInputService:IsKeyDown("A") and UserInputService:IsKeyDown("W") then add = 45 end 
				if UserInputService:IsKeyDown("D") and UserInputService:IsKeyDown("W") then add = 315 end 
				if UserInputService:IsKeyDown("D") and UserInputService:IsKeyDown("S") then add = 225 end 
				if UserInputService:IsKeyDown("A") and UserInputService:IsKeyDown("S") then add = 145 end 
			end 
			local rot = YROTATION(CamCFrame) * CFrame.Angles(0,math.rad(add),0) 
			BodyVelocity.Parent = LocalPlayer.Character.UpperTorso 
			LocalPlayer.Character.Humanoid.Jump = true 
				if values.rage.movement.type.Dropdown == "gyro" and values.rage.movement["gyro type"].Dropdown == "no fling" then 
					BodyVelocity.MaxForce = Vector3.new(99999,0,99999)
				else
					BodyVelocity.MaxForce = Vector3.new(math.huge,0,math.huge)
				end
			BodyVelocity.Velocity = Vector3.new(rot.LookVector.X,0,rot.LookVector.Z) * (values.rage.movement["speed"].Slider * 2) 
			if add == 0 and values.rage.movement.direction.Dropdown == "directional" and not UserInputService:IsKeyDown("W") then 
				BodyVelocity:Destroy() 
			else 
				if values.rage.movement.type.Dropdown == "cframe" then 
				    	BodyVelocity:Destroy()
					Root.CFrame = Root.CFrame + Vector3.new(rot.LookVector.X,0,rot.LookVector.Z) * values.rage.movement["speed"].Slider/50 
				elseif values.rage.movement.type.Dropdown == "velocity" then
					BodyVelocity:Destroy()
					Root.Velocity = Vector3.new(rot.LookVector.X * (values.rage.movement["speed"].Slider * 2), Root.Velocity.y, rot.LookVector.Z * (values.rage.movement["speed"].Slider * 2))
				end
			end 
		end
		if values.rage.movement["edge jump"].Toggle and values.rage.movement["edge jump"].Active then 
			if LocalPlayer.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Freefall and LocalPlayer.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Jumping then 
				coroutine.wrap(function() 
					RunService.Heartbeat:Wait() 
					if LocalPlayer.Character ~= nil and LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall and LocalPlayer.Character.Humanoid:GetState() ~= Enum.HumanoidStateType.Jumping then 
						LocalPlayer.Character.Humanoid:ChangeState("Jumping") 
					end 
				end)() 
			end 
		end

		spawn(function()
			if not jitterwait then
				jitterwait = true
				Jitter = not Jitter
				wait(values.rage.angles['jitter wait (ms)'].Slider/100) 
				jitterwait = false
			end
		end)
		
		LocalPlayer.Character.Humanoid.AutoRotate = false 
		if values.rage.angles.enabled.Toggle and not DisableAA then 
			local Angle = -math.atan2(CamLook.Z, CamLook.X) + math.rad(-90) 
			if values.rage.angles["yaw base"].Dropdown == "spin" then 
				Angle = Angle + math.rad(Spin) 
			end 
			if values.rage.angles["yaw base"].Dropdown == "random" then 
				Angle = Angle + math.rad(math.random(0, 360)) 
			end 
			    if values.rage.angles["yaw base"].Dropdown == "switch" then 
				Angle = Angle + math.clamp(Spin + 100, 0, 180)
			end 
			    if values.rage.angles["yaw base"].Dropdown == "defensive" then 
				Angle = Angle + math.clamp(Spin + 100, 0, 180) + math.rad(Spin) 
			end
				if values.rage.angles["yaw base"].Dropdown == "double" then 
				Angle = Angle + math.rad(Spin) + math.rad(math.random(0, 180))
			end 
                                if values.rage.angles["yaw base"].Dropdown == "keybind yaw" then 
               			 if UserInputService:IsKeyDown("W") then
                		Angle = -math.atan2(CamLook.Z, CamLook.X) + math.rad(-90) + math.rad(0)
                		elseif values.rage.angles["reset yaw"].Toggle and values.rage.angles["reset yaw"].Active then
                		Angle = -math.atan2(CamLook.Z, CamLook.X) + math.rad(-90) + math.rad(0)
                		end
                		if UserInputService:IsKeyDown("A") then
                		Angle = -math.atan2(CamLook.Z, CamLook.X) + math.rad(-90) + math.rad(90)
                		elseif values.rage.angles["reset yaw"].Toggle and values.rage.angles["reset yaw"].Active then
                		Angle = -math.atan2(CamLook.Z, CamLook.X) + math.rad(-90) + math.rad(0)
                		end
                		if UserInputService:IsKeyDown("S") then
                		Angle = -math.atan2(CamLook.Z, CamLook.X) + math.rad(-90) + math.rad(180)
                		elseif values.rage.angles["reset yaw"].Toggle and values.rage.angles["reset yaw"].Active then
                		Angle = -math.atan2(CamLook.Z, CamLook.X) + math.rad(-90) + math.rad(0)
                		end
                		if UserInputService:IsKeyDown("D") then
                		Angle = -math.atan2(CamLook.Z, CamLook.X) + math.rad(-90) + math.rad(-90)
                		elseif values.rage.angles["reset yaw"].Toggle and values.rage.angles["reset yaw"].Active then
                		Angle = -math.atan2(CamLook.Z, CamLook.X) + math.rad(-90) + math.rad(0)
                		end
            		end 
				if values.rage.angles["reset yaw"].Toggle and values.rage.angles["reset yaw"].Active then
                Angle = -math.atan2(CamLook.Z, CamLook.X) + math.rad(0)
            end
                        local Offset = math.rad(-values.rage.angles["yaw offset"].Slider - (values.rage.angles.jitter.Toggle and Jitter and values.rage.angles["jitter offset"].Slider or 0)) 
			local CFramePos = CFrame.new(Root.Position) * CFrame.Angles(0, Angle + Offset, 0) 
			if values.rage.angles["yaw base"].Dropdown == "targets" then 
				local part 
				local closest = 9999 
				for _,plr in next, Players:GetPlayers() do 
					if plr.Character and plr.Character:FindFirstChild("Humanoid") and plr.Character:FindFirstChild("Humanoid").Health > 0 and plr.Team ~= LocalPlayer.Team then 
						local pos, onScreen = Camera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position) 
						local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude 
						if closest > magnitude then 
							part = plr.Character.HumanoidRootPart 
							closest = magnitude 
						end 
					end 
				end 
				if part ~= nil then 
					CFramePos = CFrame.new(Root.Position, part.Position) * CFrame.Angles(0, Offset, 0) 
				end 
			end
			Root.CFrame = YROTATION(CFramePos) 
			if values.rage.angles["body roll"].Dropdown == "180" then 
				Root.CFrame = Root.CFrame * CFrame.Angles(values.rage.angles["body roll"].Dropdown == "180" and math.rad(180) or 0, 1, 0) 
				LocalPlayer.Character.Humanoid.HipHeight = 4
			end
			local Pitch = values.rage.angles["pitch"].Dropdown == "sus_down" and -3  or values.rage.angles["pitch"].Dropdown == "god" and 15 or values.rage.angles["pitch"].Dropdown == "up" and 1 or values.rage.angles["pitch"].Dropdown == "down" and -1 or values.rage.angles["pitch"].Dropdown == "negative" and -6 or values.rage.angles["pitch"].Dropdown == "glitch" and (0 + -5) or values.rage.angles["pitch"].Dropdown == "Bodyarm" and -15 or values.rage.angles["pitch"].Dropdown == "imposter" and math.huge -5/0 -1 or values.rage.angles["pitch"].Dropdown == "zero" and 0 or values.rage.angles["pitch"].Dropdown == "freak" and 5 or values.rage.angles["pitch"].Dropdown == "random" and math.random(-10, 10)/10 or 2.5
			if values.rage.angles["extend pitch"].Toggle and (values.rage.angles["pitch"].Dropdown == "up" or values.rage.angles["pitch"].Dropdown == "down" or values.rage.angles["pitch"].Dropdown == "negative" or values.rage.angles["pitch"].Dropdown == "glitch" or values.rage.angles["pitch"].Dropdown == "brr" and -92 or values.rage.angles["pitch"].Dropdown == "180" or values.rage.angles ["pitch"].Dropdown == "Bodyarm") then 
				Pitch = (Pitch*values.rage.angles["extend value"].Slider)/1.6
			end
			if values.rage.angles["spin pitch"].Toggle and (values.rage.angles["pitch"].Dropdown == "up" or values.rage.angles["pitch"].Dropdown == "down" or values.rage.angles["pitch"].Dropdown == "negative" or values.rage.angles["pitch"].Dropdown == "glitch" or values.rage.angles["pitch"].Dropdown == "brr" and -92 or values.rage.angles["pitch"].Dropdown == "180" or values.rage.angles ["pitch"].Dropdown == "Bodyarm") then 
				Pitch = (Pitch*math.rad(Spin))/1.6 
			end
			game.ReplicatedStorage.Events.ControlTurn:FireServer(Pitch, LocalPlayer.Character:FindFirstChild("Climbing") and true or false) 
		else 
			LocalPlayer.Character.Humanoid.HipHeight = 2     
			Root.CFrame = CFrame.new(Root.Position) * CFrame.Angles(0, -math.atan2(CamLook.Z, CamLook.X) + math.rad(270), 0) 
			game.ReplicatedStorage.Events.ControlTurn:FireServer(CamLook.Y, LocalPlayer.Character:FindFirstChild("Climbing") and true or false) 
		end
		if values.rage.exploits["remove head"].Toggle then 
			if LocalPlayer.Character:FindFirstChild("FakeHead") then 
				LocalPlayer.Character.FakeHead:Destroy() 
			end 
			if LocalPlayer.Character:FindFirstChild("HeadHB") then 
				LocalPlayer.Character.HeadHB:Destroy() 
			end 
		end 
		if table.find(values.misc.client["gun modifiers"].Jumbobox, "recoil") then 
			Client.resetaccuracy() 
			Client.RecoilX = 0 
			Client.RecoilY = 0 
		end 
	end 
	for _,Player in next, Players:GetPlayers() do 
		if Player.Character and Player ~= LocalPlayer and Player.Character:FindFirstChild("HumanoidRootPart") and Player.Character.HumanoidRootPart:FindFirstChild("OldPosition") then 
			coroutine.wrap(function() 
				local Position = Player.Character.HumanoidRootPart.Position 
				RunService.Heartbeat:Wait() 
				if Player.Character and Player ~= LocalPlayer and Player.Character:FindFirstChild("HumanoidRootPart") then 
					if Player.Character.HumanoidRootPart:FindFirstChild("OldPosition") then 
						Player.Character.HumanoidRootPart.OldPosition.Value = Position 
					else 
						local Value = Instance.new("Vector3Value") 
						Value.Name = "OldPosition" 
						Value.Value = Position 
						Value.Parent = Player.Character.HumanoidRootPart 
					end 
				end 
			end)() 
		end 
	end 
	for _,Player in next, Players:GetPlayers() do 
		local tbl = objects[Player] 
		if tbl == nil then return end 
		if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and Player.Team ~= "TTT" and (Player.Team ~= LocalPlayer.Team or values.visuals.players.teammates.Toggle) and Player.Character:FindFirstChild("Gun") and Player.Character:FindFirstChild("Humanoid") and Player ~= LocalPlayer then 
			local HumanoidRootPart = Player.Character.HumanoidRootPart 
			local RootPosition = HumanoidRootPart.Position 
			local Pos, OnScreen = Camera:WorldToViewportPoint(RootPosition) 
			local Size = (Camera:WorldToViewportPoint(RootPosition - Vector3.new(0, 3, 0)).Y - Camera:WorldToViewportPoint(RootPosition + Vector3.new(0, 2.6, 0)).Y) / 2 

			local Drawings, Text = table.find(values.visuals.players.outlines.Jumbobox, "drawings") ~= nil, table.find(values.visuals.players.outlines.Jumbobox, "text") ~= nil 

			tbl.Box.Color = values.visuals.players.box.Color 
			tbl.Box.Size = Vector2.new(Size * 1.5, Size * 1.9) 
			tbl.Box.Position = Vector2.new(Pos.X - Size*1.5 / 2, (Pos.Y - Size*1.6 / 2)) 

			if values.visuals.players.box.Toggle then 
				tbl.Box.Visible = OnScreen 
				if Drawings then 
					tbl.BoxOutline.Size = tbl.Box.Size 
					tbl.BoxOutline.Position = tbl.Box.Position 
					tbl.BoxOutline.Visible = OnScreen 
				else 
					tbl.BoxOutline.Visible = false 
				end 
			else 
				tbl.Box.Visible = false 
				tbl.BoxOutline.Visible = false 
			end 

			if values.visuals.players.health.Toggle then 
				tbl.Health.Color = values.visuals.players["health"].Color  
				tbl.Health.From = Vector2.new((tbl.Box.Position.X - 5), tbl.Box.Position.Y + tbl.Box.Size.Y) 
				tbl.Health.To = Vector2.new(tbl.Health.From.X, tbl.Health.From.Y - math.clamp(Player.Character.Humanoid.Health / Player.Character.Humanoid.MaxHealth, 0, 1) * tbl.Box.Size.Y) 
				tbl.Health.Visible = OnScreen 
				if values.visuals.players.health.Toggle then 
					tbl.HealthOutline.From = Vector2.new(tbl.Health.From.X, tbl.Box.Position.Y + tbl.Box.Size.Y + 1) 
					tbl.HealthOutline.To = Vector2.new(tbl.Health.From.X, (tbl.Health.From.Y - 1 * tbl.Box.Size.Y) -1) 
					tbl.HealthOutline.Visible = OnScreen 
				else 
					tbl.HealthOutline.Visible = false 
				end 
			else 
				tbl.Health.Visible = false 
				tbl.HealthOutline.Visible = false 
			end 

			if values.visuals.players.weapon.Toggle then 
				tbl.Weapon.Color = values.visuals.players.weapon.Color 
				tbl.Weapon.Text = Player.Character.EquippedTool.Value 
				tbl.Weapon.Position = Vector2.new(tbl.Box.Size.X/2 + tbl.Box.Position.X, tbl.Box.Size.Y + tbl.Box.Position.Y + 1) 
				tbl.Weapon.Font = Drawing.Fonts[values.visuals.players.font.Dropdown] 
				tbl.Weapon.Outline = Text 
				tbl.Weapon.Size = values.visuals.players.size.Slider 
				tbl.Weapon.Visible = OnScreen 
			else 
				tbl.Weapon.Visible = false 
			end 

			if values.visuals.players["weapon icon"].Toggle then 
				Items[Player.Name].ImageColor3 = values.visuals.players["weapon icon"].Color 
				Items[Player.Name].Image = GetIcon.getWeaponOfKiller(Player.Character.EquippedTool.Value) 
				Items[Player.Name].Position = UDim2.new(0, tbl.Box.Size.X/2 + tbl.Box.Position.X, 0, tbl.Box.Size.Y + tbl.Box.Position.Y + (values.visuals.players.weapon.Toggle and -10 or -22)) 
				Items[Player.Name].Visible = OnScreen 
			else 
				Items[Player.Name].Visible = false 
			end 

			if values.visuals.players.name.Toggle then 
				tbl.Name.Color = values.visuals.players.name.Color 
				tbl.Name.Text = Player.Name 
				tbl.Name.Position = Vector2.new(tbl.Box.Size.X/2 + tbl.Box.Position.X,  tbl.Box.Position.Y - 16) 
				tbl.Name.Font = Drawing.Fonts[values.visuals.players.font.Dropdown] 
				tbl.Name.Outline = Text 
				tbl.Name.Size = values.visuals.players.size.Slider 
				tbl.Name.Visible = OnScreen 
			else 
				tbl.Name.Visible = false 
			end 
			local LastInfoPos = tbl.Box.Position.Y - 1 
			if table.find(values.visuals.players.indicators.Jumbobox, "armor") and Player:FindFirstChild("Kevlar") then 
				tbl.Armor.Color = Color3.fromRGB(0, 150, 255) 
				tbl.Armor.Text = Player:FindFirstChild("Helmet") and "HK" or "K" 
				tbl.Armor.Position = Vector2.new(tbl.Box.Size.X + tbl.Box.Position.X + 12, LastInfoPos) 
				tbl.Armor.Font = Drawing.Fonts[values.visuals.players.font.Dropdown] 
				tbl.Armor.Outline = Text 
				tbl.Armor.Size = values.visuals.players.size.Slider 
				tbl.Armor.Visible = OnScreen 

				LastInfoPos = LastInfoPos + values.visuals.players.size.Slider 
			else 
				tbl.Armor.Visible = false 
			end 
		else 
			if Player.Name ~= LocalPlayer.Name then 
				Items[Player.Name].Visible = false 
				for i,v in next, tbl do 
					v.Visible = false 
				end 
			end 
		end 
	end 
end) 

local mt = getrawmetatable(game) 
local oldNamecall = mt.__namecall 
local oldIndex = mt.__index 
local oldNewIndex = mt.__newindex 
setreadonly(mt,false) 
mt.__namecall = function(self, ...) 
	local method = tostring(getnamecallmethod()) 
	local args = {...} 

	if method == "SetPrimaryPartCFrame" and self.Name == "Arms" then 
		if values.visuals.self["third person"].Toggle and values.visuals.self["third person"].Active and LocalPlayer.Character then 
			args[1] = args[1] * CFrame.new(99, 99, 99) 
		else 
			if values.visuals.self["viewmodel changer"].Toggle then 
				args[1] = args[1] * ViewmodelOffset
			end 
			if values.visuals.self["visualize silent angle"].Toggle and RageTarget then
				args[1] = CFrame.lookAt(args[1].p, RageTarget.Position)
			end 
		end
	end
	if method == "SetPrimaryPartCFrame" and self.Name ~= "Arms" then 
		args[1] = args[1] + Vector3.new(0, 3, 0) 
		coroutine.wrap(function() 
			DisableAA = true 
			wait(2) 
			DisableAA = false 
		end)() 
	end 
	if method == "Kick" then 
		return 
	end 
	if method == "FireServer" then 
		if string.len(self.Name) == 38 then 
			return 
		elseif self.Name == "FallDamage" and table.find(values.misc.client["damage bypass"].Jumbobox, "fall") or values.rage.movement["jump bug"].Toggle and values.rage.movement["jump bug"].Active then 
			return 
		elseif self.Name == "BURNME" and table.find(values.misc.client["damage bypass"].Jumbobox, "fire") then 
			return 
		elseif self.Name == "ControlTurn" and not checkcaller() then 
			return 
		end 
		if self.Name == "PlayerChatted" and values.misc.chat["chat alive"].Toggle then 
			args[2] = false 
			args[3] = "Innocent" 
			args[4] = false 
			args[5] = false 
		end 
		if self.Name == "ReplicateCamera" and values.misc.client["anti spectate"].Toggle then 
			args[1] = CFrame.new() 
		end
		if self.Name == "ReplicateCamera" and values.misc.client["backwards spectate"].Toggle then      
			args[1] =  args[1] * CFrame.Angles(0,math.rad(180),0)      
		end
		
	end 
	if method == "FindPartOnRayWithWhitelist" and not checkcaller() and Client.gun ~= "none" and Client.gun.Name ~= "C4" then 
		if #args[2] == 1 and args[2][1].Name == "SpawnPoints" then 
			local Team = LocalPlayer.Status.Team.Value 

			if table.find(values.misc.client.shop.Jumbobox, "anywhere") then 
				return Team == "T" and args[2][1].BuyArea or args[2][1].BuyArea2 
			end 
		end 
	end 
	if method == "FindPartOnRayWithIgnoreList" and args[2][1] == workspace.Debris then 
		if not checkcaller() or Filter then 
			if table.find(values.misc.client["gun modifiers"].Jumbobox, "spread") then 
				args[1] = Ray.new(Camera.CFrame.p, Camera.CFrame.LookVector * Client.gun.Range.Value) 
			end 
			local Stats = GetStatsLegit(GetWeaponLegit(Client.gun.Name)) 
			if values.legit.aimbot["silent aim"].Toggle and values.legit.aimbot["silent aim"].Active and Stats["silent aim"].Toggle then 
				local Ignore = {LocalPlayer.Character, Camera, workspace.Map.Clips, workspace.Map.SpawnPoints, workspace.Debris} 
				local Closest = 9999 
				local Target 

				if not table.find(Stats.conditions.Jumbobox, "smoke") then 
					table.insert(Ignore, workspace.Ray_Ignore) 
				end 

				coroutine.wrap(function() 
					if not table.find(Stats.conditions.Jumbobox, "blind") or LocalPlayer.PlayerGui.Blnd.Blind.BackgroundTransparency > 0.9 then 
						if not table.find(Stats.conditions.Jumbobox, "blind") or SelfVelocity.Magnitude < 3 then 
							for _,Player in next, Players:GetPlayers() do 
								if Player.Character and Player.Character:FindFirstChild("Humanoid") and Player.Character:FindFirstChild("Humanoid").Health > 0 then 
									if not values.legit.settings["forcefield check"].Toggle or not Player.Character:FindFirstChildOfClass("ForceField") then 
										if Player.Team ~= LocalPlayer.Team or values.legit.settings["free for all"].Toggle then 
											local Pos, onScreen = Camera:WorldToViewportPoint(Player.Character.HumanoidRootPart.Position) 
											if onScreen then 
												local Magnitude = (Vector2.new(Pos.X, Pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude 
												if Magnitude < Stats["field of view"].Slider then 
													local Hitbox = Stats.priority.Dropdown == "head" and Player.Character.Head or Stats.priority.Dropdown == "chest" and Player.Character.UpperTorso 
													if Stats.priority.Dropdown == "closest" then 
														local HeadPos = Camera:WorldToViewportPoint(Player.Character.Head.Position) 
														local TorsoPos = Camera:WorldToViewportPoint(Player.Character.UpperTorso.Position) 
														local HeadDistance = (Vector2.new(HeadPos.X, HeadPos.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude 
														local TorsoDistance = (Vector2.new(TorsoPos.X, TorsoPos.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude 
														if HeadDistance < TorsoDistance then 
															Hitbox = Player.Character.Head 
														else 
															Hitbox = Player.Character.UpperTorso 
														end 
													end 
													if Hitbox ~= nil then 
														if not table.find(Stats.conditions.Jumbobox, "visible") then 
															Target = Hitbox 
														else 
															local Ray1 = Ray.new(Camera.CFrame.Position, (Hitbox.Position - Camera.CFrame.Position).unit * (Hitbox.Position - Camera.CFrame.Position).magnitude) 
															local Hit, Pos = workspace:FindPartOnRayWithIgnoreList(Ray1, Ignore, false, true) 
															if Hit and Hit:FindFirstAncestor(Player.Name) then 
																Target = Hitbox 
															end 
														end 
													end 
												end 
											end 
										end 
									end 
								end 
							end 
						end 
					end 

					local Hit = math.random(1, 100) <= Stats.hitchance.Slider 
					if Target ~= nil and Hit then 
						args[1] = Ray.new(Camera.CFrame.Position, (Target.Position - Camera.CFrame.Position).unit * (Target.Position - Camera.CFrame.Position).magnitude) 
					end 
				end)() 
			end 
			if RageTarget ~= nil then 
				local Origin = LocalPlayer.Character.LowerTorso.Position + Vector3.new(0, 2.5, 0)
				if values.rage.ragebot["delay shot"].Toggle then 
					spawn(function() 
						args[1] = Ray.new(Origin, (RageTarget.Position - Origin).unit * (RageTarget.Position - Origin).magnitude) 
					end) 
				else 
					args[1] = Ray.new(Origin, (RageTarget.Position - Origin).unit * (RageTarget.Position - Origin).magnitude) 
				end 
			end 
		end 
	end 
	if method == "InvokeServer" then 
		if self.Name == "Moolah" then 
			return 
		elseif self.Name == "Hugh" then 
			return 
		elseif self.Name == "Filter" and values.misc.chat["no filter"].Toggle then 
			return args[1] 
		end 
	end 
	if method == "LoadAnimation" and self.Name == "Humanoid" then 
		if values.rage.movement["leg movement"].Dropdown == "slide" then 
			if string.find(args[1].Name, "Walk") or string.find(args[1].Name, "Jump")then 
				args[1] = FakeAnim
			end 
		end
		if values.rage.movement["leg movement"].Dropdown == "freeze" then 
			if string.find(args[1].Name, "Run") or string.find(args[1].Name, "Jump") or string.find(args[1].Name, "Walk") then 
				args[1] = FakeAnim 
			end
		end
	end 
	if method == "FireServer" and self.Name == "HitPart" then 
		if values.rage.ragebot["force hit"].Toggle then 
			args[1] = RageTarget 
			args[2] = RageTarget.Position 
		end
		if values.rage.ragebot["prediction"].Dropdown ~= "off" and RageTarget ~= nil then      
			coroutine.wrap(function()
				if values.rage.ragebot["prediction"].Dropdown == "neverblox" then
					if Players:GetPlayerFromCharacter(args[1].Parent) or args[1] == RageTarget then      
						local hrp = RageTarget.Parent.HumanoidRootPart.Position      
						local oldHrp = RageTarget.Parent.HumanoidRootPart.OldPosition.Value
						local Velocity = RageTarget.Parent.HumanoidRootPart.Velocity
						local Direction = Vector3.new(Velocity.X/Velocity.magnitude, 0, Velocity.Z/Velocity.magnitude)

						local vel = (Vector3.new(hrp.X, 0, hrp.Z) - Vector3.new(oldHrp.X, 0, oldHrp.Z)) / LastStep      
						local dir = Vector3.new(vel.X / vel.magnitude, 0, vel.Z / vel.magnitude)

						if Velocity.magnitude >= 0 then
						    args[2] = args[2] + dir + Direction * (Ping / (math.pow(Ping, 1.5)) * (dir / (dir / 2)) * (Velocity.magnitude*(Ping/1000) * (Ping > 200 and 1.5 or 2)))
						    args[4] = 0
						    args[12] = args[12] - 500  
						end
					end     
				elseif values.rage.ragebot["prediction"].Dropdown == "shibagang" then
					if Players:GetPlayerFromCharacter(args[1].Parent) or args[1] == RageTarget then 
						local hrp = RageTarget.Parent.HumanoidRootPart.Position
						local oldHrp = RageTarget.Parent.HumanoidRootPart.OldPosition.Value

						local vel = (Vector3.new(hrp.X, 0, hrp.Z) - Vector3.new(oldHrp.X, 0, oldHrp.Z)) / LastStep
						local dir = Vector3.new(vel.X / vel.magnitude, 0, vel.Z / vel.magnitude)


						args[2] = args[2] + dir * (Ping / (math.pow(Ping, (1.5))) * (dir / (dir / 2)))
						args[4] = 0
						args[12] = args[12] - (500)
					end
				elseif values.rage.ragebot["prediction"].Dropdown == "bad" then
					if Players:GetPlayerFromCharacter(args[1].Parent) or args[1] == RageTarget then 
						local hrp = RageTarget.Parent.HumanoidRootPart.Position 
						local oldHrp = RageTarget.Parent.HumanoidRootPart.OldPosition.Value 

						local vel = (Vector3.new(hrp.X, 0, hrp.Z) - Vector3.new(oldHrp.X, 0, oldHrp.Z)) / LastStep 
						local dir = Vector3.new(vel.X / vel.magnitude, 0, vel.Z / vel.magnitude) 


						args[2] = args[2] + dir * (Ping / (math.pow(Ping, -1)) * (dir / (dir / 2))) 
						args[4] = 0 
						args[12] = args[12] - 500 
					end 
				end
			end)()      
		end

		if values.visuals.world["impacts"].Toggle then 
			coroutine.wrap(function() 
				local hit = Instance.new("Part") 
				hit.Transparency = 1 
				hit.Anchored = true 
				hit.CanCollide = false 
				hit.Size = Vector3.new(0.3,0.3,0.3) 
				hit.Position = args[2] 
				local selection = Instance.new("SelectionBox") 
				selection.LineThickness = 0 
				selection.SurfaceTransparency = 0.5 
				selection.Color3 = values.visuals.world["impacts"].Color 
				selection.SurfaceColor3 = values.visuals.world["impacts"].Color 
				selection.Parent = hit 
				selection.Adornee = hit 
				hit.Parent = workspace.Debris 
				wait(5.9) 
				library:Tween(selection, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {SurfaceTransparency = 1}) 
				hit:Destroy() 
			end)() 
		end
	end

	return oldNamecall(self, unpack(args)) 
end
local oldIndex
oldIndex = hookmetamethod(game,"__index",function(self, key)      
	local CallingScript = getcallingscript()      

	if not checkcaller() and self == Viewmodels and LocalPlayer.Character ~= nil and LocalPlayer.Character:FindFirstChild("UpperTorso") then      
		local WeaponName = string.gsub(key, "v_", "")      
		if not string.find(WeaponName, "Arms") then      
			if Weapons[WeaponName]:FindFirstChild("Melee") and values.skins.knife["knife changer"].Toggle then      
				if Viewmodels:FindFirstChild("v_"..values.skins.knife.model.Scroll) then      
					return Viewmodels:FindFirstChild("v_"..values.skins.knife.model.Scroll)      
				else      
					local Clone = Models.Knives[values.skins.knife.model.Scroll]:Clone()      
					return Clone      
				end
			end      
		end
	end
	
	return oldIndex(self, key)      
end)
mt.__newindex = function(self, i, v) 
	if self:IsA("Humanoid") and i == "JumpPower" and not checkcaller() then 
		if values.rage.movement["jump bug"].Toggle and values.rage.movement["jump bug"].Active then 
			v = 24 
		end 
	elseif self:IsA("Humanoid") and i == "CameraOffset" then 
		if values.rage.angles.enabled.Toggle and values.rage.angles["body roll"].Dropdown == "180" and not DisableAA then 
			v = v + Vector3.new(0, -3.5, 0) 
		end 
	end 

	return oldNewIndex(self, i, v) 
end
Crosshairs.Scope:GetPropertyChangedSignal("Visible"):Connect(function(current) 
	if not table.find(values.misc.client.removals.Jumbobox, "scope lines") then return end 

	if current ~= false then 
		Crosshairs.Scope.Visible = false 
	end 
end) 
Crosshair:GetPropertyChangedSignal("Visible"):Connect(function(current) 
	if not LocalPlayer.Character then return end 
	if not values.visuals.effects["force crosshair"].Toggle then return end 
	if LocalPlayer.Character:FindFirstChild("AIMING") then return end 

	Crosshair.Visible = true 
end) 

LocalPlayer.Additionals.TotalDamage:GetPropertyChangedSignal("Value"):Connect(function(current) 
	if current == 0 then return end 
	coroutine.wrap(function() 
		if values.visuals.effects.hitmarker.Toggle then 
			local Line = Drawing.new("Line") 
			local Line2 = Drawing.new("Line") 
			local Line3 = Drawing.new("Line") 
			local Line4 = Drawing.new("Line") 

			local x, y = Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2 

			Line.From = Vector2.new(x + 4, y + 4) 
			Line.To = Vector2.new(x + 8, y + 8) 
			Line.Color = values.visuals.effects.hitmarker.Color 
			Line.Visible = true 

			Line2.From = Vector2.new(x + 4, y - 4) 
			Line2.To = Vector2.new(x + 8, y - 8) 
			Line2.Color = values.visuals.effects.hitmarker.Color 
			Line2.Visible = true 

			Line3.From = Vector2.new(x - 4, y - 4) 
			Line3.To = Vector2.new(x - 8, y - 8) 
			Line3.Color = values.visuals.effects.hitmarker.Color 
			Line3.Visible = true 

			Line4.From = Vector2.new(x - 4, y + 4) 
			Line4.To = Vector2.new(x - 8, y + 8) 
			Line4.Color = values.visuals.effects.hitmarker.Color 
			Line4.Visible = true 

			Line.Transparency = 1 
			Line2.Transparency = 1 
			Line3.Transparency = 1 
			Line4.Transparency = 1 

			Line.Thickness = 1 
			Line2.Thickness = 1 
			Line3.Thickness = 1 
			Line4.Thickness = 1 

			wait(0.3) 
			for i = 1,0,-0.1 do 
				wait() 
				Line.Transparency = i 
				Line2.Transparency = i 
				Line3.Transparency = i 
				Line4.Transparency = i 
			end 
			Line:Remove() 
			Line2:Remove() 
			Line3:Remove() 
			Line4:Remove() 
		end 
	end)() 
	if values.misc.audio.hitsound.Dropdown == "none" then return end 

	local sound = Instance.new("Sound") 
	sound.Parent = game:GetService("SoundService") 
	sound.SoundId = values.misc.audio.hitsound.Dropdown == "headshot" and "rbxassetid://5764885927" or values.misc.audio.hitsound.Dropdown == "skeet" and "rbxassetid://5447626464" or values.misc.audio.hitsound.Dropdown == "neverlose" and "rbxassetid://6607204501" or values.misc.audio.hitsound.Dropdown == "rust" and "rbxassetid://5043539486" or values.misc.audio.hitsound.Dropdown == "bag" and "rbxassetid://364942410" or values.misc.audio.hitsound.Dropdown == "baimware" and "rbxassetid://6607339542" or values.misc.audio.hitsound.Dropdown == "lessgo" and "rbxassetid://6782594987" or values.misc.audio.hitsound.Dropdown == "MCOOF" and "rbxassetid://5869422451" or values.misc.audio.hitsound.Dropdown == "osu" and "rbxassetid://7149919358" or values.misc.audio.hitsound.Dropdown == "Tf2" and "rbxassetid://296102734" or values.misc.audio.hitsound.Dropdown == "Tf2 pan" and "rbxassetid://3431749479" or values.misc.audio.hitsound.Dropdown  == "M55solix" and "rbxassetid://364942410" or values.misc.audio.hitsound.Dropdown == "Slap" and "rbxassetid://4888372697" or values.misc.audio.hitsound.Dropdown  == "1" and "rbxassetid://7349055654" or values.misc.audio.hitsound.Dropdown == "Minecraft" and "rbxassetid://7273736372" or values.misc.audio.hitsound.Dropdown == "jojo" and "rbxassetid://6787514780" or values.misc.audio.hitsound.Dropdown == "vibe" and "rbxassetid://1848288500" or values.misc.audio.hitsound.Dropdown == "supersmash" and "rbxassetid://2039907664" or values.misc.audio.hitsound.Dropdown == "epic" and "rbxassetid://7344303740" or values.misc.audio.hitsound.Dropdown == "retro" and "rbxassetid://3466984142" or values.misc.audio.hitsound.Dropdown == "quek" and "rbxassetid://4868633804" or values.misc.audio.hitsound.Dropdown == "squash" and "rbxassetid://3466981613" or values.misc.audio.hitsound.Dropdown
	sound.Volume = values.misc.audio["sound volume"].Slider 
	sound.PlayOnRemove = true 
	sound:Destroy() 
end) 
LocalPlayer.Status.Kills:GetPropertyChangedSignal("Value"):Connect(function(current) 
	if current == 0 then return end 
	if values.misc.chat["kill say"].Toggle then 
		game:GetService("ReplicatedStorage").Events.PlayerChatted:FireServer(values.misc.chat["message"].Text ~= "neptunium wins!" and values.misc.chat["message"].Text or "neptttuniummm", false, "Innocent", false, true) 
	end 
end) 
RayIgnore.ChildAdded:Connect(function(obj) 
	if obj.Name == "Fires" then 
		obj.ChildAdded:Connect(function(fire) 
			if values.visuals.world["molly radius"].Toggle then 
				fire.Transparency = values.visuals.world["molly radius"].Transparency 
				fire.Color = values.visuals.world["molly radius"].Color 
			end 
		end) 
	end
end) 
if RayIgnore:FindFirstChild("Fires") then 
	RayIgnore:FindFirstChild("Fires").ChildAdded:Connect(function(fire) 
		if values.visuals.world["molly radius"].Toggle then 
			fire.Transparency = values.visuals.world["molly radius"].Transparency 
			fire.Color = values.visuals.world["molly radius"].Color 
		end 
	end) 
end
Camera.ChildAdded:Connect(function(obj) 
	if table.find(values.misc.client["gun modifiers"].Jumbobox, "ammo") then 
		Client.ammocount = 11111
		Client.ammocount2 = 11111
	end 
	RunService.Heartbeat:Wait() 
	if obj.Name ~= "Arms" then return end 
	local Model 
	for i,v in next, obj:GetChildren() do 
		if v:IsA("Model") and (v:FindFirstChild("Right Arm") or v:FindFirstChild("Left Arm")) then 
			Model = v 
		end 
	end 
	if Model == nil then return end 
	for i,v in next, obj:GetChildren() do 
		if (v:IsA("BasePart") or v:IsA("Part")) and v.Transparency ~= 1 and v.Name ~= "Flash" then 
			local valid = true 
			if v:IsA("Part") and v:FindFirstChild("Mesh") and not v:IsA("BlockMesh") then 
				valid = false 
				local success, err = pcall(function() 
					local OriginalTexture = Instance.new("StringValue") 
					OriginalTexture.Value = v.Mesh.TextureId 
					OriginalTexture.Name = "OriginalTexture" 
					OriginalTexture.Parent = v.Mesh 
				end) 
				local success2, err2 = pcall(function() 
					local OriginalTexture = Instance.new("StringValue") 
					OriginalTexture.Value = v.Mesh.TextureID 
					OriginalTexture.Name = "OriginalTexture" 
					OriginalTexture.Parent = v.Mesh 
				end) 
				if success or success2 then valid = true end 
			end 

			for i2,v2 in next, v:GetChildren() do 
				if (v2:IsA("BasePart") or v2:IsA("Part")) then 
					table.insert(WeaponObj, v2) 
				end 
			end 

			if valid then 
				table.insert(WeaponObj, v) 
			end 
		end 
	end 

	local gunname = Client.gun ~= "none" and values.skins.knife["knife changer"].Toggle and Client.gun:FindFirstChild("Melee") and values.skins.knife.model.Scroll or Client.gun ~= "none" and Client.gun.Name 
	if values.skins.skins["skin changer"].Toggle and gunname ~= nil and Skins:FindFirstChild(gunname) then 
		if values.skins.skins.skin.Scroll[gunname] ~= "Inventory" then 
			MapSkin(gunname, values.skins.skins.skin.Scroll[gunname]) 
		end 
	end 
	for _,v in next, WeaponObj do 
		if v:IsA("MeshPart") then 
			local OriginalTexture = Instance.new("StringValue") 
			OriginalTexture.Value = v.TextureID 
			OriginalTexture.Name = "OriginalTexture" 
			OriginalTexture.Parent = v 
		end 

		local OriginalColor = Instance.new("Color3Value") 
		OriginalColor.Value = v.Color 
		OriginalColor.Name = "OriginalColor" 
		OriginalColor.Parent = v 

		local OriginalMaterial = Instance.new("StringValue") 
		OriginalMaterial.Value = v.Material.Name 
		OriginalMaterial.Name = "OriginalMaterial" 
		OriginalMaterial.Parent = v 

		if values.visuals.effects["weapon chams"].Toggle then 
			UpdateWeapon(v) 
		end 
	end 
	RArm = Model:FindFirstChild("Right Arm"); LArm = Model:FindFirstChild("Left Arm") 
	if RArm then 
		local OriginalColor = Instance.new("Color3Value") 
		OriginalColor.Value = RArm.Color 
		OriginalColor.Name = "Color3Value" 
		OriginalColor.Parent = RArm 
		if values.visuals.effects["arm chams"].Toggle then 
			RArm.Color = values.visuals.effects["arm chams"].Color 
			RArm.Transparency = values.visuals.effects["arm chams"].Transparency 
		end 
		RGlove = RArm:FindFirstChild("Glove") or RArm:FindFirstChild("RGlove") 
		if values.skins.glove["glove changer"].Toggle and Client.gun ~= "none" then 
			if RGlove then RGlove:Destroy() end 
			RGlove = GloveModels[values.skins.glove.model.Dropdown].RGlove:Clone() 
			RGlove.Mesh.TextureId = Gloves[values.skins.glove.model.Dropdown][values.skins.glove.model.Scroll[values.skins.glove.model.Dropdown]].Textures.TextureId 
			RGlove.Parent = RArm 
			RGlove.Transparency = 0 
			RGlove.Welded.Part0 = RArm 
		end 
		if RGlove.Transparency == 1 then 
			RGlove:Destroy() 
			RGlove = nil 
		else 
			local GloveTexture = Instance.new("StringValue") 
			GloveTexture.Value = RGlove.Mesh.TextureId 
			GloveTexture.Name = "StringValue" 
			GloveTexture.Parent = RGlove 

			if values.visuals.effects["glove chams"].Toggle then 
				UpdateAccessory(RGlove) 
			end 
		end 
		RSleeve = RArm:FindFirstChild("Sleeve") 
		if RSleeve ~= nil then 
			local SleeveTexture = Instance.new("StringValue") 
			SleeveTexture.Value = RSleeve.Mesh.TextureId 
			SleeveTexture.Name = "StringValue" 
			SleeveTexture.Parent = RSleeve 
			if values.visuals.effects["arm chams"].Toggle then 
				LArm.Color = values.visuals.effects["arm chams"].Color 
			end 
			if values.visuals.effects["sleeve chams"].Toggle then 
				UpdateAccessory(RSleeve) 
			end 
		end 
	end 
	if LArm then 
		local OriginalColor = Instance.new("Color3Value") 
		OriginalColor.Value = LArm.Color 
		OriginalColor.Name = "Color3Value" 
		OriginalColor.Parent = LArm 
		if values.visuals.effects["arm chams"].Toggle then 
			LArm.Color = values.visuals.effects["arm chams"].Color 
			LArm.Transparency = values.visuals.effects["arm chams"].Transparency 
		end 
		LGlove = LArm:FindFirstChild("Glove") or LArm:FindFirstChild("LGlove") 
		if values.skins.glove["glove changer"].Toggle and Client.gun ~= "none" then 
			if LGlove then LGlove:Destroy() end 
			LGlove = GloveModels[values.skins.glove.model.Dropdown].LGlove:Clone() 
			LGlove.Mesh.TextureId = Gloves[values.skins.glove.model.Dropdown][values.skins.glove.model.Scroll[values.skins.glove.model.Dropdown]].Textures.TextureId 
			LGlove.Transparency = 0 
			LGlove.Parent = LArm 
			LGlove.Welded.Part0 = LArm 
		end 
		if LGlove.Transparency == 1 then 
			LGlove:Destroy() 
			LGlove =  nil 
		else 
			local GloveTexture = Instance.new("StringValue") 
			GloveTexture.Value = LGlove.Mesh.TextureId 
			GloveTexture.Name = "StringValue" 
			GloveTexture.Parent = LGlove 

			if values.visuals.effects["glove chams"].Toggle then 
				UpdateAccessory(LGlove) 
			end 
		end 
		LSleeve = LArm:FindFirstChild("Sleeve") 
		if LSleeve ~= nil then 
			local SleeveTexture = Instance.new("StringValue") 
			SleeveTexture.Value = LSleeve.Mesh.TextureId 
			SleeveTexture.Name = "StringValue" 
			SleeveTexture.Parent = LSleeve 

			if values.visuals.effects["sleeve chams"].Toggle then 
				UpdateAccessory(LSleeve) 
			end 
		end 
	end 
end) 
Camera.ChildAdded:Connect(function(obj) 
	if obj.Name == "Arms" then 
		RArm, LArm, RGlove, RSleeve, LGlove, LSleeve = nil, nil, nil, nil, nil, nil 
		WeaponObj = {} 
	end 
end) 
Camera:GetPropertyChangedSignal("FieldOfView"):Connect(function(fov) 
	if LocalPlayer.Character == nil then return end 
	if fov == values.visuals.self["fov changer"].Slider then return end 
	if values.visuals.self["on scope"].Toggle or not LocalPlayer.Character:FindFirstChild("AIMING") then 
		Camera.FieldOfView = values.visuals.self["fov changer"].Slider 
	end 
end) 
LocalPlayer.Cash:GetPropertyChangedSignal("Value"):Connect(function(cash) 
	if values.misc.client["infinite cash"].Toggle and cash ~= 11111 then 
		LocalPlayer.Cash.Value = 11111
	end 
end) 
if workspace:FindFirstChild("Map") and workspace:FindFirstChild("Map"):FindFirstChild("Origin") then 
	if workspace.Map.Origin.Value == "de_cache" or workspace.Map.Origin.Value == "de_vertigo" or workspace.Map.Origin.Value == "de_nuke" or workspace.Map.Origin.Value == "de_aztec" then 
		oldSkybox = Lighting:FindFirstChildOfClass("Sky"):Clone() 
	end 
end 
workspace.ChildAdded:Connect(function(obj) 
	if obj.Name == "Map" then 
		wait(5) 
		if values.misc.client["remove killers"].Toggle then 
			if workspace:FindFirstChild("Map") and workspace:FindFirstChild("Map"):FindFirstChild("Killers") then 
				local clone = workspace:FindFirstChild("Map"):FindFirstChild("Killers"):Clone() 
				clone.Name = "KillersClone" 
				clone.Parent = workspace:FindFirstChild("Map") 

				workspace:FindFirstChild("Map"):FindFirstChild("Killers"):Destroy() 
			end 
		end 
		if oldSkybox ~= nil then 
			oldSkybox:Destroy() 
			oldSkybox = nil 
		end 
		local Origin = workspace.Map:WaitForChild("Origin") 
		if workspace.Map.Origin.Value == "de_cache" or workspace.Map.Origin.Value == "de_vertigo" or workspace.Map.Origin.Value == "de_nuke" or workspace.Map.Origin.Value == "de_aztec" then 
			oldSkybox = Lighting:FindFirstChildOfClass("Sky"):Clone() 

			local sky = values.visuals.world.skybox.Dropdown 
			if sky ~= "none" then 
				Lighting:FindFirstChildOfClass("Sky"):Destroy() 
				local skybox = Instance.new("Sky") 
				skybox.SkyboxLf = Skyboxes[sky].SkyboxLf 
				skybox.SkyboxBk = Skyboxes[sky].SkyboxBk 
				skybox.SkyboxDn = Skyboxes[sky].SkyboxDn 
				skybox.SkyboxFt = Skyboxes[sky].SkyboxFt 
				skybox.SkyboxRt = Skyboxes[sky].SkyboxRt 
				skybox.SkyboxUp = Skyboxes[sky].SkyboxUp 
				skybox.Name = "override" 
				skybox.Parent = Lighting 
			end 
		else 
			local sky = values.visuals.world.skybox.Dropdown 
			if sky ~= "none" then 
				local skybox = Instance.new("Sky") 
				skybox.SkyboxLf = Skyboxes[sky].SkyboxLf 
				skybox.SkyboxBk = Skyboxes[sky].SkyboxBk 
				skybox.SkyboxDn = Skyboxes[sky].SkyboxDn 
				skybox.SkyboxFt = Skyboxes[sky].SkyboxFt 
				skybox.SkyboxRt = Skyboxes[sky].SkyboxRt 
				skybox.SkyboxUp = Skyboxes[sky].SkyboxUp 
				skybox.Name = "override" 
				skybox.Parent = Lighting 
			end 
		end 
	end 
end) 
Lighting.ChildAdded:Connect(function(obj) 
	if obj:IsA("Sky") and obj.Name ~= "override" then 
		oldSkybox = obj:Clone() 
	end 
end) 

local function CollisionTBL(obj) 
	if obj:IsA("Accessory") then 
		table.insert(Collision, obj) 
	end 
	if obj:IsA("Part") then 
		if obj.Name == "HeadHB" or obj.Name == "FakeHead" then 
			table.insert(Collision, obj) 
		end 
	end 
end 
LocalPlayer.CharacterAdded:Connect(function(char) 
	repeat RunService.Heartbeat:Wait() 
	until char:FindFirstChild("Gun") 
	SelfObj = {} 
	if values.skins.characters["character changer"].Toggle then 
		ChangeCharacter(ChrModels:FindFirstChild(values.skins.characters.skin.Scroll)) 
	end 
	if char:FindFirstChildOfClass("Shirt") then 
		local String = Instance.new("StringValue") 
		String.Name = "OriginalTexture" 
		String.Value = char:FindFirstChildOfClass("Shirt").ShirtTemplate 
		String.Parent = char:FindFirstChildOfClass("Shirt") 

		if table.find(values.misc.client.removals.Jumbobox, "clothes") then 
			char:FindFirstChildOfClass("Shirt").ShirtTemplate = "" 
		end 
	end 
	if char:FindFirstChildOfClass("Pants") then 
		local String = Instance.new("StringValue") 
		String.Name = "OriginalTexture" 
		String.Value = char:FindFirstChildOfClass("Pants").PantsTemplate 
		String.Parent = char:FindFirstChildOfClass("Pants") 

		if table.find(values.misc.client.removals.Jumbobox, "clothes") then 
			char:FindFirstChildOfClass("Pants").PantsTemplate = "" 
		end 
	end 
	    if values.misc.animations.enabled.Toggle then
		if LoadedAnim then 
			savedanimationdance = Dance
			LoadedAnim = LocalPlayer.Character.Humanoid:LoadAnimation(Dance)
			LoadedAnim.Priority = Enum.AnimationPriority.Action
			LoadedAnim:Play()
			LoadedAnim:AdjustSpeed(values.misc.animations['animation speed'].Slider)
		end
	end
	for i,v in next, char:GetChildren() do 
		if v:IsA("BasePart") and v.Transparency ~= 1 then 
			table.insert(SelfObj, v) 
			local Color = Instance.new("Color3Value") 
			Color.Name = "OriginalColor" 
			Color.Value = v.Color 
			Color.Parent = v 

			local String = Instance.new("StringValue") 
			String.Name = "OriginalMaterial" 
			String.Value = v.Material.Name 
			String.Parent = v 
		elseif v:IsA("Accessory") and v.Handle.Transparency ~= 1 then 
			table.insert(SelfObj, v.Handle) 
			local Color = Instance.new("Color3Value") 
			Color.Name = "OriginalColor" 
			Color.Value = v.Handle.Color 
			Color.Parent = v.Handle 

			local String = Instance.new("StringValue") 
			String.Name = "OriginalMaterial" 
			String.Value = v.Handle.Material.Name 
			String.Parent = v.Handle 
		end 
	end 
	if values.visuals.self["self chams"].Toggle then 
		for _,obj in next, SelfObj do 
			if obj.Parent ~= nil then 
				obj.Material = values.visuals.self["material    "].Dropdown 
				obj.Color = values.visuals.self["self chams"].Color 
			end 
		end 
	end 
	LocalPlayer.Character.ChildAdded:Connect(function(Child) 
		if Child:IsA("Accessory") and Child.Handle.Transparency ~= 1 then 
			table.insert(SelfObj, Child.Handle) 
			local Color = Instance.new("Color3Value") 
			Color.Name = "OriginalColor" 
			Color.Value = Child.Handle.Color 
			Color.Parent = Child.Handle 

			local String = Instance.new("StringValue") 
			String.Name = "OriginalMaterial" 
			String.Value = Child.Handle.Material.Name 
			String.Parent = Child.Handle 

			if values.visuals.self["self chams"].Toggle then 
				for _,obj in next, SelfObj do 
					if obj.Parent ~= nil then 
						obj.Material = values.visuals.self["material    "].Dropdown 
						obj.Color = values.visuals.self["self chams"].Color 
					end 
				end 
			end 
		end 
	end) 

	if values.misc.animations.enabled.Toggle and values.misc.animations.enabled.Active then 
		LoadedAnim = LocalPlayer.Character.Humanoid:LoadAnimation(Dance) 
		LoadedAnim.Priority = Enum.AnimationPriority.Action 
		LoadedAnim:Play() 
	end 
end) 
if LocalPlayer.Character ~= nil then 
	for i,v in next, LocalPlayer.Character:GetChildren() do 
		if v:IsA("BasePart") and v.Transparency ~= 1 then 
			table.insert(SelfObj, v) 
			local Color = Instance.new("Color3Value") 
			Color.Name = "OriginalColor" 
			Color.Value = v.Color 
			Color.Parent = v 

			local String = Instance.new("StringValue") 
			String.Name = "OriginalMaterial" 
			String.Value = v.Material.Name 
			String.Parent = v 
		elseif v:IsA("Accessory") and v.Handle.Transparency ~= 1 then 
			table.insert(SelfObj, v.Handle) 
			local Color = Instance.new("Color3Value") 
			Color.Name = "OriginalColor" 
			Color.Value = v.Handle.Color 
			Color.Parent = v.Handle 

			local String = Instance.new("StringValue") 
			String.Name = "OriginalMaterial" 
			String.Value = v.Handle.Material.Name 
			String.Parent = v.Handle 
		end 
	end 
	if values.visuals.self["self chams"].Toggle then 
		for _,obj in next, SelfObj do 
			if obj.Parent ~= nil then 
				obj.Material = values.visuals.self["material    "].Dropdown 
				obj.Color = values.visuals.self["self chams"].Color 
			end 
		end 
	end 
	LocalPlayer.Character.ChildAdded:Connect(function(Child) 
		if Child:IsA("Accessory") and Child.Handle.Transparency ~= 1 then 
			table.insert(SelfObj, Child.Handle) 
			local Color = Instance.new("Color3Value") 
			Color.Name = "OriginalColor" 
			Color.Value = Child.Handle.Color 
			Color.Parent = Child.Handle 

			local String = Instance.new("StringValue") 
			String.Name = "OriginalMaterial" 
			String.Value = Child.Handle.Material.Name 
			String.Parent = Child.Handle 

			if values.visuals.self["self chams"].Toggle then 
				for _,obj in next, SelfObj do 
					if obj.Parent ~= nil then 
						obj.Material = values.visuals.self["material    "].Dropdown
						obj.Color = values.visuals.self["self chams"].Color 
					end 
				end 
			end 
		end 
	end) 
end 
Players.PlayerAdded:Connect(function(Player)
	Player:GetPropertyChangedSignal("Team"):Connect(function(new)
		wait()
		if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
			for _2,Obj in next, Player.Character:GetDescendants() do
				if Obj.Name == "VisibleCham" then
					if values.visuals.players["visible chams"].Toggle then
						if values.visuals.players.teammates.Toggle or Player.Team ~= LocalPlayer.Team then
							Obj.Visible = true
						else
							Obj.Visible = false
						end
					else
						Obj.Visible = false
					end
					Obj.Color3 = values.visuals.players["visible chams"].Color
				end
			end
		end
	end)
    Player.CharacterAdded:Connect(function(Character)
        Character.ChildAdded:Connect(function(obj)
            wait(1)
			CollisionTBL(obj)
        end)
		wait(1)
		if Character ~= nil then
			local Value = Instance.new("Vector3Value")
			Value.Name = "OldPosition"
			Value.Value = Character.HumanoidRootPart.Position
			Value.Parent = Character.HumanoidRootPart
			for _,obj in next, Character:GetChildren() do
				if obj:IsA("BasePart") and Player ~= LocalPlayer and obj.Name ~= "HumanoidRootPart" and obj.Name ~= "Head" and obj.Name ~= "BackC4" and obj.Name ~= "HeadHB" then
					local VisibleCham = Instance.new("BoxHandleAdornment")
					VisibleCham.Name = "VisibleCham"
					VisibleCham.AlwaysOnTop = false
					VisibleCham.ZIndex = 8
					VisibleCham.Size = obj.Size + Vector3.new(0.18,0.18,0.18)
					VisibleCham.AlwaysOnTop = false
					VisibleCham.Transparency = 0.05


					if values.visuals.players["visible chams"].Toggle then
						if values.visuals.players.teammates.Toggle or Player.Team ~= LocalPlayer.Team then
							VisibleCham.Visible = true
						else
							VisibleCham.Visible = false
						end
					else
						VisibleCham.Visible = false
					end

					table.insert(ChamItems, VisibleCham)

					VisibleCham.Color3 = values.visuals.players["visible chams"].Color

					VisibleCham.AdornCullingMode = "Never"

					VisibleCham.Adornee = obj
					VisibleCham.Parent = obj
				end
			end
		end
    end)
end)
for _,Player in next, Players:GetPlayers() do
	if Player ~= LocalPlayer then
		Player:GetPropertyChangedSignal("Team"):Connect(function(new)
			wait()
			if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
				for _2,Obj in next, Player.Character:GetDescendants() do
					if Obj.Name == "VisibleCham"then
						if values.visuals.players["visible chams"].Toggle then
							if values.visuals.players.teammates.Toggle or Player.Team ~= LocalPlayer.Team then
								Obj.Visible = true
							else
								Obj.Visible = false
							end
						else
							Obj.Visible = false
						end
						Obj.Color3 = values.visuals.players["visible chams"].Color
					end
				end
			end
		end)
	else
		LocalPlayer:GetPropertyChangedSignal("Team"):Connect(function(new)
			wait()
			for _,Player in next, Players:GetPlayers() do
				if Player.Character then
					for _2,Obj in next, Player.Character:GetDescendants() do
						if Obj.Name == "VisibleCham" then
							if values.visuals.players["visible chams"].Toggle then
								if values.visuals.players.teammates.Toggle or Player.Team ~= LocalPlayer.Team then
									Obj.Visible = true
								else
									Obj.Visible = false
								end
							else
								Obj.Visible = false
							end
							Obj.Color3 = values.visuals.players["visible chams"].Color
						end
					end
				end
			end
		end)
	end
	Player.CharacterAdded:Connect(function(Character)
        Character.ChildAdded:Connect(function(obj)
            wait(1)
			CollisionTBL(obj)
        end)
		wait(1)
		if Player.Character ~= nil and Player.Character:FindFirstChild("HumanoidRootPart") then
			local Value = Instance.new("Vector3Value")
			Value.Value = Player.Character.HumanoidRootPart.Position
			Value.Name = "OldPosition"
			Value.Parent = Player.Character.HumanoidRootPart
			for _,obj in next, Player.Character:GetChildren() do
				if obj:IsA("BasePart") and Player ~= LocalPlayer and obj.Name ~= "HumanoidRootPart" and obj.Name ~= "Head" and obj.Name ~= "BackC4" and obj.Name ~= "HeadHB" then
					local VisibleCham = Instance.new("BoxHandleAdornment")
					VisibleCham.Name = "VisibleCham"
					VisibleCham.AlwaysOnTop = false
					VisibleCham.ZIndex = 5
					VisibleCham.Size = obj.Size + Vector3.new(0.18,0.18,0.18)
					VisibleCham.AlwaysOnTop = false
					VisibleCham.Transparency = 0.05


					if values.visuals.players["visible chams"].Toggle then
						if values.visuals.players.teammates.Toggle or Player.Team ~= LocalPlayer.Team then
							VisibleCham.Visible = true
						else
							VisibleCham.Visible = false
						end
					else
						VisibleCham.Visible = false
					end

					table.insert(ChamItems, VisibleCham)

					VisibleCham.Color3 = values.visuals.players["visible chams"].Color

					VisibleCham.AdornCullingMode = "Never"

					VisibleCham.Adornee = obj
					VisibleCham.Parent = obj
				end
			end
		end
    end)
	if Player.Character ~= nil and Player.Character:FindFirstChild("UpperTorso") then
		local Value = Instance.new("Vector3Value")
		Value.Name = "OldPosition"
		Value.Value = Player.Character.HumanoidRootPart.Position
		Value.Parent = Player.Character.HumanoidRootPart
		for _,obj in next, Player.Character:GetChildren() do
			CollisionTBL(obj)
			if obj:IsA("BasePart") and Player ~= LocalPlayer and obj.Name ~= "HumanoidRootPart" and obj.Name ~= "Head" and obj.Name ~= "BackC4" and obj.Name ~= "HeadHB" then
				local VisibleCham = Instance.new("BoxHandleAdornment")
				VisibleCham.Name = "VisibleCham"
				VisibleCham.AlwaysOnTop = false
				VisibleCham.ZIndex = 5
				VisibleCham.Size = obj.Size + Vector3.new(0.18,0.18,0.18)
				VisibleCham.AlwaysOnTop = false
				VisibleCham.Transparency = 0.05


				if values.visuals.players["visible chams"].Toggle then
					if values.visuals.players.teammates.Toggle or Player.Team ~= LocalPlayer.Team then
						VisibleCham.Visible = true
					else
						VisibleCham.Visible = false
					end
				else
					VisibleCham.Visible = false
				end

				table.insert(ChamItems, VisibleCham)

				VisibleCham.Color3 = values.visuals.players["visible chams"].Color

				VisibleCham.AdornCullingMode = "Never"

				VisibleCham.Adornee = obj
				VisibleCham.Parent = obj
			end
		end
	end
end

Players.PlayerAdded:Connect(function(Player)
	Player:GetPropertyChangedSignal("Team"):Connect(function(new)
		wait()
		if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
			for _2,Obj in next, Player.Character:GetDescendants() do
				if Obj.Name == "WallCham" then
					if values.visuals.players["wall chams"].Toggle then
						if values.visuals.players.teammates.Toggle or Player.Team ~= LocalPlayer.Team then
							Obj.Visible = true
						else
							Obj.Visible = false
						end
					else
						Obj.Visible = false
					end
					Obj.Color3 = values.visuals.players["wall chams"].Color
				end
			end
		end
	end)
    Player.CharacterAdded:Connect(function(Character)
        Character.ChildAdded:Connect(function(obj)
            wait(1)
			CollisionTBL(obj)
        end)
		wait(1)
		if Character ~= nil then
			local Value = Instance.new("Vector3Value")
			Value.Name = "OldPosition"
			Value.Value = Character.HumanoidRootPart.Position
			Value.Parent = Character.HumanoidRootPart
			for _,obj in next, Character:GetChildren() do
				if obj:IsA("BasePart") and Player ~= LocalPlayer and obj.Name ~= "HumanoidRootPart" and obj.Name ~= "Head" and obj.Name ~= "BackC4" and obj.Name ~= "HeadHB" then

					local WallCham = Instance.new("BoxHandleAdornment")
					WallCham.Name = "WallCham"
					WallCham.AlwaysOnTop = true
					WallCham.ZIndex = 5
					WallCham.Size = obj.Size + Vector3.new(0.08,0.08,0.08)
					WallCham.AlwaysOnTop = true
					WallCham.Transparency = 0

					if values.visuals.players["wall chams"].Toggle then
						if values.visuals.players.teammates.Toggle or Player.Team ~= LocalPlayer.Team then
							WallCham.Visible = true
						else
							WallCham.Visible = false
						end
					else
						WallCham.Visible = false
					end

					table.insert(ChamItems, WallCham)

					WallCham.Color3 = values.visuals.players["wall chams"].Color

					WallCham.AdornCullingMode = "Never"

					WallCham.Adornee = obj
					WallCham.Parent = obj
				end
			end
		end
    end)
end)
for _,Player in next, Players:GetPlayers() do
	if Player ~= LocalPlayer then
		Player:GetPropertyChangedSignal("Team"):Connect(function(new)
			wait()
			if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
				for _2,Obj in next, Player.Character:GetDescendants() do
					if Obj.Name == "WallCham" then
						if values.visuals.players["wall chams"].Toggle then
							if values.visuals.players.teammates.Toggle or Player.Team ~= LocalPlayer.Team then
								Obj.Visible = true
							else
								Obj.Visible = false
							end
						else
							Obj.Visible = false
						end
						Obj.Color3 = values.visuals.players["wall chams"].Color
					end
				end
			end
		end)
	else
		LocalPlayer:GetPropertyChangedSignal("Team"):Connect(function(new)
			wait()
			for _,Player in next, Players:GetPlayers() do
				if Player.Character then
					for _2,Obj in next, Player.Character:GetDescendants() do
						if Obj.Name == "WallCham" then
							if values.visuals.players["wall chams"].Toggle then
								if values.visuals.players.teammates.Toggle or Player.Team ~= LocalPlayer.Team then
									Obj.Visible = true
								else
									Obj.Visible = false
								end
							else
								Obj.Visible = false
							end
							Obj.Color3 = values.visuals.players["wall chams"].Color
						end
					end
				end
			end
		end)
	end
	Player.CharacterAdded:Connect(function(Character)
        Character.ChildAdded:Connect(function(obj)
            wait(1)
			CollisionTBL(obj)
        end)
		wait(1)
		if Player.Character ~= nil and Player.Character:FindFirstChild("HumanoidRootPart") then
			local Value = Instance.new("Vector3Value")
			Value.Value = Player.Character.HumanoidRootPart.Position
			Value.Name = "OldPosition"
			Value.Parent = Player.Character.HumanoidRootPart
			for _,obj in next, Player.Character:GetChildren() do
				if obj:IsA("BasePart") and Player ~= LocalPlayer and obj.Name ~= "HumanoidRootPart" and obj.Name ~= "Head" and obj.Name ~= "BackC4" and obj.Name ~= "HeadHB" then

					local WallCham = Instance.new("BoxHandleAdornment")
					WallCham.Name = "WallCham"
					WallCham.AlwaysOnTop = true
					WallCham.ZIndex = 5
					WallCham.Size = obj.Size + Vector3.new(0.08,0.08,0.08)
					WallCham.AlwaysOnTop = true
					WallCham.Transparency = 0

					if values.visuals.players["wall chams"].Toggle then
						if values.visuals.players.teammates.Toggle or Player.Team ~= LocalPlayer.Team then
							WallCham.Visible = true
						else
							WallCham.Visible = false
						end
					else
						WallCham.Visible = false
					end

					table.insert(ChamItems, WallCham)

					WallCham.Color3 = values.visuals.players["wall chams"].Color

					WallCham.AdornCullingMode = "Never"

					WallCham.Adornee = obj
					WallCham.Parent = obj
				end
			end
		end
    end)
	if Player.Character ~= nil and Player.Character:FindFirstChild("UpperTorso") then
		local Value = Instance.new("Vector3Value")
		Value.Name = "OldPosition"
		Value.Value = Player.Character.HumanoidRootPart.Position
		Value.Parent = Player.Character.HumanoidRootPart
		for _,obj in next, Player.Character:GetChildren() do
			CollisionTBL(obj)
			if obj:IsA("BasePart") and Player ~= LocalPlayer and obj.Name ~= "HumanoidRootPart" and obj.Name ~= "Head" and obj.Name ~= "BackC4" and obj.Name ~= "HeadHB" then

				local WallCham = Instance.new("BoxHandleAdornment")
				WallCham.Name = "WallCham"
				WallCham.AlwaysOnTop = true
				WallCham.ZIndex = 5
				WallCham.Size = obj.Size + Vector3.new(0.08,0.08,0.08)
				WallCham.AlwaysOnTop = true
				WallCham.Transparency = 0

				if values.visuals.players["wall chams"].Toggle then
					if values.visuals.players.teammates.Toggle or Player.Team ~= LocalPlayer.Team then
						WallCham.Visible = true
					else
						WallCham.Visible = false
					end
				else
					WallCham.Visible = false
				end

				table.insert(ChamItems, WallCham)

				WallCham.Color3 = values.visuals.players["wall chams"].Color

				WallCham.AdornCullingMode = "Never"

				WallCham.Adornee = obj
				WallCham.Parent = obj
			end
		end
	end
end
