return (function(...)
	task.spawn(function()
		OldTick = tick();
		CrumbleWare = "3.4";
		if not game:IsLoaded() then
			game.Loaded:Wait();
		end
		if (not syn or not protectgui) then
			(getgenv()).protectgui = function()
			end;
		end
		print("Check 0");
		Library = (loadstring(game:HttpGet("https://raw.githubusercontent.com/starlolq/backups/main/LinoriaUI")))();
		ThemeManager = (loadstring(game:HttpGet("https://raw.githubusercontent.com/starlolq/backups/main/LinoriaTHEME")))();
		SaveManager = (loadstring(game:HttpGet("https://raw.githubusercontent.com/starlolq/backups/main/LinoriaSAVE")))();
		esp = (loadstring(game:HttpGet("https://raw.githubusercontent.com/starlolq/backups/main/JonathanESP")))();
		print("Check 1");
		local workspace = game.workspace;
		local Camera = workspace.CurrentCamera;
		local Players = game.Players;
		local LocalPlayer = Players.LocalPlayer;
		local Character = LocalPlayer.Character;
		local WorldToPoint = Camera.WorldToScreenPoint;
		local q = {};
		local a = workspace.CurrentCamera.ViewportSize / 2;
		local GetMouse = LocalPlayer:GetMouse();
		local X = 0;
		local f = {
			Neverlose = "rbxassetid://8726881116",
			Gamesense = "rbxassetid://4817809188",
			Rust = "rbxassetid://1255040462",
			["Among Us"] = "rbxassetid://5700183626",
			["CS:GO"] = "rbxassetid://6937353691",
			["Call of Duty"] = "rbxassetid://5952120301",
			Click = "rbxassetid://8053704437",
			Steve = "rbxassetid://4965083997"
		};
		FPS = 0;
		SilentTarget = false;
		HeadSound = Instance.new("Sound");
		HeadSound.Volume = 10;
		HeadSound.Parent = game.ReplicatedStorage;
		BodySound = Instance.new("Sound");
		BodySound.Volume = 10;
		BodySound.Parent = game.ReplicatedStorage;
		local s = Drawing.new("Circle");
		s.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2);
		s.Radius = 0;
		s.Filled = false;
		s.Color = Color3.fromRGB(255, 255, 255);
		s.Visible = false;
		s.Transparency = 0;
		s.NumSides = 0;
		s.Thickness = 0;
		local v = Drawing.new("Circle");
		v.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2);
		v.Radius = 0;
		v.Filled = false;
		v.Color = Color3.fromRGB(255, 255, 255);
		v.Visible = false;
		v.Transparency = 0;
		v.NumSides = 0;
		v.Thickness = 0;
		local R = Drawing.new("Circle");
		R.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2);
		R.Radius = 10;
		R.Filled = false;
		R.Color = Color3.fromRGB(255, 255, 255);
		R.Visible = true;
		R.Transparency = 0;
		R.NumSides = 0;
		R.Thickness = 0;
		local p = Drawing.new("Line");
		p.Visible = true;
		p.Thickness = 1;
		p.Transparency = 1;
		p.From = Vector2.new(game.workspace.CurrentCamera.ViewportSize.X / 2, game.workspace.CurrentCamera.ViewportSize.Y / 2);
		p.To = Vector2.new(game.workspace.CurrentCamera.ViewportSize.X / 2, game.workspace.CurrentCamera.ViewportSize.Y / 2);
		p.Color = Color3.fromRGB(255, 255, 255);
		local W = Drawing.new("Line");
		W.Visible = true;
		W.Thickness = 1;
		W.Transparency = 1;
		W.From = Vector2.new(game.workspace.CurrentCamera.ViewportSize.X / 2, game.workspace.CurrentCamera.ViewportSize.Y / 2);
		W.To = Vector2.new(game.workspace.CurrentCamera.ViewportSize.X / 2, game.workspace.CurrentCamera.ViewportSize.Y / 2);
		W.Color = Color3.fromRGB(255, 255, 255);
		local z = Drawing.new("Line");
		z.Visible = false;
		z.Thickness = 1;
		z.Transparency = 1;
		z.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2);
		z.To = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2);
		z.Color = Color3.fromRGB(255, 255, 255);
		local M = Drawing.new("Line");
		M.Visible = false;
		M.Thickness = 1;
		M.Transparency = 1;
		M.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2);
		M.To = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2);
		M.Color = Color3.fromRGB(255, 255, 255);
		print("Check 2");
		function GetTargetS()
			local workspace;
			local Camera;
			for Players, Character in pairs(Players:GetChildren()) do
				if (Character ~= game.Players.LocalPlayer) then
					if (Character == LocalPlayer) then
						continue;
					end
					local Players = Character.Character;
					if not Players then
						continue;
					end
					local WorldToPoint = Players:FindFirstChild("HumanoidRootPart");
					local q = Players:FindFirstChild("Humanoid");
					if (not WorldToPoint or not q or (q and (q.Health <= 0))) then
						continue;
					end
					local a, GetMouse = ScreenPos(Players.HumanoidRootPart.Position);
					if not GetMouse then
						continue;
					end
					local X = (Vector2.new(game.workspace.CurrentCamera.ViewportSize.X / 2, game.workspace.CurrentCamera.ViewportSize.Y / 2) - a).Magnitude;
					if (X <= (Camera or Options.FovRadius.Value or 2000)) then
						if (Options.TargetPart.Value == "Random") then
							local Camera = math.random(1, 2);
							if (Camera == 1) then
								workspace = Players.Head or false;
							else
								workspace = Players.HumanoidRootPart or false;
							end
						else
							workspace = Players[Options.TargetPart.Value] or false;
						end
						Camera = X;
					end
				end
			end
			if Toggles.TargetBots.Value then
				for Players, LocalPlayer in pairs((game:GetService("Workspace")).AiZones:GetChildren()) do
					for Players, LocalPlayer in pairs(LocalPlayer:GetChildren()) do
						if ((LocalPlayer and (LocalPlayer.Name ~= "ElectricityAnomaly")) or (LocalPlayer.Name ~= "PMN2")) then
							local Players = LocalPlayer;
							if not Players then
								continue;
							end
							local Character = Players:FindFirstChild("HumanoidRootPart");
							local WorldToPoint = Players:FindFirstChild("Humanoid");
							if (not Character or not WorldToPoint or (WorldToPoint and (WorldToPoint.Health <= 0))) then
								continue;
							end
							local q, a = ScreenPos(Players.HumanoidRootPart.Position);
							if not a then
								continue;
							end
							local GetMouse = (Vector2.new(game.workspace.CurrentCamera.ViewportSize.X / 2, game.workspace.CurrentCamera.ViewportSize.Y / 2) - q).Magnitude;
							if (GetMouse <= (Camera or Options.FovRadius.Value or 2000)) then
								if (Options.TargetPart.Value == "Random") then
									local Camera = math.random(1, 2);
									if (Camera == 1) then
										workspace = Players.Head or false;
									else
										workspace = Players.HumanoidRootPart or false;
									end
								else
									workspace = Players[Options.TargetPart.Value] or false;
								end
								Camera = GetMouse;
							end
						end
					end
				end
			end
			return workspace or false;
		end
		function newdrawing(workspace, Camera)
			local Players = Drawing.new(workspace);
			for workspace, Camera in next, Camera or {} do
				Players[workspace] = Camera;
			end
			return Players;
		end
		function GetTargetA()
			local workspace;
			local Camera;
			for Players, Character in pairs(Players:GetChildren()) do
				if (Character ~= game.Players.LocalPlayer) then
					if (Character == LocalPlayer) then
						continue;
					end
					local Players = Character.Character;
					if not Players then
						continue;
					end
					local WorldToPoint = Players:FindFirstChild("HumanoidRootPart");
					local q = Players:FindFirstChild("Humanoid");
					if (not WorldToPoint or not q or (q and (q.Health <= 0))) then
						continue;
					end
					local a, GetMouse = ScreenPos(WorldToPoint.Position);
					if not GetMouse then
						continue;
					end
					local X = (Vector2.new(game.workspace.CurrentCamera.ViewportSize.X / 2, game.workspace.CurrentCamera.ViewportSize.Y / 2) - a).Magnitude;
					if (X <= (Camera or Options.FovRadius2.Value or 2000)) then
						if (Options.TargetPart.Value == "Random") then
							local Camera = math.random(1, 2);
							if (Camera == 1) then
								workspace = Players.Head or false;
							else
								workspace = Players.HumanoidRootPart or false;
							end
						else
							workspace = Players[Options.TargetPart.Value] or false;
						end
						Camera = X;
					end
				end
			end
			if Toggles.TargetBots.Value then
				for Players, LocalPlayer in pairs((game:GetService("Workspace")).AiZones:GetChildren()) do
					for Players, LocalPlayer in pairs(LocalPlayer:GetChildren()) do
						if ((LocalPlayer and (LocalPlayer.Name ~= "ElectricityAnomaly")) or (LocalPlayer.Name ~= "PMN2")) then
							local Players = LocalPlayer;
							if not Players then
								continue;
							end
							local Character = Players:FindFirstChild("HumanoidRootPart");
							local WorldToPoint = Players:FindFirstChild("Humanoid");
							if (not Character or not WorldToPoint or (WorldToPoint and (WorldToPoint.Health <= 0))) then
								continue;
							end
							local q, a = ScreenPos(Character.Position);
							if not a then
								continue;
							end
							local GetMouse = (Vector2.new(game.workspace.CurrentCamera.ViewportSize.X / 2, game.workspace.CurrentCamera.ViewportSize.Y / 2) - q).Magnitude;
							if (GetMouse <= (Camera or Options.FovRadius2.Value or 2000)) then
								if (Options.TargetPart.Value == "Random") then
									local Camera = math.random(1, 2);
									if (Camera == 1) then
										workspace = Players.Head or false;
									else
										workspace = Players.HumanoidRootPart or false;
									end
								else
									workspace = Players[Options.TargetPart.Value] or false;
								end
								Camera = GetMouse;
							end
						end
					end
				end
			end
			return workspace or false;
		end
		function ScreenPos(workspace)
			local Players, LocalPlayer = WorldToPoint(Camera, workspace);
			return Vector2.new(Players.X, Players.Y), LocalPlayer;
		end
		function PredictVelocity(workspace, Players)
			local LocalPlayer = workspace.Velocity;
			local Character = (Camera.CFrame.p - workspace.CFrame.p).Magnitude;
			local WorldToPoint = Character / Players;
			local q = workspace.CFrame.p + (LocalPlayer * WorldToPoint);
			local a = (q - workspace.CFrame.p).Magnitude;
			local GetMouse = Players - (0.013 * (Players ^ 2) * (WorldToPoint ^ 2));
			WorldToPoint += (a / GetMouse)
			return workspace.CFrame.p + (LocalPlayer * WorldToPoint);
		end
		function PredictDrop(workspace, Players, LocalPlayer)
			local Character = (Camera.CFrame.p - workspace.CFrame.p).Magnitude;
			local WorldToPoint = Character / Players;
			local q = Players - (0.013 * (Players ^ 2) * (WorldToPoint ^ 2));
			WorldToPoint += (Character / q)
			local a = LocalPlayer * (WorldToPoint ^ 2);
			if not (tostring(a)):find("nan") then
				return a;
			end
			return 0;
		end
		function getbulletatribute(workspace)
			local Camera = nil;
			local Players = game.ReplicatedStorage.Players[game.Players.LocalPlayer.Name]:FindFirstChild("Status");
			if Players then
				local LocalPlayer = Players.GameplayVariables.EquippedTool.Value;
				if LocalPlayer then
					local Players = game.ReplicatedStorage.Players[game.Players.LocalPlayer.Name].Inventory:FindFirstChild(tostring(LocalPlayer));
					if Players then
						local LocalPlayer = (Players.Attachments:FindFirstChild("Magazine") and (Players.Attachments:FindFirstChild("Magazine")):FindFirstChildOfClass("StringValue") and (((Players.Attachments:FindFirstChild("Magazine")):FindFirstChildOfClass("StringValue")):FindFirstChild("ItemProperties")).LoadedAmmo) or Players.ItemProperties:FindFirstChild("LoadedAmmo");
						if LocalPlayer then
							local Players = LocalPlayer:FindFirstChild("1");
							if Players then
								Camera = game.ReplicatedStorage.AmmoTypes[Players:GetAttribute("AmmoType")]:GetAttribute(workspace);
							end
						end
					end
				end
			end
			return Camera;
		end
		function hitmarker_update()
			for workspace = 1, #q, 1 do
				q[workspace].Position = Vector2.new(a.X, a.Y + 150 + (workspace * 18));
			end
		end
		function hitmarker(workspace, Camera, Players)
			if Toggles.HitLogs.Value then
				task.spawn(function()
					local LocalPlayer = Drawing.new("Text");
					local Character = Camera.Parent.Name;
					LocalPlayer.Size = 13;
					LocalPlayer.Font = 2;
					LocalPlayer.Text = "[Crumbleware] damage inflicted to " .. Character .. " on " .. workspace;
					LocalPlayer.Visible = true;
					LocalPlayer.ZIndex = 3;
					LocalPlayer.Center = true;
					LocalPlayer.Color = Color3.fromRGB(138, 43, 226);
					LocalPlayer.Outline = true;
					table.insert(q, LocalPlayer);
					hitmarker_update();
					wait(Players);
					table.remove(q, table.find(q, LocalPlayer));
					hitmarker_update();
					LocalPlayer:Remove();
				end);
			end
		end
		print("Check 3");
		local g = Library:CreateWindow({
			Title = ("Crumbleware | v" .. CrumbleWare .. " | Beta"),
			Center = true,
			AutoShow = false
		});
		local T = {
			Combat = g:AddTab("Combat"),
			Visuals = g:AddTab("Visuals"),
			Movement = g:AddTab("Misc"),
			["UI Settings"] = g:AddTab("UI Settings")
		};
		local r = T.Combat:AddLeftTabbox();
		local c = r:AddTab("Main");
		local t = T.Combat:AddRightTabbox();
		local S = t:AddTab("SFov");
		local e = t:AddTab("AFov");
		c:AddToggle("CEnabled", {
			Text = "Enabled",
			Default = false,
			Tooltip = "Enables Combat Features"
		});
		c:AddToggle("SEnabled", {
			Text = "Silent Aim",
			Default = false,
			Tooltip = "Enables Silent Aim Features"
		});
		c:AddToggle("AEnabled", {
			Text = "Aimbot",
			Default = false,
			Tooltip = "Enables Aimbot Features"
		});
		c:AddToggle("TargetBots", {
			Text = "Target Bots",
			Default = false,
			Tooltip = "Aimbot and Silent Aim Will Target Bots"
		});
		c:AddDropdown("TargetPart", {
			Values = {
				"Head",
				"HumanoidRootPart",
				"Random"
			},
			Default = 1,
			Multi = false,
			Text = "Target",
			Tooltip = "Changes the Target"
		});
		c:AddSlider("HitchanceS", {
			Text = "Hit Chance",
			Default = 100,
			Min = 0,
			Max = 100,
			Rounding = 0,
			Compact = true
		});
		c:AddToggle("OldPredic", {
			Text = "Prediction",
			Default = false,
			Tooltip = "Enables Prediction"
		});
		(c:AddToggle("SnapEnabled", {
			Text = "Silent Snaplines",
			Default = false,
			Tooltip = "Enables Snaplines"
		})):AddColorPicker("SnaplineColor", {
			Default = Color3.fromRGB(255, 0, 0),
			Title = "Snapline Color"
		});
		Options.SnaplineColor:OnChanged(function()
			p.Color = Options.SnaplineColor.Value;
		end);
		(c:AddToggle("SnapEnabled2", {
			Text = "Aimbot Snaplines",
			Default = false,
			Tooltip = "Enables Snaplines"
		})):AddColorPicker("SnaplineColor", {
			Default = Color3.fromRGB(255, 0, 0),
			Title = "Snapline Color"
		});
		Options.SnaplineColor:OnChanged(function()
			W.Color = Options.SnaplineColor.Value;
		end);
		(S:AddToggle("FovEnabled", {
			Text = "Silent Fov Enabled",
			Default = false,
			Tooltip = "Toggles The Circle"
		})):AddColorPicker("FovColor", {
			Default = Color3.fromRGB(255, 255, 255),
			Title = "Circle Color"
		});
		Options.FovColor:OnChanged(function()
			s.Color = Options.FovColor.Value;
		end);
		Toggles.FovEnabled:OnChanged(function()
			s.Visible = Toggles.FovEnabled.Value;
		end);
		(S:AddSlider("FovRadius", {
			Text = "Radius",
			Default = 80,
			Min = 0,
			Max = 1200,
			Rounding = 0,
			Compact = true
		})):OnChanged(function()
			s.Radius = Options.FovRadius.Value;
		end);
		(S:AddToggle("FovFilled", {
			Text = "Filled",
			Default = false,
			Tooltip = "Fills The Circle"
		})):OnChanged(function()
			s.Filled = Toggles.FovFilled.Value;
		end);
		(S:AddSlider("FovTransparency", {
			Text = "Transparency",
			Default = 100,
			Min = 0,
			Max = 100,
			Rounding = 2,
			Compact = true
		})):OnChanged(function()
			s.Transparency = Options.FovTransparency.Value / 100;
		end);
		(S:AddSlider("FovSides", {
			Text = "Sides",
			Default = 14,
			Min = 3,
			Max = 64,
			Rounding = 0,
			Compact = true
		})):OnChanged(function()
			s.NumSides = Options.FovSides.Value;
		end);
		(S:AddSlider("FovThickness", {
			Text = "Thickness",
			Default = 0,
			Min = 0,
			Max = 10,
			Rounding = 0,
			Compact = true
		})):OnChanged(function()
			s.Thickness = Options.FovThickness.Value;
		end);
		(e:AddToggle("FovEnabled2", {
			Text = "Aimbot Fov Enabled",
			Default = false,
			Tooltip = "Toggles The Circle"
		})):AddColorPicker("FovColor2", {
			Default = Color3.fromRGB(255, 255, 255),
			Title = "Circle Color"
		});
		Options.FovColor2:OnChanged(function()
			v.Color = Options.FovColor2.Value;
		end);
		Toggles.FovEnabled2:OnChanged(function()
			v.Visible = Toggles.FovEnabled2.Value;
		end);
		(e:AddSlider("FovRadius2", {
			Text = "Radius",
			Default = 80,
			Min = 0,
			Max = 1200,
			Rounding = 0,
			Compact = true
		})):OnChanged(function()
			v.Radius = Options.FovRadius2.Value;
		end);
		(e:AddToggle("FovFilled2", {
			Text = "Filled",
			Default = false,
			Tooltip = "Fills The Circle"
		})):OnChanged(function()
			v.Filled = Toggles.FovFilled2.Value;
		end);
		(e:AddSlider("FovTransparency2", {
			Text = "Transparency",
			Default = 100,
			Min = 0,
			Max = 100,
			Rounding = 2,
			Compact = true
		})):OnChanged(function()
			v.Transparency = Options.FovTransparency2.Value / 100;
		end);
		(e:AddSlider("FovSides2", {
			Text = "Sides",
			Default = 14,
			Min = 3,
			Max = 64,
			Rounding = 0,
			Compact = true
		})):OnChanged(function()
			v.NumSides = Options.FovSides2.Value;
		end);
		(e:AddSlider("FovThickness2", {
			Text = "Thickness",
			Default = 0,
			Min = 0,
			Max = 10,
			Rounding = 0,
			Compact = true
		})):OnChanged(function()
			v.Thickness = Options.FovThickness2.Value;
		end);
		local O = T.Combat:AddRightTabbox();
		local j = O:AddTab("Gun Mods");
		local w = O:AddTab("HitSounds");
		j:AddToggle("GEnabled", {
			Text = "Enabled",
			Default = false,
			Tooltip = "Enables Gun Mods"
		});
		j:AddToggle("NoSpread", {
			Text = "No Spread",
			Default = false,
			Tooltip = "Enables No Spread"
		});
		j:AddToggle("nodrop", {
			Text = "No Drop",
			Default = false,
			Tooltip = "Enables No Drop"
		});
		j:AddToggle("Flash", {
			Text = "No Muzzle Flash",
			Default = false,
			Tooltip = "Disables Muzzle Flash"
		});
		j:AddToggle("NoTracer", {
			Text = "No Tracer",
			Default = false,
			Tooltip = "Disables Tracer"
		});
		j:AddToggle("Instant", {
			Text = "Insta-Hit",
			Default = false,
			Tooltip = "Disables Tracer"
		});
		(j:AddToggle("GunMods_NoRecoil", {
			Text = "No Recoil",
			Default = false
		})):OnChanged(function()
			local workspace = nil;
			for Camera, Players in next, getgc(true) do
				if ((typeof(Players) == "table") and rawget(Players, "RecoilCamera")) then
					workspace = Players;
					break;
				end
			end
			local Camera = workspace.RecoilCamera;
			workspace.RecoilCamera = function(...)
				if (Toggles.GunMods_NoRecoil.Value and Toggles.GEnabled.Value) then
					return 0;
				else
					return Camera(...);
				end
			end;
		end);
		w:AddToggle("HitSoundEnabled", {
			Text = "Hit Sounds",
			Default = false,
			Tooltip = "Enables Hit Sounds"
		});
		(w:AddDropdown("HeadEnabled", {
			Values = {
				"Neverlose",
				"Gamesense",
				"Rust",
				"Among Us",
				"CS:GO",
				"Call of Duty",
				"Click",
				"Steve"
			},
			Default = 1,
			Multi = false,
			Text = "Headshot Sound"
		})):OnChanged(function()
			HeadSound.SoundId = f[Options.HeadEnabled.Value];
		end);
		(w:AddSlider("HeadVolume", {
			Text = "Volume",
			Default = 1,
			Min = 0,
			Max = 10,
			Rounding = 2,
			Compact = true
		})):OnChanged(function()
			HeadSound.Volume = Options.HeadVolume.Value;
		end);
		(w:AddDropdown("BodyEnabled", {
			Values = {
				"Neverlose",
				"Gamesense",
				"Rust",
				"Among Us",
				"CS:GO",
				"Call of Duty",
				"Click",
				"Steve"
			},
			Default = 1,
			Multi = false,
			Text = "Bodyshot Sound"
		})):OnChanged(function()
			HeadSound.SoundId = f[Options.BodyEnabled.Value];
		end);
		(w:AddSlider("BodyVolume", {
			Text = "Volume",
			Default = 1,
			Min = 0,
			Max = 10,
			Rounding = 2,
			Compact = true
		})):OnChanged(function()
			HeadSound.Volume = Options.BodyVolume.Value;
		end);
		(w:AddToggle("DisableArmorSounds", {
			Text = "Armor Sounds",
			Default = true,
			Tooltip = "Disables Hit Sounds"
		})):OnChanged(function(workspace)
			if not workspace then
				(game:GetService("ReplicatedStorage")).SFX.Hits.HitMarkers.Helmet.Volume = 0;
				(game:GetService("ReplicatedStorage")).SFX.Hits.HitMarkers.BodyArmor.Volume = 0;
				(game:GetService("ReplicatedStorage")).SFX.Hits.HitMarkers.Bodyshot.Volume = 0;
				(game:GetService("ReplicatedStorage")).SFX.Hits.HitMarkers.Headshot.Volume = 0;
				(game:GetService("ReplicatedStorage")).SFX.Hits.ProjectileHits.Default.Hit.Volume = 0;
				(game:GetService("ReplicatedStorage")).SFX.Hits.ProjectileHits.Blood.Hit.Volume = 0;
			else
				(game:GetService("ReplicatedStorage")).SFX.Hits.HitMarkers.Helmet.Volume = 7;
				(game:GetService("ReplicatedStorage")).SFX.Hits.HitMarkers.BodyArmor.Volume = 7;
				(game:GetService("ReplicatedStorage")).SFX.Hits.HitMarkers.Bodyshot.Volume = 7;
				(game:GetService("ReplicatedStorage")).SFX.Hits.HitMarkers.Headshot.Volume = 7;
				(game:GetService("ReplicatedStorage")).SFX.Hits.ProjectileHits.Default.Hit.Volume = 1;
				(game:GetService("ReplicatedStorage")).SFX.Hits.ProjectileHits.Blood.Hit.Volume = 1;
			end
		end);
		local V = T.Visuals:AddLeftTabbox();
		local H = V:AddTab("Main Esp");
		local D = V:AddTab("Other Esp");
		(H:AddToggle("EEnabled", {
			Text = "Enabled",
			Default = false,
			Tooltip = "Enables ESP"
		})):OnChanged(function()
			esp.enabled = Toggles.EEnabled.Value;
		end);
		(H:AddToggle("NameEnabled", {
			Text = "Names",
			Default = false,
			Tooltip = "Enables Name ESP"
		})):OnChanged(function()
			esp.settings.name.enabled = Toggles.NameEnabled.Value;
		end);
		Toggles.NameEnabled:AddColorPicker("NameColor", {
			Default = Color3.fromRGB(255, 255, 255),
			Title = "Name Color"
		});
		Options.NameColor:OnChanged(function()
			esp.settings.name.color = Options.NameColor.Value;
		end);
		(H:AddToggle("DistanceEnabled", {
			Text = "Distance",
			Default = false,
			Tooltip = "Enables Distance ESP"
		})):OnChanged(function()
			esp.settings.distance.enabled = Toggles.DistanceEnabled.Value;
		end);
		Toggles.DistanceEnabled:AddColorPicker("DistanceColor", {
			Default = Color3.fromRGB(255, 255, 255),
			Title = "Distance Color"
		});
		Options.DistanceColor:OnChanged(function()
			esp.settings.distance.color = Options.DistanceColor.Value;
		end);
		(H:AddToggle("HealthBEnabled", {
			Text = "HealthBar",
			Default = false,
			Tooltip = "Enables HealthBar ESP"
		})):OnChanged(function()
			esp.settings.healthbar.enabled = Toggles.HealthBEnabled.Value;
		end);
		(H:AddToggle("HealthTEnabled", {
			Text = "HealthText",
			Default = false,
			Tooltip = "Enables HealthText ESP"
		})):OnChanged(function()
			esp.settings.healthtext.enabled = Toggles.HealthTEnabled.Value;
		end);
		Toggles.HealthTEnabled:AddColorPicker("HealthTextColor", {
			Default = Color3.fromRGB(255, 255, 255),
			Title = "Health Text Color"
		});
		Options.HealthTextColor:OnChanged(function()
			esp.settings.healthtext.color = Options.HealthTextColor.Value;
		end);
		(H:AddToggle("ChamsEnabled", {
			Text = "Chams",
			Default = false,
			Tooltip = "Enables Chams ESP"
		})):OnChanged(function()
			esp.settings_chams.enabled = Toggles.ChamsEnabled.Value;
		end);
		Toggles.ChamsEnabled:AddColorPicker("ChamsVisibleColor", {
			Default = Color3.fromRGB(0, 255, 0),
			Title = "Chams Visible Color"
		});
		Options.ChamsVisibleColor:OnChanged(function()
			esp.settings_chams.visible_Color = Options.ChamsVisibleColor.Value;
		end);
		Toggles.ChamsEnabled:AddColorPicker("ChamsNotVisibleColor", {
			Default = Color3.fromRGB(255, 0, 0),
			Title = "Chams Hidden Color"
		});
		Options.ChamsNotVisibleColor:OnChanged(function()
			esp.settings_chams.invisible_Color = Options.ChamsNotVisibleColor.Value;
		end);
		(H:AddToggle("ArrowEnabled", {
			Text = "Arrow",
			Default = false,
			Tooltip = "Enables Arrow ESP"
		})):OnChanged(function()
			esp.settings.arrow.enabled = Toggles.ArrowEnabled.Value;
		end);
		Toggles.ArrowEnabled:AddColorPicker("ArrowColor", {
			Default = Color3.fromRGB(255, 255, 255),
			Title = "Arrow Color"
		});
		Options.ArrowColor:OnChanged(function()
			esp.settings.arrow.color = Options.ArrowColor.Value;
		end);
		(H:AddToggle("AngleEnabled", {
			Text = "Angle",
			Default = false,
			Tooltip = "Enables Angle ESP"
		})):OnChanged(function()
			esp.settings.viewangle.enabled = Toggles.AngleEnabled.Value;
		end);
		Toggles.AngleEnabled:AddColorPicker("AngleColor", {
			Default = Color3.fromRGB(255, 255, 255),
			Title = "Angle Color"
		});
		Options.AngleColor:OnChanged(function()
			esp.settings.viewangle.color = Options.AngleColor.Value;
		end);
		(H:AddToggle("TracerEnabled", {
			Text = "Tracers",
			Default = false,
			Tooltip = "Enables Tracer ESP"
		})):OnChanged(function()
			esp.settings.tracer.enabled = Toggles.TracerEnabled.Value;
		end);
		Toggles.TracerEnabled:AddColorPicker("TracerColor", {
			Default = Color3.fromRGB(255, 255, 255),
			Title = "Tracer Color"
		});
		Options.TracerColor:OnChanged(function()
			esp.settings.tracer.color = Options.TracerColor.Value;
		end);
		(H:AddToggle("SkeletonEnabled", {
			Text = "Skeleton",
			Default = false,
			Tooltip = "Enables Skeleton ESP"
		})):OnChanged(function()
			esp.settings.skeleton.enabled = Toggles.SkeletonEnabled.Value;
		end);
		Toggles.SkeletonEnabled:AddColorPicker("SkeletonColor", {
			Default = Color3.fromRGB(255, 255, 255),
			Title = "Skeleton Color"
		});
		Options.SkeletonColor:OnChanged(function()
			esp.settings.skeleton.color = Options.SkeletonColor.Value;
		end);
		local G = T.Visuals:AddRightTabbox();
		local F = G:AddTab("MainEsp Settings");
		(F:AddToggle("TeamCheckEnabled", {
			Text = "Team Check",
			Default = false,
			Tooltip = "Enables Team Check"
		})):OnChanged(function()
			esp.teamcheck = Toggles.TeamCheckEnabled.Value;
		end);
		(F:AddSlider("MaxDis", {
			Text = "Max Distance",
			Default = 0,
			Min = 0,
			Max = 5000,
			Rounding = 0,
			Compact = false
		})):OnChanged(function()
			esp.maxdist = Options.MaxDis.Value;
		end);
		(F:AddToggle("DisplayName", {
			Text = "Display Name",
			Default = false,
			Tooltip = "Changes What Name Is Shown"
		})):OnChanged(function()
			esp.settings.name.displaynames = Toggles.DisplayName.Value;
		end);
		(F:AddToggle("NameOutline", {
			Text = "Name Outline",
			Default = true,
			Tooltip = "Changes If The Outline Is Visible"
		})):OnChanged(function()
			esp.settings.name.outline = Toggles.DisplayName.Value;
		end);
		(F:AddSlider("TextSize", {
			Text = "Text Size",
			Default = 13,
			Min = 0,
			Max = 20,
			Rounding = 1,
			Compact = false
		})):OnChanged(function()
			esp.fontsize = Options.TextSize.Value;
		end);
		(F:AddToggle("HealthBarOutline", {
			Text = "HealthBar Outline",
			Default = true,
			Tooltip = "Changes If The Outline Is Visible"
		})):OnChanged(function()
			esp.settings.healthbar.outline = Toggles.HealthBarOutline.Value;
		end);
		(F:AddToggle("HealthTextOutline", {
			Text = "HealthText Outline",
			Default = true,
			Tooltip = "Changes If The Outline Is Visible"
		})):OnChanged(function()
			esp.settings.healthtext.outline = Toggles.HealthTextOutline.Value;
		end);
		(F:AddToggle("DistanceOutline", {
			Text = "Distance Outline",
			Default = true,
			Tooltip = "Changes If The Outline Is Visible"
		})):OnChanged(function()
			esp.settings.distance.outline = Toggles.DistanceOutline.Value;
		end);
		(F:AddSlider("ViewAngleSize", {
			Text = "View Angle",
			Default = 6,
			Min = 0,
			Max = 20,
			Rounding = 0,
			Compact = false
		})):OnChanged(function()
			esp.settings.viewangle.size = Options.ViewAngleSize.Value;
		end);
		(F:AddDropdown("TracerOrigin", {
			Values = {
				"Bottom",
				"Top",
				"Middle"
			},
			Default = 3,
			Multi = false,
			Text = "Tracer Origin",
			Tooltip = "Changes the Tracer Origin"
		})):OnChanged(function()
			esp.settings.tracer.origin = Options.TracerOrigin.Value;
		end);
		(F:AddToggle("ArrowFilled", {
			Text = "Arrow Filled",
			Default = true,
			Tooltip = "Changes If The Arrow Is Filled"
		})):OnChanged(function()
			esp.settings.arrow.filled = Toggles.ArrowFilled.Value;
		end);
		(F:AddSlider("ArrowRadius", {
			Text = "Arrow Radius",
			Default = 100,
			Min = 0,
			Max = 800,
			Rounding = 0,
			Compact = false
		})):OnChanged(function()
			esp.settings.arrow.radius = Options.ArrowRadius.Value;
		end);
		(F:AddSlider("ArrowSize", {
			Text = "Arrow Size",
			Default = 25,
			Min = 0,
			Max = 100,
			Rounding = 1,
			Compact = false
		})):OnChanged(function()
			esp.settings.arrow.size = Options.ArrowSize.Value;
		end);
		local A = T.Visuals:AddLeftTabbox();
		local l = A:AddTab("Other");
		local U = A:AddTab("Other Settings");
		U:AddSlider("ThirdPersonDistance", {
			Text = "ThirdPerson Distance",
			Default = 5,
			Min = 0,
			Max = 10,
			Rounding = 2,
			Compact = false
		});
		U:AddDropdown("ArmChamsMat", {
			Text = "Arm Chams Material",
			Default = "SmoothPlastic",
			Values = {
				"ForceField",
				"Neon",
				"SmoothPlastic",
				"Glass"
			}
		});
		(U:AddLabel("Arm Chams Color")):AddColorPicker("ArmChamsColor", {
			Default = Color3.new(1, 1, 1),
			Title = "Arm Chams Color"
		});
		U:AddDropdown("GunChamsMat", {
			Text = "Gun Chams Material",
			Default = "SmoothPlastic",
			Values = {
				"ForceField",
				"Neon",
				"SmoothPlastic",
				"Glass"
			}
		});
		(U:AddLabel("Gun Chams Color")):AddColorPicker("GunChamsColor", {
			Default = Color3.new(1, 1, 1),
			Title = "Gun Chams Color"
		});
		U:AddSlider("ZoomAmount", {
			Text = "Zoom Amount",
			Default = 5,
			Min = 0,
			Max = 30,
			Rounding = 1,
			Compact = false
		});
		U:AddSlider("CrossHairSize", {
			Text = "Crosshair-Size",
			Default = 5,
			Min = 0,
			Max = 25,
			Rounding = 1,
			Compact = false
		});
		Options.CrossHairSize:OnChanged(function()
			z.From = Vector2.new((Camera.ViewportSize.X / 2) - Options.CrossHairSize.Value, Camera.ViewportSize.Y / 2);
			z.To = Vector2.new((Camera.ViewportSize.X / 2) + Options.CrossHairSize.Value, Camera.ViewportSize.Y / 2);
			M.From = Vector2.new(Camera.ViewportSize.X / 2, (Camera.ViewportSize.Y / 2) - Options.CrossHairSize.Value);
			M.To = Vector2.new(Camera.ViewportSize.X / 2, (Camera.ViewportSize.Y / 2) + Options.CrossHairSize.Value);
		end);
		l:AddToggle("VisualsEnabled", {
			Text = "Enabled",
			Default = false,
			Tooltip = "Enables Visuals"
		});
		l:AddToggle("HitLogs", {
			Text = "Hit Logs",
			Default = false,
			Tooltip = "Enables Hit Logs"
		});
		l:AddToggle("Predictionvis", {
			Text = "Prediction Visulizer",
			Default = false,
			Tooltip = "Enables Visuals"
		});
		l:AddToggle("FullBrightEnabled", {
			Text = "FullBright",
			Default = false
		});
		(l:AddToggle("ThirdPersonEnabled", {
			Text = "Third Person",
			Default = false
		})):AddKeyPicker("ThirdPersonKey", {
			Default = "P",
			SyncToggleState = true,
			Mode = "Toggle",
			Text = "Third Person",
			NoUI = false
		});
		l:AddToggle("ArmChamsEnabled", {
			Text = "Arm Chams",
			Default = false
		});
		l:AddToggle("GunChamsEnabled", {
			Text = "Gun Chams",
			Default = false
		});
		(l:AddToggle("HitMarkEnabled", {
			Text = "Hit Markers",
			Default = false
		})):OnChanged(function()
			HitMarker = Toggles.HitMarkEnabled.Value;
		end);
		Toggles.HitMarkEnabled:AddColorPicker("HitMarkerColor", {
			Default = Color3.fromRGB(255, 255, 255),
			Title = "Hit Marker Color"
		});
		Options.HitMarkerColor:OnChanged(function()
			HitMarkerColor = Options.HitMarkerColor.Value;
		end);
		(l:AddToggle("BulletTracerEnabled", {
			Text = "Bullet Tracers",
			Default = false
		})):OnChanged(function()
			HitTracerToggle = Toggles.BulletTracerEnabled.Value;
		end);
		Toggles.BulletTracerEnabled:AddColorPicker("HitTracerColor", {
			Default = Color3.fromRGB(0, 0, 255),
			Title = "Hit Tracer Color"
		});
		Options.HitTracerColor:OnChanged(function()
			HitTracerColor = Options.HitTracerColor.Value;
		end);
		((l:AddToggle("ZoomEnabled", {
			Text = "Zoom",
			Default = false
		})):AddKeyPicker("ZoomKey", {
			Default = "X",
			SyncToggleState = true,
			Mode = "Toggle",
			Text = "Zoom",
			NoUI = false
		})):OnChanged(function()
			repeat
				if not Toggles.ZoomEnabled.Value then
					Camera.FieldOfView = 90;
				end
			until Camera.FieldOfView ~= Options.ZoomAmount.Value
		end);
		(l:AddToggle("CrosshairEnabled", {
			Text = "Crosshair",
			Default = false
		})):OnChanged(function()
			M.Visible = Toggles.CrosshairEnabled.Value;
			z.Visible = Toggles.CrosshairEnabled.Value;
		end);
		Toggles.CrosshairEnabled:AddColorPicker("CrossHairColor", {
			Default = Color3.fromRGB(255, 255, 255),
			Title = "CrossHair Color"
		});
		Options.CrossHairColor:OnChanged(function()
			z.Color = Options.CrossHairColor.Value;
			M.Color = Options.CrossHairColor.Value;
		end);
		local Y = T.Movement:AddLeftGroupbox("Main");
		(Y:AddToggle("speed", {
			Text = "Speed",
			Default = false
		})):AddKeyPicker("speed_Enabled_KeyPicker", {
			Default = "RightAlt",
			SyncToggleState = true,
			Mode = "Toggle",
			Text = "Speed",
			NoUI = false
		});
		Options.speed_Enabled_KeyPicker:OnClick(function()
			task.spawn(function()
				SpeedToggle = Toggles.speed.Value;
				if SpeedToggle then
					while Toggles.speed.Value do
						local Camera = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart");
						if (Camera ~= nil) then
							local Players = Vector3.new();
							local LocalPlayer = workspace.CurrentCamera.CFrame.lookVector;
							if (game:GetService("UserInputService")):IsKeyDown(Enum.KeyCode.W) then
								Players += Vector3.new(LocalPlayer.x, 0, LocalPlayer.Z)
							end
							if (game:GetService("UserInputService")):IsKeyDown(Enum.KeyCode.S) then
								Players -= Vector3.new(LocalPlayer.x, 0, LocalPlayer.Z)
							end
							if (game:GetService("UserInputService")):IsKeyDown(Enum.KeyCode.D) then
								Players += Vector3.new(-LocalPlayer.Z, 0, LocalPlayer.x)
							end
							if (game:GetService("UserInputService")):IsKeyDown(Enum.KeyCode.A) then
								Players += Vector3.new(LocalPlayer.Z, 0, -LocalPlayer.x)
							end
							Players = Players.Unit;
							local Character = Vector3.new(Players.x * X, Camera.Velocity.y, Players.Z * X);
							if (Players.Unit.x == Players.Unit.x) then
								Camera.Velocity = Character;
							end
						end
						task.wait(0.01);
					end
				end
			end);
		end);
		Toggles.speed:OnChanged(function()
			task.spawn(function()
				SpeedToggle = Toggles.speed.Value;
				if SpeedToggle then
					while Toggles.speed.Value do
						repeat
							wait();
						until game.Players.LocalPlayer.Character
						local Camera = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart");
						if (Camera ~= nil) then
							local Players = Vector3.new();
							local LocalPlayer = workspace.CurrentCamera.CFrame.lookVector;
							if (game:GetService("UserInputService")):IsKeyDown(Enum.KeyCode.W) then
								Players += Vector3.new(LocalPlayer.x, 0, LocalPlayer.Z)
							end
							if (game:GetService("UserInputService")):IsKeyDown(Enum.KeyCode.S) then
								Players -= Vector3.new(LocalPlayer.x, 0, LocalPlayer.Z)
							end
							if (game:GetService("UserInputService")):IsKeyDown(Enum.KeyCode.D) then
								Players += Vector3.new(-LocalPlayer.Z, 0, LocalPlayer.x)
							end
							if (game:GetService("UserInputService")):IsKeyDown(Enum.KeyCode.A) then
								Players += Vector3.new(LocalPlayer.Z, 0, -LocalPlayer.x)
							end
							Players = Players.Unit;
							local Character = Vector3.new(Players.x * X, Camera.Velocity.y, Players.Z * X);
							if (Players.Unit.x == Players.Unit.x) then
								Camera.Velocity = Character;
							end
						end
						task.wait(0.01);
					end
				end
			end);
		end);
		(Y:AddToggle("bhop", {
			Text = "Bunny Hop",
			Default = false
		})):OnChanged(function(workspace)
			task.spawn(function()
				if workspace then
					repeat
						wait();
					until LocalPlayer.Character
					local workspace = LocalPlayer.Character:FindFirstChildOfClass("Humanoid");
					if workspace then
						for workspace, Camera in pairs({
							getconnections(workspace.StateChanged),
							getconnections(workspace:GetPropertyChangedSignal("WalkSpeed")),
							getconnections(workspace:GetPropertyChangedSignal("JumpHeight"))
						}) do
							for workspace, Camera in pairs(Camera) do
								if Toggles.bhop.Value then
									Camera:Disable();
								else
									Camera:Enable();
								end
							end
						end
					end
				end
			end);
		end);
		local C = T.Movement:AddLeftGroupbox("Settings");
		(C:AddSlider("speed", {
			Text = "Speed",
			Min = 0,
			Max = 30,
			Default = 20,
			Rounding = 0
		})):OnChanged(function()
			X = Options.speed.Value;
		end);
		local n = T.Movement:AddRightGroupbox("Anti-Aim");
		n:AddToggle("aaenabled", {
			Text = "Enabled",
			Default = false
		});
		n:AddToggle("force", {
			Text = "Force Angles",
			Default = false
		});
		local Z = T.Movement:AddRightGroupbox("Anti-Aim Settings");
		Z:AddToggle("leanaa", {
			Text = "Lean Anti-Aim",
			Default = false
		});
		Z:AddSlider("leandel", {
			Text = "Lean Delay",
			Min = 0,
			Max = 1,
			Default = 1,
			Rounding = 2
		});
		Z:AddDropdown("yawbase", {
			Values = {
				"camera",
				"random",
				"spin",
				"target"
			},
			Default = "camera",
			Multi = false,
			Text = "Yaw Base",
			Tooltip = "Changes the Yaw Base"
		});
		Z:AddSlider("yawoff", {
			Text = "Yaw Offset",
			Min = -180,
			Max = 180,
			Default = 0,
			Rounding = 0
		});
		Z:AddDropdown("yawm", {
			Values = {
				"none",
				"jitter",
				"offset jitter"
			},
			Default = "none",
			Multi = false,
			Text = "Yaw Modifier",
			Tooltip = "Changes the Yaw Modifer"
		});
		Z:AddSlider("modoff", {
			Text = "Modifier Offset",
			Min = -180,
			Max = 180,
			Default = 0,
			Rounding = 0
		});
		Z:AddSlider("pitch", {
			Text = "Pitch",
			Min = -2,
			Max = 2,
			Default = 0,
			Rounding = 0
		});
		local E = T.Movement:AddRightGroupbox("Removals");
		(E:AddToggle("visorremover", {
			Text = "Remove Visor",
			Default = false
		})):OnChanged(function(workspace)
			local Camera = Players.LocalPlayer.PlayerGui:FindFirstChild("MainGui");
			if Camera then
				local workspace = Camera:FindFirstChild("MainFrame");
				if workspace then
					local Camera = workspace:FindFirstChild("ScreenEffects");
					Visor = Camera:FindFirstChild("Visor");
				end
			end
		end);
		local I = {};
		SpawnerZones = (game:GetService("Workspace")):FindFirstChild("SpawnerZones");
		(E:AddToggle("leafremover", {
			Text = "Remove Leaves",
			Default = false
		})):OnChanged(function(workspace)
			if (workspace and SpawnerZones) then
				for workspace, Camera in next, (game:GetService("Workspace")).SpawnerZones.Foliage:GetDescendants() do
					if (Camera:IsA("MeshPart") and (Camera.TextureID == "")) then
						I[workspace] = {
							Part = Camera,
							Old = Camera.Parent
						};
						Camera.Parent = CoreGui;
					end
				end
			else
				pcall(function()
					for workspace, Camera in pairs(I) do
						Camera.Part.Parent = Camera.Old;
					end
					I = {};
				end);
			end
		end);
		E:AddToggle("cloudsremover", {
			Text = "Remove Clouds",
			Default = false
		});
		E:AddToggle("atmosphereremover", {
			Text = "Remove Atmosphere",
			Default = false
		});
		(E:AddToggle("serverinforemove", {
			Text = "Remove Server Info",
			Default = false
		})):OnChanged(function(workspace)
			for workspace, Camera in pairs(LocalPlayer.PlayerGui:GetDescendants()) do
				if Camera:IsA("TextLabel") then
					if (Camera.Text:find("| Server") or Camera.Text:find(game.JobId:lower()) or Camera.Text:find(LocalPlayer.UserId)) then
						serverLabel = Camera;
					end
				end
			end
		end);
		(E:AddToggle("landmineremover", {
			Text = "Remove PMN2",
			Default = false
		})):OnChanged(function(workspace)
			if workspace then
				for workspace, Camera in pairs((game:GetService("Workspace")).AiZones:GetDescendants()) do
					if (Camera.Name == "PMN2") then
						Camera:Destroy();
					end
				end
			end
		end);
		local x = T.Movement:AddLeftGroupbox("Chat");
		(x:AddToggle("chatspam", {
			Text = "Enabled",
			Default = false
		})):OnChanged(function()
		end);
		x:AddInput("message", {
			Default = "Crumbleware V3 On Top (.gg/rryKkVtZw2)",
			Numeric = false,
			Finished = false,
			Text = "Message",
			Tooltip = "What Message is spammed",
			Placeholder = "Spammed Message"
		});
		x:AddSlider("delayc", {
			Text = "Chat Delay",
			Min = 2,
			Max = 10,
			Default = 2,
			Rounding = 1
		});
		task.spawn(function()
			while task.wait(Options.delayc.Value) do
				if Toggles.chatspam.Value then
					local workspace = {
						[1] = Options.message.Value,
						[2] = "Global"
					};
					game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(workspace));
				end
			end
		end);
		local i = T.Movement:AddLeftGroupbox("Other");
		i:AddToggle("invview", {
			Text = "Inventory Viewer",
			Default = false
		});
		i:AddSlider("delayv", {
			Text = "Inventory Viewer Update Delay",
			Min = 0,
			Max = 10,
			Default = 1,
			Rounding = 2
		});
		i:AddInput("scanfor", {
			Default = "",
			Numeric = false,
			Finished = false,
			Text = "Message",
			Tooltip = "What is scanned for",
			Placeholder = "Item Scanned For"
		});
		ItemScannerText = Drawing.new("Text");
		i:AddSlider("itemdelay", {
			Text = "Scan Delay",
			Min = 0,
			Max = 240,
			Default = 120,
			Rounding = 1
		});
		i:AddButton("itemscanner", function()
			local Players = false;
			for workspace, Character in pairs(workspace:GetDescendants()) do
				if (tostring(Character.Name) == tostring(Options.scanfor.Value)) then
					local workspace = nil;
					for Camera, Players in pairs(Character:GetDescendants()) do
						if (Players:IsA("MeshPart") or Players:IsA("Part")) then
							workspace = Players;
							break;
						end
					end
					if (workspace ~= nil) then
						Players = true;
						local Character = workspace.Position;
						local WorldToPoint = (Character - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude;
						WorldToPoint = WorldToPoint / 3;
						local q, a = Camera:WorldToViewportPoint(Character);
						ItemScannerText.Text = tostring(Options.scanfor.Value) .. " (" .. tostring(WorldToPoint) .. "workspace)";
						ItemScannerText.Size = 15;
						ItemScannerText.Outline = true;
						ItemScannerText.Color = Color3.fromRGB(255, 255, 255);
						ItemScannerText.Position = Vector2.new(q.X, q.Y);
						ItemScannerText.Visible = true;
						local GetMouse = tick();
						while math.floor(tick() - GetMouse) < tonumber(Options.itemdelay.Value) do
							local Players = workspace.Position;
							local Character = (Players - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude;
							Character = Character / 3;
							local WorldToPoint, q = Camera:WorldToViewportPoint(Players);
							ItemScannerText.Text = tostring(Options.scanfor.Value) .. " (" .. tostring(math.floor(Character)) .. "workspace)";
							ItemScannerText.Position = Vector2.new(WorldToPoint.X, WorldToPoint.Y);
							ItemScannerText.Visible = q;
							task.wait();
						end
						ItemScannerText.Visible = false;
						return;
					end
				end
			end
			if (Players == false) then
				for workspace, Character in next, game.ReplicatedStorage.Players:GetChildren() do
					if (Character.Name ~= LocalPlayer.Name) then
						for workspace, WorldToPoint in next, Character:GetDescendants() do
							if WorldToPoint:IsA("StringValue") then
								if ((WorldToPoint.Parent.Name == "Inventory") or (WorldToPoint.Parent.Name == "Equipment")) then
									if (tostring(WorldToPoint.Name) == tostring(Options.scanfor.Value)) then
										local workspace = Character.Name;
										if game.Players[workspace].Character:FindFirstChild("HumanoidRootPart") then
											Players = true;
											local Character = game.Players[workspace].Character.HumanoidRootPart.Position;
											local WorldToPoint = (Character - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude;
											WorldToPoint = WorldToPoint / 3;
											local q, a = Camera:WorldToViewportPoint(Character);
											ItemScannerText.Text = tostring(Options.scanfor.Value) .. " (" .. tostring(math.floor(WorldToPoint)) .. "workspace)";
											ItemScannerText.Size = 15;
											ItemScannerText.Outline = true;
											ItemScannerText.Color = Color3.fromRGB(255, 255, 255);
											ItemScannerText.Position = Vector2.new(q.X, q.Y);
											ItemScannerText.Visible = true;
											local GetMouse = tick();
											while math.floor(tick() - GetMouse) < tonumber(Options.itemdelay.Value) do
												local Players = game.Players[workspace].Character.HumanoidRootPart.Position;
												local Character = (Players - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude;
												Character = Character / 3;
												local WorldToPoint, q = Camera:WorldToViewportPoint(Players);
												ItemScannerText.Text = tostring(Options.scanfor.Value) .. " (" .. tostring(Character) .. "workspace)";
												ItemScannerText.Position = Vector2.new(WorldToPoint.X, WorldToPoint.Y);
												ItemScannerText.Visible = q;
												task.wait();
											end
											ItemScannerText.Visible = false;
											return;
										end
									end
								end
							end
						end
					end
				end
			end
		end);
		Library:SetWatermarkVisibility(true);
		Library:SetWatermark("Crumbleware | Beta v" .. CrumbleWare .. " | Dev | " .. FPS);
		Library.KeybindFrame.Visible = true;
		Library:OnUnload(function()
			Library.Unloaded = true;
		end);
		Library:OnUnload(function()
			Library.Unloaded = true;
		end);
		local L = T["UI Settings"]:AddLeftGroupbox("Menu");
		local u = T["UI Settings"]:AddRightGroupbox("UI");
		L:AddButton("Unload", function()
			Library:Unload();
		end);
		(L:AddLabel("Menu bind")):AddKeyPicker("MenuKeybind", {
			Default = "End",
			NoUI = true,
			Text = "Menu keybind"
		});
		Library.ToggleKeybind = Options.MenuKeybind;
		ThemeManager:SetLibrary(Library);
		SaveManager:SetLibrary(Library);
		SaveManager:IgnoreThemeSettings();
		SaveManager:SetIgnoreIndexes({
			"MenuKeybind"
		});
		ThemeManager:SetFolder("CrumblewareV3.0");
		SaveManager:SetFolder("CrumblewareV3.0/ProjectDelta");
		SaveManager:BuildConfigSection(T["UI Settings"]);
		ThemeManager:ApplyToTab(T["UI Settings"]);
		u:AddToggle("watermark", {
			Text = "WaterMark",
			Default = true,
			Tooltip = "Toggles the Water Mark"
		});
		Toggles.watermark:OnChanged(function()
			mark = Toggles.watermark.Value;
			Library:SetWatermarkVisibility(mark);
		end);
		u:AddToggle("Keybinds", {
			Text = "KeyBind List",
			Default = false,
			Tooltip = "Toggles the KeyBind List"
		});
		Toggles.Keybinds:OnChanged(function()
			keybind = Toggles.Keybinds.Value;
			Library.KeybindFrame.Visible = keybind;
		end);
		local o = nil;
		o = hookmetamethod(game, "__newindex", function(workspace, Players, LocalPlayer)
			if ((workspace == Camera) and (Players == "CFrame")) then
				LastCameraCFrame = LocalPlayer;
				if (Toggles.ThirdPersonEnabled.Value and Toggles.VisualsEnabled.Value) then
					return o(workspace, Players, LocalPlayer + (Camera.CFrame.LookVector * -Options.ThirdPersonDistance.Value));
				end
			end
			return o(workspace, Players, LocalPlayer);
		end);
		local P;
		P = hookmetamethod(game, "__namecall", newcclosure(function(Players, ...)
			local Character = getnamecallmethod();
			local WorldToPoint = {
				...
			};
			if (getnamecallmethod() == "GetAttribute") then
				if ((WorldToPoint[1] == "MuzzleEffect") and Toggles.Flash.Value) then
					return false;
				end
				if ((WorldToPoint[1] == "AccuracyDeviation") and Toggles.NoSpread.Value) then
					return 1;
				end
				if ((WorldToPoint[1] == "ProjectileDrop") and Toggles.nodrop.Value) then
					return 0;
				end
				if ((WorldToPoint[1] == "Tracer") and Toggles.NoTracer.Value) then
					return false;
				end
				if ((WorldToPoint[1] == "RecoilStrength") and Toggles.GunMods_NoRecoil.Value) then
					return 0;
				end
				if ((WorldToPoint[1] == "RecoilRecoveryTimeMod") and Toggles.GunMods_NoRecoil.Value) then
					return 0;
				end
				if ((WorldToPoint[1] == "MuzzleVelocity") and Toggles.Instant.Value) then
					return 9000000000;
				end
			elseif ((getnamecallmethod() == "FireServer") and (Players.Name == "ProjectileInflict")) then
				hitmarker(tostring(WorldToPoint[2]), WorldToPoint[2], 3);
				FoundHit = true;
				HitTarget = WorldToPoint[2];
				if HitTracerToggle then
					task.spawn(function()
						local Players = WorldToPoint[2].Position;
						local Character, q = Camera:WorldToViewportPoint(Players);
						local a = false;
						local GetMouse = Instance.new("Part");
						GetMouse.CanCollide = false;
						GetMouse.Anchored = true;
						GetMouse.Parent = workspace;
						local X = Instance.new("Attachment");
						X.Position = LocalPlayer.Character.Head.Position;
						X.Parent = GetMouse;
						X.Visible = false;
						local f = Instance.new("Attachment");
						f.Position = Players;
						f.Parent = GetMouse;
						f.Visible = false;
						local s = Instance.new("Beam");
						s.Enabled = q;
						s.Brightness = 10;
						s.LightInfluence = 0.75;
						s.LightEmission = 0.1;
						s.Attachment0 = X;
						s.Attachment1 = f;
						s.Texture = "rbxassetid://7216850022";
						s.TextureLength = 7;
						s.TextureMode = "Stretch";
						s.TextureSpeed = 6.21;
						s.Color = ColorSequence.new(HitTracerColor);
						s.Transparency = NumberSequence.new(0);
						s.Parent = GetMouse;
						s.CurveSize0 = 0;
						s.CurveSize1 = 0;
						s.FaceCamera = true;
						s.Segments = 10;
						s.Width0 = 2;
						s.Width1 = 2;
						s.ZOffset = 0;
						local v;
						v = (game:GetService("RunService")).RenderStepped:Connect(function()
							if not a then
								s.Enabled = q;
							else
								v:Disconnect();
							end
						end);
						if not a then
							wait(5);
							a = true;
							GetMouse:Destroy();
						end
					end);
				end
				if HitMarker then
					task.spawn(function()
						local workspace = WorldToPoint[2].Position;
						local Players, LocalPlayer = Camera:WorldToViewportPoint(workspace);
						local Character = false;
						local q = Drawing.new("Line");
						local a = Drawing.new("Line");
						local GetMouse = Drawing.new("Line");
						local X = Drawing.new("Line");
						q.Visible = LocalPlayer;
						a.Visible = LocalPlayer;
						GetMouse.Visible = LocalPlayer;
						X.Visible = LocalPlayer;
						q.Thickness = 2;
						a.Thickness = 2;
						GetMouse.Thickness = 2;
						X.Thickness = 2;
						q.Color = HitMarkerColor;
						a.Color = HitMarkerColor;
						GetMouse.Color = HitMarkerColor;
						X.Color = HitMarkerColor;
						q.Transparency = 1;
						a.Transparency = 1;
						GetMouse.Transparency = 1;
						X.Transparency = 1;
						q.From = Vector2.new(Players.X - 10, Players.Y - 10);
						q.To = Vector2.new(Players.X - 3, Players.Y - 3);
						a.From = Vector2.new(Players.X + 10, Players.Y - 10);
						a.To = Vector2.new(Players.X + 3, Players.Y - 3);
						GetMouse.From = Vector2.new(Players.X - 10, Players.Y + 10);
						GetMouse.To = Vector2.new(Players.X - 3, Players.Y + 3);
						X.From = Vector2.new(Players.X + 10, Players.Y + 10);
						X.To = Vector2.new(Players.X + 3, Players.Y + 3);
						local f;
						f = (game:GetService("RunService")).RenderStepped:Connect(function()
							if not Character then
								local Players, LocalPlayer = Camera:WorldToViewportPoint(workspace);
								q.Visible = LocalPlayer;
								a.Visible = LocalPlayer;
								GetMouse.Visible = LocalPlayer;
								X.Visible = LocalPlayer;
								q.From = Vector2.new(Players.X - 10, Players.Y - 10);
								q.To = Vector2.new(Players.X - 5, Players.Y - 5);
								a.From = Vector2.new(Players.X + 10, Players.Y - 10);
								a.To = Vector2.new(Players.X + 5, Players.Y - 5);
								GetMouse.From = Vector2.new(Players.X - 10, Players.Y + 10);
								GetMouse.To = Vector2.new(Players.X - 5, Players.Y + 5);
								X.From = Vector2.new(Players.X + 10, Players.Y + 10);
								X.To = Vector2.new(Players.X + 5, Players.Y + 5);
							else
								f:Disconnect();
							end
						end);
						wait(5);
						while q.Transparency > 0 do
							q.Transparency = q.Transparency - 0.05;
							a.Transparency = a.Transparency - 0.05;
							GetMouse.Transparency = GetMouse.Transparency - 0.05;
							X.Transparency = X.Transparency - 0.05;
							wait(0.03);
						end
						Character = true;
						q:Remove();
						a:Remove();
						GetMouse:Remove();
						X:Remove();
					end);
				end
			end
			return P(Players, unpack(WorldToPoint));
		end));
		local y = {
			FindPartOnRayWithIgnoreList = {
				ArgCountRequired = 3,
				Args = {
					"Instance",
					"Ray",
					"table",
					"boolean",
					"boolean"
				}
			},
			FindPartOnRayWithWhitelist = {
				ArgCountRequired = 3,
				Args = {
					"Instance",
					"Ray",
					"table",
					"boolean"
				}
			},
			FindPartOnRay = {
				ArgCountRequired = 2,
				Args = {
					"Instance",
					"Ray",
					"Instance",
					"boolean",
					"boolean"
				}
			},
			Raycast = {
				ArgCountRequired = 3,
				Args = {
					"Instance",
					"Vector3",
					"Vector3",
					"RaycastParams"
				}
			}
		};
		local function J(workspace, Camera)
			return (Camera - workspace).Unit * (game.workspace.Camera.CFrame.Position - Camera).Magnitude;
		end
		local function k(workspace, Camera)
			local Players = 0;
			if (#workspace < Camera.ArgCountRequired) then
				return false;
			end
			for workspace, LocalPlayer in next, workspace do
				if (typeof(LocalPlayer) == Camera.Args[workspace]) then
					Players = Players + 1;
				end
			end
			return Players >= Camera.ArgCountRequired;
		end
		local B;
		B = hookmetamethod(game, "__namecall", newcclosure(function(...)
			local workspace = getnamecallmethod();
			local Camera = {
				...
			};
			local Players = Camera[1];
			if (Toggles.SEnabled.Value and Toggles.CEnabled.Value and SilentTarget and (Players == workspace) and not checkcaller() and (workspace == "Raycast")) then
				if k(Camera, y.Raycast) then
					local workspace = Camera[2];
					local Players = SilentTarget;
					if Players then
						Camera[3] = J(workspace, Vector3.new(Players.X, Players.Y, Players.Z));
						return B(unpack(Camera));
					end
				end
			elseif (Toggles.aaenabled.Value and (Players.Name == "UpdateTilt") and not checkcaller() and (workspace == "FireServer")) then
				Camera[1] = Options.pitch.Value;
				return B(Players, unpack(Camera));
			end
			return B(...);
		end));
		game.UserInputService.InputBegan:Connect(function(workspace)
			if (workspace.UserInputType == Enum.UserInputType.MouseButton2) then
				Holding = true;
			end
		end);
		game.UserInputService.InputEnded:Connect(function(workspace)
			if (workspace.UserInputType == Enum.UserInputType.MouseButton2) then
				Holding = false;
			end
		end);
		function Draw(workspace, Camera)
			workspace = Drawing.new(workspace);
			for Camera, Players in pairs(Camera) do
				workspace[Camera] = Players;
			end
			return workspace;
		end
		local mo = {
			Size = Vector2.new(170, 14),
			Main = Draw("Square", {
				Thickness = 0,
				Size = Vector2.new(300, 14),
				Filled = true,
				Color = Color3.fromRGB(20, 20, 20),
				Outline = true,
				OutlineColor = Color3.fromRGB(50, 50, 50),
				Position = Vector2.new(0, game.workspace.CurrentCamera.ViewportSize.Y / 6),
				Transparency = 0
			}),
			Top = Draw("Square", {
				Thickness = 0,
				Size = Vector2.new(300, 3),
				Filled = true,
				Color = Color3.fromRGB(209, 123, 255),
				Outline = true,
				OutlineColor = Color3.fromRGB(50, 50, 50),
				Position = Vector2.new(0, (game.workspace.CurrentCamera.ViewportSize.Y / 6) - 2.5),
				Transparency = 0
			}),
			Texts = {}
		};
		mo.Clear = function(workspace)
			for workspace, Camera in pairs(mo.Texts) do
				Camera:Remove();
				mo.Texts[workspace] = nil;
				mo.Main.Size = mo.Size;
				mo.Main.Transparency = 0;
				mo.Top.Transparency = 0;
			end
		end;
		mo.AddText = function(LocalPlayer, workspace, Camera, Players)
			local Character = mo.Main;
			local WorldToPoint = mo.Top;
			local q = Draw("Text", {
				Text = workspace,
				Color = Color3.new(1, 1, 1),
				Transparency = 1,
				Size = 13,
				Font = 2,
				Outline = true,
				Visible = true
			});
			table.insert(mo.Texts, q);
			local a = #mo.Texts;
			Character.Size = Vector2.new(mo.Size.X, 14 * a);
			WorldToPoint.Size = Vector2.new(mo.Size.X, 3);
			q.Position = Character.Position + Vector2.new(5, (a - 1) * 14);
			if Players then
				q.Center = true;
				q.Position = Character.Position + Vector2.new(Character.Size.X / 2, 0);
			end
			if Camera then
				q.Position = Character.Position + Vector2.new(20, (a - 1) * 14);
			end
			return q;
		end;
		mo.Update = function(Camera)
			mo:Clear();
			mo.Main.Transparency = 1;
			mo.Top.Transparency = 1;
			mo.Size = Vector2.new(170, 14);
			Players = game.Players;
			local LocalPlayer, Character = {}, true;
			if Character then
				for workspace, Camera in pairs(Players:GetPlayers()) do
					if ((Camera ~= game.Players.LocalPlayer) and Camera.Character and Camera.Character:FindFirstChild("HumanoidRootPart") and Camera.Character:FindFirstChildOfClass("Humanoid")) then
						table.insert(LocalPlayer, Camera.Character);
					end
				end
			end
			local WorldToPoint, q, a = nil, math.huge, math.huge;
			for Camera, Players in pairs(LocalPlayer) do
				local LocalPlayer = Players.PrimaryPart;
				if LocalPlayer then
					local Camera, Character = workspace.CurrentCamera:WorldToViewportPoint(LocalPlayer.Position);
					if Character then
						local LocalPlayer = ((workspace.CurrentCamera.ViewportSize / 2) - Vector2.new(Camera.X, Camera.Y)).Magnitude;
						if (LocalPlayer < a) then
							a = LocalPlayer;
							WorldToPoint = Players;
						end
					end
				end
			end
			if not WorldToPoint then
				mo:Clear();
				mo:AddText("Inventory Viewer", false, true);
				return;
			end
			local GetMouse = WorldToPoint:FindFirstChildOfClass("Humanoid");
			mo:Clear();
			local X = mo:AddText(WorldToPoint.Name, false, true);
			LocalPlayer = {};
			local f = 0;
			local s = (game:GetService("ReplicatedStorage")).Players[WorldToPoint.Name];
			if (GetMouse and s) then
				table.insert(LocalPlayer, s.Inventory);
				table.insert(LocalPlayer, s.Clothing);
				for workspace, Camera in pairs(LocalPlayer) do
					local Players = Camera.Name;
					if (Players == "Inventory") then
						for workspace, Camera in pairs(Camera:GetChildren()) do
							local Players = Camera:FindFirstChild("ItemProperties");
							if Players then
								local workspace = "";
								local LocalPlayer = false;
								local Character = Players:GetAttribute("ItemType");
								if (Character and (Character == "RangedWeapon")) then
									LocalPlayer = true;
									local Players = Camera:FindFirstChild("Attachments");
									if Players then
										local Camera = Players:FindFirstChild("Magazine");
										if Camera then
											Camera = Camera:FindFirstChildOfClass("StringValue");
											if Camera then
												local Players = Camera:FindFirstChild("ItemProperties");
												if Players then
													local Camera = Players:FindFirstChild("LoadedAmmo");
													if Camera then
														for Camera, Players in pairs(Camera:GetChildren()) do
															local LocalPlayer, Character = Players:GetAttribute("AmmoType"), Players:GetAttribute("Amount");
															if (LocalPlayer and Character) then
																workspace = workspace .. Character .. " - " .. LocalPlayer:gsub("Tracer", "T") .. "; ";
															end
														end
													end
												end
											end
										end
									end
								end
								if ((workspace == "") and (LocalPlayer == false)) then
									mo:AddText("[Hotbar] " .. Camera.Name);
								elseif (workspace == "") then
									local workspace = mo:AddText("[Hotbar] " .. Camera.Name .. " [OUT OF AMMO]");
									local Players = workspace.TextBounds.X;
									if (Players > f) then
										f = Players;
									end
									if (f > mo.Size.X) then
										mo.Size = Vector2.new(f + 10, mo.Main.Size.Y);
										mo.Main.Size = mo.Size;
										X.Position = mo.Main.Position + Vector2.new(mo.Main.Size.X / 2, 0);
									end
								else
									workspace = workspace:sub(0, workspace:len() - 2);
									local Players = mo:AddText("[Hotbar] " .. Camera.Name .. " [" .. workspace .. "]");
									local LocalPlayer = Players.TextBounds.X;
									if (LocalPlayer > f) then
										f = LocalPlayer;
									end
									if (f > mo.Size.X) then
										mo.Size = Vector2.new(f + 10, mo.Main.Size.Y);
										mo.Main.Size = mo.Size;
										X.Position = mo.Main.Position + Vector2.new(mo.Main.Size.X / 2, 0);
									end
								end
							else
								mo:AddText("[Hotbar] " .. Camera.Name);
							end
						end
					elseif (Players == "Clothing") then
						for workspace, Camera in pairs(Camera:GetChildren()) do
							local Players = Camera:FindFirstChild("Attachments");
							local LocalPlayer = "";
							if Players then
								for workspace, Camera in pairs(Players:GetChildren()) do
									local Players = Camera:FindFirstChildOfClass("StringValue");
									if Players then
										LocalPlayer = LocalPlayer .. Players.Name .. "; ";
									end
								end
							end
							LocalPlayer = LocalPlayer:sub(0, LocalPlayer:len() - 2);
							if (LocalPlayer == "") then
								mo:AddText(Camera.Name);
							else
								local workspace = mo:AddText(Camera.Name .. " [" .. LocalPlayer .. "]");
								local Players = workspace.TextBounds.X;
								if (Players > f) then
									f = Players;
								end
								if (f > mo.Size.X) then
									mo.Size = Vector2.new(f + 10, mo.Main.Size.Y);
									mo.Main.Size = mo.Size;
									X.Position = mo.Main.Position + Vector2.new(mo.Main.Size.X / 2, 0);
								end
							end
							local Character = Camera:FindFirstChild("Inventory");
							if Character then
								for workspace, Camera in pairs(Character:GetChildren()) do
									local Players = Camera:FindFirstChild("ItemProperties");
									if Players then
										local workspace = Players:GetAttribute("Amount");
										if workspace then
											if (workspace > 1) then
												mo:AddText(Camera.Name .. " [" .. tostring(workspace) .. "]", true);
											else
												mo:AddText(Camera.Name, true);
											end
										else
											mo:AddText(Camera.Name, true);
										end
									else
										mo:AddText(Camera.Name, true);
									end
								end
							end
						end
					end
				end
			else
				local workspace = WorldToPoint:FindFirstChild("Inventory");
				if workspace then
					for workspace, Camera in pairs(workspace:GetChildren()) do
						local Players = Camera:FindFirstChild("ItemProperties");
						if Players then
							local workspace = Players:GetAttribute("Amount");
							if workspace then
								if (workspace > 1) then
									mo:AddText(Camera.Name .. " [" .. tostring(workspace) .. "]");
								else
									mo:AddText(Camera.Name);
								end
							else
								mo:AddText(Camera.Name);
							end
						else
							mo:AddText(Camera.Name);
						end
					end
				end
			end
		end;
		task.spawn(function()
			while wait(Options.delayv.Value) do
				if Toggles.invview.Value then
					mo:Update();
				else
					mo:Clear();
				end
			end
		end);
		task.spawn(function()
			while true do
				if Toggles.leanaa.Value then
					(game:GetService("ReplicatedStorage")).Remotes.UpdateLeaning:FireServer(unpack({
						[1] = true
					}));
					wait(Options.leandel.Value);
					(game:GetService("ReplicatedStorage")).Remotes.UpdateLeaning:FireServer(unpack({
						[1] = false
					}));
				end
				wait(Options.leandel.Value);
			end
		end);
		local Qo = (LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and (LocalPlayer.Character:FindFirstChildOfClass("Humanoid")).AutoRotate) or true;
		local Ko = CFrame.new();
		local No = false;
		(game:GetService("RunService")).RenderStepped:Connect(function(Character)
			FPS = FPS + 1;
			if Toggles.HitSoundEnabled.Value then
				if FoundHit then
					FoundHit = false;
					local workspace = HitTarget;
					if ((workspace.Name:lower()):find("head") or (workspace.Name:lower()):find("face")) then
						HeadSound:Play();
					else
						BodySound:Play();
					end
				end
			end
			s.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2);
			v.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2);
			z.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2);
			z.To = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2);
			M.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2);
			M.To = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2);
			local WorldToPoint = LocalPlayer.Character;
			local q, a = WorldToPoint and WorldToPoint:FindFirstChild("HumanoidRootPart"), WorldToPoint and WorldToPoint:FindFirstChildOfClass("Humanoid");
			if (not WorldToPoint or not q or not a) then
				return;
			end
			if Toggles.aaenabled.Value then
				a.AutoRotate = false;
				local workspace;
				do
					workspace = -math.atan2(Camera.CFrame.LookVector.Z, Camera.CFrame.LookVector.X) + math.rad(-90);
					if (Options.yawbase.Value == "random") then
						workspace = -math.atan2(Camera.CFrame.LookVector.Z, Camera.CFrame.LookVector.X) + math.rad(math.random(0, 360));
					elseif (Options.yawbase.Value == "spin") then
						workspace = -math.atan2(Camera.CFrame.LookVector.Z, Camera.CFrame.LookVector.X) + ((tick() * 10) % 360);
					end
				end
				local LocalPlayer = math.rad(Options.yawoff.Value);
				No = not No;
				if No then
					if (Options.yawm.Value == "jitter") then
						LocalPlayer = math.rad(Options.modoff.Value);
					elseif (Options.yawm.Value == "offset jitter") then
						LocalPlayer = LocalPlayer + math.rad(Options.modoff.Value);
					end
				end
				local Character = CFrame.new(q.Position) * CFrame.Angles(0, workspace + LocalPlayer, 0);
				local function WorldToPoint(workspace)
					local Camera, Players, LocalPlayer = workspace:ToOrientation();
					return CFrame.new(workspace.Position) * CFrame.Angles(0, Players, 0);
				end
				if (Options.yawbase.Value == "targets") then
					local workspace;
					local LocalPlayer = 9999;
					for Players, Character in next, Players:GetPlayers() do
						if (not Character.Character or not Character.Character:FindFirstChild("HumanoidRootPart")) then
							continue;
						end
						local WorldToPoint, q = Camera:WorldToViewportPoint(Character.Character.HumanoidRootPart.Position);
						local a = (Vector2.new(WorldToPoint.X, WorldToPoint.Y) - Vector2.new(GetMouse.X, GetMouse.Y)).Magnitude;
						if (LocalPlayer > a) then
							workspace = Character.Character.HumanoidRootPart;
							LocalPlayer = a;
						end
					end
					if (workspace ~= nil) then
						Character = CFrame.new(q.Position, workspace.Position) * CFrame.Angles(0, 0, 0);
					end
				end
				Ko = workspace + LocalPlayer;
				q.CFrame = WorldToPoint(Character);
			else
				a.AutoRotate = Qo;
			end
			if Toggles.CEnabled.Value then
				local workspace = GetTargetS();
				local Players = GetTargetA();
				local LocalPlayer = getbulletatribute("MuzzleVelocity");
				local Character = getbulletatribute("ProjectileDrop");
				if (Toggles.AEnabled.Value and Toggles.CEnabled.Value and Players) then
					local workspace = Players.Position;
					if (Toggles.OldPredic and LocalPlayer) then
						local Character = (Players.Position - Camera.CFrame.p).Magnitude / LocalPlayer;
						workspace = Players.Position + ((Players.Parent:FindFirstChild("HumanoidRootPart")).Velocity * Character);
					end
					if Holding then
						Camera.CFrame = CFrame.new(Camera.CFrame.Position, workspace);
					end
				end
				if (Toggles.SEnabled.Value and Toggles.CEnabled.Value and workspace) then
					local Players = workspace.Position;
					if (Toggles.OldPredic and LocalPlayer) then
						local Character = (workspace.Position - Camera.CFrame.p).Magnitude / LocalPlayer;
						Players = workspace.Position + ((workspace.Parent:FindFirstChild("HumanoidRootPart")).Velocity * Character);
					end
					local Character = false;
					if (Options.HitchanceS.Value <= math.random(1, 100)) then
						Character = true;
					end
					if Character then
						local workspace = math.random(1, 4);
						if (workspace == 1) then
							Players = Players + Vector3.new(0, 10, 0);
						elseif (workspace == 2) then
							Players = Players + Vector3.new(0, -10, 0);
						elseif (workspace == 3) then
							Players = Players + Vector3.new(10, 0, 0);
						elseif (workspace == 4) then
							Players = Players + Vector3.new(-10, 0, 0);
						end
					end
					SilentTarget = Players;
				else
					SilentTarget = false;
				end
			end
			if (Toggles.VisualsEnabled.Value and Toggles.ZoomEnabled.Value) then
				Camera.FieldOfView = Options.ZoomAmount.Value;
			end
			if Toggles.FullBrightEnabled.Value then
				(game:GetService("Lighting")).Brightness = 2;
				(game:GetService("Lighting")).ClockTime = 14;
				(game:GetService("Lighting")).FogEnd = 100000;
				(game:GetService("Lighting")).GlobalShadows = false;
				(game:GetService("Lighting")).OutdoorAmbient = Color3.fromRGB(128, 128, 128);
			end
			if (Toggles.serverinforemove.Value and serverLabel) then
				serverLabel.Text = "";
			end
			if Toggles.atmosphereremover.Value then
				local workspace = (game:GetService("Lighting")):FindFirstChildOfClass("Atmosphere");
				if workspace then
					workspace.Parent = (State and CoreGui) or Lighting;
				end
			end
			if Toggles.cloudsremover.Value then
				local Camera = (workspace:FindFirstChildOfClass("Terrain")):FindFirstChildOfClass("Clouds");
				if Camera then
					Camera.Parent = (State and CoreGui) or Terrain;
				end
			end
			if (Toggles.visorremover.Value and Visor) then
				Visor.Visible = false;
			end
			if (Toggles.CEnabled.Value and Toggles.SnapEnabled.Value and GetTargetS()) then
				local workspace, Players = Camera:worldToViewportPoint((GetTargetS()).Position);
				if Players then
					p.From = Vector2.new(game.workspace.CurrentCamera.ViewportSize.X / 2, game.workspace.CurrentCamera.ViewportSize.Y / 2);
					p.To = Vector2.new(workspace.X, workspace.Y);
					p.Visible = true;
				else
					p.Visible = false;
				end
			else
				p.Visible = false;
			end
			if (Toggles.CEnabled.Value and Toggles.SnapEnabled2.Value and GetTargetA()) then
				local workspace, Players = Camera:worldToViewportPoint((GetTargetA()).Position);
				if Players then
					W.From = Vector2.new(game.workspace.CurrentCamera.ViewportSize.X / 2, game.workspace.CurrentCamera.ViewportSize.Y / 2);
					W.To = Vector2.new(workspace.X, workspace.Y);
					W.Visible = true;
				else
					W.Visible = false;
				end
			else
				W.Visible = false;
			end
			local X = (game:GetService("Workspace")).Camera:FindFirstChild("ViewModel");
			if (Toggles.VisualsEnabled.Value and (X ~= nil)) then
				for workspace, Camera in pairs((game:GetService("Workspace")).Camera.ViewModel:GetDescendants()) do
					if Toggles.ArmChamsEnabled.Value then
						if (Camera.ClassName == "MeshPart") then
							if ((Camera.Parent.Name == "WastelandShirt") or (Camera.Parent.Name == "GhillieTorso") or (Camera.Parent.Name == "CivilianPants") or (Camera.Parent.Name == "CamoShirt") or (Camera.Parent.Name == "HandWraps") or (Camera.Parent.Name == "CombatGloves")) then
								Camera.Transparency = 1;
							end
						end
						if (Camera.ClassName == "MeshPart") then
							if ((Camera.Name == "LeftHand") or (Camera.Name == "LeftLowerArm") or (Camera.Name == "LeftUpperArm") or (Camera.Name == "RightHand") or (Camera.Name == "RightLowerArm") or (Camera.Name == "RightUpperArm")) then
								Camera.Material = Options.ArmChamsMat.Value;
								Camera.Color = Options.ArmChamsColor.Value;
							end
						end
						if (Camera.ClassName == "Part") then
							if ((Camera.Name == "AimPartCanted") or (Camera.Name == "AimPart")) then
								Camera.Size = Vector3.new(0, 0, 0);
								Camera.Transparency = 1;
							end
						end
					end
				end
				if Toggles.GunChamsEnabled.Value then
					for workspace, Camera in pairs((game:GetService("Workspace")).Camera.ViewModel.Item:GetDescendants()) do
						if ((Camera.ClassName == "MeshPart") or (Camera.ClassName == "Part")) then
							Camera.Material = Options.GunChamsMat.Value;
							Camera.Color = Options.GunChamsColor.Value;
						end
						if Camera:FindFirstChild("SurfaceAppearance") then
							Camera.SurfaceAppearance:Destroy();
						end
					end
				end
			end
		end);
		task.spawn(function()
			function sandbox(workspace, Camera)
				local Players = getfenv(Camera);
				local LocalPlayer = setmetatable({}, {
					__index = function(Camera, LocalPlayer)
						if (LocalPlayer == "script") then
							return workspace;
						else
							return Players[LocalPlayer];
						end
					end
				});
				setfenv(Camera, LocalPlayer);
				return Camera;
			end
			cors = {};
			mas = Instance.new("Model", game:GetService("Lighting"));
			LocalScript0 = Instance.new("LocalScript");
			LocalScript0.Name = "FreeCamera";
			LocalScript0.Parent = mas;
			table.insert(cors, sandbox(LocalScript0, function()
				local workspace = math.pi;
				local Camera = math.abs;
				local Players = math.clamp;
				local LocalPlayer = math.exp;
				local Character = math.rad;
				local WorldToPoint = math.sign;
				local q = math.sqrt;
				local a = math.tan;
				local GetMouse = game:GetService("ContextActionService");
				local X = game:GetService("Players");
				local f = game:GetService("RunService");
				local s = game:GetService("StarterGui");
				local v = game:GetService("UserInputService");
				local R = X.LocalPlayer;
				if not R then
					(X:GetPropertyChangedSignal("LocalPlayer")):Wait();
					R = X.LocalPlayer;
				end
				local p = workspace.CurrentCamera;
				(workspace:GetPropertyChangedSignal("CurrentCamera")):Connect(function()
					local workspace = workspace.CurrentCamera;
					if workspace then
						p = workspace;
					end
				end);
				local W = Enum.ContextActionPriority.Low.Value;
				local z = Enum.ContextActionPriority.High.Value;
				local M = {
					Enum.KeyCode.LeftShift,
					Enum.KeyCode.P
				};
				local g = Vector3.new(1, 1, 1) * 64;
				local T = Vector2.new(0.75, 1) * 8;
				local r = 300;
				local c = Character(90);
				local t = 1.5;
				local S = 1;
				local e = 4;
				local O = {};
				do
					O.__index = O;
					O.new = function(workspace, Camera)
						local Players = setmetatable({}, O);
						Players.f = workspace;
						Players.p = Camera;
						Players.v = Camera * 0;
						return Players;
					end;
					O.Update = function(Character, Camera, Players)
						local WorldToPoint = Character.f * 2 * workspace;
						local q = Character.p;
						local a = Character.v;
						local GetMouse = Players - q;
						local X = LocalPlayer(-WorldToPoint * Camera);
						local f = Players + (((a * Camera) - (GetMouse * ((WorldToPoint * Camera) + 1))) * X);
						local s = ((WorldToPoint * Camera * ((GetMouse * WorldToPoint) - a)) + a) * X;
						Character.p = f;
						Character.v = s;
						return f;
					end;
					O.Reset = function(Camera, workspace)
						Camera.p = workspace;
						Camera.v = workspace * 0;
					end;
				end
				local j = Vector3.new();
				local w = Vector2.new();
				local V = 0;
				local H = O.new(t, Vector3.new());
				local D = O.new(S, Vector2.new());
				local G = O.new(e, 0);
				local F = {};
				do
					local Character;
					do
						local workspace = 2;
						local q = 0.15;
						local function a(Camera)
							return (LocalPlayer(workspace * Camera) - 1) / (LocalPlayer(workspace) - 1);
						end
						local function GetMouse(workspace)
							return a((workspace - q) / (1 - q));
						end
						function Character(workspace)
							return WorldToPoint(workspace) * Players(GetMouse(Camera(workspace)), 0, 1);
						end
					end
					local q = {
						ButtonX = 0,
						ButtonY = 0,
						DPadDown = 0,
						DPadUp = 0,
						ButtonL2 = 0,
						ButtonR2 = 0,
						Thumbstick1 = Vector2.new(),
						Thumbstick2 = Vector2.new()
					};
					local a = {
						W = 0,
						A = 0,
						S = 0,
						D = 0,
						E = 0,
						Players = 0,
						U = 0,
						H = 0,
						J = 0,
						LocalPlayer = 0,
						I = 0,
						Y = 0,
						Up = 0,
						Down = 0,
						LeftShift = 0,
						RightShift = 0
					};
					local X = {
						Delta = Vector2.new(),
						MouseWheel = 0
					};
					local f = Vector3.new(1, 1, 1);
					local s = Vector3.new(1, 1, 1);
					local R = Vector2.new(1, 1) * (workspace / 64);
					local p = Vector2.new(1, 1) * (workspace / 8);
					local W = 1;
					local M = 0.25;
					local g = 0.75;
					local T = 0.25;
					local r = 1;
					F.Vel = function(workspace)
						r = Players(r + (workspace * (a.Up - a.Down) * g), 0.01, 4);
						local Camera = Vector3.new(Character(q.Thumbstick1.x), Character(q.ButtonR2) - Character(q.ButtonL2), Character(-q.Thumbstick1.y)) * f;
						local LocalPlayer = Vector3.new(((a.D - a.A) + a.LocalPlayer) - a.H, ((a.E - a.Players) + a.I) - a.Y, ((a.S - a.W) + a.J) - a.U) * s;
						local WorldToPoint = v:IsKeyDown(Enum.KeyCode.LeftShift) or v:IsKeyDown(Enum.KeyCode.RightShift);
						return (Camera + LocalPlayer) * r * ((WorldToPoint and T) or 1);
					end;
					F.Pan = function(workspace)
						local Camera = Vector2.new(Character(q.Thumbstick2.y), Character(-q.Thumbstick2.x)) * p;
						local Players = X.Delta * R;
						X.Delta = Vector2.new();
						return Camera + Players;
					end;
					F.Fov = function(workspace)
						local Camera = (q.ButtonX - q.ButtonY) * M;
						local Players = X.MouseWheel * W;
						X.MouseWheel = 0;
						return Camera + Players;
					end;
					do
						local function workspace(workspace, Camera, Players)
							a[Players.KeyCode.Name] = ((Camera == Enum.UserInputState.Begin) and 1) or 0;
							return Enum.ContextActionResult.Sink;
						end
						local function Camera(workspace, Camera, Players)
							q[Players.KeyCode.Name] = ((Camera == Enum.UserInputState.Begin) and 1) or 0;
							return Enum.ContextActionResult.Sink;
						end
						local function Players(workspace, Camera, Players)
							local LocalPlayer = Players.Delta;
							X.Delta = Vector2.new(-LocalPlayer.y, -LocalPlayer.x);
							return Enum.ContextActionResult.Sink;
						end
						local function LocalPlayer(workspace, Camera, Players)
							q[Players.KeyCode.Name] = Players.Position;
							return Enum.ContextActionResult.Sink;
						end
						local function Character(workspace, Camera, Players)
							q[Players.KeyCode.Name] = Players.Position.z;
							return Enum.ContextActionResult.Sink;
						end
						local function WorldToPoint(workspace, Camera, Players)
							X[Players.UserInputType.Name] = -Players.Position.z;
							return Enum.ContextActionResult.Sink;
						end
						local function f(workspace)
							for Camera, Players in pairs(workspace) do
								workspace[Camera] = Players * 0;
							end
						end
						F.StartCapture = function()
							GetMouse:BindActionAtPriority("FreecamKeyboard", workspace, false, z, Enum.KeyCode.W, Enum.KeyCode.U, Enum.KeyCode.A, Enum.KeyCode.H, Enum.KeyCode.S, Enum.KeyCode.J, Enum.KeyCode.D, Enum.KeyCode.LocalPlayer, Enum.KeyCode.E, Enum.KeyCode.I, Enum.KeyCode.Players, Enum.KeyCode.Y, Enum.KeyCode.Up, Enum.KeyCode.Down);
							GetMouse:BindActionAtPriority("FreecamMousePan", Players, false, z, Enum.UserInputType.MouseMovement);
							GetMouse:BindActionAtPriority("FreecamMouseWheel", WorldToPoint, false, z, Enum.UserInputType.MouseWheel);
							GetMouse:BindActionAtPriority("FreecamGamepadButton", Camera, false, z, Enum.KeyCode.ButtonX, Enum.KeyCode.ButtonY);
							GetMouse:BindActionAtPriority("FreecamGamepadTrigger", Character, false, z, Enum.KeyCode.ButtonR2, Enum.KeyCode.ButtonL2);
							GetMouse:BindActionAtPriority("FreecamGamepadThumbstick", LocalPlayer, false, z, Enum.KeyCode.Thumbstick1, Enum.KeyCode.Thumbstick2);
						end;
						F.StopCapture = function()
							r = 1;
							f(q);
							f(a);
							f(X);
							GetMouse:UnbindAction("FreecamKeyboard");
							GetMouse:UnbindAction("FreecamMousePan");
							GetMouse:UnbindAction("FreecamMouseWheel");
							GetMouse:UnbindAction("FreecamGamepadButton");
							GetMouse:UnbindAction("FreecamGamepadTrigger");
							GetMouse:UnbindAction("FreecamGamepadThumbstick");
						end;
					end
				end
				local function A(workspace)
					local Camera = 0.1;
					local Players = p.ViewportSize;
					local LocalPlayer = 2 * a(V / 2);
					local Character = (Players.x / Players.y) * LocalPlayer;
					local WorldToPoint = workspace.rightVector;
					local q = workspace.upVector;
					local GetMouse = workspace.lookVector;
					local X = Vector3.new();
					local f = 512;
					for Players = 0, 1, 0.5 do
						for a = 0, 1, 0.5 do
							local s = (Players - 0.5) * Character;
							local v = (a - 0.5) * LocalPlayer;
							local R = ((WorldToPoint * s) - (q * v)) + GetMouse;
							local p = workspace.p + (R * Camera);
							local W, z = workspace:FindPartOnRay(Ray.new(p, R.unit * f));
							local M = (z - p).magnitude;
							if (f > M) then
								f = M;
								X = R.unit;
							end
						end
					end
					return GetMouse:Dot(X) * f;
				end
				local function l(Camera)
					local LocalPlayer = H:Update(Camera, F.Vel(Camera));
					local WorldToPoint = D:Update(Camera, F.Pan(Camera));
					local GetMouse = G:Update(Camera, F.Fov(Camera));
					local X = q(a(Character(35)) / a(Character(V / 2)));
					V = Players(V + (GetMouse * r * (Camera / X)), 1, 120);
					w = w + (WorldToPoint * T * (Camera / X));
					w = Vector2.new(Players(w.x, -c, c), w.y % (2 * workspace));
					local f = CFrame.new(j) * CFrame.fromOrientation(w.x, w.y, 0) * CFrame.new(LocalPlayer * g * Camera);
					j = f.p;
					p.CFrame = f;
					p.Focus = f * CFrame.new(0, 0, -A(f));
					p.FieldOfView = V;
				end
				local U = {};
				do
					local workspace;
					local Camera;
					local Players;
					local LocalPlayer;
					local Character;
					local WorldToPoint;
					local q = {};
					local a = {
						Backpack = true,
						Chat = true,
						Health = true,
						PlayerList = true
					};
					local GetMouse = {
						BadgesNotificationsActive = true,
						PointsNotificationsActive = true
					};
					U.Push = function()
						for workspace in pairs(a) do
							a[workspace] = s:GetCoreGuiEnabled(Enum.CoreGuiType[workspace]);
							s:SetCoreGuiEnabled(Enum.CoreGuiType[workspace], false);
						end
						for workspace in pairs(GetMouse) do
							GetMouse[workspace] = s:GetCore(workspace);
							s:SetCore(workspace, false);
						end
						local X = R:FindFirstChildOfClass("PlayerGui");
						if X then
							for workspace, Camera in pairs(X:GetChildren()) do
								if (Camera:IsA("ScreenGui") and Camera.Enabled) then
									q[#q + 1] = Camera;
									Camera.Enabled = false;
								end
							end
						end
						WorldToPoint = p.FieldOfView;
						p.FieldOfView = 70;
						Players = p.CameraType;
						p.CameraType = Enum.CameraType.Custom;
						Camera = p.CameraSubject;
						p.CameraSubject = nil;
						Character = p.CFrame;
						LocalPlayer = p.Focus;
						workspace = v.MouseIconEnabled;
						v.MouseIconEnabled = false;
						mouseBehavior = v.MouseBehavior;
						v.MouseBehavior = Enum.MouseBehavior.Default;
					end;
					U.Pop = function()
						for workspace, Camera in pairs(a) do
							s:SetCoreGuiEnabled(Enum.CoreGuiType[workspace], Camera);
						end
						for workspace, Camera in pairs(GetMouse) do
							s:SetCore(workspace, Camera);
						end
						for workspace, Camera in pairs(q) do
							if Camera.Parent then
								Camera.Enabled = true;
							end
						end
						p.FieldOfView = WorldToPoint;
						WorldToPoint = nil;
						p.CameraType = Players;
						Players = nil;
						p.CameraSubject = Camera;
						Camera = nil;
						p.CFrame = Character;
						Character = nil;
						p.Focus = LocalPlayer;
						LocalPlayer = nil;
						v.MouseIconEnabled = workspace;
						workspace = nil;
						v.MouseBehavior = mouseBehavior;
						mouseBehavior = nil;
					end;
				end
				local function Y()
					local workspace = p.CFrame;
					w = Vector2.new(workspace:toEulerAnglesYXZ());
					j = workspace.p;
					V = p.FieldOfView;
					H:Reset(Vector3.new());
					D:Reset(Vector2.new());
					G:Reset(0);
					U.Push();
					f:BindToRenderStep("Freecam", Enum.RenderPriority.Camera.Value, l);
					F.StartCapture();
				end
				local function C()
					F.StopCapture();
					f:UnbindFromRenderStep("Freecam");
					U.Pop();
				end
				do
					local workspace = false;
					local function Camera()
						if workspace then
							C();
						else
							Y();
						end
						workspace = not workspace;
					end
					local function Players(workspace)
						for Camera = 1, #workspace - 1, 1 do
							if not v:IsKeyDown(workspace[Camera]) then
								return;
							end
						end
						Camera();
					end
					local function LocalPlayer(workspace, Camera, LocalPlayer)
						if (Camera == Enum.UserInputState.Begin) then
							if (LocalPlayer.KeyCode == M[#M]) then
								Players(M);
							end
						end
						return Enum.ContextActionResult.Pass;
					end
					GetMouse:BindActionAtPriority("FreecamToggle", LocalPlayer, false, W, M[#M]);
				end
			end));
			for workspace, Camera in pairs(mas:GetChildren()) do
				Camera.Parent = (game:GetService("Players")).LocalPlayer.PlayerGui;
				pcall(function()
					Camera:MakeJoints();
				end);
			end
			mas:Destroy();
			for workspace, Camera in pairs(cors) do
				spawn(function()
					pcall(Camera);
				end);
			end
		end);
		coroutine.resume(coroutine.create(function()
			while wait(1) do
				Library:SetWatermark("Crumbleware | v" .. CrumbleWare .. " | Beta | " .. FPS .. " |");
				Library:SetWatermarkVisibility(Toggles.watermark.Value);
				FPS = 0;
			end
		end));
		SaveManager:LoadAutoloadConfig();
	end);
end)(...);
