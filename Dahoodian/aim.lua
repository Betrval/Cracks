getgenv().dnss = {
	SilentAim = {
		["Enabled"] = true, -- // Auto closest point and Auto resolver
		["ToggleKey"] = "C",
		["Prediction"] = 0.133
	},
	AntiGroundShots = {
		["Enabled"] = true,
		["TakeOff"] = 0.5
	},
	Checks = {
		["wallCheck"] = true,
		["KOCheck"] = true,
		["GrabbedCheck"] = true,
		["CrewCheck"] = false
	},
	MemSpoofer = {
		["Enabled"] = false,
		["Start"] = 800,
		["End"] = 900
	},
	Misc = {
		["AntiCurve"] = false,
		["AutoPrediction"] = false -- // Based off your normal Prediction
	},
	Macro = {
		["Enabled"] = false,
		["Type"] = "Mouse", -- // Mouse or Keyboard
		["Key"] = "Z",
		["Speed"] = 1,
	},
	FOV = {
		["Enabled"] = true,
        ["Filled"] = false,
		["Size"] = 50,
		["Color"] = Color3.fromRGB(255, 255, 255),
		["Transparency"] = 1,
		["Thickness"] = 1
	}
}

-- // cache
local Circle = Drawing.new("Circle")
local rPoint
local localPlayer = game.Players.LocalPlayer
local mouse = localPlayer:GetMouse()
local mousePos = mouse.hit.p
local playersService = game:GetService("Players")
local workspaceCam = workspace.CurrentCamera;
local CFramelookat = CFrame.lookAt
local v3 = Vector3.new
local Player = game:GetService("Players").LocalPlayer
local Mouse = Player:GetMouse()
local SpeedGlitch = false

Circle.Transparency = dnss.FOV.Transparency
Circle.Radius = dnss.FOV.Size * 3
Circle.Visible = dnss.FOV.Enabled
Circle.Color = dnss.FOV.Color
Circle.Thickness = dnss.FOV.Thickness
Circle.Filled = dnss.FOV.Filled

local positionData = {}
local velocityCache = {}
local smoothingFactor = 30
local smoothingFactorMax = 100
local prevVelocity = Vector3.new()

local function calculateVelocityAverage(positionData)
	local totalVelocity = 0
	local avgPosition = Vector3.new()
	local avgTime = 0
	local len = # positionData
	if len == 0 then
		return avgPosition, avgTime
	end
	for i, data in ipairs(positionData) do
		if data.pos then
			local velocity = velocityCache[i] or (1 - (i - 1) / smoothingFactorMax) ^ 2
			velocityCache[i] = velocity
			avgPosition += data.pos * velocity
			avgTime += data.time * velocity
			totalVelocity += velocity
		end
	end
	return avgPosition / totalVelocity, avgTime / totalVelocity
end

