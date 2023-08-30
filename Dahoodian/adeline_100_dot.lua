-- made by gigglesnort#5693
getgenv().targetlock_enabled = true 
getgenv().use_cam = false

getgenv().prediction_X   = 0.140
getgenv().prediction_Y   = 0.120
getgenv().prediction_Z   = 0.130

getgenv().togglekey  = "e"
getgenv().part       = "HumanoidRootPart"

getgenv().distance_based_pred = false
getgenv().far       = 0.150
getgenv().mid       = 0.160
getgenv().close     = 0.170

getgenv().far_dist    = 70
getgenv().mid_dist    = 40
getgenv().close_dist  = 20

getgenv().target_strafe       = false
getgenv().strafing_speed      = 10
getgenv().strafing_radius     = 10
getgenv().strafe_height       = 0
getgenv().view_while_strafe   = true
--





local CC = game:GetService("Workspace").CurrentCamera
local target
local enabled = false
local mouse = game.Players.LocalPlayer:GetMouse()
local dot = Instance.new("Part", game.Workspace)
local currentprediction = prediction

function makemarker(Parent, Adornee, Color, Size, Size2)
    local e = Instance.new("BillboardGui", Parent)
    e.Name = "PP"
    e.Adornee = Adornee
    e.Size = UDim2.new(Size, Size2, Size, Size2)
    e.AlwaysOnTop = true
    local a = Instance.new("Frame", e)
    a.Size = UDim2.new(2, 1, 2, 1)
    a.BackgroundTransparency = 0
    a.BackgroundColor3 = Color
    local g = Instance.new("UICorner", a)
    g.CornerRadius = UDim.new(100, 100)
    return e
end

function getClosestPlayerToCursor()
    local closestPlayer
    local shortestDistance = math.huge
    for i, v in pairs(game.Players:GetPlayers()) do
        if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") then
            local pos = CC:WorldToViewportPoint(v.Character.PrimaryPart.Position)
            local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).magnitude
            if magnitude < shortestDistance then
                closestPlayer = v
                shortestDistance = magnitude
            end
        end
    end
    return closestPlayer
end

function disdet()
    if enabled and distance_based_pred then
         local vvv = (target.Character.PrimaryPart.Position-game.Players.LocalPlayer.Character.PrimaryPart.Position).magnitude
            
            if vvv > far_dist then
            getgenv().prediction = far
        elseif vvv > mid_dist then
            getgenv().prediction = mid
        elseif vvv <= close_dist then
            getgenv().prediction = close
        else
            getgenv().prediction = currentprediction
        end
    else   
        getgenv().prediction = currentprediction
    end
end

spawn(function()
    dot.Anchored = true
    dot.CanCollide = false
    dot.Size = Vector3.new(7, 7, 7)
    dot.Transparency = 1
    makemarker(dot, dot, Color3.fromRGB(255, 255, 0), 0.40, 0)
end)

mouse.KeyDown:Connect(function(k)
    if k ~= togglekey then return end
    enabled = not enabled
    if enabled then
        target = getClosestPlayerToCursor()
    end
end)

game:GetService("RunService").Stepped:Connect(function()
    disdet()
if enabled and target ~= nil then
        local targetpos = target.Character[part].Velocity
        dot.CFrame = CFrame.new(target.Character[part].Position+Vector3.new(targetpos.X*prediction_X, targetpos.Y*prediction_Y, targetpos.Z*prediction_Z))
    else
        dot.CFrame = CFrame.new(0, 9999, 0)
    end
end)

game:GetService("RunService").Heartbeat:Connect(function()
if enabled and target ~= nil and target_strafe then
   local lp = game.Players.LocalPlayer.Character
   local targpos = target.Character.HumanoidRootPart.Position
         lp:SetPrimaryPartCFrame(CFrame.new(targpos+Vector3.new(math.cos(tick()*strafing_speed)*strafing_radius,strafe_height,math.sin(tick()*strafing_speed)*strafing_radius)))
         
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position, Vector3.new(targpos.X,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Y,targpos.Z))
        game:GetService("Players").LocalPlayer.Character.Humanoid.AutoRotate = false
    else
        game:GetService("Players").LocalPlayer.Character.Humanoid.AutoRotate = true
     end
end)   
   
game:GetService("RunService").Heartbeat:Connect(function()
    if enabled and target ~= nil and target_strafe and view_while_strafe then
        CC.CameraSubject = target.Character.HumanoidRootPart
    else 
        CC.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
    end
end)


game:GetService("RunService").RenderStepped:Connect(function()
    if enabled and target ~= nil and use_cam then
        CC.CFrame = CFrame.new(CC.CFrame.Position,dot.CFrame.Position)
    end
end)

local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)
mt.__namecall = newcclosure(function(...)
    local args = {...}
    if enabled and targetlock_enabled and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" then
        args[3] = dot.CFrame.Position -- dunno why people js dont do dis
        return old(unpack(args))
    end
    return old(...)
end)

-- adeline loves cats