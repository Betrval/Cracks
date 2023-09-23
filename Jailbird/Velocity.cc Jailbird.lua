local requiredPlaceId = 6452089755
if game.PlaceId ~= requiredPlaceId then
  warn(("This script is intended for use in game with place ID %d, but the current game has place ID %d."):format(requiredPlaceId, game.PlaceId))
  return
end
repeat task.wait() until game:IsLoaded()
  rconsoleprint("[*]: System Alert: velocity.cc has been injected.\n")

  --// Locals
  local players = game:GetService("Players");
  local workspace = game:GetService("Workspace");
  local runService = game:GetService("RunService");
  local inputService = game:GetService("UserInputService");
  local networkClient = game:GetService("NetworkClient");
  local virtualUser = game:GetService("VirtualUser");
  local lighting = game:GetService("Lighting");
  local teleportService = game:GetService("TeleportService");
  local camera = workspace.CurrentCamera;
  local localplayer = players.LocalPlayer;
  local mouse = localplayer:GetMouse();
  local curveStatus = {player = nil, i = 0};
  local fovCircle = Drawing.new("Circle");
  local ambient = lighting.Ambient;
  local keybinds = {};
  local xray = {};
  local fonts = {};
  for font, index in next, Drawing.Fonts do
    fonts[index] = font;
  end
  local camera = game:GetService("Workspace").CurrentCamera
  local CurrentCamera = workspace.CurrentCamera
  local worldToViewportPoint = CurrentCamera.worldToViewportPoint
  local UIS = game:GetService("UserInputService")
  local dwCamera = workspace.CurrentCamera
  local dwRunService = game:GetService("RunService")
  local dwUIS = game:GetService("UserInputService")
  local dwEntities = game:GetService("Players")
  local dwLocalPlayer = dwEntities.LocalPlayer
  local dwMouse = dwLocalPlayer:GetMouse()
  local CurrentMap = "Gas Station"
  local InGame = false
  local DeathLoop = false
  local PeekBool = false
  local Camera = game:GetService("Workspace").Camera
  local Camera = game:GetService("Workspace").CurrentCamera
  local Decimals = 2
  local Clock = os.clock()

  --// Create UI
  local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/BigHacker123/Library.lua/main/Library.lua'))()
  local SaveManager = loadstring(game:HttpGet('https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/addons/SaveManager.lua'))()
  local ThemeManager = loadstring(game:HttpGet('https://raw.githubusercontent.com/BigHacker123/Library.lua/main/Theme.lua'))()
  local espLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/zzvsvv/zv-softwares/main/libs/esp.lua"))();
  local Window = Library:CreateWindow({ Size = UDim2.fromOffset(550, 610),Title = 'velocity.<font color="#de6cff">cc</font>                                             [jailbird]',Center = true,AutoShow = true})
  local Tabs = {CombatTab = Window:AddTab('combat'),VisualsTab = Window:AddTab('visuals'),MiscellaneousTab = Window:AddTab('miscellaneous'),UISettings = Window:AddTab('settings')}

  --// Notifications
  Library:Notify(("welcome to velocity.cc "..game.Players.LocalPlayer.Name.." 👋"), 6)
  Library:Notify(("Status: 🟢 - undetected (Safe to use)"), 6)
  local notifyPlayerChange = function(player, message, color)
  local prefix = player:IsFriendsWith(game.Players.LocalPlayer.UserId) and "notification - friend" or "notification - player"
  Library:Notify(("%s | user: %s | %s"):format(prefix, player.DisplayName, message), prefix == "notification - friend" and 6 or 3, color)
end
game.Players.PlayerAdded:Connect(function(player)
notifyPlayerChange(player, "joined", Color3.fromRGB(0, 255, 0))
end)
game.Players.PlayerRemoving:Connect(function(player)
notifyPlayerChange(player, "left", Color3.fromRGB(255, 0, 0))
end)