local function smoothVelocity(character, smoothingFactor)
	local currentPos = character.HumanoidRootPart.Position
	local currentTick = tick()
	positionData[# positionData + 1] = {
		pos = currentPos,
		time = currentTick
	}
	if # positionData > smoothingFactorMax then
		table.remove(positionData, 1)
	end
	local avgPosition, avgTime = calculateVelocityAverage(positionData)
	local prevData = positionData[# positionData - 1]
	if prevData and prevData.pos then
		local avgVelocity = (avgPosition - prevData.pos) / (avgTime - prevData.time)
		local smoothedVelocity = (1 - 1 / smoothingFactor) * prevVelocity + 1 / smoothingFactor * avgVelocity
		prevVelocity = smoothedVelocity
		return smoothedVelocity
	end
end

local function getPingBasedPrediction()
	if dnss.Misc.AutoPrediction then
		local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()
		local calculatedPrediction = (((ping - 0) / 200) * (0.2 - 0.1)) + 0.1
		return dnss.SilentAim.Prediction + calculatedPrediction
	else
		return dnss.SilentAim.Prediction
	end
end

pcall(function()
	local spoofer, updating = false
	local performanceStats = game:GetService('CoreGui').RobloxGui.PerformanceStats
	local function updateChildNames()
		for i, v in ipairs(performanceStats:GetChildren()) do
			v.Name = i
		end
	end
	local function updateValueLabelText()
		if dnss.MemSpoofer.Enabled and not updating then
			updating = true
			spoofer = string.format('%d.%dMB', math.random(MemSpoofer.Start, MemSpoofer.End), math.random(10, 99))
			performanceStats['1'].StatsMiniTextPanelClass.ValueLabel.Text = spoofer
			updating = false
		end
	end
	local function onDataChange()
		updateChildNames()
		updateValueLabelText()
	end
	updateChildNames()
	performanceStats['1'].StatsMiniTextPanelClass.ValueLabel:GetPropertyChangedSignal('Text'):Connect(onDataChange)
end)

function wallCheck(position, ignoreList)
	if dnss.Checks.wallCheck then
		return not workspace:FindPartOnRayWithIgnoreList(
		Ray.new(workspace.CurrentCamera.CFrame.p, position - workspace.CurrentCamera.CFrame.p), ignoreList)
	end
end

function KnockedCheck(_)
	if _.Character.BodyEffects["K.O"] and dnss.Checks.KOCheck then
		return _.Character.BodyEffects["K.O"].Value ~= true
	end
end

function GrabbedCheck(_)
	if dnss.Checks.GrabbedCheck then
		return not _.Character:FindFirstChild("GRABBING_CONSTRAINT")
	end
end

function isSameCrew(Player1, Player2)
	if dnss.Checks.CrewCheck and Player1:FindFirstChild("DataFolder") and Player1.DataFolder:FindFirstChild("Information") and Player1.DataFolder.Information:FindFirstChild("Crew") and Player2:FindFirstChild("DataFolder") and Player2.DataFolder:FindFirstChild("Information") and Player2.DataFolder.Information:FindFirstChild("Crew") then
		local Player1Crew = Player1.DataFolder.Information.Crew.Value
		local Player2Crew = Player2.DataFolder.Information.Crew.Value
		if Player1Crew ~= nil and Player2Crew ~= nil and Player1Crew ~= "" and Player2Crew ~= "" then
			return Player1Crew == Player2Crew
		end
	end
	return false
end

local userInputService = game:GetService("UserInputService")
userInputService.InputBegan:Connect(function(input, gameProcessedEvent)
	if input.KeyCode.Name == dnss.SilentAim.ToggleKey and not gameProcessedEvent then
		dnss.SilentAim.Enabled = not dnss.SilentAim.Enabled
	end
end)

function getClosestPart(Target)
	if Target and Target:GetChildren() then
		local closestpart, closdist = nil, math.huge
		local camera = workspace.CurrentCamera
		local mousepos = game.Players.LocalPlayer:GetMouse()
		local circleRadius = Circle.Radius
		local children = Target:GetChildren()
		local i = 1
		while i <= #children do
			local child = children[i]
			if child:IsA("BasePart") then
				local them, vis = camera:WorldToScreenPoint(child.Position)
				local magnitude = (Vector2.new(them.X, them.Y) - Vector2.new(mousepos.X, mousepos.Y)).magnitude
				if vis and circleRadius > magnitude and magnitude < closdist then
					closestpart, closdist = child, magnitude
				end
			end
			i = i + 1
		end
		return closestpart
	end
end

function closestPointOnPart(part, point)
	local cf = part.CFrame
	local extent = part.Size / 2
	local diff = point - cf.p
	local closestPoint = Vector3.new(
	math.clamp(diff.x, - extent.x, extent.x), math.clamp(diff.y, - extent.y, extent.y), math.clamp(diff.z, - extent.z, extent.z))
	return cf:pointToWorldSpace(closestPoint)
end

function cls(target)
	local SelectedPart = getClosestPart(self.Character)
	if SelectedPart then
		local MouseHit = game.Players.LocalPlayer:GetMouse().hit
		return closestPointOnPart(SelectedPart, MouseHit.p)
	end
end

function getClosestPlayer()
    local closestPlayer, closestDistance = nil, 1 / 0
    local camera = workspace.CurrentCamera
    local localPlayer = game.Players.LocalPlayer
    local mouse = localPlayer:GetMouse()
    local mousePos = mouse.hit.p
    local players = game:GetService("Players"):GetPlayers()
    -- Define or pass variables for the following functions
    local knockedCheck = KnockedCheck
    local grabbedCheck = GrabbedCheck
    local wallCheck = wallCheck
    local isSameCrew = isSameCrew
    local i = 1
    while i <= #players do
        local player = players[i]
        if player ~= localPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local rootPart = player.Character.HumanoidRootPart
            local OnScreen = camera:WorldToViewportPoint(rootPart.Position)
            local distance = (rootPart.Position - mousePos).magnitude
            if distance < closestDistance
                    and knockedCheck(player)
                    and grabbedCheck(player)
                    and OnScreen
                    and wallCheck(rootPart.Position, { localPlayer, player.Character })
                    and not isSameCrew(localPlayer, player) then
                closestPlayer = player
                closestDistance = distance
            end
        end
        i = i + 1
    end
    return closestPlayer
end

local function AntiGroundShots()
	if self ~= nil and dnss.AntiGroundShots.Enabled and self.Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall then
			local currentvelocity = self.Character.HumanoidRootPart.Velocity
			self.Character.HumanoidRootPart.Velocity = Vector3.new(currentvelocity.X, currentvelocity.Y / dnss.AntiGroundShots.TakeOff, currentvelocity.Z)
	end
end

function isAnti()
	local calculateVelocityAverage = smoothVelocity(self.Character)
	return self.Character.HumanoidRootPart.Velocity.Magnitude > 50 and calculateVelocityAverage * dnss.SilentAim.Prediction or self.Character.HumanoidRootPart.Velocity * dnss.SilentAim.Prediction
end
function AntiCurve()
    local character = game.Players.LocalPlayer.Character
    if dnss.Misc.AntiCurve and character and character.PrimaryPart then
        local characterCf = character.PrimaryPart.CFrame
        local target = self.Character.HumanoidRootPart
        local targetPos = target.Position
        local charPos = character.PrimaryPart.Position
        character:SetPrimaryPartCFrame(CFrame.lookAt(charPos, v3(targetPos.X, charPos.Y, targetPos.Z)))
        wait()
        character:SetPrimaryPartCFrame(characterCf)
    end
end

game.RunService.Heartbeat:Connect(function()
	local vector2Pos = game:GetService("UserInputService"):GetMouseLocation()
	Circle.Position = Vector2.new(vector2Pos.X, vector2Pos.Y)
	AntiCurve()
	AntiGroundShots()
	getPingBasedPrediction()
	if dnss.SilentAim.Enabled then
		self = getClosestPlayer()
		if self then
			rPoint = cls(self.Character)
			getgenv().Result = getClosestPart(self.Character)
		else
			rPoint = nil
			getgenv().Result = nil
		end
	else
		rPoint = nil
	end
end)

local function processInput(Key)
	if Key == string.lower(dnss.Macro.Key) and dnss.Macro.Enabled then
		SpeedGlitch = not SpeedGlitch
		if SpeedGlitch == true then
			repeat
				task.wait(dnss.Macro.Speed / 100)
				if dnss.Macro.Type == "Keyboard" then
					game:GetService("VirtualInputManager"):SendKeyEvent(true, "I", false, game)
					task.wait(dnss.Macro.Speed / 100)
					game:GetService("VirtualInputManager"):SendKeyEvent(true, "O", false, game)
				elseif dnss.Macro.Type == "Mouse" then
					game:GetService("VirtualInputManager"):SendMouseWheelEvent("0", "0", true, game)
					task.wait(dnss.Macro.Speed / 100)
					game:GetService("VirtualInputManager"):SendMouseWheelEvent("0", "0", false, game)
				end
				task.wait(dnss.Macro.Speed / 100)
			until SpeedGlitch == false
		end
	end
end

Mouse.KeyDown:Connect(processInput)

local __index
__index = hookmetamethod(game, "__index", function(t, k)
	if t:IsA("Mouse") and k == "Hit" or k == "Target" then
		if self ~= nil and Result ~= nil and rPoint then
			local Hit = CFrame.new(rPoint) + isAnti()
			return (k == "Hit" and Hit)
		end
	end
	return __index(t, k)
end)