--// Utility
local utility = {
  services = {
    players = game:GetService("Players"),
    workspace = game:GetService("Workspace"),
    userinputservice = game:GetService("UserInputService"),
    runservice = game:GetService("RunService"),
    httpservice = game:GetService("HttpService"),
    coregui = game:GetService("CoreGui"),
    lighting = game:GetService("Lighting"),
    guiservice = game:GetService("GuiService"),
    replicatedstorage = game:GetService("ReplicatedStorage"),
    networkclient = game:GetService("NetworkClient")
  },
  functions = {},
  }

  --// Lph
  if not LPH_OBFUSCATED then
    LPH_JIT = function(...) return ... end
    LPH_JIT_MAX = function(...) return ... end
    LPH_JIT_ULTRA = function(...) return ... end
    LPH_NO_VIRTUALIZE = function(...) return ... end
    LPH_NO_UPVALUES = function(f) return(function(...) return f(...) end) end
    LPH_ENCSTR = function(...) return ... end
    LPH_STRENC = function(...) return ... end
    LPH_HOOK_FIX = function(...) return ... end
    LPH_CRASH = function() return print(debug.traceback()) end
  end

  --
  local AimbotTabbox1 = Tabs.CombatTab:AddLeftTabbox()
  local Aim1 = AimbotTabbox1:AddTab('aimbot')

  --* Aimbot *--

  Aim1:AddToggle("aim_enabled", {Text = "enabled"}):AddKeyPicker("aim_key", {Text = "Aimbot", Default = "MB2", Mode = "Hold"})
  Aim1:AddToggle("fov_Circle", {Text = "draw fov:"}):AddColorPicker("fovColor", { Default = Color3.fromRGB(255, 255, 255) })
  Aim1:AddSlider("aimbot_distance", {Text = "distance:", Default = 500, Min = 1, Max = 1000, Rounding = 0})
  Aim1:AddSlider("circle_radius", {Text = "radius:", Default = 250, Min = 50, Max = 600, Rounding = 0})
  Aim1:AddDropdown("aim_part", {Text = "aim part:", Default = 1, Values = {"Head", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg"}})

  local VisTabbox3 = Tabs.CombatTab:AddRightTabbox()
  local CrosshairXTab = VisTabbox3:AddTab('crosshair')
  local CrossHairX = Drawing.new("Circle"), Drawing.new("Circle")
  CrossHairX.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
  CrossHairX.Thickness = 1
  CrossHairX.ZIndex = 3
  CrosshairXTab:AddToggle('zCrosshairX_Toggle', {Text = 'enabled', Default = false}):AddColorPicker("eCrosshairX_Color", {Default = Color3.fromRGB(208, 123, 255)}):OnChanged(function()
  CrossHairX.Visible = Toggles.zCrosshairX_Toggle.Value
  end)
  Options.eCrosshairX_Color:OnChanged(function()
  CrossHairX.Color = Options.eCrosshairX_Color.Value
  end)
  CrosshairXTab:AddToggle('Crosshair_Filled1', {Text = 'filled', Default = false}):OnChanged(function()
  CrossHairX.Filled = Toggles.Crosshair_Filled1.Value
  end)
  CrosshairXTab:AddSlider('Crosshair_Radius', {Text = 'size', Suffix = "°", Default = 2, Min = 0, Max = 100, Rounding = 0, Compact = true}):OnChanged(function(CrosshairXRadius)
  CrossHairX.Radius = CrosshairXRadius
  end)

  --
  local WeaponModsTabBox = Tabs.CombatTab:AddRightTabbox('weapon modifications')
  local WeaponModsTab = WeaponModsTabBox:AddTab('weapon modifications')

  --* Weapon Modifications *--

  WeaponModsTab:AddToggle("InfAmmo", {Text="infinite ammo",Default=false});
  local aY;
  aY = hookmetamethod(game, "__index", newcclosure(function(self, aZ)
  if (not checkcaller() and (tostring(aZ) == "Value") and (tostring(self) == "Ammo") and Toggles.InfAmmo.Value) then
    return 30;
  end
  return aY(self, aZ);
  end));

  --
  local CustomViewmodelTabBox = Tabs.CombatTab:AddRightTabbox('custom viewmodel')
  local CustomViewmodelTab = CustomViewmodelTabBox:AddTab('custom viewmodel')

  --* Custom Viewmodel *--

  local ViewmodelEnabled = false
  local ViewmodelPos = Vector3.new(0, 0, 0)
  local CurrentCamera = workspace.CurrentCamera
  local newindex
  newindex = hookmetamethod(game, '__newindex', function(obj, idx, val)
  if obj == CurrentCamera and idx == 'CFrame' and ViewmodelEnabled then
    val = val + (val.LookVector * ViewmodelPos.Z) + (val.RightVector * ViewmodelPos.X) + (val.UpVector * ViewmodelPos.Y)
  end
  return newindex(obj, idx, val)
  end)

  CustomViewmodelTab:AddToggle('ViewmodelEnabled', {Text = 'enabled', Default = ViewmodelEnabled}):OnChanged(function(Toggle)
  ViewmodelEnabled = Toggle
  end)

  CustomViewmodelTab:AddSlider('ViewmodelX', {Text = 'x-offset:', Default = 0, Min = -5, Max = 5, Rounding = 2, Compact = false}):OnChanged(function(Slider)
  ViewmodelPos = Vector3.new(Slider, ViewmodelPos.Y, ViewmodelPos.Z)
  end)

  CustomViewmodelTab:AddSlider('ViewmodelY', {Text = 'y-offset:', Default = 0, Min = -5, Max = 5, Rounding = 2, Compact = false}):OnChanged(function(Slider)
  ViewmodelPos = Vector3.new(ViewmodelPos.X, Slider, ViewmodelPos.Z)
  end)

  CustomViewmodelTab:AddSlider('ViewmodelZ', {Text = 'z-offset:', Default = 0, Min = -5, Max = 5, Rounding = 2, Compact = false}):OnChanged(function(Slider)
  ViewmodelPos = Vector3.new(ViewmodelPos.X, ViewmodelPos.Y, Slider)
  end)

  --// Anti Aim
  local antiaimEnabled = false
  local camera = workspace.CurrentCamera
  local Players = game:GetService("Players")
  local RunService = game:GetService("RunService")
  local humanoid
  local motionOptions = {
    sineWave = {
      isEnabled = false,
      startAngle = 0,
      endAngle = 180,
      frequency = 1,
      amplitude = (180 - 0) / 2,
    },
    jitter = {
      isEnabled = false,
      startAngle = 5,
      endAngle = 20,
      intensity = 50,
    },
    spin = {
      isEnabled = false,
      speed = 5,
    },
  }

  local function onCharacterAdded(character)
    humanoid = character:WaitForChild("Humanoid")
  end
  Players.LocalPlayer.CharacterAdded:Connect(onCharacterAdded)
  if Players.LocalPlayer.Character then
    onCharacterAdded(Players.LocalPlayer.Character)
  end
  local function updateAntiAim()
    if antiaimEnabled and humanoid then
      local angle = 0
      if motionOptions.sineWave.isEnabled then
        angle = motionOptions.sineWave.startAngle + motionOptions.sineWave.amplitude * math.sin(time() * motionOptions.sineWave.frequency)
      end
      if motionOptions.jitter.isEnabled then
        angle = angle + motionOptions.jitter.startAngle + (motionOptions.jitter.endAngle - motionOptions.jitter.startAngle) * math.random(-100, 100) / 100 + motionOptions.jitter.intensity * math.random(-100, 100) / 100
      end
      if motionOptions.spin.isEnabled then
        humanoid.RootPart.CFrame = humanoid.RootPart.CFrame * CFrame.Angles(0, math.rad(motionOptions.spin.speed), 0)
      end
      if motionOptions.sineWave.isEnabled or motionOptions.jitter.isEnabled then
        local lookAtPos = camera.CFrame.Position
        lookAtPos = Vector3.new(lookAtPos.X, humanoid.RootPart.Position.Y, lookAtPos.Z)
        humanoid.RootPart.CFrame = CFrame.new(humanoid.RootPart.Position, lookAtPos) * CFrame.Angles(0, math.rad(angle), 0)
      end
      humanoid.AutoRotate = false
    elseif humanoid then
      humanoid.AutoRotate = true
    end
  end
  RunService.RenderStepped:Connect(updateAntiAim)

  --
  local SpinbotTabBox = Tabs.CombatTab:AddLeftTabbox('spinbot')
  local SpinbotTab = SpinbotTabBox:AddTab('spinbot')

  --* Spinbot *--

  SpinbotTab:AddToggle('', { Text = 'enabled', Default = false }):OnChanged(function(Toggle)
  antiaimEnabled = Toggle
  end)

  SpinbotTab:AddDropdown("", { Text = "type:", Default = 1, Values = {"off", "wave", "jitter", "spin"} }):OnChanged(function(value)
  antiaimEnabled = value ~= "off"
  motionOptions.sineWave.isEnabled = value == "wave"
  motionOptions.jitter.isEnabled = value == "jitter"
  motionOptions.spin.isEnabled = value == "spin"
  end)

  SpinbotTab:AddSlider('', {Text = 'intensity:', Default = 50, Min = 1, Max = 100, Rounding = 0, Compact = false}):OnChanged(function(Slider)
  motionOptions.jitter.intensity = Slider
  end)

  SpinbotTab:AddSlider('', {Text = 'speed:', Default = 5, Min = 1, Max = 25, Rounding = 0, Compact = false}):OnChanged(function(Slider)
  motionOptions.spin.speed = Slider
  end)

  SpinbotTab:AddToggle('', { Text = 'fake lag', Default = false }):OnChanged(function(value)
  game:GetService("NetworkClient"):SetOutgoingKBPSLimit(value and 1 or 0);
  end)

  --
  local VisTabbox1 = Tabs.VisualsTab:AddLeftTabbox()
  local Esp1 = VisTabbox1:AddTab('player visuals')

  --* Player Visuals *--

  Esp1:AddToggle("", {Text = "enabled"}):OnChanged(function(value)
  espLibrary.options.enabled = value;
  end)
  espLibrary.options.limitDistance = true
  Esp1:AddSlider('', {Text = 'distance:',Suffix = " studs",Default = 1000, Min = 1, Max = 2500, Rounding = 0, Compact = false}):OnChanged(function(value)
  espLibrary.options.limitDistance = value
  end)
  local CustomText = Drawing.new("Text")
  CustomText.Visible = false
  CustomText.Text = "velocity.cc"
  CustomText.Size = 12
  CustomText.Outline = true
  CustomText.Center = true
  CustomText.Font = 2
  CustomText.Color = Color3.new(208, 123, 255)
  CustomText.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 1.88)
  --
  Esp1:AddToggle('12t2ta22', {Text = 'onscreen',Default = false,Tooltip = 'Onscreen',}):AddColorPicker('OnscreenColor', {Default = Color3.fromRGB(208, 123, 255),Title = 'Color',}):OnChanged(function(ONSCREENVALUE)
  CustomText.Visible = ONSCREENVALUE
  end)
  Options.OnscreenColor:OnChanged(function(Color320)
  CustomText.Color = Color320
  end)
  Esp1:AddToggle("", {Text = "names"}):AddColorPicker('namescolor', {Default = Color3.fromRGB(208, 123, 255),Title = 'Color',}):OnChanged(function(value)
  espLibrary.options.names = value;
  end)
  Options.namescolor:OnChanged(function(Color320)
  espLibrary.options.nameColor = Color320
  end)
  Esp1:AddToggle("", {Text = "boxes"}):AddColorPicker('boxescolor', {Default = Color3.fromRGB(208, 123, 255),Title = 'Color',}):OnChanged(function(value)
  espLibrary.options.boxes = value;
  end)
  Options.boxescolor:OnChanged(function(Color320)
  espLibrary.options.boxesColor = Color320
  end)
  Esp1:AddToggle("", {Text = "filled boxes"}):AddColorPicker('fillboxscolor', {Default = Color3.fromRGB(208, 123, 255),Title = 'Color',}):OnChanged(function(value)
  espLibrary.options.boxFill = value;
  end)
  Options.fillboxscolor:OnChanged(function(Color320)
  espLibrary.options.boxFillColor = Color320
  end)
  Esp1:AddToggle("", {Text = "distances"}):AddColorPicker('distancescolor', {Default = Color3.fromRGB(208, 123, 255),Title = 'Color',}):OnChanged(function(value)
  espLibrary.options.distance = value;
  end)
  Options.distancescolor:OnChanged(function(Color320)
  espLibrary.options.distanceColor = Color320
  end)
  Esp1:AddToggle("", {Text = "healthbars"}):AddColorPicker('healthbarscolor', {Default = Color3.fromRGB(208, 123, 255),Title = 'Color',}):OnChanged(function(value)
  espLibrary.options.healthBars = value;
  end)
  Options.healthbarscolor:OnChanged(function(Color320)
  espLibrary.options.healthBarsColor = Color320
  end)
  Esp1:AddToggle("", {Text = "health text"}):AddColorPicker('healthTextColor', {Default = Color3.fromRGB(208, 123, 255),Title = 'Color',}):OnChanged(function(value)
  espLibrary.options.healthText = value;
  end)
  Options.healthTextColor:OnChanged(function(Color320)
  espLibrary.options.healthTextColor = Color320
  end)
  Esp1:AddToggle("", {Text = "chams"}):AddColorPicker('chamsColor', {Default = Color3.fromRGB(208, 123, 255),Title = 'Color',}):AddColorPicker('chamsotherColor', {Default = Color3.fromRGB(208, 123, 255),Title = 'Color',}):OnChanged(function(value)
  espLibrary.options.chams = value;
  end)
  Options.chamsColor:OnChanged(function(Color320)
  espLibrary.options.chamsFillColor = Color320
  end)
  Options.chamsotherColor:OnChanged(function(Color320)
  espLibrary.options.chamsOutlineColor = Color320
  end)
  Esp1:AddSlider('', {Text = 'transparency:',Suffix = "%",Default = 0.5, Min = 0, Max = 1, Rounding = 2, Compact = false}):OnChanged(function(value)
  espLibrary.options.chamsFillTransparency = value
  end)
  Esp1:AddToggle("", {Text = "tracers"}):AddColorPicker('tracersColor', {Default = Color3.fromRGB(208, 123, 255),Title = 'Color',}):OnChanged(function(value)
  espLibrary.options.tracers = value;
  end)
  Options.tracersColor:OnChanged(function(Color320)
  espLibrary.options.tracerColor = Color320
  end)
  Esp1:AddDropdown("", {Text = "tracer origin:", Default = 1, Values = {"Bottom", "Top", "Mouse"}}):OnChanged(function(value)
  espLibrary.options.tracerOrigin = value
  end)
  Esp1:AddToggle("", {Text = "arrows"}):AddColorPicker('arrowsColor', {Default = Color3.fromRGB(208, 123, 255),Title = 'Color',}):OnChanged(function(value)
  espLibrary.options.outOfViewArrows = value;
  espLibrary.options.outOfViewArrowsOutline = value;
  end)
  Options.arrowsColor:OnChanged(function(Color320)
  espLibrary.options.outOfViewArrowsColor = Color320
  espLibrary.options.outOfViewArrowsOutlineColor = Color320
  end)

  Esp1:AddDivider("")

  Esp1:AddToggle("", {Text = "team color"}):OnChanged(function(value)
  espLibrary.options.teamColor = value;
  end)
  Esp1:AddToggle("", {Text = "team check"}):OnChanged(function(value)
  espLibrary.options.teamCheck = value;
  end)
  Esp1:AddToggle("", {Text = "visible check"}):OnChanged(function(value)
  espLibrary.options.teamCheck = value;
  end)
  Esp1:AddSlider('', {Text = 'font size:',Suffix = "px",Default = 13, Min = 1, Max = 25, Rounding = 0, Compact = false}):OnChanged(function(value)
  espLibrary.options.fontSize = value
  end)
  Esp1:AddDropdown("", {Text = "fonts:", Default = 1, Values = fonts}):OnChanged(function(value)
  espLibrary.options.font = Drawing.Fonts[value]
  end)

  --
  local VisTabbox2 = Tabs.VisualsTab:AddRightTabbox()
  local Chams1 = VisTabbox2:AddTab('local chams')

  --* Local Chams *--

  Chams1:AddToggle("hand_chams", {Text = "local chams"}):AddColorPicker("handColor", { Default = Color3.fromRGB(255, 255, 255) })
  Chams1:AddSlider("hand_chams_transparency", { Text = "transparency:", Default = 100, Min = 0, Max = 100, Rounding = 0, Suffix = "%"})
  Chams1:AddDropdown("hand_mat", {Text = "material:", Default = 1, Values = {"Plastic", "Neon", "ForceField"}})
  Chams1:AddToggle("gun_chams", {Text = "gun chams"}):AddColorPicker("gunColor", { Default = Color3.fromRGB(255, 255, 255) })
  Chams1:AddSlider("gun_chams_transparency", { Text = "transparency:", Default = 0, Min = 0, Max = 100, Rounding = 0, Suffix = "%"})
  Chams1:AddDropdown("gun_mat", {Text = "material:", Default = 1, Values = {"Plastic", "Neon", "ForceField"}})

  local VisTabbox4 = Tabs.VisualsTab:AddRightTabbox("lighting")
  local CustomSkyTab = VisTabbox4:AddTab("lighting")

  --* Lighting *--

  local LightingEnabled = nil

  CustomSkyTab:AddToggle('AWASZnfh', {Text = "enabled",Default = false,Tooltip = "Enables SkyTab",}):OnChanged(function(EnabledLighting)
  LightingEnabled = EnabledLighting
  end)

  CustomSkyTab:AddToggle('z1AWASZnfh', {Text = "remove shadows",Default = false,Tooltip = "Global Shadows On/Off",}):OnChanged(function(GlobalShadowsToggle)
  if LightingEnabled and GlobalShadowsToggle == true then
    sethiddenproperty(game:GetService("Lighting"), "GlobalShadows", false)
  elseif LightingEnabled and GlobalShadowsToggle == false then
    sethiddenproperty(game:GetService("Lighting"), "GlobalShadows", true)
  end
  end)

  CustomSkyTab:AddToggle('51z1AWASZnfh', {Text = "remove fog",Default = false,Tooltip = "Fog On/Off",}):OnChanged(function(RemoveFogToggle)
  if LightingEnabled and RemoveFogToggle == true then
    sethiddenproperty(game:GetService("Lighting"), "FogStart", math.huge)
  elseif LightingEnabled and RemoveFogToggle == false then
    sethiddenproperty(game:GetService("Lighting"), "FogStart", 150)
  end
  end)

  CustomSkyTab:AddToggle('Grass', {Text = 'remove grass',Default = false,Tooltip = "Grass On/Off",}):OnChanged(function(GrassRemove)
  if LightingEnabled and GrassRemove == true then
    sethiddenproperty(game.Workspace.Terrain, "Decoration", false)
  elseif LightingEnabled and GrassRemove == false then
    sethiddenproperty(game.Workspace.Terrain, "Decoration", true)
  end
  end)

  local GCEN = Color3.fromRGB(95, 100, 49)
  local GRCEND = false

  CustomSkyTab:AddToggle('CLRG', {Text = 'grass color', Default = true, Tooltip = "Off/On"}):AddColorPicker('ColorGrass', {Default = GCEN, Title = 'Changer Color Grass'})
  Toggles.CLRG:OnChanged(function(T)
  GRCEND = T
  game:GetService("Workspace").Terrain:SetMaterialColor(Enum.Material.Grass, T and GCEN or Color3.fromRGB(95, 100, 49))
  end)
  Options.ColorGrass:OnChanged(function(Grass1)
  if GRCEND then
    GCEN = Grass1
    game:GetService("Workspace").Terrain:SetMaterialColor(Enum.Material.Grass, Grass1)
  end
  end)

  local Lighting = game:GetService("Lighting")
  local ColorCorrection = Lighting:FindFirstChild("ColorCorrection")
  if not ColorCorrection then
    ColorCorrection = Instance.new("ColorCorrectionEffect")
    ColorCorrection.Name = "ColorCorrection"
    ColorCorrection.Parent = Lighting
  end

  CustomSkyTab:AddToggle('CLRG1', {Text = 'ambient', Default = EnableCustomColor, Tooltip = "Off/On"}):AddColorPicker('ColorAmbient1', {Default = Color3.fromRGB(255, 255, 255), Title = 'Change Ambient Color'})
  Options.ColorAmbient1:OnChanged(function(NewColor2)
  sethiddenproperty(ColorCorrection, "TintColor", NewColor2)
  end)

  CustomSkyTab:AddSlider('Exposure_sUS', {Text = 'exposure', Suffix = "%", Default = 0, Min = -5, Max = 5, Rounding = 1, Compact = true}):OnChanged(function(ExposureValue)
  if LightingEnabled and sethiddenproperty(game:GetService("Lighting"), "ExposureCompensation", ExposureValue) then
  end
  end)

  CustomSkyTab:AddSlider('Saturation_sUS', {Text = 'saturation',Suffix = "%",Default = 0,Min = -5,Max = 5,Rounding = 1,Compact = true}):OnChanged(function(SaturationValue)
  if sethiddenproperty(ColorCorrection, "Saturation", SaturationValue) then
  end
  end)

  CustomSkyTab:AddDropdown('World_Technology', {Values = { 'Technology', 'ShadowMap', 'Voxel', 'Compatibility' },Default = 1,Multi = false,Text = 'technology:',Tooltip = 'Game Technology',}):OnChanged(function(GPHZ)
  if LightingEnabled and GPHZ == "Technology" then
    sethiddenproperty(game.Lighting, "Technology", Enum.Technology.Future)
  elseif LightingEnabled and GPHZ == "ShadowMap" then
    sethiddenproperty(game.Lighting, "Technology", Enum.Technology.ShadowMap)
  elseif LightingEnabled and GPHZ == "Voxel" then
    sethiddenproperty(game.Lighting, "Technology", Enum.Technology.Voxel)
  elseif LightingEnabled and GPHZ == "Compatibility" then
    sethiddenproperty(game.Lighting, "Technology", Enum.Technology.Compatibility)
  end
  end)

  --
  local World1 = VisTabbox4:AddTab("xray")

  --* World *--

  local players = game:GetService("Players");
  local function isCharacterPart(part)
    for _, player in next, players:GetPlayers() do
      if player.Character and part:IsDescendantOf(player.Character) then
        return true;
      end
    end
    return false;
  end

  local xray = {};
  local workspace = game:GetService("Workspace");
  local transparencyEnabled = false

  World1:AddToggle("transparent_walls", {Text = "enabled"}):OnChanged(function(value)
  transparencyEnabled = value
  if value then
    for _, part in next, workspace:GetDescendants() do
      if part:IsA("BasePart") and part.Transparency ~= 1 and not part:IsDescendantOf(camera) and not isCharacterPart(part) then
        if not xray[part] or xray[part] ~= part.Transparency then
          xray[part] = part.Transparency;
        end
        part.Transparency = 0.5;
      end
    end
  else
    for part, transparency in pairs(xray) do
      part.Transparency = transparency;
    end
  end
  end)

  World1:AddSlider("transparency_slider", { Text = "transparency:", Default = 0.5, Min = 0, Max = 1, Rounding = 2}):OnChanged(function(XrayT)
  if transparencyEnabled then
    for part, transparency in pairs(xray) do
      part.Transparency = XrayT;
    end
  end
  end)

  --
  local PlayerTabbox1 = Tabs.MiscellaneousTab:AddLeftTabbox("player modification")
  local Player1 = PlayerTabbox1:AddTab("player modification")

  --* Player Mods *--

  Player1:AddToggle("plr_mod", {Text = "enabled"})
  Player1:AddSlider("player_speed", { Text = "player speed", Default = 10, Min = 10, Max = 100, Rounding = 0})
  Player1:AddSlider("player_height", { Text = "player jump height", Default = 30, Min = 30, Max = 100, Rounding = 0})
  local function TPSpawnBox()
    game:GetService"Players".LocalPlayer.Character:FindFirstChild"HumanoidRootPart".CFrame = game:GetService("Workspace").SpawnLocation.CFrame
  end

  --
  local FieldOfViewTabBox = Tabs.MiscellaneousTab:AddLeftTabbox('Camera')
  local FieldOfViewTab = FieldOfViewTabBox:AddTab('Camera')

  --* Field Of View *--

  local camera = utility.services.workspace.CurrentCamera
  FieldOfViewTab:AddToggle('Camera_FOVToggle', {Text = 'enabled', Default = false})
  FieldOfViewTab:AddSlider('Camera_FOVValue', {Text = 'field of view:',Suffix = "°", Default = 70, Min = 0, Max = 120, Rounding = 0, Compact = false})
  Toggles.Camera_FOVToggle:OnChanged(function()
  if Toggles.Camera_FOVToggle.Value then
    camera.FieldOfView = Options.Camera_FOVValue.Value
  else
    camera.FieldOfView = 70
  end
  end)
  Options.Camera_FOVValue:OnChanged(function()
  if Toggles.Camera_FOVToggle.Value then
    camera.FieldOfView = Options.Camera_FOVValue.Value
  end
  end)

  FieldOfViewTab:AddToggle('Camera_ZoomToggle', {Text = 'enabled', Default = false}):AddKeyPicker('Camera_ZoomHolding', {Default = 'Z', SyncToggleState = false, Mode = 'Toggle', Text = 'Zoom Keybind', NoUI = false,})
  FieldOfViewTab:AddSlider('Camera_ZoomValue', {Text = 'zoom field of view:',Suffix = "°", Default = 30, Min = 0, Max = 120, Rounding = 0, Compact = false})
  camera:GetPropertyChangedSignal("FieldOfView"):Connect(function()
  if Toggles.Camera_FOVToggle.Value then
    camera.FieldOfView = Options.Camera_FOVValue.Value
  end
  if Toggles.Camera_ZoomToggle.Value and Options.Camera_ZoomHolding:GetState() then
    camera.FieldOfView = Options.Camera_ZoomValue.Value
  end
  end)

  local ExploitsTabbox1 = Tabs.MiscellaneousTab:AddRightTabbox("exploits")
  local Exploits1 = ExploitsTabbox1:AddTab("exploits")
  Exploits1:AddToggle("no_barrier", {Text = "noclip"}):AddKeyPicker('',{Default='None', SyncToggleState=true, Mode='Toggle', Text='Noclip', NoUI=false}):OnChanged(function(Callback)
  if Callback then
    NoclipLoop = game:GetService("RunService").Stepped:Connect(function()
    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
      if v:IsA("BasePart") and v.CanCollide == true then
        v.CanCollide = false
      end
    end
    end)
  elseif Callback == false and NoclipLoop then
    NoclipLoop:Disconnect()
  end
  end)
  Exploits1:AddToggle("no_barricades", {Text = "destroy all barricades"})
  Exploits1:AddToggle("no_barrier", {Text = "destroy pre-round barrier"})
  Exploits1:AddButton("tp to spawn box", TPSpawnBox)

  --// Game
  local GameID = Tabs.UISettings:AddLeftGroupbox('Game')
  GameID:AddInput('GameID_Check', {Default = 'Game ID', Numeric = true, Finished = false, Text = 'Game ID:', Placeholder = 'Game ID Here'})
  GameID:AddButton('Join Game', function()
  game:GetService("TeleportService"):Teleport(Options.GameID_Check.Value, plr)
  end)

  --// Menu
  local MenuGroup = Tabs.UISettings:AddRightGroupbox('Menu')

  local playerCountLabel = MenuGroup:AddLabel("Player Count: 0", nil, true)
  local function updatePlayerCount()
    local playerCount = #game:GetService("Players"):GetPlayers()
    playerCountLabel:SetText("Players Online: " .. playerCount)
  end
  game:GetService("Players").PlayerAdded:Connect(updatePlayerCount)
  game:GetService("Players").PlayerRemoving:Connect(updatePlayerCount)
  updatePlayerCount()

  MenuGroup:AddLabel('Made by:<font color="#de6cff"> velocity#9108</font> 👑', true)

  MenuGroup:AddButton('Unload Script', function() Library:Unload()
  for i,v in pairs(Toggles) do
    v:SetValue(false)
    Library:Notify('Unloaded!', 1)
  end
  end)

  MenuGroup:AddButton('Panic Button', function()
  for i,v in pairs(Toggles) do
    v:SetValue(false)
    Library:Notify('Panic Button!', 1)
  end
  end)

  MenuGroup:AddButton('Copy Discord', function()
  if pcall(setclipboard,"https://discord.gg/dWvMFGkT") then
    Library:Notify('Successfully copied discord link to your clipboard!', 5)
  end
  end)

  MenuGroup:AddToggle('WatermarkToggle', { Text = 'Watermark', Default = false, Tooltip = nil })
  Toggles.WatermarkToggle:OnChanged(function()
  while Toggles.WatermarkToggle.Value do
    task.wait(1)
    local fps = string.format('%.0f', game.Stats.Workspace.Heartbeat:GetValue())
    local ping = string.format('%.0f', game.Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
    Library:SetWatermark('velocity.cc - FPS: ' .. fps .. ' | Ping: ' .. ping .. ' | [jailbird]')
    Library:SetWatermarkVisibility(true)
  end
  Library:SetWatermarkVisibility(false)
  end)

  MenuGroup:AddToggle('UISettings_KeybindFrameVisibility', {Text = 'Keybind', Default = true}):OnChanged(function()
  Library.KeybindFrame.Visible = Toggles.UISettings_KeybindFrameVisibility.Value
  end)

  MenuGroup:AddLabel('Menu Keybind'):AddKeyPicker('MenuKeybind', { Default = 'Insert', NoUI = true, Text = 'Menu keybind' })
  Library.ToggleKeybind = Options.MenuKeybind

  --// Manager
  SaveManager:SetLibrary(Library)
  SaveManager:SetFolder('velocity.cc/folder')
  SaveManager:BuildConfigSection(Tabs.UISettings)
  SaveManager:IgnoreThemeSettings()
  ThemeManager:SetLibrary(Library)
  ThemeManager:SetFolder('velocity.cc/themes')
  ThemeManager:ApplyToTab(Tabs.UISettings)

  function gunGetter()
    game:GetService("RunService").RenderStepped:Connect(function ()
    for i, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
      if v:IsA("Tool") then
        currentGun = v.Name
      end
    end
    end)
  end
  coroutine.wrap(gunGetter)()

  function gunChams()
    game:GetService("RunService").RenderStepped:Connect(function()
    if Toggles.gun_chams.Value == true then
      local gunModel = game:GetService("Workspace").Camera:FindFirstChild(currentGun)
      if gunModel and gunModel:IsA("Model") then
        for i, v in ipairs(gunModel:GetDescendants()) do
          if v:IsA("MeshPart") or v:IsA("UnionOperation") or v:IsA("Part") then
            v.BrickColor = BrickColor.new(Options.gunColor.Value)
            v.Material = Options.gun_mat.Value
          end
        end
      end
    end
    end)
  end
  coroutine.wrap(gunChams)()

  function localChams()
    game:GetService("RunService").RenderStepped:Connect(function()
    if Toggles.hand_chams.Value == true then
      local gunModel = game:GetService("Workspace").Camera:FindFirstChild(currentGun)
      if gunModel and gunModel:IsA("Model") then
        for i, v in ipairs(gunModel:GetChildren()) do
          if v:IsA("Part") and (v.Name == "Left Arm" or v.Name == "Right Arm") then
            v.BrickColor = BrickColor.new(Options.handColor.Value)
            v.Material = Options.hand_mat.Value
            v.Transparency = Options.hand_chams_transparency.Value / 100
          end
        end
      end
    end
    end)
  end
  coroutine.wrap(localChams)()

  local aiming = false
  local selectKey = Options.aim_key.Value
  local fovcircle = Drawing.new("Circle")
  local peekPressed = false
  local origPos = CFrame.new(0,0,0)
  local changedPos = CFrame.new(0,0,0)
  local deathLoopPos = CFrame.new(0,0,0)

  fovcircle.Visible = Toggles.fov_Circle.Value
  fovcircle.Radius = Options.circle_radius.Value
  fovcircle.Color = Options.fovColor.Value
  fovcircle.Thickness = 1
  fovcircle.Filled = false
  fovcircle.Transparency = 1
  fovcircle.Position = Vector2.new(CurrentCamera.ViewportSize.X / 2, CurrentCamera.ViewportSize.Y / 2)

  local UserInputService = game:GetService("UserInputService")
  UIS.InputBegan:Connect(function(i)
  if i.UserInputType == Enum.UserInputType.MouseButton2 then
    aiming = true
  end
  end)

  UIS.InputEnded:Connect(function(i)
  if i.UserInputType == Enum.UserInputType.MouseButton2 then
    aiming = false
  end
  end)

  dwRunService.RenderStepped:Connect(function()
  local dist = math.huge
  local closest_char = nil
  fovcircle.Radius = Options.circle_radius.Value
  fovcircle.Color = Options.fovColor.Value
  fovcircle.Visible = Toggles.fov_Circle.Value
  if aiming and Toggles.aim_enabled.Value == true then
    for i,v in next, dwEntities:GetChildren() do
      if v ~= dwLocalPlayer and
      v.Character and
      v.Character:FindFirstChild("HumanoidRootPart") and
      v.Character:FindFirstChild("Humanoid") and
      v.Character:FindFirstChild("Humanoid").Health > 0 then
        local RootPart = v.Character.HumanoidRootPart
        local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)
        if v.Team ~= dwLocalPlayer.Team then
          local texts = math.ceil((RootPart.Position - game:GetService("Workspace").Camera.CFrame.Position).magnitude)
          local char = v.Character
          local char_part_pos, is_onscreen = dwCamera:WorldToViewportPoint(char[Options.aim_part.Value].Position)
          if is_onscreen then
            local mag = (Vector2.new(dwMouse.X, dwMouse.Y) - Vector2.new(char_part_pos.X, char_part_pos.Y)).Magnitude
            if mag < dist and mag < Options.circle_radius.Value and texts <= Options.aimbot_distance.Value then
              dist = mag
              closest_char = char
            end
          end
        end
      end
    end

    if closest_char ~= nil and
    closest_char:FindFirstChild("HumanoidRootPart") and
    closest_char:FindFirstChild("Humanoid") and
    closest_char:FindFirstChild("Humanoid").Health > 0 and TweenStatus == nil then
      dwCamera.CFrame = CFrame.new(dwCamera.CFrame.Position, closest_char[Options.aim_part.Value].Position)
      --mousemoverel(((closest_char[Options.aim_part.Value].Position.X - MouseLocation.X)  / 0.5), ((closest_char[Options.aim_part.Value].Position.Y - MouseLocation.Y) / 0.5))
    end
  end
  end)

  -- Exploits
  function mapGetter()
    repeat
      for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
        if v:IsA("Folder") and v.Name == "Map" then
          for i,v in pairs(game:GetService("Workspace").Map:GetChildren()) do
            if v:IsA("Model") then
              CurrentMap = v.Name
              InGame = true
              print(v.Name)
            end
          end
        else
        end
      end
    until InGame == true
  end
  coroutine.wrap(mapGetter)()

  local function DeleteMap()
    if InGame == true then
      for i,v in pairs(game:GetService("Workspace").Map[CurrentMap]:GetDescendants()) do
        if v.Name ==  "Part" or v:IsA("MeshPart" )and v.Name ~= "Object_Doors" and v.Name ~= "Barricade" then
          v:Destroy()
        end
      end
    end
  end

  local function TPMoneyStand()
    if InGame == true then
      game:GetService"Players".LocalPlayer.Character:FindFirstChild"HumanoidRootPart".CFrame = game:GetService("Workspace").Map[CurrentMap].Objective.CFrame * CFrame.new(0,5,0)
    end
  end

  Exploits1:AddButton("tp to money obj", TPMoneyStand)
  Exploits1:AddButton("delete map", DeleteMap)

  function gunGetter()
    game:GetService("RunService").RenderStepped:Connect(function ()
    if InGame == true then
      for i,v in pairs(game:GetService"Players".LocalPlayer.Character:GetDescendants()) do
        if v:IsA("Tool") then
          currentGun = v.Name
        end
      end
    end
    end)
  end
  coroutine.wrap(gunGetter)()

  local playerMods = function ()
  game:GetService("RunService").RenderStepped:Connect(function()
  if Toggles.plr_mod.Value == true then
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Options.player_speed.Value
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = Options.player_height.Value
  else
  end
  end)
end
coroutine.wrap(playerMods)()
espLibrary:Load();
