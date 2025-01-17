local V2new = Vector2.new
local V3new = Vector3.new
local Drawnew = Drawing.new
local Randomnew = Random.new

repeat
    wait()
until game:IsLoaded()

grm = getrawmetatable(game)
setreadonly(grm, false)
old = grm.__namecall
grm.__namecall = newcclosure(function(self, ...)
    local args = {...}
    if tostring(args[1]) == "TeleportDetect" then
        return
    elseif tostring(args[1]) == "CHECKER_1" then
        return
    elseif tostring(args[1]) == "CHECKER" then
        return
    elseif tostring(args[1]) == "GUI_CHECK" then
        return
    elseif tostring(args[1]) == "OneMoreTime" then
        return
    elseif tostring(args[1]) == "checkingSPEED" then
        return
    elseif tostring(args[1]) == "BANREMOTE" then
        return
    elseif tostring(args[1]) == "PERMAIDBAN" then
        return
    elseif tostring(args[1]) == "KICKREMOTE" then
        return
    elseif tostring(args[1]) == "BR_KICKPC" then
        return
    elseif tostring(args[1]) == "BR_KICKMOBILE" then
        return
    end
    return old(self, ...)
end)

local uis = game:GetService("UserInputService")
local rs = game:GetService("RunService")
local ts = game:GetService("TweenService")
local plrs = game:GetService("Players")
local stats = game:GetService("Stats")

local FOV = Drawing.new("Circle")
FOV.Color = Color3.fromRGB(255, 255, 255)
FOV.Thickness = 1

local library = {
    connections = {},
    accents = {},
    drawings = {},
    hidden = {},
    pointers = {},
    flags = {},
    preloaded_images = {},
    loaded = false
}

makefolder("beanbot")
makefolder("beanbot/Da Hood")
makefolder("beanbot/Da Hood/configs")

local esp_stuff = {}

local r6_dummy = game:GetObjects("rbxassetid://9474737816")[1]
r6_dummy.Head.Face:Destroy()

for i, v in pairs(r6_dummy:GetChildren()) do
    v.Transparency = v.Name == "HumanoidRootPart" and 1 or 0.88
    v.Material = "Neon"
    v.Color = Color3.fromRGB(255, 0, 0)
    v.CanCollide = false
    v.Anchored = false
end

local utility = {}

do
    function utility:Draw(class, offset, properties, hidden)
        hidden = hidden or false

        local draw = Drawing.new(class)
        local fakeDraw = {}
        rawset(fakeDraw, "__OBJECT_EXIST", true)
        setmetatable(fakeDraw, {
            __index = function(self, key)
                if rawget(fakeDraw, "__OBJECT_EXIST") then
                    return draw[key]
                end
            end,
            __newindex = function(self, key, value)
                if rawget(fakeDraw, "__OBJECT_EXIST") then
                    draw[key] = value
                    if key == "Position" then
                        for _, v in pairs(rawget(fakeDraw, "children")) do
                            v.Position = fakeDraw.Position + v.GetOffset()
                        end
                    end
                end
            end
        })
        rawset(fakeDraw, "Remove", function()
            if rawget(fakeDraw, "__OBJECT_EXIST") then
                draw:Remove()
                rawset(fakeDraw, "__OBJECT_EXIST", false)
            end
        end)
        rawset(fakeDraw, "GetType", function()
            return class
        end)
        rawset(fakeDraw, "GetOffset", function()
            return offset or V2new()
        end)
        rawset(fakeDraw, "SetOffset", function(noffset)
            offset = noffset or V2new()

            fakeDraw.Position = properties.Parent.Position + fakeDraw.GetOffset()
        end)
        rawset(fakeDraw, "children", {})
        rawset(fakeDraw, "Lerp", function(instanceTo, instanceTime)
            if not rawget(fakeDraw, "__OBJECT_EXIST") then return end

            local currentTime = 0
            local currentIndex = {}
            local connection
            
            for i,v in pairs(instanceTo) do
                currentIndex[i] = fakeDraw[i]
            end
            
            local function lerp()
                for i,v in pairs(instanceTo) do
                    fakeDraw[i] = ((v - currentIndex[i]) * currentTime / instanceTime) + currentIndex[i]
                end
            end
            
            connection = rs.RenderStepped:Connect(function(delta)
                if currentTime < instanceTime then
                    currentTime = currentTime + delta
                    lerp()
                else
                    connection:Disconnect()
                end
            end)

            table.insert(library.connections, connection)
        end)

        local customProperties = {
            ["Parent"] = function(object)
                table.insert(rawget(object, "children"), fakeDraw)
            end
        }

        if class == "Square" then
            fakeDraw.Thickness = 1
            fakeDraw.Filled = true
        end

        fakeDraw.Visible = library.loaded
        if properties ~= nil then
            for key, value in pairs(properties) do
                if customProperties[key] == nil then
                    fakeDraw[key] = value
                else
                    customProperties[key](value)
                end
            end
            if properties.Parent then
                fakeDraw.Position = properties.Parent.Position + fakeDraw.GetOffset()
            end
            if properties.Parent and properties.From then
                fakeDraw.From = properties.Parent.Position + fakeDraw.GetOffset()
            end
            if properties.Parent and properties.To then
                fakeDraw.To = properties.Parent.Position + fakeDraw.GetOffset()
            end
        end

        if not library.loaded and not hidden then
            fakeDraw.Transparency = 0
        end

        if not hidden then
            table.insert(library.drawings, {fakeDraw, properties["Transparency"] or 1})
        else
            table.insert(library.hidden, {fakeDraw, properties["Transparency"] or 1})
        end

        return fakeDraw
    end

    function utility:ScreenSize()
        return workspace.CurrentCamera.ViewportSize
    end

    function utility:RoundVector(vector)
        return V2new(math.floor(vector.X), math.floor(vector.Y))
    end

    function utility:MouseOverDrawing(object)
        local values = {object.Position, object.Position + object.Size}
        local mouseLocation = uis:GetMouseLocation()
        return mouseLocation.X >= values[1].X and mouseLocation.Y >= values[1].Y and mouseLocation.X <= values[2].X and mouseLocation.Y <= values[2].Y
    end

    function utility:MouseOverPosition(values)
        local mouseLocation = uis:GetMouseLocation()
        return mouseLocation.X >= values[1].X and mouseLocation.Y >= values[1].Y and mouseLocation.X <= values[2].X and mouseLocation.Y <= values[2].Y
    end

    function utility:Image(object, link)
        local data = library.preloaded_images[link] or game:HttpGet(link)
        if library.preloaded_images[link] == nil then
            library.preloaded_images[link] = data
        end
        object.Data = data
    end

    function utility:Connect(connection, func)
        local con = connection:Connect(func)
        table.insert(library.connections, con)
        return con
    end

    function utility:Combine(t1, t2)
        local t3 = {}
        for i, v in pairs(t1) do
            table.insert(t3, v)
        end
        for i, v in pairs(t2) do
            table.insert(t3, v)
        end
        return t3
    end

    function utility:GetTextSize(text, font, size)
        local textlabel = Drawing.new("Text")
        textlabel.Size = size
        textlabel.Font = font
        textlabel.Text = text
        local bounds = textlabel.TextBounds
        textlabel:Remove()
        return bounds
    end

    function utility:RemoveItem(tbl, item)
        local newtbl = {}
        for i, v in pairs(tbl) do
            if v ~= item then
                table.insert(newtbl, v)
            end
        end
        return newtbl
    end

    function utility:CopyTable(tbl)
        local newtbl = {}
        for i, v in pairs(tbl) do
            newtbl[i] = v
        end
        return newtbl
    end

    function utility.EspAddPlayer(plr)
        esp_stuff[plr] = {
            Box = utility:Draw("Square", V2new(), {Visible = false, Filled = false, ZIndex = 2}, true),
            BoxOutline = utility:Draw("Square", V2new(), {Visible = false, Filled = false, Thickness = 3, ZIndex = 1}, true),
            Health = utility:Draw("Square", V2new(), {Visible = false, ZIndex = 2}, true),
            HealthOutline = utility:Draw("Square", V2new(), {Visible = false, ZIndex = 1}, true),
            Name = utility:Draw("Text", V2new(), {Size = 13, Font = 2, Text = plr.Name, Outline = true, Center = true, Visible = false, ZIndex = 1}, true),
        }
    end

    function utility.EspRemovePlayer(plr)
        if esp_stuff[plr] then
            for i, v in pairs(esp_stuff[plr]) do
                v.Remove()
            end
            esp_stuff[plr] = nil
        end
    end
end

for _, plr in pairs(game.Players:GetPlayers()) do
    utility.EspAddPlayer(plr)
end

utility:Connect(game.Players.PlayerAdded, utility.EspAddPlayer)
utility:Connect(game.Players.PlayerRemoving, utility.EspRemovePlayer)


function library:New(args)
    args = args or {}

    local name = args.name or args.Name or "bbot ui"
    local accent1 = args.accent1 or args.Accent1 or Color3.fromRGB(127, 72, 163)
    local accent2 = args.accent2 or args.Accent2 or Color3.fromRGB(87, 32, 123)

    local window = {name = name, tabs = {}, visible = false, fading = false, togglekey = "Insert", dragging = false, startPos = nil, content = {dropdown = nil, colorpicker = nil, keybind = nil}}
    if Keybind then
        window.togglekey = Keybind
    end

    local window_frame = utility:Draw("Square", nil, {
        Color = Color3.fromRGB(35, 35, 35),
        Size = V2new(496, 596),
        Position = utility:RoundVector(utility:ScreenSize() / 2) - V2new(248, 298)
    })

    utility:Draw("Square", V2new(-1, -1), {
        Color = Color3.fromRGB(20, 20, 20),
        Size = window_frame.Size + V2new(2, 2),
        Filled = false,
        Parent = window_frame
    })

    utility:Draw("Square", V2new(-2, -2), {
        Color = Color3.fromRGB(0, 0, 0),
        Size = window_frame.Size + V2new(4, 4),
        Filled = false,
        Parent = window_frame
    })

    table.insert(library.accents, utility:Draw("Square", V2new(0, 1), {
        Color = accent1,
        Size = V2new(window_frame.Size.X, 1),
        Parent = window_frame
    }))

    table.insert(library.accents, utility:Draw("Square", V2new(0, 2), {
        Color = accent2,
        Size = V2new(window_frame.Size.X, 1),
        Parent = window_frame
    }))

    utility:Draw("Square", V2new(0, 3), {
        Color = Color3.fromRGB(20, 20, 20),
        Size = V2new(window_frame.Size.X, 1),
        Parent = window_frame
    })

    local title = utility:Draw("Text", V2new(4, 6), {
        Color = Color3.fromRGB(255, 255, 255),
        Outline = true,
        Size = 13,
        Font = 2,
        Text = name,
        Parent = window_frame
    })

    local tabs_frame = utility:Draw("Square", V2new(8, 23), {
        Color = Color3.fromRGB(35, 35, 35),
        Size = V2new(480, 566),
        Parent = window_frame
    })

    utility:Draw("Square", V2new(-1, -1), {
        Color = Color3.fromRGB(20, 20, 20),
        Size = tabs_frame.Size + V2new(2, 2),
        Filled = false,
        Parent = tabs_frame
    })

    utility:Draw("Square", V2new(-2, -2), {
        Color = Color3.fromRGB(0, 0, 0),
        Size = tabs_frame.Size + V2new(4, 4),
        Filled = false,
        Parent = tabs_frame
    })

    table.insert(library.accents, utility:Draw("Square", V2new(0, 1), {
        Color = accent1,
        Size = V2new(tabs_frame.Size.X, 1),
        Parent = tabs_frame
    }))

    table.insert(library.accents, utility:Draw("Square", V2new(0, 2), {
        Color = accent2,
        Size = V2new(tabs_frame.Size.X, 1),
        Parent = tabs_frame
    }))

    utility:Draw("Square", V2new(0, 3), {
        Color = Color3.fromRGB(20, 20, 20),
        Size = V2new(tabs_frame.Size.X, 1),
        Parent = tabs_frame
    })

    local tab_content = utility:Draw("Square", V2new(1, 37), {
        Color = Color3.fromRGB(35, 35, 35),
        Size = V2new(478, 528),
        Parent = tabs_frame
    })

    utility:Draw("Square", V2new(-1, -1), {
        Color = Color3.fromRGB(20, 20, 20),
        Size = tab_content.Size + V2new(2, 2),
        Filled = false,
        Parent = tab_content
    })

    utility:Connect(uis.InputBegan, function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 and utility:MouseOverPosition({window_frame.Position, window_frame.Position + V2new(window_frame.Size.X, 22)}) and window_frame.Visible and not window.fading then
            window.dragging = true
            window.startPos = uis:GetMouseLocation() - window_frame.Position
        elseif input.UserInputType == Enum.UserInputType.Keyboard then
            if input.KeyCode.Name == window.togglekey then
                window:Toggle()
            end
        end
    end)

    utility:Connect(uis.InputEnded, function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            window.dragging = false
        end
    end)

    utility:Connect(rs.RenderStepped, function()
        if window.dragging then
            window_frame.Position = uis:GetMouseLocation() - window.startPos
        end
    end)

    function window:Toggle()
        if window.fading then return end
        window:CloseContent()
        if window_frame.Visible then
            for i, v in pairs(library.drawings) do
                v[1].Lerp({Transparency = 0}, 0.25)
                delay(0.25, function()
                    v[1].Visible = false
                end)
            end
            window.fading = true
            delay(0.25, function()
                window.fading = false
            end)
        else
            local lerp_tick = tick()
            for i, v in pairs(library.drawings) do
                v[1].Visible = true
                v[1].Lerp({Transparency = v[2]}, 0.25)
            end
            local connection connection = utility:Connect(rs.RenderStepped, function()
                if tick()-lerp_tick < 1/4 then
                    window:UpdateTabs()
                else
                    connection:Disconnect()
                end
            end)
            window.fading = true
            delay(0.25, function()
                window.fading = false
                window:UpdateTabs()
            end)
        end
        window.visible = not window.visible
    end

    function window:Tab(args)
        args = args or {}

        local name = args.name or args.Name or "Tab"

        local tab = {name = name, sections = {}, sectionOffsets = {left = 0, right = 0}, open = false, instances = {}}

        if #window.tabs >= 5 then return end

        local tab_frame = utility:Draw("Square", V2new(1 + (96 * #window.tabs), 5), {
            Color = Color3.fromRGB(30, 30, 30),
            Size = V2new(94, 30),
            Parent = tabs_frame
        })

        local outline = utility:Draw("Square", V2new(-1, -1), {
            Color = Color3.fromRGB(20, 20, 20),
            Size = tab_frame.Size + V2new(2, 2),
            Filled = false,
            Parent = tab_frame
        })

        local tab_gradient = utility:Draw("Image", V2new(), {
            Size = tab_frame.Size,
            Visible = false,
            Transparency = 0.65,
            Parent = tab_frame
        })

        local tab_title = utility:Draw("Text", V2new(47, 7), {
            Color = Color3.fromRGB(255, 255, 255),
            Outline = true,
            Size = 13,
            Font = 2,
            Text = name,
            Center = true,
            Parent = tab_frame
        })

        local outline_hider = utility:Draw("Square", V2new(0, 30), {
            Color = Color3.fromRGB(35, 35, 35),
            Size = V2new(tab_frame.Size.X, 2),
            Visible = false,
            Parent = tab_frame
        })

        utility:Image(tab_gradient, "https://i.imgur.com/5hmlrjX.png")

        utility:Connect(uis.InputBegan, function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 and utility:MouseOverDrawing(tab_frame) and not window.fading then
                window:SetTab(name)
            end
        end)

        tab.instances = {tab_frame, outline, tab_gradient, tab_title, outline_hider}

        table.insert(window.tabs, tab)

        function tab:Show()
            window:CloseContent()

            tab_frame.Color = Color3.fromRGB(50, 50, 50)
            tab_gradient.Visible = true
            outline_hider.Visible = true

            for i, v in pairs(tab.sections) do
                for i2, v2 in pairs(v.instances) do
                    v2.Visible = true
                end
            end
        end

        function tab:Hide()
            window:CloseContent()

            tab_frame.Color = Color3.fromRGB(30, 30, 30)
            tab_gradient.Visible = false
            outline_hider.Visible = false

            for i, v in pairs(tab.sections) do
                for i2, v2 in pairs(v.instances) do
                    v2.Visible = false
                end
            end
        end

        function tab:GetSecionPosition(side)
            local default = V2new(side == "left" and 9 or side == "right" and 245, 9 + tab.sectionOffsets[side])
            return default
        end

        function tab:Section(args)
            args = args or {}

            local name = args.name or args.Name or "section"
            local side = (args.side or args.Side or "left"):lower()

            local section = {name = name, side = side, offset = 0, instances = {}}

            local section_frame = utility:Draw("Square", tab:GetSecionPosition(side), {
                Color = Color3.fromRGB(35, 35, 35),
                Size = V2new(226, 15),
                Parent = tab_content
            })

            local section_inline = utility:Draw("Square", V2new(-1, -1), {
                Color = Color3.fromRGB(20, 20, 20),
                Size = section_frame.Size + V2new(2, 2),
                Filled = false,
                Parent = section_frame
            })

            local section_outline = utility:Draw("Square", V2new(-2, -2), {
                Color = Color3.fromRGB(0, 0, 0),
                Size = section_frame.Size + V2new(4, 4),
                Filled = false,
                Parent = section_frame
            })

            local section_title = utility:Draw("Text", V2new(4, 4), {
                Color = Color3.fromRGB(255, 255, 255),
                Outline = true,
                Size = 13,
                Font = 2,
                Text = name,
                Parent = section_frame
            })

            local section_accent1 = utility:Draw("Square", V2new(0, 1), {
                Color = accent1,
                Size = V2new(section_frame.Size.X, 1),
                Parent = section_frame
            })

            table.insert(library.accents, section_accent1)
        
            local section_accent2 = utility:Draw("Square", V2new(0, 2), {
                Color = accent2,
                Size = V2new(section_frame.Size.X, 1),
                Parent = section_frame
            })

            table.insert(library.accents, section_accent2)
        
            local section_inline2 = utility:Draw("Square", V2new(0, 3), {
                Color = Color3.fromRGB(20, 20, 20),
                Size = V2new(section_frame.Size.X, 1),
                Parent = section_frame
            })

            tab.sectionOffsets[side] = tab.sectionOffsets[side] + 27

            section.instances = {section_frame, section_inline, section_outline, section_title, section_accent1, section_accent2, section_inline2}

            table.insert(tab.sections, section)

            function section:Update()
                task.wait()
                section_frame.Size = V2new(226, 28 + section.offset)
                section_inline.Size = section_frame.Size + V2new(2, 2)
                section_outline.Size = section_frame.Size + V2new(4, 4)
            end

            function section:Toggle(args)
                args = args or {}

                local name = args.name or args.Name or "toggle"
                local default = args.default or args.Default or args.def or args.Def or false
                local callback = args.callback or args.Callback or function() end
                local flag = args.flag or args.Flag or ""
                local pointer = args.pointer or args.Pointer or tab.name .. "_" .. section.name .. "_" .. name

                local toggle = {name = name, state = false, colorpicker = {}, keybind = {}}

                local toggle_frame = utility:Draw("Square", V2new(8, 25 + section.offset), {
                    Color = Color3.fromRGB(50, 50, 50),
                    Size = V2new(8, 8),
                    Parent = section_frame
                })

                table.insert(library.accents, toggle_frame)

                local toggle_inline = utility:Draw("Square", V2new(-1, -1), {
                    Color = Color3.fromRGB(0, 0, 0),
                    Size = toggle_frame.Size + V2new(2, 2),
                    Filled = false,
                    Parent = toggle_frame
                })

                local toggle_outline = utility:Draw("Square", V2new(-2, -2), {
                    Color = Color3.fromRGB(30, 30, 30),
                    Size = toggle_frame.Size + V2new(4, 4),
                    Filled = false,
                    Parent = toggle_frame
                })

                local toggle_gradient = utility:Draw("Image", V2new(), {
                    Size = toggle_frame.Size,
                    Transparency = 0.8,
                    Parent = toggle_frame
                })

                local toggle_title = utility:Draw("Text", V2new(15, -3), {
                    Color = Color3.fromRGB(255, 255, 255),
                    Outline = true,
                    Size = 13,
                    Font = 2,
                    Text = name,
                    Parent = toggle_frame
                })

                utility:Image(toggle_gradient, "https://i.imgur.com/5hmlrjX.png")

                function toggle:Set(value)
                    toggle.state = value
                    toggle_frame.Color = toggle.state == true and accent1 or Color3.fromRGB(50, 50, 50)

                    if flag ~= "" then
                        library.flags[flag] = toggle.state
                    end

                    callback(toggle.state)
                end

                function toggle:Get()
                    return toggle.state
                end

                function toggle:Keybind(args)
                    if #toggle.colorpicker > 0 then return end

                    args = args or {}

                    local kname = args.name or args.Name or args.kname or args.Kname or toggle.name
                    local default = (args.default or args.Default or args.def or args.Def or "..."):upper()
                    local kpointer = args.pointer or args.Pointer or tab.name .. "_" .. section.name .. "_" .. toggle.name .. "_keybind"
                    local callback = args.callback or args.Callback or function() end

                    local keybind = {name = kname, value = default, binding = false, mode = "Toggle", content = {}}

                    local keybind_frame = utility:Draw("Square", V2new(171, -1), {
                        Color = Color3.fromRGB(25, 25, 25),
                        Size = V2new(40, 12),
                        Parent = toggle_frame
                    })

                    local keybind_inline = utility:Draw("Square", V2new(-1, -1), {
                        Color = Color3.fromRGB(0, 0, 0),
                        Size = keybind_frame.Size + V2new(2, 2),
                        Filled = false,
                        Parent = keybind_frame
                    })
    
                    local keybind_outline = utility:Draw("Square", V2new(-2, -2), {
                        Color = Color3.fromRGB(30, 30, 30),
                        Size = keybind_frame.Size + V2new(4, 4),
                        Filled = false,
                        Parent = keybind_frame
                    })

                    local keybind_value = utility:Draw("Text", V2new(21, -1), {
                        Color = Color3.fromRGB(255, 255, 255),
                        Outline = true,
                        Size = 13,
                        Font = 2,
                        Text = default,
                        Center = true,
                        Parent = keybind_frame
                    })

                    local shortenedInputs = {["Insert"] = "INS", ["Home"] = "HOME", ["LeftAlt"] = "LALT", ["LeftControl"] = "LC", ["LeftShift"] = "LS", ["RightAlt"] = "RALT", ["RightControl"] = "RC", ["RightShift"] = "RS", ["CapsLock"] = "CAPS", ["Delete"] = "DEL", ["PageUp"] = "PUP", ["PageDown"] = "PDO", ["Space"] = "SPACE"}

                    function keybind:Set(value)
                        keybind.value = value
                        keybind_value.Text = keybind.value
                        callback(keybind.value)
                    end

                    function keybind:Get()
                        return keybind.value
                    end

                    utility:Connect(uis.InputBegan, function(input)
                        if not keybind.binding then
                            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                                if not window:MouseOverContent() and not window.fading and tab.open then
                                    if #keybind.content > 0 then
                                        window:CloseContent()
                                        keybind.content = {}
                                    end
                                    if utility:MouseOverDrawing(keybind_frame) then
                                        keybind.binding = true
                                        keybind_value.Text = "..."
                                    end
                                elseif #keybind.content > 0 and window:MouseOverContent() and not window.fading and tab.open then
                                    for i, v in pairs({"Always", "Hold", "Toggle"}) do
                                        if utility:MouseOverPosition({keybind.content[1].Position + V2new(0, 15 * (i - 1)), keybind.content[1].Position + V2new(keybind.content[1].Size.X, 15 * i )}) then
                                            keybind.mode = v
                                            keybind.content[4 + i].Color = accent1
                                        else
                                            keybind.content[4 + i].Color = Color3.fromRGB(255, 255, 255)
                                        end
                                    end
                                end
                            elseif input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode.Name == keybind.value then
                                if #keybind.content > 0 then
                                    window:CloseContent()
                                    keybind.content = {}
                                end
                                if keybind.mode == "Toggle" then
                                    toggle:Set(not toggle.state)
                                else
                                    toggle:Set(true)
                                end
                                if library.loaded then
                                    if toggle.state then
                                        window.keybinds:Add(string.format("[%s] " .. section.name .. ": " .. keybind.name, shortenedInputs[keybind.value] or keybind.value:upper()))
                                    else
                                        window.keybinds:Remove(string.format("[%s] " .. section.name .. ": " .. keybind.name, shortenedInputs[keybind.value] or keybind.value:upper()))
                                    end
                                end
                            elseif input.UserInputType == Enum.UserInputType.MouseButton2 then
                                if utility:MouseOverDrawing(keybind_frame) and not window:MouseOverContent() and not window.fading and tab.open then
                                    local keybind_open_frame = utility:Draw("Square", V2new(45, -17), {
                                        Color = Color3.fromRGB(50, 50, 50),
                                        Size = V2new(68, 45),
                                        Parent = keybind_frame
                                    })

                                    local keybind_open_inline = utility:Draw("Square", V2new(-1, -1), {
                                        Color = Color3.fromRGB(20, 20, 20),
                                        Size = keybind_open_frame.Size + V2new(2, 2),
                                        Filled = false,
                                        Parent = keybind_open_frame
                                    })

                                    local keybind_open_outline = utility:Draw("Square", V2new(-2, -2), {
                                        Color = Color3.fromRGB(0, 0, 0),
                                        Size = keybind_open_frame.Size + V2new(4, 4),
                                        Filled = false,
                                        Parent = keybind_open_frame
                                    })

                                    local keybind_open_gradient = utility:Draw("Image", V2new(), {
                                        Size = keybind_open_frame.Size,
                                        Transparency = 0.65,
                                        Parent = keybind_open_frame
                                    })

                                    utility:Image(keybind_open_gradient, "https://i.imgur.com/5hmlrjX.png")

                                    keybind.content = {keybind_open_frame, keybind_open_inline, keybind_open_outline, keybind_open_gradient}

                                    for i, v in pairs({"Always", "Hold", "Toggle"}) do
                                        local mode = utility:Draw("Text", V2new(34, (15 * (i-1))), {
                                            Color = keybind.mode == v and accent1 or Color3.fromRGB(255, 255, 255),
                                            Outline = true,
                                            Size = 13,
                                            Font = 2,
                                            Text = v,
                                            Center = true,
                                            Parent = keybind_open_frame
                                        })

                                        table.insert(keybind.content, mode)
                                    end

                                    window.content.keybind = keybind.content
                                end 
                            end
                        else
                            if input.UserInputType == Enum.UserInputType.Keyboard then
                                if input.KeyCode.Name ~= "Escape" and input.KeyCode.Name ~= "Backspace" then
                                    keybind.binding = false
                                    keybind.value = input.KeyCode.Name
                                    keybind_value.Text = shortenedInputs[keybind.value] or keybind.value:upper()
                                else
                                    keybind.binding = false
                                    keybind_value.Text = shortenedInputs[keybind.value] or keybind.value:upper()
                                end
                            end
                        end
                    end)

                    utility:Connect(uis.InputEnded, function(input)
                        if not keybind.binding and input.UserInputType == Enum.UserInputType.Keyboard and keybind.mode == "Hold" and input.KeyCode.Name == keybind.value then
                            toggle:Set(false)
                            if library.loaded then
                                window.keybinds:Remove(string.format("[%s] " .. section.name .. ": " .. keybind.name, shortenedInputs[keybind.value] or keybind.value:upper()))
                            end
                        end
                    end)

                    toggle.keybind = keybind

                    library.pointers[pointer] = keybind

                    section.instances = utility:Combine(section.instances, {keybind_frame, keybind_inline, keybind_outline, keybind_value})
                end

                function toggle:Colorpicker(args)
                    if #toggle.keybind > 0 then return end

                    args = args or {}

                    local cname = args.name or args.Name or "colorpicker"
                    local default = args.default or args.Default or args.def or args.Def or Color3.fromRGB(255, 0, 0)
                    local flag = args.flag or args.Flag or ""
                    local pointer = args.pointer or args.Pointer or tab.name .. "_" .. section.name .. "_" .. toggle.name .. "_colorpicker"
                    local callback = args.callback or args.Callback or function() end

                    local colorpicker = {name = cname, value = {default:ToHSV()}, tempvalue = {}, brightness = {100, 0}, holding = {hue = false, brightness = false, color = false}, content = {}}

                    if flag ~= "" then
                        library.flags[flag] = default
                    end

                    local colorpicker_color = utility:Draw("Square", V2new(section_frame.Size.X - 45, -1), {
                        Color = default,
                        Size = V2new(24, 10),
                        Parent = toggle_frame
                    })

                    local colorpciker_inline1 = utility:Draw("Square", V2new(), {
                        Color = Color3.fromRGB(0, 0, 0),
                        Size = colorpicker_color.Size,
                        Transparency = 0.3,
                        Filled = false,
                        Parent = colorpicker_color
                    })

                    local colorpciker_inline2 = utility:Draw("Square", V2new(1, 1), {
                        Color = Color3.fromRGB(0, 0, 0),
                        Size = colorpicker_color.Size - V2new(2, 2),
                        Transparency = 0.3,
                        Filled = false,
                        Parent = colorpicker_color
                    })

                    local colorpicker_outline = utility:Draw("Square", V2new(-1, -1), {
                        Color = Color3.fromRGB(0, 0, 0),
                        Size = colorpicker_color.Size + V2new(2, 2),
                        Filled = false,
                        Parent = colorpicker_color
                    })

                    function colorpicker:Set(value)
                        if typeof(value) == "Color3" then
                            value = {value:ToHSV()}
                        end

                        colorpicker.value = value
                        colorpicker_color.Color = Color3.fromHSV(unpack(colorpicker.value))

                        if flag ~= "" then
                            library.flags[flag] = Color3.fromHSV(unpack(colorpicker.value))
                        end

                        callback(Color3.fromHSV(unpack(colorpicker.value)))
                    end

                    function colorpicker:Get()
                        return Color3.fromHSV(unpack(colorpicker.value))
                    end

                    utility:Connect(uis.InputBegan, function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            if #colorpicker.content == 0 and utility:MouseOverDrawing(colorpicker_color) and not window:MouseOverContent() and not window.fading and tab.open then
                                colorpicker.tempvalue = colorpicker.value
                                colorpicker.brightness[2] = 0
                                
                                local colorpicker_open_frame = utility:Draw("Square", V2new(12, 5), {
                                    Color = Color3.fromRGB(35, 35, 35),
                                    Size = V2new(276, 207),
                                    Parent = colorpicker_color
                                })

                                local colorpicker_open_inline = utility:Draw("Square", V2new(-1, -1), {
                                    Color = Color3.fromRGB(20, 20, 20),
                                    Size = colorpicker_open_frame.Size + V2new(2, 2),
                                    Filled = false,
                                    Parent = colorpicker_open_frame
                                })

                                local colorpicker_open_outline = utility:Draw("Square", V2new(-2, -2), {
                                    Color = Color3.fromRGB(0, 0, 0),
                                    Size = colorpicker_open_frame.Size + V2new(4, 4),
                                    Filled = false,
                                    Parent = colorpicker_open_frame
                                })

                                local colorpicker_open_accent1 = utility:Draw("Square", V2new(0, 1), {
                                    Color = accent1,
                                    Size = V2new(colorpicker_open_frame.Size.X, 1),
                                    Parent = colorpicker_open_frame
                                })

                                table.insert(library.accents, colorpicker_open_accent1)
                            
                                local colorpicker_open_accent2 = utility:Draw("Square", V2new(0, 2), {
                                    Color = accent2,
                                    Size = V2new(colorpicker_open_frame.Size.X, 1),
                                    Parent = colorpicker_open_frame
                                })

                                table.insert(library.accents, colorpicker_open_accent2)
                            
                                local colorpicker_open_inline2 = utility:Draw("Square", V2new(0, 3), {
                                    Color = Color3.fromRGB(20, 20, 20),
                                    Size = V2new(colorpicker_open_frame.Size.X, 1),
                                    Parent = colorpicker_open_frame
                                })

                                local colorpicker_open_title = utility:Draw("Text", V2new(5, 6), {
                                    Color = Color3.fromRGB(255, 255, 255),
                                    Outline = true,
                                    Size = 13,
                                    Font = 2,
                                    Text = colorpicker.name,
                                    Parent = colorpicker_open_frame
                                })

                                local colorpicker_open_apply = utility:Draw("Text", V2new(232, 187), {
                                    Color = Color3.fromRGB(255, 255, 255),
                                    Outline = true,
                                    Size = 13,
                                    Font = 2,
                                    Text = "[ Apply ]",
                                    Center = true,
                                    Parent = colorpicker_open_frame
                                })

                                local colorpicker_open_color = utility:Draw("Square", V2new(10, 23), {
                                    Color = Color3.fromHSV(colorpicker.value[1], 1, 1),
                                    Size = V2new(156, 156),
                                    Parent = colorpicker_open_frame
                                })

                                local colorpicker_open_color_image = utility:Draw("Image", V2new(), {
                                    Size = colorpicker_open_color.Size,
                                    Parent = colorpicker_open_color
                                })

                                local colorpicker_open_color_inline = utility:Draw("Square", V2new(-1, -1), {
                                    Color = Color3.fromRGB(0, 0, 0),
                                    Size = colorpicker_open_color.Size + V2new(2, 2),
                                    Filled = false,
                                    Parent = colorpicker_open_color
                                })

                                local colorpicker_open_color_outline = utility:Draw("Square", V2new(-2, -2), {
                                    Color = Color3.fromRGB(30, 30, 30),
                                    Size = colorpicker_open_color.Size + V2new(4, 4),
                                    Filled = false,
                                    Parent = colorpicker_open_color
                                })

                                local colorpicker_open_brightness_image = utility:Draw("Image", V2new(10, 189), {
                                    Size = V2new(156, 10),
                                    Parent = colorpicker_open_frame
                                })

                                local colorpicker_open_brightness_inline = utility:Draw("Square", V2new(-1, -1), {
                                    Color = Color3.fromRGB(0, 0, 0),
                                    Size = colorpicker_open_brightness_image.Size + V2new(2, 2),
                                    Filled = false,
                                    Parent = colorpicker_open_brightness_image
                                })

                                local colorpicker_open_brightness_outline = utility:Draw("Square", V2new(-2, -2), {
                                    Color = Color3.fromRGB(30, 30, 30),
                                    Size = colorpicker_open_brightness_image.Size + V2new(4, 4),
                                    Filled = false,
                                    Parent = colorpicker_open_brightness_image
                                })

                                local colorpicker_open_hue_image = utility:Draw("Image", V2new(176, 23), {
                                    Size = V2new(10, 156),
                                    Parent = colorpicker_open_frame
                                })

                                local colorpicker_open_hue_inline = utility:Draw("Square", V2new(-1, -1), {
                                    Color = Color3.fromRGB(0, 0, 0),
                                    Size = colorpicker_open_hue_image.Size + V2new(2, 2),
                                    Filled = false,
                                    Parent = colorpicker_open_hue_image
                                })

                                local colorpicker_open_hue_outline = utility:Draw("Square", V2new(-2, -2), {
                                    Color = Color3.fromRGB(30, 30, 30),
                                    Size = colorpicker_open_hue_image.Size + V2new(4, 4),
                                    Filled = false,
                                    Parent = colorpicker_open_hue_image
                                })

                                local colorpicker_open_newcolor_title = utility:Draw("Text", V2new(196, 23), {
                                    Color = Color3.fromRGB(255, 255, 255),
                                    Outline = true,
                                    Size = 13,
                                    Font = 2,
                                    Text = "New color",
                                    Parent = colorpicker_open_frame
                                })

                                local colorpicker_open_newcolor_image = utility:Draw("Image", V2new(197, 37), {
                                    Size = V2new(71, 36),
                                    Parent = colorpicker_open_frame
                                })

                                local colorpicker_open_newcolor_inline = utility:Draw("Square", V2new(-1, -1), {
                                    Color = Color3.fromRGB(0, 0, 0),
                                    Size = colorpicker_open_newcolor_image.Size + V2new(2, 2),
                                    Filled = false,
                                    Parent = colorpicker_open_newcolor_image
                                })

                                local colorpicker_open_newcolor_outline = utility:Draw("Square", V2new(-2, -2), {
                                    Color = Color3.fromRGB(30, 30, 30),
                                    Size = colorpicker_open_newcolor_image.Size + V2new(4, 4),
                                    Filled = false,
                                    Parent = colorpicker_open_newcolor_image
                                })

                                local colorpicker_open_newcolor = utility:Draw("Square", V2new(2, 2), {
                                    Color = Color3.fromHSV(unpack(colorpicker.value)),
                                    Size = colorpicker_open_newcolor_image.Size - V2new(4, 4),
                                    Transparency = 0.4,
                                    Parent = colorpicker_open_newcolor_image
                                })

                                local colorpicker_open_oldcolor_title = utility:Draw("Text", V2new(196, 76), {
                                    Color = Color3.fromRGB(255, 255, 255),
                                    Outline = true,
                                    Size = 13,
                                    Font = 2,
                                    Text = "Old color",
                                    Parent = colorpicker_open_frame
                                })

                                local colorpicker_open_oldcolor_image = utility:Draw("Image", V2new(197, 91), {
                                    Size = V2new(71, 36),
                                    Parent = colorpicker_open_frame
                                })

                                local colorpicker_open_oldcolor_inline = utility:Draw("Square", V2new(-1, -1), {
                                    Color = Color3.fromRGB(0, 0, 0),
                                    Size = colorpicker_open_oldcolor_image.Size + V2new(2, 2),
                                    Filled = false,
                                    Parent = colorpicker_open_oldcolor_image
                                })

                                local colorpicker_open_oldcolor_outline = utility:Draw("Square", V2new(-2, -2), {
                                    Color = Color3.fromRGB(30, 30, 30),
                                    Size = colorpicker_open_oldcolor_image.Size + V2new(4, 4),
                                    Filled = false,
                                    Parent = colorpicker_open_oldcolor_image
                                })

                                local colorpicker_open_oldcolor = utility:Draw("Square", V2new(2, 2), {
                                    Color = Color3.fromHSV(unpack(colorpicker.value)),
                                    Size = colorpicker_open_oldcolor_image.Size - V2new(4, 4),
                                    Transparency = 0.4,
                                    Parent = colorpicker_open_oldcolor_image
                                })

                                local colorpicker_open_color_holder = utility:Draw("Square", V2new(colorpicker_open_color_image.Size.X - 5, 0), {
                                    Color = Color3.fromRGB(255, 255, 255),
                                    Size = V2new(5, 5),
                                    Filled = false,
                                    Parent = colorpicker_open_color_image
                                })

                                local colorpicker_open_color_holder_outline = utility:Draw("Square", V2new(-1, -1), {
                                    Color = Color3.fromRGB(0, 0, 0),
                                    Size = colorpicker_open_color_holder.Size + V2new(2, 2),
                                    Filled = false,
                                    Parent = colorpicker_open_color_holder
                                })

                                local colorpicker_open_hue_holder = utility:Draw("Square", V2new(-1, 0), {
                                    Color = Color3.fromRGB(255, 255, 255),
                                    Size = V2new(12, 3),
                                    Filled = false,
                                    Parent = colorpicker_open_hue_image
                                })

                                colorpicker_open_hue_holder.Position = V2new(colorpicker_open_hue_image.Position.X-1, colorpicker_open_hue_image.Position.Y + colorpicker.tempvalue[1] * colorpicker_open_hue_image.Size.Y)

                                local colorpicker_open_hue_holder_outline = utility:Draw("Square", V2new(-1, -1), {
                                    Color = Color3.fromRGB(0, 0, 0),
                                    Size = colorpicker_open_hue_holder.Size + V2new(2, 2),
                                    Filled = false,
                                    Parent = colorpicker_open_hue_holder
                                })

                                local colorpicker_open_brightness_holder = utility:Draw("Square", V2new(colorpicker_open_brightness_image.Size.X, -1), {
                                    Color = Color3.fromRGB(255, 255, 255),
                                    Size = V2new(3, 12),
                                    Filled = false,
                                    Parent = colorpicker_open_brightness_image
                                })

                                colorpicker_open_brightness_holder.Position = V2new(colorpicker_open_brightness_image.Position.X + colorpicker_open_brightness_image.Size.X * (colorpicker.brightness[1] / 100), colorpicker_open_brightness_image.Position.Y-1)

                                local colorpicker_open_brightness_holder_outline = utility:Draw("Square", V2new(-1, -1), {
                                    Color = Color3.fromRGB(0, 0, 0),
                                    Size = colorpicker_open_brightness_holder.Size + V2new(2, 2),
                                    Filled = false,
                                    Parent = colorpicker_open_brightness_holder
                                })

                                utility:Image(colorpicker_open_color_image, "https://i.imgur.com/wpDRqVH.png")
                                utility:Image(colorpicker_open_brightness_image, "https://tr.rbxcdn.com/cf80cdea88fd9bbdb4037ab352260726/420/420/Image/Png")
                                utility:Image(colorpicker_open_hue_image, "https://i.imgur.com/iEOsHFv.png")
                                utility:Image(colorpicker_open_newcolor_image, "https://images-ext-1.discordapp.net/external/Nc7u8ZAc9yYabSDkX2zn48MdXjh0BL3KswXDknMm97w/https/media.discordapp.net/attachments/942749250897477662/980791504954093588/unknown.png")
                                utility:Image(colorpicker_open_oldcolor_image, "https://images-ext-1.discordapp.net/external/Nc7u8ZAc9yYabSDkX2zn48MdXjh0BL3KswXDknMm97w/https/media.discordapp.net/attachments/942749250897477662/980791504954093588/unknown.png")

                                colorpicker.content = {colorpicker_open_frame, colorpicker_open_inline, colorpicker_open_outline, colorpicker_open_accent1, colorpicker_open_accent2, colorpicker_open_inline2, colorpicker_open_title, colorpicker_open_apply,
                                colorpicker_open_color, colorpicker_open_color_image, colorpicker_open_color_inline, colorpicker_open_color_outline, colorpicker_open_brightness_image, colorpicker_open_brightness_inline, colorpicker_open_brightness_outline,
                                colorpicker_open_hue_image, colorpicker_open_hue_inline, colorpicker_open_hue_outline, colorpicker_open_newcolor_title, colorpicker_open_newcolor_image, colorpicker_open_newcolor_inline, colorpicker_open_newcolor_outline,
                                colorpicker_open_newcolor, colorpicker_open_oldcolor_title, colorpicker_open_oldcolor_image, colorpicker_open_oldcolor_inline, colorpicker_open_oldcolor_outline, colorpicker_open_oldcolor, colorpicker_open_hue_holder_outline,
                                colorpicker_open_brightness_holder_outline, colorpicker_open_color_holder_outline, colorpicker_open_color_holder, colorpicker_open_hue_holder, colorpicker_open_brightness_holder}

                                window.content.colorpicker = colorpicker.content

                            elseif #colorpicker.content > 0 and not window:MouseOverContent() and not window.fading and tab.open then
                                window:CloseContent()
                                colorpicker.content = {}
                                for i, v in pairs(colorpicker.holding) do
                                    colorpicker.holding[i] = false
                                end
                            elseif #colorpicker.content > 0 and window:MouseOverContent() and not window.fadign and tab.open then
                                if utility:MouseOverDrawing(colorpicker.content[10]) then
                                    local colorx = math.clamp(uis:GetMouseLocation().X - colorpicker.content[10].Position.X, 0, colorpicker.content[10].Position.X) /colorpicker.content[10].Size.X
                                    local colory = math.clamp(uis:GetMouseLocation().Y - colorpicker.content[10].Position.Y, 0, colorpicker.content[10].Position.Y) / colorpicker.content[10].Size.Y
                                    local s = colorx
                                    local v = (colorpicker.brightness[1] / 100) - colory

                                    colorpicker.brightness[2] = colory

                                    colorpicker.tempvalue = {colorpicker.tempvalue[1], s, v}

                                    local minPos = V2new(colorpicker.content[10].Position.X, colorpicker.content[10].Position.Y)
                                    local maxPos = V2new(colorpicker.content[10].Position.X + colorpicker.content[10].Size.X - 5, colorpicker.content[10].Position.Y + colorpicker.content[10].Size.Y - 5)
                                    local holderPos = uis:GetMouseLocation()
                                    if holderPos.X > maxPos.X then
                                        holderPos = V2new(maxPos.X, holderPos.Y)
                                    end 
                                    if holderPos.Y > maxPos.Y then
                                        holderPos = V2new(holderPos.X, maxPos.Y)
                                    end
                                    if holderPos.X < minPos.X then
                                        holderPos = V2new(minPos.X, holderPos.Y)
                                    end 
                                    if holderPos.Y < minPos.Y then
                                        holderPos = V2new(holderPos.X, minPos.Y)
                                    end
                                    colorpicker.content[32].Position = holderPos

                                    colorpicker.holding.color = true
                                elseif utility:MouseOverDrawing(colorpicker.content[16]) then
                                    local hue = math.clamp(uis:GetMouseLocation().Y - colorpicker.content[16].Position.Y, 0, colorpicker.content[16].Size.Y) / colorpicker.content[16].Size.Y

                                    colorpicker.tempvalue = {hue, colorpicker.tempvalue[2], colorpicker.tempvalue[3]}

                                    colorpicker.content[33].Position = V2new(colorpicker.content[16].Position.X-1, colorpicker.content[16].Position.Y + colorpicker.tempvalue[1] * colorpicker.content[16].Size.Y)

                                    colorpicker.content[9].Color = Color3.fromHSV(colorpicker.tempvalue[1], 1, 1)

                                    colorpicker.holding.hue = true
                                elseif utility:MouseOverDrawing(colorpicker.content[13]) then
                                    local percent = math.clamp(uis:GetMouseLocation().X - colorpicker.content[13].Position.X, 0, colorpicker.content[13].Size.X) / colorpicker.content[13].Size.X

                                    colorpicker.brightness[1] = 100 * percent

                                    colorpicker.tempvalue[3] = (colorpicker.brightness[1] / 100) - colorpicker.brightness[2]

                                    colorpicker.content[34].Position = V2new(colorpicker.content[13].Position.X + colorpicker.content[13].Size.X * (colorpicker.brightness[1] / 100), colorpicker.content[13].Position.Y-1)

                                    colorpicker.holding.brightness = true
                                elseif utility:MouseOverPosition({colorpicker.content[8].Position - V2new(colorpicker.content[8].TextBounds.X / 2, 0), colorpicker.content[8].Position + V2new(colorpicker.content[8].TextBounds.X / 2, 13)}) then
                                    colorpicker:Set(colorpicker.tempvalue)
                                    colorpicker.tempvalue = colorpicker.value
                                    colorpicker.content[28].Color = Color3.fromHSV(unpack(colorpicker.value))
                                end
                                colorpicker.content[23].Color = Color3.fromHSV(unpack(colorpicker.tempvalue))
                            end
                        end
                    end)

                    utility:Connect(uis.InputChanged, function(input)
                        if input.UserInputType == Enum.UserInputType.MouseMovement and #colorpicker.content > 0 then
                            if colorpicker.holding.color then
                                local colorx = math.clamp(uis:GetMouseLocation().X - colorpicker.content[10].Position.X, 0, colorpicker.content[10].Position.X) /colorpicker.content[10].Size.X
                                local colory = math.clamp(uis:GetMouseLocation().Y - colorpicker.content[10].Position.Y, 0, colorpicker.content[10].Position.Y) / colorpicker.content[10].Size.Y
                                local s = colorx
                                local v = (colorpicker.brightness[1] / 100) - colory

                                colorpicker.brightness[2] = colory

                                colorpicker.tempvalue = {colorpicker.tempvalue[1], s, v}

                                local minPos = V2new(colorpicker.content[10].Position.X, colorpicker.content[10].Position.Y)
                                local maxPos = V2new(colorpicker.content[10].Position.X + colorpicker.content[10].Size.X - 5, colorpicker.content[10].Position.Y + colorpicker.content[10].Size.Y - 5)
                                local holderPos = uis:GetMouseLocation()
                                if holderPos.X > maxPos.X then
                                    holderPos = V2new(maxPos.X, holderPos.Y)
                                end 
                                if holderPos.Y > maxPos.Y then
                                    holderPos = V2new(holderPos.X, maxPos.Y)
                                end
                                if holderPos.X < minPos.X then
                                    holderPos = V2new(minPos.X, holderPos.Y)
                                end 
                                if holderPos.Y < minPos.Y then
                                    holderPos = V2new(holderPos.X, minPos.Y)
                                end
                                colorpicker.content[32].Position = holderPos
                            elseif colorpicker.holding.hue then
                                local hue = math.clamp(uis:GetMouseLocation().Y - colorpicker.content[16].Position.Y, 0, colorpicker.content[16].Size.Y) / colorpicker.content[16].Size.Y

                                colorpicker.tempvalue = {hue, colorpicker.tempvalue[2], colorpicker.tempvalue[3]}

                                colorpicker.content[33].Position = V2new(colorpicker.content[16].Position.X-1, colorpicker.content[16].Position.Y + colorpicker.tempvalue[1] * colorpicker.content[16].Size.Y)

                                colorpicker.content[9].Color = Color3.fromHSV(colorpicker.tempvalue[1], 1, 1)
                            elseif colorpicker.holding.brightness then
                                local percent = math.clamp(uis:GetMouseLocation().X - colorpicker.content[13].Position.X, 0, colorpicker.content[13].Size.X) / colorpicker.content[13].Size.X
                                    
                                local colory = math.clamp(colorpicker.content[31].Position.Y - colorpicker.content[10].Position.Y, 0, colorpicker.content[10].Position.Y) / colorpicker.content[10].Size.Y

                                colorpicker.brightness[1] = 100 * percent

                                colorpicker.tempvalue[3] = (colorpicker.brightness[1] / 100) - colorpicker.brightness[2]

                                colorpicker.content[34].Position = V2new(colorpicker.content[13].Position.X + colorpicker.content[13].Size.X * (colorpicker.brightness[1] / 100), colorpicker.content[13].Position.Y-1)
                            end
                            colorpicker.content[23].Color = Color3.fromHSV(unpack(colorpicker.tempvalue))
                        end
                    end)

                    utility:Connect(uis.InputEnded, function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 and #colorpicker.content > 0 then
                            for i, v in pairs(colorpicker.holding) do
                                colorpicker.holding[i] = false
                            end
                        end
                    end)
                    
                    toggle.colorpicker = colorpicker

                    library.pointers[pointer] = colorpicker

                    section.instances = utility:Combine(section.instances, {colorpicker_title, colorpicker_color, colorpciker_inline1, colorpciker_inline2, colorpicker_outline})
                
                    return colorpicker
                end

                toggle:Set(default)

                utility:Connect(uis.InputBegan, function(input)
                    local positions = {V2new(section_frame.Position.X, toggle_frame.Position.Y - 3), V2new(section_frame.Position.X + section_frame.Size.X, toggle_frame.Position.Y + 10)}

                    if toggle.keybind.name ~= nil or toggle.colorpicker.name ~= nil then
                        positions = {V2new(section_frame.Position.X, toggle_frame.Position.Y - 3), V2new(section_frame.Position.X + section_frame.Size.X - 50, toggle_frame.Position.Y + 10)}
                    end

                    if input.UserInputType == Enum.UserInputType.MouseButton1 and utility:MouseOverPosition(positions) and not window:MouseOverContent() and not window.fading and tab.open then
                        toggle:Set(not toggle.state)
                    end
                end)

                section.offset = section.offset + 17

                tab.sectionOffsets[side] = tab.sectionOffsets[side] + 19

                section:Update()

                library.pointers[pointer] = toggle

                section.instances = utility:Combine(section.instances, {toggle_frame, toggle_inline, toggle_outline, toggle_gradient, toggle_title})
            
                return toggle
            end

            function section:Button(args)
                args = args or {}

                local name = args.name or args.Name or "button"
                local callback = args.callback or args.Callback or function() end

                local button = {name = name, pressed = false}

                local button_frame = utility:Draw("Square", V2new(8, 25 + section.offset), {
                    Color = Color3.fromRGB(50, 50, 50),
                    Size = V2new(210, 18),
                    Parent = section_frame
                })

                local button_inline = utility:Draw("Square", V2new(-1, -1), {
                    Color = Color3.fromRGB(0, 0, 0),
                    Size = button_frame.Size + V2new(2, 2),
                    Filled = false,
                    Parent = button_frame
                })

                local button_outline = utility:Draw("Square", V2new(-2, -2), {
                    Color = Color3.fromRGB(30, 30, 30),
                    Size = button_frame.Size + V2new(4, 4),
                    Filled = false,
                    Parent = button_frame
                })

                local button_gradient = utility:Draw("Image", V2new(), {
                    Size = button_frame.Size,
                    Transparency = 0.8,
                    Parent = button_frame
                })

                local button_title = utility:Draw("Text", V2new(105, 1), {
                    Color = Color3.fromRGB(255, 255, 255),
                    Outline = true,
                    Size = 13,
                    Font = 2,
                    Text = name,
                    Center = true,
                    Parent = button_frame
                })

                utility:Image(button_gradient, "https://i.imgur.com/5hmlrjX.png")

                utility:Connect(uis.InputBegan, function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 and utility:MouseOverPosition({V2new(section_frame.Position.X, button_frame.Position.Y - 2), V2new(section_frame.Position.X + section_frame.Size.X, button_frame.Position.Y + 20)}) and not window:MouseOverContent() and not window.fading and tab.open then
                        button.pressed = true
                        button_frame.Color = Color3.fromRGB(40, 40, 40)
                        callback()
                    end
                end)

                utility:Connect(uis.InputEnded, function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 and button.pressed then
                        button.pressed = false
                        button_frame.Color = Color3.fromRGB(50, 50, 50)
                    end
                end)

                section.offset = section.offset + 23

                tab.sectionOffsets[side] = tab.sectionOffsets[side] + 25

                section:Update()

                section.instances = utility:Combine(section.instances, {button_frame, button_inline, button_outline, button_gradient, button_title})
            end

            function section:SubButtons(args)
                args = args or {}
                local buttons_table = args.buttons or args.Buttons or {{"button 1", function() end}, {"button 2", function() end}}

                local buttons = {{}, {}}

                for i = 1, 2 do
                    local button_frame = utility:Draw("Square", V2new(8 + (110 * (i-1)), 25 + section.offset), {
                        Color = Color3.fromRGB(50, 50, 50),
                        Size = V2new(100, 18),
                        Parent = section_frame
                    })
    
                    local button_inline = utility:Draw("Square", V2new(-1, -1), {
                        Color = Color3.fromRGB(0, 0, 0),
                        Size = button_frame.Size + V2new(2, 2),
                        Filled = false,
                        Parent = button_frame
                    })
    
                    local button_outline = utility:Draw("Square", V2new(-2, -2), {
                        Color = Color3.fromRGB(30, 30, 30),
                        Size = button_frame.Size + V2new(4, 4),
                        Filled = false,
                        Parent = button_frame
                    })
    
                    local button_gradient = utility:Draw("Image", V2new(), {
                        Size = button_frame.Size,
                        Transparency = 0.8,
                        Parent = button_frame
                    })
    
                    local button_title = utility:Draw("Text", V2new(50, 1), {
                        Color = Color3.fromRGB(255, 255, 255),
                        Outline = true,
                        Size = 13,
                        Font = 2,
                        Text = buttons_table[i][1],
                        Center = true,
                        Parent = button_frame
                    })

                    utility:Image(button_gradient, "https://i.imgur.com/5hmlrjX.png")

                    buttons[i] = {button_frame, button_inline, button_outline, button_gradient, button_title}

                    section.instances = utility:Combine(section.instances, buttons[i])
                end

                utility:Connect(uis.InputBegan, function(input)
                    for i = 1, 2 do
                        if input.UserInputType == Enum.UserInputType.MouseButton1 and utility:MouseOverDrawing(buttons[i][1]) and not window:MouseOverContent() and not window.fading and tab.open then
                            buttons[i][1].Color = Color3.fromRGB(30, 30, 30)
                            buttons_table[i][2]()
                        end
                    end
                end)

                utility:Connect(uis.InputEnded, function(input)
                    for i = 1, 2 do
                        buttons[i][1].Color = Color3.fromRGB(50, 50, 50)
                    end
                end)

                section.offset = section.offset + 23

                tab.sectionOffsets[side] = tab.sectionOffsets[side] + 25

                section:Update()
            end

            function section:Slider(args)
                args = args or {}

                local name = args.name or args.Name or "slider"
                local min = args.minimum or args.Minimum or args.min or args.Min or -25
                local max = args.maximum or args.Maximum or args.max or args.Max or 25
                local default = args.default or args.Default or args.def or args.Def or min
                local decimals = 1 / (args.decimals or args.Decimals or 1)
                local ending = args.ending or args.Ending or args.suffix or args.Suffix or args.suf or args.Suf or ""
                local callback = args.callback or args.Callback or function() end
                local flag = args.flag or args.Flag or ""
                local pointer = args.pointer or args.Pointer or tab.name .. "_" .. section.name .. "_" .. name

                local slider = {name = name, value = def, sliding = false}

                local slider_title = utility:Draw("Text", V2new(8, 25 + section.offset), {
                    Color = Color3.fromRGB(255, 255, 255),
                    Outline = true,
                    Size = 13,
                    Font = 2,
                    Text = name,
                    Parent = section_frame
                })

                local slider_frame = utility:Draw("Square", V2new(0, 16), {
                    Color = Color3.fromRGB(50, 50, 50),
                    Size = V2new(210, 10),
                    Parent = slider_title
                })

                local slider_bar = utility:Draw("Square", V2new(), {
                    Color = accent1,
                    Size = V2new(0, slider_frame.Size.Y),
                    Parent = slider_frame
                })

                table.insert(library.accents, slider_bar)

                local slider_inline = utility:Draw("Square", V2new(-1, -1), {
                    Color = Color3.fromRGB(0, 0, 0),
                    Size = slider_frame.Size + V2new(2, 2),
                    Filled = false,
                    Parent = slider_frame
                })

                local slider_outline = utility:Draw("Square", V2new(-2, -2), {
                    Color = Color3.fromRGB(30, 30, 30),
                    Size = slider_frame.Size + V2new(4, 4),
                    Filled = false,
                    Parent = slider_frame
                })

                local slider_gradient = utility:Draw("Image", V2new(), {
                    Size = slider_frame.Size,
                    Transparency = 0.8,
                    Parent = slider_frame
                })

                local slider_value = utility:Draw("Text", V2new(slider_frame.Size.X / 2, -2), {
                    Color = Color3.fromRGB(255, 255, 255),
                    Outline = true,
                    Size = 13,
                    Font = 2,
                    Text = tostring(default) .. ending,
                    Center = true,
                    Parent = slider_frame
                })

                utility:Image(slider_gradient, "https://i.imgur.com/5hmlrjX.png")

                function slider:Set(value)
                    slider.value = math.clamp(math.round(value * decimals) / decimals, min, max)
                    local percent = 1 - ((max - slider.value) / (max - min))
                    slider_value.Text = tostring(value) .. ending
                    slider_bar.Size = V2new(percent * slider_frame.Size.X, slider_frame.Size.Y)

                    if flag ~= "" then
                        library.flags[flag] = slider.value
                    end

                    callback(slider.value)
                end

                function slider:Get()
                    return slider.value
                end
                
                slider:Set(default)

                utility:Connect(uis.InputBegan, function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 and utility:MouseOverPosition({V2new(section_frame.Position.X, slider_title.Position.Y), V2new(section_frame.Position.X + section_frame.Size.X, slider_title.Position.Y + 18 + slider_frame.Size.Y)}) and not window:MouseOverContent() and not window.fading and tab.open then
                        slider.holding = true
                        local percent = math.clamp(uis:GetMouseLocation().X - slider_bar.Position.X, 0, slider_frame.Size.X) / slider_frame.Size.X
                        local value = math.floor((min + (max - min) * percent) * decimals) / decimals
                        value = math.clamp(value, min, max)
                        slider:Set(value)
                    end
                end)

                utility:Connect(uis.InputChanged, function(input)
                    if input.UserInputType == Enum.UserInputType.MouseMovement and slider.holding then
                        local percent = math.clamp(uis:GetMouseLocation().X - slider_bar.Position.X, 0, slider_frame.Size.X) / slider_frame.Size.X
                        local value = math.floor((min + (max - min) * percent) * decimals) / decimals
                        value = math.clamp(value, min, max)
                        slider:Set(value)
                    end
                end)

                utility:Connect(uis.InputEnded, function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 and slider.holding then
                        slider.holding = false
                    end
                end)

                section.offset = section.offset + 32

                tab.sectionOffsets[side] = tab.sectionOffsets[side] + 34

                section:Update()

                library.pointers[pointer] = slider

                section.instances = utility:Combine(section.instances, {slider_frame, slider_bar, slider_inline, slider_outline, slider_gradient, slider_title, slider_value})
                
                return slider
            end

            function section:Dropdown(args)
                args = args or {}

                local name = args.name or args.Name or "dropdown"
                local options = args.options or args.Options or {"1", "2"}
                local multi = args.multi or args.Multi or false
                local default = args.default or args.Default or args.def or args.Def or (multi == false and options[1] or multi == true and {options[1]}) 
                local flag = args.flag or args.Flag or ""
                local pointer = args.pointer or args.Pointer or tab.name .. "_" .. section.name .. "_" .. name
                local callback = args.callback or args.Callback or function() end

                local dropdown = {name = name, options = options, value = default, multi = multi, open = false, search = "", content = {}}

                if flag ~= "" then
                    library.flags[flag] = dropdown.value
                end

                function dropdown:ReadValue(val)
                    if not multi then
                        if utility:GetTextSize(dropdown.value, 2, 13).X >= 196 then
                            return "..."
                        else
                            return dropdown.value
                        end
                    else
                        local str = ""
                        for i, v in pairs(dropdown.value) do
                            if i < #dropdown.value then
                                str = str .. tostring(v) .. ", "
                            else
                                str = str .. tostring(v)
                            end
                        end
                        if utility:GetTextSize(str, 2, 13).X >= 196 then
                            return "..."
                        else
                            return str
                        end
                    end
                end

                local dropdown_title = utility:Draw("Text", V2new(8, 25 + section.offset), {
                    Color = Color3.fromRGB(255, 255, 255),
                    Outline = true,
                    Size = 13,
                    Font = 2,
                    Text = name,
                    Parent = section_frame
                })

                local dropdown_frame = utility:Draw("Square", V2new(0, 16), {
                    Color = Color3.fromRGB(50, 50, 50),
                    Size = V2new(210, 18),
                    Parent = dropdown_title
                })

                local dropdown_inline = utility:Draw("Square", V2new(-1, -1), {
                    Color = Color3.fromRGB(0, 0, 0),
                    Size = dropdown_frame.Size + V2new(2, 2),
                    Filled = false,
                    Parent = dropdown_frame
                })

                local dropdown_outline = utility:Draw("Square", V2new(-2, -2), {
                    Color = Color3.fromRGB(30, 30, 30),
                    Size = dropdown_frame.Size + V2new(4, 4),
                    Filled = false,
                    Parent = dropdown_frame
                })

                local dropdown_gradient = utility:Draw("Image", V2new(), {
                    Size = dropdown_frame.Size,
                    Transparency = 0.8,
                    Parent = dropdown_frame
                })

                local dropdown_value = utility:Draw("Text", V2new(5, 1), {
                    Color = Color3.fromRGB(255, 255, 255),
                    Outline = true,
                    Size = 13,
                    Font = 2,
                    Text = dropdown:ReadValue(),
                    Parent = dropdown_frame
                })

                local dropdown_indicator = utility:Draw("Text", V2new(dropdown_frame.Size.X - 12, 1), {
                    Color = Color3.fromRGB(255, 255, 255),
                    Outline = true,
                    Size = 13,
                    Font = 2,
                    Text = "+",
                    Parent = dropdown_frame
                })

                utility:Image(dropdown_gradient, "https://i.imgur.com/5hmlrjX.png")

                function dropdown:Update()
                    if #dropdown.content > 0 then
                        for i, v in pairs({select(4, unpack(dropdown.content))}) do
                            v.Color = (multi == false and v.Text == dropdown.value and accent1 or multi == true and table.find(dropdown.value, v.Text) and accent1 or Color3.fromRGB(255, 255, 255))
                        end
                    end
                end

                function dropdown:Set(value)
                    dropdown.value = table.find(dropdown.options, value) and value or options[1]
                    dropdown_value.Text = dropdown:ReadValue()
                    dropdown:Update()

                    if flag ~= "" then
                        library.flags[flag] = dropdown.value
                    end

                    callback(dropdown.value)
                end

                function dropdown:Get()
                    return dropdown.value
                end

                function dropdown:Refresh(options)
                    if #dropdown.content > 0 then
                        window:CloseContent()
                    end

                    dropdown.options = options
                    dropdown:Set(multi == false and dropdown.options[1] or multi == true and {dropdown.options[1]})
                end

                utility:Connect(uis.InputBegan, function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 and not window:MouseOverContent() and not window.fading and tab.open then
                        if #dropdown.content == 0 and utility:MouseOverPosition({V2new(section_frame.Position.X, dropdown_title.Position.Y), V2new(section_frame.Position.X + section_frame.Size.X, dropdown_title.Position.Y + 20 + dropdown_frame.Size.Y)}) then
                            window:CloseContent()

                            dropdown.search = ""

                            local list_frame = utility:Draw("Square", V2new(1, 20), {
                                Color = Color3.fromRGB(45, 45, 45),
                                Size = V2new(dropdown_frame.Size.X - 2, #dropdown.options * 15),
                                Parent = dropdown_frame
                            })
    
                            local list_inline = utility:Draw("Square", V2new(-1, -1), {
                                Color = Color3.fromRGB(30, 30, 30),
                                Size = list_frame.Size + V2new(2, 2),
                                Filled = false,
                                Parent = list_frame
                            })
            
                            local list_outline = utility:Draw("Square", V2new(-2, -2), {
                                Color = Color3.fromRGB(0, 0, 0),
                                Size = list_frame.Size + V2new(4, 4),
                                Filled = false,
                                Parent = list_frame
                            })
    
                            dropdown.content = {list_frame, list_inline, list_outline}
    
                            for i, v in pairs(dropdown.options) do
                                local text = utility:Draw("Text", V2new(4, 15 * (i - 1)), {
                                    Color = (multi == false and v == dropdown.value and accent1 or multi == true and table.find(dropdown.value, v) and accent1 or Color3.fromRGB(255, 255, 255)),
                                    Outline = true,
                                    Size = 13,
                                    Font = 2,
                                    Text = tostring(v),
                                    Parent = list_frame
                                })
    
                                table.insert(dropdown.content, text)
                            end

                            window.content.dropdown = dropdown.content

                            dropdown_indicator.Text = "-"
                        elseif #dropdown.content > 0 then
                            window:CloseContent()
                            dropdown.content = {}

                            dropdown_indicator.Text = "+"
                        end
                    elseif input.UserInputType == Enum.UserInputType.MouseButton1 and #dropdown.content > 0 and not window.fading and tab.open then
                        for i = 1, #dropdown.options do
                            if utility:MouseOverPosition({V2new(dropdown.content[1].Position.X, dropdown.content[3 + i].Position.Y), V2new(dropdown.content[1].Position.X + dropdown.content[1].Size.X, dropdown.content[3 + i].Position.Y + 15)}) then
                                if not dropdown.multi then
                                    dropdown:Set(dropdown.options[i])
                                else
                                    if table.find(dropdown.value, dropdown.options[i]) then
                                        dropdown:Set(utility:RemoveItem(dropdown.value, dropdown.options[i]))
                                    else
                                        table.insert(dropdown.value, dropdown.options[i])
                                        dropdown:Set(dropdown.value)
                                    end
                                end
                            end
                        end
                    elseif input.UserInputType == Enum.UserInputType.Keyboard and #dropdown.content > 0 and not window.fading and tab.open then
                        local key = input.KeyCode
                        if key.Name ~= "Backspace" then
                            dropdown.search = dropdown.search .. uis:GetStringForKeyCode(key):lower()
                        else
                            dropdown.search = dropdown.search:sub(1, -2)
                        end
                        if dropdown.search ~= "" then
                            for i, v in pairs({select(4, unpack(dropdown.content))}) do
                                if v.Color ~= accent1 and v.Text:lower():find(dropdown.search) then
                                    v.Color = Color3.fromRGB(255, 255, 255)
                                elseif v.Color ~= accent1 and not v.Text:lower():find(dropdown.search) then
                                    v.Color = Color3.fromRGB(155, 155, 155)
                                end
                            end
                        else
                            for i, v in pairs({select(4, unpack(dropdown.content))}) do
                                if v.Color ~= accent1 then
                                    v.Color = Color3.fromRGB(255, 255, 255)
                                end
                            end
                        end
                    end
                end)

                section.offset = section.offset + 40

                tab.sectionOffsets[side] = tab.sectionOffsets[side] + 42

                section:Update()

                library.pointers[pointer] = dropdown

                section.instances = utility:Combine(section.instances, {dropdown_frame, dropdown_inline, dropdown_outline, dropdown_gradient, dropdown_title, dropdown_value, dropdown_indicator})
            
                return dropdown
            end

            function section:Textbox(args)
                args = args or {}

                local name = args.name or args.Name or "textbox"
                local default = args.default or args.Default or args.def or args.Def or ""
                local flag = args.flag or args.Flag or ""
                local pointer = args.pointer or args.Pointer or tab.name .. "_" .. section.name .. "_" .. name
                local callback = args.callback or args.Callback or function() end

                local textbox = {name = name, typing = false, hideHolder = false, value = ""}

                local textbox_frame = utility:Draw("Square", V2new(8, 25 + section.offset), {
                    Color = Color3.fromRGB(50, 50, 50),
                    Size = V2new(210, 18),
                    Parent = section_frame
                })

                local textbox_inline = utility:Draw("Square", V2new(-1, -1), {
                    Color = Color3.fromRGB(0, 0, 0),
                    Size = textbox_frame.Size + V2new(2, 2),
                    Filled = false,
                    Parent = textbox_frame
                })

                local textbox_outline = utility:Draw("Square", V2new(-2, -2), {
                    Color = Color3.fromRGB(30, 30, 30),
                    Size = textbox_frame.Size + V2new(4, 4),
                    Filled = false,
                    Parent = textbox_frame
                })

                local textbox_gradient = utility:Draw("Image", V2new(), {
                    Size = textbox_frame.Size,
                    Transparency = 0.8,
                    Parent = textbox_frame
                })

                local textbox_title = utility:Draw("Text", V2new(4, 1), {
                    Color = Color3.fromRGB(255, 255, 255),
                    Outline = true,
                    Size = 13,
                    Font = 2,
                    Text = name,
                    Parent = textbox_frame
                })

                utility:Image(textbox_gradient, "https://i.imgur.com/5hmlrjX.png")

                function textbox:Set(value)
                    textbox.value = value
                    textbox_title.Text = textbox.typing == false and name or textbox.value
                    if flag ~= "" then
                        library.flags[flag] = textbox.value
                    end
                    callback(textbox.value)
                end

                function textbox:Get()
                    return textbox.value
                end

                utility:Connect(uis.InputBegan, function(input)
                    if not textbox.typing then
                        if input.UserInputType == Enum.UserInputType.MouseButton1 and utility:MouseOverPosition({V2new(section_frame.Position.X, textbox_frame.Position.Y - 2), V2new(section_frame.Position.X + section_frame.Size.X, textbox_frame.Position.Y + 20)}) and not window:MouseOverContent() and not window.fading and tab.open then
                            textbox.typing = true
                            if textbox.hideHolder == false then
                                textbox.hideHolder = true
                                textbox_title.Text = textbox.value
                            end
                        end
                    else
                        if input.UserInputType == Enum.UserInputType.MouseButton1 and not window:MouseOverContent() and not window.fading and tab.open then
                            textbox.typing = false
                            textbox.hideHolder = false
                            textbox_title.Text = name
                        elseif input.UserInputType == Enum.UserInputType.Keyboard then
                            local key = input.KeyCode
                            if key.Name ~= "Return" then
                                if key.Name ~= "Backspace" then
                                    if uis:GetStringForKeyCode(key) ~= "" then
                                        textbox.value = textbox.value .. uis:GetStringForKeyCode(key):lower()
                                        local time = 1
                                        spawn(function()
                                            task.wait(0.5)
                                            while uis:IsKeyDown(key.Name) do
                                                if not textbox.typing then break end
                                                task.wait(.2 / time)
                                                textbox.value = textbox.value .. uis:GetStringForKeyCode(key):lower()
                                                time = time + 1
                                                textbox:Set(textbox.value)
                                            end
                                        end)
                                    end
                                else
                                    textbox.value = textbox.value:sub(1, -2)
                                    local time = 1
                                    spawn(function()
                                        task.wait(0.5)
                                        while uis:IsKeyDown(key.Name) do
                                            if not textbox.typing then break end
                                            task.wait(.2 / time)
                                            textbox.value = textbox.value:sub(1, -2)
                                            time = time + 1
                                            textbox:Set(textbox.value)
                                        end
                                    end)
                                end
                            else
                                textbox.typing = false
                                textbox.hideHolder = false
                                textbox_title.Text = name
                            end
                            if textbox.hideHolder == true then
                                textbox_title.Text = textbox.value
                                textbox:Set(textbox.value)
                            end
                        end
                    end
                end)

                if flag ~= "" then
                    library.flags[flag] = ""
                end

                section.offset = section.offset + 22

                tab.sectionOffsets[side] = tab.sectionOffsets[side] + 24

                section:Update()

                section.instances = utility:Combine(section.instances, {textbox_frame, textbox_inline, textbox_outline, textbox_gradient, textbox_title})
            end

            function section:Label(args)
                args = args or {}

                local name = args.name or args.Name or args.text or args.Text or "label"
                local middle = args.mid or args.Mid or args.middle or args.Middle or false
                local callback = args.callback or args.Callback or function() end

                local label = {name = name, middle = middle}

                local label_title = utility:Draw("Text", V2new(middle == false and 9 or section_frame.Size.X / 2, 25 + section.offset), {
                    Color = Color3.fromRGB(255, 255, 255),
                    Outline = true,
                    Size = 13,
                    Font = 2,
                    Text = name,
                    Center = middle,
                    Parent = section_frame
                })

                section.offset = section.offset + 15

                tab.sectionOffsets[side] = tab.sectionOffsets[side] + 17

                section:Update()

                section.instances = utility:Combine(section.instances, {label_title})
            end

            function section:Colorpicker(args)
                args = args or {}

                local name = args.name or args.Name or "colorpicker"
                local default = args.default or args.Default or args.def or args.Def or Color3.fromRGB(255, 0, 0)
                local flag = args.flag or args.Flag or ""
                local pointer = args.pointer or args.Pointer or tab.name .. "_" .. section.name .. "_" .. name
                local callback = args.callback or args.Callback or function() end

                local colorpicker = {name = name, value = {default:ToHSV()}, tempvalue = {}, brightness = {100, 0}, holding = {hue = false, brightness = false, color = false}, content = {}}

                if flag ~= "" then
                    library.flags[flag] = default
                end

                local colorpicker_title = utility:Draw("Text", V2new(8, 25 + section.offset), {
                    Color = Color3.fromRGB(255, 255, 255),
                    Outline = true,
                    Size = 13,
                    Font = 2,
                    Text = name,
                    Parent = section_frame
                })

                local colorpicker_color = utility:Draw("Square", V2new(section_frame.Size.X - 45, 2), {
                    Color = default,
                    Size = V2new(24, 10),
                    Parent = colorpicker_title
                })

                local colorpciker_inline1 = utility:Draw("Square", V2new(), {
                    Color = Color3.fromRGB(0, 0, 0),
                    Size = colorpicker_color.Size,
                    Transparency = 0.3,
                    Filled = false,
                    Parent = colorpicker_color
                })

                local colorpciker_inline2 = utility:Draw("Square", V2new(1, 1), {
                    Color = Color3.fromRGB(0, 0, 0),
                    Size = colorpicker_color.Size - V2new(2, 2),
                    Transparency = 0.3,
                    Filled = false,
                    Parent = colorpicker_color
                })

                local colorpicker_outline = utility:Draw("Square", V2new(-1, -1), {
                    Color = Color3.fromRGB(0, 0, 0),
                    Size = colorpicker_color.Size + V2new(2, 2),
                    Filled = false,
                    Parent = colorpicker_color
                })

                function colorpicker:Set(value)
                    if typeof(value) == "Color3" then
                        value = {value:ToHSV()}
                    end

                    colorpicker.value = value
                    colorpicker_color.Color = Color3.fromHSV(unpack(colorpicker.value))

                    if flag ~= "" then
                        library.flags[flag] = Color3.fromHSV(unpack(colorpicker.value))
                    end

                    callback(Color3.fromHSV(unpack(colorpicker.value)))
                end

                function colorpicker:Get()
                    return Color3.fromHSV(unpack(colorpicker.value))
                end

                utility:Connect(uis.InputBegan, function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        if #colorpicker.content == 0 and utility:MouseOverPosition({V2new(section_frame.Position.X, colorpicker_title.Position.Y - 3), V2new(section_frame.Position.X + section_frame.Size.X, colorpicker_title.Position.Y + 10)}) and not window:MouseOverContent() and not window.fading and tab.open then
                            colorpicker.tempvalue = colorpicker.value
                            colorpicker.brightness[2] = 0
                            
                            local colorpicker_open_frame = utility:Draw("Square", V2new(12, 5), {
                                Color = Color3.fromRGB(35, 35, 35),
                                Size = V2new(276, 207),
                                Parent = colorpicker_color
                            })

                            local colorpicker_open_inline = utility:Draw("Square", V2new(-1, -1), {
                                Color = Color3.fromRGB(20, 20, 20),
                                Size = colorpicker_open_frame.Size + V2new(2, 2),
                                Filled = false,
                                Parent = colorpicker_open_frame
                            })

                            local colorpicker_open_outline = utility:Draw("Square", V2new(-2, -2), {
                                Color = Color3.fromRGB(0, 0, 0),
                                Size = colorpicker_open_frame.Size + V2new(4, 4),
                                Filled = false,
                                Parent = colorpicker_open_frame
                            })

                            local colorpicker_open_accent1 = utility:Draw("Square", V2new(0, 1), {
                                Color = accent1,
                                Size = V2new(colorpicker_open_frame.Size.X, 1),
                                Parent = colorpicker_open_frame
                            })

                            table.insert(library.accents, colorpicker_open_accent1)
                        
                            local colorpicker_open_accent2 = utility:Draw("Square", V2new(0, 2), {
                                Color = accent2,
                                Size = V2new(colorpicker_open_frame.Size.X, 1),
                                Parent = colorpicker_open_frame
                            })

                            table.insert(library.accents, colorpicker_open_accent2)
                        
                            local colorpicker_open_inline2 = utility:Draw("Square", V2new(0, 3), {
                                Color = Color3.fromRGB(20, 20, 20),
                                Size = V2new(colorpicker_open_frame.Size.X, 1),
                                Parent = colorpicker_open_frame
                            })

                            local colorpicker_open_title = utility:Draw("Text", V2new(5, 6), {
                                Color = Color3.fromRGB(255, 255, 255),
                                Outline = true,
                                Size = 13,
                                Font = 2,
                                Text = colorpicker.name,
                                Parent = colorpicker_open_frame
                            })

                            local colorpicker_open_apply = utility:Draw("Text", V2new(232, 187), {
                                Color = Color3.fromRGB(255, 255, 255),
                                Outline = true,
                                Size = 13,
                                Font = 2,
                                Text = "[ Apply ]",
                                Center = true,
                                Parent = colorpicker_open_frame
                            })

                            local colorpicker_open_color = utility:Draw("Square", V2new(10, 23), {
                                Color = Color3.fromHSV(colorpicker.value[1], 1, 1),
                                Size = V2new(156, 156),
                                Parent = colorpicker_open_frame
                            })

                            local colorpicker_open_color_image = utility:Draw("Image", V2new(), {
                                Size = colorpicker_open_color.Size,
                                Parent = colorpicker_open_color
                            })

                            local colorpicker_open_color_inline = utility:Draw("Square", V2new(-1, -1), {
                                Color = Color3.fromRGB(0, 0, 0),
                                Size = colorpicker_open_color.Size + V2new(2, 2),
                                Filled = false,
                                Parent = colorpicker_open_color
                            })

                            local colorpicker_open_color_outline = utility:Draw("Square", V2new(-2, -2), {
                                Color = Color3.fromRGB(30, 30, 30),
                                Size = colorpicker_open_color.Size + V2new(4, 4),
                                Filled = false,
                                Parent = colorpicker_open_color
                            })

                            local colorpicker_open_brightness_image = utility:Draw("Image", V2new(10, 189), {
                                Size = V2new(156, 10),
                                Parent = colorpicker_open_frame
                            })

                            local colorpicker_open_brightness_inline = utility:Draw("Square", V2new(-1, -1), {
                                Color = Color3.fromRGB(0, 0, 0),
                                Size = colorpicker_open_brightness_image.Size + V2new(2, 2),
                                Filled = false,
                                Parent = colorpicker_open_brightness_image
                            })

                            local colorpicker_open_brightness_outline = utility:Draw("Square", V2new(-2, -2), {
                                Color = Color3.fromRGB(30, 30, 30),
                                Size = colorpicker_open_brightness_image.Size + V2new(4, 4),
                                Filled = false,
                                Parent = colorpicker_open_brightness_image
                            })

                            local colorpicker_open_hue_image = utility:Draw("Image", V2new(176, 23), {
                                Size = V2new(10, 156),
                                Parent = colorpicker_open_frame
                            })

                            local colorpicker_open_hue_inline = utility:Draw("Square", V2new(-1, -1), {
                                Color = Color3.fromRGB(0, 0, 0),
                                Size = colorpicker_open_hue_image.Size + V2new(2, 2),
                                Filled = false,
                                Parent = colorpicker_open_hue_image
                            })

                            local colorpicker_open_hue_outline = utility:Draw("Square", V2new(-2, -2), {
                                Color = Color3.fromRGB(30, 30, 30),
                                Size = colorpicker_open_hue_image.Size + V2new(4, 4),
                                Filled = false,
                                Parent = colorpicker_open_hue_image
                            })

                            local colorpicker_open_newcolor_title = utility:Draw("Text", V2new(196, 23), {
                                Color = Color3.fromRGB(255, 255, 255),
                                Outline = true,
                                Size = 13,
                                Font = 2,
                                Text = "New color",
                                Parent = colorpicker_open_frame
                            })

                            local colorpicker_open_newcolor_image = utility:Draw("Image", V2new(197, 37), {
                                Size = V2new(71, 36),
                                Parent = colorpicker_open_frame
                            })

                            local colorpicker_open_newcolor_inline = utility:Draw("Square", V2new(-1, -1), {
                                Color = Color3.fromRGB(0, 0, 0),
                                Size = colorpicker_open_newcolor_image.Size + V2new(2, 2),
                                Filled = false,
                                Parent = colorpicker_open_newcolor_image
                            })

                            local colorpicker_open_newcolor_outline = utility:Draw("Square", V2new(-2, -2), {
                                Color = Color3.fromRGB(30, 30, 30),
                                Size = colorpicker_open_newcolor_image.Size + V2new(4, 4),
                                Filled = false,
                                Parent = colorpicker_open_newcolor_image
                            })

                            local colorpicker_open_newcolor = utility:Draw("Square", V2new(2, 2), {
                                Color = Color3.fromHSV(unpack(colorpicker.value)),
                                Size = colorpicker_open_newcolor_image.Size - V2new(4, 4),
                                Transparency = 0.4,
                                Parent = colorpicker_open_newcolor_image
                            })

                            local colorpicker_open_oldcolor_title = utility:Draw("Text", V2new(196, 76), {
                                Color = Color3.fromRGB(255, 255, 255),
                                Outline = true,
                                Size = 13,
                                Font = 2,
                                Text = "Old color",
                                Parent = colorpicker_open_frame
                            })

                            local colorpicker_open_oldcolor_image = utility:Draw("Image", V2new(197, 91), {
                                Size = V2new(71, 36),
                                Parent = colorpicker_open_frame
                            })

                            local colorpicker_open_oldcolor_inline = utility:Draw("Square", V2new(-1, -1), {
                                Color = Color3.fromRGB(0, 0, 0),
                                Size = colorpicker_open_oldcolor_image.Size + V2new(2, 2),
                                Filled = false,
                                Parent = colorpicker_open_oldcolor_image
                            })

                            local colorpicker_open_oldcolor_outline = utility:Draw("Square", V2new(-2, -2), {
                                Color = Color3.fromRGB(30, 30, 30),
                                Size = colorpicker_open_oldcolor_image.Size + V2new(4, 4),
                                Filled = false,
                                Parent = colorpicker_open_oldcolor_image
                            })

                            local colorpicker_open_oldcolor = utility:Draw("Square", V2new(2, 2), {
                                Color = Color3.fromHSV(unpack(colorpicker.value)),
                                Size = colorpicker_open_oldcolor_image.Size - V2new(4, 4),
                                Transparency = 0.4,
                                Parent = colorpicker_open_oldcolor_image
                            })

                            local colorpicker_open_color_holder = utility:Draw("Square", V2new(colorpicker_open_color_image.Size.X - 5, 0), {
                                Color = Color3.fromRGB(255, 255, 255),
                                Size = V2new(5, 5),
                                Filled = false,
                                Parent = colorpicker_open_color_image
                            })

                            local colorpicker_open_color_holder_outline = utility:Draw("Square", V2new(-1, -1), {
                                Color = Color3.fromRGB(0, 0, 0),
                                Size = colorpicker_open_color_holder.Size + V2new(2, 2),
                                Filled = false,
                                Parent = colorpicker_open_color_holder
                            })

                            local colorpicker_open_hue_holder = utility:Draw("Square", V2new(-1, 0), {
                                Color = Color3.fromRGB(255, 255, 255),
                                Size = V2new(12, 3),
                                Filled = false,
                                Parent = colorpicker_open_hue_image
                            })

                            colorpicker_open_hue_holder.Position = V2new(colorpicker_open_hue_image.Position.X-1, colorpicker_open_hue_image.Position.Y + colorpicker.tempvalue[1] * colorpicker_open_hue_image.Size.Y)

                            local colorpicker_open_hue_holder_outline = utility:Draw("Square", V2new(-1, -1), {
                                Color = Color3.fromRGB(0, 0, 0),
                                Size = colorpicker_open_hue_holder.Size + V2new(2, 2),
                                Filled = false,
                                Parent = colorpicker_open_hue_holder
                            })

                            local colorpicker_open_brightness_holder = utility:Draw("Square", V2new(colorpicker_open_brightness_image.Size.X, -1), {
                                Color = Color3.fromRGB(255, 255, 255),
                                Size = V2new(3, 12),
                                Filled = false,
                                Parent = colorpicker_open_brightness_image
                            })

                            colorpicker_open_brightness_holder.Position = V2new(colorpicker_open_brightness_image.Position.X + colorpicker_open_brightness_image.Size.X * (colorpicker.brightness[1] / 100), colorpicker_open_brightness_image.Position.Y-1)

                            local colorpicker_open_brightness_holder_outline = utility:Draw("Square", V2new(-1, -1), {
                                Color = Color3.fromRGB(0, 0, 0),
                                Size = colorpicker_open_brightness_holder.Size + V2new(2, 2),
                                Filled = false,
                                Parent = colorpicker_open_brightness_holder
                            })

                            utility:Image(colorpicker_open_color_image, "https://i.imgur.com/wpDRqVH.png")
                            utility:Image(colorpicker_open_brightness_image, "https://tr.rbxcdn.com/cf80cdea88fd9bbdb4037ab352260726/420/420/Image/Png")
                            utility:Image(colorpicker_open_hue_image, "https://i.imgur.com/iEOsHFv.png")
                            utility:Image(colorpicker_open_newcolor_image, "https://images-ext-1.discordapp.net/external/Nc7u8ZAc9yYabSDkX2zn48MdXjh0BL3KswXDknMm97w/https/media.discordapp.net/attachments/942749250897477662/980791504954093588/unknown.png")
                            utility:Image(colorpicker_open_oldcolor_image, "https://images-ext-1.discordapp.net/external/Nc7u8ZAc9yYabSDkX2zn48MdXjh0BL3KswXDknMm97w/https/media.discordapp.net/attachments/942749250897477662/980791504954093588/unknown.png")

                            colorpicker.content = {colorpicker_open_frame, colorpicker_open_inline, colorpicker_open_outline, colorpicker_open_accent1, colorpicker_open_accent2, colorpicker_open_inline2, colorpicker_open_title, colorpicker_open_apply,
                            colorpicker_open_color, colorpicker_open_color_image, colorpicker_open_color_inline, colorpicker_open_color_outline, colorpicker_open_brightness_image, colorpicker_open_brightness_inline, colorpicker_open_brightness_outline,
                            colorpicker_open_hue_image, colorpicker_open_hue_inline, colorpicker_open_hue_outline, colorpicker_open_newcolor_title, colorpicker_open_newcolor_image, colorpicker_open_newcolor_inline, colorpicker_open_newcolor_outline,
                            colorpicker_open_newcolor, colorpicker_open_oldcolor_title, colorpicker_open_oldcolor_image, colorpicker_open_oldcolor_inline, colorpicker_open_oldcolor_outline, colorpicker_open_oldcolor, colorpicker_open_hue_holder_outline,
                            colorpicker_open_brightness_holder_outline, colorpicker_open_color_holder_outline, colorpicker_open_color_holder, colorpicker_open_hue_holder, colorpicker_open_brightness_holder}

                            window.content.colorpicker = colorpicker.content

                        elseif #colorpicker.content > 0 and not window:MouseOverContent() and not window.fading and tab.open then
                            window:CloseContent()
                            colorpicker.content = {}
                            for i, v in pairs(colorpicker.holding) do
                                colorpicker.holding[i] = false
                            end
                        elseif #colorpicker.content > 0 and window:MouseOverContent() and not window.fadign and tab.open then
                            if utility:MouseOverDrawing(colorpicker.content[10]) then
                                local colorx = math.clamp(uis:GetMouseLocation().X - colorpicker.content[10].Position.X, 0, colorpicker.content[10].Position.X) /colorpicker.content[10].Size.X
								local colory = math.clamp(uis:GetMouseLocation().Y - colorpicker.content[10].Position.Y, 0, colorpicker.content[10].Position.Y) / colorpicker.content[10].Size.Y
								local s = colorx
								local v = (colorpicker.brightness[1] / 100) - colory

                                colorpicker.brightness[2] = colory

                                colorpicker.tempvalue = {colorpicker.tempvalue[1], s, v}

                                local minPos = V2new(colorpicker.content[10].Position.X, colorpicker.content[10].Position.Y)
                                local maxPos = V2new(colorpicker.content[10].Position.X + colorpicker.content[10].Size.X - 5, colorpicker.content[10].Position.Y + colorpicker.content[10].Size.Y - 5)
                                local holderPos = uis:GetMouseLocation()
                                if holderPos.X > maxPos.X then
                                    holderPos = V2new(maxPos.X, holderPos.Y)
                                end 
                                if holderPos.Y > maxPos.Y then
                                    holderPos = V2new(holderPos.X, maxPos.Y)
                                end
                                if holderPos.X < minPos.X then
                                    holderPos = V2new(minPos.X, holderPos.Y)
                                end 
                                if holderPos.Y < minPos.Y then
                                    holderPos = V2new(holderPos.X, minPos.Y)
                                end
                                colorpicker.content[32].Position = holderPos

                                colorpicker.holding.color = true
                            elseif utility:MouseOverDrawing(colorpicker.content[16]) then
                                local hue = math.clamp(uis:GetMouseLocation().Y - colorpicker.content[16].Position.Y, 0, colorpicker.content[16].Size.Y) / colorpicker.content[16].Size.Y

                                colorpicker.tempvalue = {hue, colorpicker.tempvalue[2], colorpicker.tempvalue[3]}

                                colorpicker.content[33].Position = V2new(colorpicker.content[16].Position.X-1, colorpicker.content[16].Position.Y + colorpicker.tempvalue[1] * colorpicker.content[16].Size.Y)

                                colorpicker.content[9].Color = Color3.fromHSV(colorpicker.tempvalue[1], 1, 1)

                                colorpicker.holding.hue = true
                            elseif utility:MouseOverDrawing(colorpicker.content[13]) then
                                local percent = math.clamp(uis:GetMouseLocation().X - colorpicker.content[13].Position.X, 0, colorpicker.content[13].Size.X) / colorpicker.content[13].Size.X

                                colorpicker.brightness[1] = 100 * percent

                                colorpicker.tempvalue[3] = (colorpicker.brightness[1] / 100) - colorpicker.brightness[2]

                                colorpicker.content[34].Position = V2new(colorpicker.content[13].Position.X + colorpicker.content[13].Size.X * (colorpicker.brightness[1] / 100), colorpicker.content[13].Position.Y-1)

                                colorpicker.holding.brightness = true
                            elseif utility:MouseOverPosition({colorpicker.content[8].Position - V2new(colorpicker.content[8].TextBounds.X / 2, 0), colorpicker.content[8].Position + V2new(colorpicker.content[8].TextBounds.X / 2, 13)}) then
                                colorpicker:Set(colorpicker.tempvalue)
                                colorpicker.tempvalue = colorpicker.value
                                colorpicker.content[28].Color = Color3.fromHSV(unpack(colorpicker.value))
                            end
                            colorpicker.content[23].Color = Color3.fromHSV(unpack(colorpicker.tempvalue))
                        end
                    end
                end)

                utility:Connect(uis.InputChanged, function(input)
                    if input.UserInputType == Enum.UserInputType.MouseMovement and #colorpicker.content > 0 then
                        if colorpicker.holding.color then
                            local colorx = math.clamp(uis:GetMouseLocation().X - colorpicker.content[10].Position.X, 0, colorpicker.content[10].Position.X) /colorpicker.content[10].Size.X
							local colory = math.clamp(uis:GetMouseLocation().Y - colorpicker.content[10].Position.Y, 0, colorpicker.content[10].Position.Y) / colorpicker.content[10].Size.Y
							local s = colorx
							local v = (colorpicker.brightness[1] / 100) - colory

                            colorpicker.brightness[2] = colory

                            colorpicker.tempvalue = {colorpicker.tempvalue[1], s, v}

                            local minPos = V2new(colorpicker.content[10].Position.X, colorpicker.content[10].Position.Y)
                            local maxPos = V2new(colorpicker.content[10].Position.X + colorpicker.content[10].Size.X - 5, colorpicker.content[10].Position.Y + colorpicker.content[10].Size.Y - 5)
                            local holderPos = uis:GetMouseLocation()
                            if holderPos.X > maxPos.X then
                                holderPos = V2new(maxPos.X, holderPos.Y)
                            end 
                            if holderPos.Y > maxPos.Y then
                                holderPos = V2new(holderPos.X, maxPos.Y)
                            end
                            if holderPos.X < minPos.X then
                                holderPos = V2new(minPos.X, holderPos.Y)
                            end 
                            if holderPos.Y < minPos.Y then
                                holderPos = V2new(holderPos.X, minPos.Y)
                            end
                            colorpicker.content[32].Position = holderPos
                        elseif colorpicker.holding.hue then
                            local hue = math.clamp(uis:GetMouseLocation().Y - colorpicker.content[16].Position.Y, 0, colorpicker.content[16].Size.Y) / colorpicker.content[16].Size.Y

                            colorpicker.tempvalue = {hue, colorpicker.tempvalue[2], colorpicker.tempvalue[3]}

                            colorpicker.content[33].Position = V2new(colorpicker.content[16].Position.X-1, colorpicker.content[16].Position.Y + colorpicker.tempvalue[1] * colorpicker.content[16].Size.Y)

                            colorpicker.content[9].Color = Color3.fromHSV(colorpicker.tempvalue[1], 1, 1)
                        elseif colorpicker.holding.brightness then
                            local percent = math.clamp(uis:GetMouseLocation().X - colorpicker.content[13].Position.X, 0, colorpicker.content[13].Size.X) / colorpicker.content[13].Size.X
                                
                            local colory = math.clamp(colorpicker.content[31].Position.Y - colorpicker.content[10].Position.Y, 0, colorpicker.content[10].Position.Y) / colorpicker.content[10].Size.Y

                            colorpicker.brightness[1] = 100 * percent

                            colorpicker.tempvalue[3] = (colorpicker.brightness[1] / 100) - colorpicker.brightness[2]

                            colorpicker.content[34].Position = V2new(colorpicker.content[13].Position.X + colorpicker.content[13].Size.X * (colorpicker.brightness[1] / 100), colorpicker.content[13].Position.Y-1)
                        end
                        colorpicker.content[23].Color = Color3.fromHSV(unpack(colorpicker.tempvalue))
                    end
                end)

                utility:Connect(uis.InputEnded, function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 and #colorpicker.content > 0 then
                        for i, v in pairs(colorpicker.holding) do
                            colorpicker.holding[i] = false
                        end
                    end
                end)

                section.offset = section.offset + 17

                tab.sectionOffsets[side] = tab.sectionOffsets[side] + 19

                section:Update()

                library.pointers[pointer] = colorpicker

                section.instances = utility:Combine(section.instances, {colorpicker_title, colorpicker_color, colorpciker_inline1, colorpciker_inline2, colorpicker_outline})
            
                return colorpicker
            end

            return section
        end

        function tab:Update()
            function getUnderIndex(i, side)
                local count = 0
                for i2, v in pairs(tab.sections) do
                    if i2 < i and v.side == side then
                        count = count + v.instances[1].Size.Y + 9
                    end
                end
                return count
            end

            for i, v in pairs(tab.sections) do
                v.instances[1].SetOffset(V2new(v.side == "left" and 9 or v.side == "right" and 245, 9 + getUnderIndex(i, v.side)))
            end
        end

        return tab
    end

    if LRM_UserNote == "owner" then
        getgenv().VersionMode = "Dev"
    else
        getgenv().VersionMode = "User"
    end

    function window:Watermark()
        local watermark = {
            name = "JewishBot",
            version = getgenv().VersionMode,
            instances = {},
            values = {}
        }

        local watermark_frame = utility:Draw("Square", V2new(), {
            Color = Color3.fromRGB(50, 50, 50),
            Size = V2new(223, 20),
            Position = V2new(60, 10)
        }, true)

        local watermark_inline = utility:Draw("Square", V2new(-1, -1), {
            Color = Color3.fromRGB(20, 20, 20),
            Size = watermark_frame.Size + V2new(2, 2),
            Filled = false,
            Parent = watermark_frame
        }, true)

        local watermark_outline = utility:Draw("Square", V2new(-2, -2), {
            Color = Color3.fromRGB(0, 0, 0),
            Size = watermark_frame.Size + V2new(4, 4),
            Filled = false,
            Parent = watermark_frame
        }, true)

        local watermark_accent1 = utility:Draw("Square", V2new(), {
            Color = accent1,
            Size = V2new(watermark_frame.Size.X, 1),
            Parent = watermark_frame
        }, true)

        table.insert(library.accents, watermark_accent1)

        local watermark_accent2 = utility:Draw("Square", V2new(0, 1), {
            Color = accent2,
            Size = V2new(watermark_frame.Size.X, 1),
            Parent = watermark_frame
        }, true)

        table.insert(library.accents, watermark_accent2)

        local watermark_inline2 = utility:Draw("Square", V2new(0, 2), {
            Color = Color3.fromRGB(20, 20, 20),
            Size = V2new(watermark_frame.Size.X, 1),
            Parent = watermark_frame
        }, true)

        local watermark_gradient = utility:Draw("Image", V2new(0, 3), {
            Size = watermark_frame.Size - V2new(0, 3),
            Transparency = 0.65,
            Parent = watermark_frame
        }, true)

        local watermark_icon = utility:Draw("Image", V2new(4, 2), {
            Size = V2new(18, 18),
            Parent = watermark_frame
        }, true)

        local watermark_title = utility:Draw("Text", V2new(28, 4), {
            Color = Color3.fromRGB(255, 255, 255),
            Outline = true,
            Size = 13,
            Font = 2,
            Text = watermark.name .. " | 0 fps | 0ms",
            Parent = watermark_frame
        }, true)

        utility:Image(watermark_gradient, "https://i.imgur.com/5hmlrjX.png")
        utility:Image(watermark_icon, "https://user-images.githubusercontent.com/88141245/214285162-a812aa79-deab-49c0-9582-483ebcb58752.png")

        function watermark:Property(i, v)
            if i == "Visible" then
                for i2, v2 in pairs(watermark.instances) do
                    v2.Visible = v
                end
            elseif i == "Icon" then
                utility:Image(watermark_icon, v)
            elseif i == "Name" then
                watermark.name = v
            end
        end

        utility:Connect(rs.Heartbeat, function(delta)
            watermark.values[1] = math.floor(1 / delta)
            watermark.values[2] = math.floor(game.Stats.PerformanceStats.Ping:GetValue())
        end)

        spawn(function()
            while task.wait(0.1) do
                if rawget(watermark_title, "__OBJECT_EXIST") then
                    watermark_title.Text = watermark.name .. " | " .. watermark.version .. " | " .. tostring(watermark.values[1]) .. " fps | " .. tostring(watermark.values[2]) .. "ms"
                    watermark_frame.Size = V2new(32 + watermark_title.TextBounds.X, 20)
                    watermark_inline.Size = watermark_frame.Size + V2new(2, 2)
                    watermark_outline.Size = watermark_frame.Size + V2new(4, 4)
                    watermark_gradient.Size = watermark_frame.Size
                    watermark_accent1.Size = V2new(watermark_frame.Size.X, 1)
                    watermark_accent2.Size = V2new(watermark_frame.Size.X, 1)
                    watermark_inline2.Size = V2new(watermark_frame.Size.X, 1)
                else
                    break
                end
            end
        end)

        watermark.instances = {watermark_frame, watermark_inline, watermark_outline, watermark_accent1, watermark_accent2, watermark_inline2, watermark_gradient, watermark_icon, watermark_title}

        watermark:Property("Visible", false)

        window.watermark = watermark
    end

    function window:Keybinds()
        local keybinds = {instances = {}, keybinds = {}}

        local keybinds_frame = utility:Draw("Square", V2new(), {
            Color = Color3.fromRGB(50, 50, 50),
            Size = V2new(62, 18),
            Position = V2new(10, math.floor(utility:ScreenSize().Y / 2))
        }, true)

        local keybinds_inline = utility:Draw("Square", V2new(-1, -1), {
            Color = Color3.fromRGB(20, 20, 20),
            Size = keybinds_frame.Size + V2new(2, 2),
            Filled = false,
            Parent = keybinds_frame
        }, true)

        local keybinds_outline = utility:Draw("Square", V2new(-2, -2), {
            Color = Color3.fromRGB(0, 0, 0),
            Size = keybinds_frame.Size + V2new(4, 4),
            Filled = false,
            Parent = keybinds_frame
        }, true)

        local keybinds_accent1 = utility:Draw("Square", V2new(), {
            Color = accent1,
            Size = V2new(keybinds_frame.Size.X, 1),
            Parent = keybinds_frame
        }, true)

        table.insert(library.accents, keybinds_accent1)

        local keybinds_accent2 = utility:Draw("Square", V2new(0, 1), {
            Color = accent2,
            Size = V2new(keybinds_frame.Size.X, 1),
            Parent = keybinds_frame
        }, true)

        table.insert(library.accents, keybinds_accent2)

        local keybinds_inline2 = utility:Draw("Square", V2new(0, 2), {
            Color = Color3.fromRGB(20, 20, 20),
            Size = V2new(keybinds_frame.Size.X, 1),
            Parent = keybinds_frame
        }, true)

        local keybinds_gradient = utility:Draw("Image", V2new(0, 3), {
            Size = keybinds_frame.Size - V2new(0, 3),
            Transparency = 0.8,
            Parent = keybinds_frame
        }, true)

        local keybinds_title = utility:Draw("Text", V2new(2, 2), {
            Color = Color3.fromRGB(255, 255, 255),
            Outline = true,
            Size = 13,
            Font = 2,
            Text = "Keybinds",
            Parent = keybinds_frame
        }, true)

        utility:Image(keybinds_gradient, "https://i.imgur.com/5hmlrjX.png")

        function keybinds:Longest()
            if #keybinds.keybinds > 0 then
                local copy = utility:CopyTable(keybinds.keybinds)
                table.sort(copy, function(a, b)
                    return utility:GetTextSize(a, 2, 13).X > utility:GetTextSize(b, 2, 13).X
                end)
                return utility:GetTextSize(copy[1], 2, 13).X
            end
            return 0
        end

        function keybinds:Redraw()
            for _, v in pairs({select(9, unpack(keybinds.instances))}) do
                v.Remove()
            end

            keybinds.instances = {keybinds_frame, keybinds_inline, keybinds_outline, keybinds_accent1, keybinds_accent2, keybinds_inline2, keybinds_gradient, keybinds_title}

            if keybinds:Longest() + 6 > 60 then
                keybinds_frame.Size = V2new(keybinds:Longest() + 6, (#keybinds.keybinds + 1) * 16 + 2)
                keybinds_inline.Size = keybinds_frame.Size + V2new(2, 2)
                keybinds_outline.Size = keybinds_frame.Size + V2new(4, 4)
                keybinds_accent1.Size = V2new(keybinds_frame.Size.X, 1)
                keybinds_accent2.Size = V2new(keybinds_frame.Size.X, 1)
                keybinds_inline2.Size = V2new(keybinds_frame.Size.X, 1)
                keybinds_gradient.Size = keybinds_frame.Size
            else
                keybinds_frame.Size = V2new(60, (#keybinds.keybinds + 1) * 16 + 2)
                keybinds_inline.Size = keybinds_frame.Size + V2new(2, 2)
                keybinds_outline.Size = keybinds_frame.Size + V2new(4, 4)
                keybinds_accent1.Size = V2new(keybinds_frame.Size.X, 1)
                keybinds_accent2.Size = V2new(keybinds_frame.Size.X, 1)
                keybinds_inline2.Size = V2new(keybinds_frame.Size.X, 1)
                keybinds_gradient.Size = keybinds_frame.Size
            end

            for i, v in pairs(keybinds.keybinds) do
                local keybind_title = utility:Draw("Text", V2new(2, 16 * i + 2), {
                    Color = Color3.fromRGB(255, 255, 255),
                    Outline = true,
                    Size = 13,
                    Font = 2,
                    Text = v,
                    Parent = keybinds_frame,
                    Visible = keybinds_frame.Visible
                }, true)

                table.insert(keybinds.instances, keybind_title)
            end
        end

        function keybinds:Add(name)
            if not table.find(keybinds.keybinds, name) then
                table.insert(keybinds.keybinds, name)
                keybinds:Redraw()
            end
        end

        function keybinds:Remove(name)
            if table.find(keybinds.keybinds, name) then
                table.remove(keybinds.keybinds, table.find(keybinds.keybinds, name))
                keybinds:Redraw()
            end
        end

        function keybinds:Property(i, v)
            if i == "Visible" then
                for _, v2 in pairs(keybinds.instances) do
                    v2.Visible = v
                end
            end
        end

        keybinds.instances = {keybinds_frame, keybinds_inline, keybinds_outline, keybinds_accent1, keybinds_accent2, keybinds_inline2, keybinds_gradient, keybinds_title}

        keybinds:Property("Visisble", false)

        window.keybinds = keybinds
    end

    function window:ChangeAccent(atype, color)
        for i, v in pairs(library.accents) do
            if rawget(v, "__OBJECT_EXIST") then
                if atype:lower() == "accent1" and v.Color == accent1 or atype:lower() == "accent2" and v.Color == accent2 then
                    v.Color = color
                end
            end
        end
        if atype:lower() == "accent1" then
            accent1 = color
        else
            accent2 = color
        end
    end
    
    function window:Rename(value)
        title.Text = value
    end

    function window:GetConfig()
        local config = {}
        for i, v in pairs(library.pointers) do
            config[i] = v:Get()
        end
        return game:GetService("HttpService"):JSONEncode(config)
    end

    function window:LoadConfig(config)
        for i, v in pairs(game:GetService("HttpService"):JSONDecode(config)) do
            if library.pointers[i] then
                library.pointers[i]:Set(v)
            end
        end
    end

    function window:Update()
        for i, v in pairs(window.tabs) do
            v:Update()
        end
        window:UpdateTabs()
    end

    function window:MouseOverContent()
        if window_frame.Visible then
            if window.content.dropdown then
                return utility:MouseOverDrawing(window.content.dropdown[1])
            elseif window.content.colorpicker then
                return utility:MouseOverDrawing(window.content.colorpicker[1])
            elseif window.content.keybind then
                return utility:MouseOverDrawing(window.content.keybind[1])
            end
        end 
        return not window_frame.Visible
    end

    function window:CloseContent()
        if window.content.dropdown then
            for i, v in pairs(window.content.dropdown) do
                v.Remove()
            end
            window.content.dropdown = nil
        elseif window.content.colorpicker then
            for i, v in pairs(window.content.colorpicker) do
                v.Remove()
            end
            window.content.colorpicker = nil
        elseif window.content.keybind then
            for i, v in pairs(window.content.keybind) do
                v.Remove()
            end
            window.content.keybind = nil
        end
    end

    function window:UpdateTabs()
        for _, v in pairs(window.tabs) do
            if v.open == false then
                v:Hide()
            else
                v:Show()
            end
        end
    end

    function window:SetTab(name)
        for _, v in pairs(window.tabs) do
            if v.name == name then
                v.open = true
            else
                v.open = false
            end
        end
        window:UpdateTabs()
        window:CloseContent()
    end

    function window:Load()
        getgenv().window_state = "pre"
        window:SetTab(window.tabs[1].name)
        task.wait(0.3)
        getgenv().window_state = "initializing"
        window:Watermark()
        window:Keybinds()
        library.loaded = true
        task.wait(0.3)
        getgenv().window_state = "post"
        task.wait(0.5)
        window:Toggle()
        repeat task.wait() until window.fading == false
        getgenv().window_state = "finished"
    end

    function window:Unload()
        for i, v in pairs(library.connections) do
            v:Disconnect()
        end
        for i, v in pairs(utility:Combine(library.drawings, library.hidden)) do
            v[1].Remove()
        end

        FOV:Remove()

        library.loaded = false
    end

    return window
end


local lplr = game.Players.LocalPlayer
local aimbot_target = nil
local ragebot_target = nil

local desync_stuff = {}
local icons_stuff = {["JewishBot"] = "https://user-images.githubusercontent.com/88141245/214285162-a812aa79-deab-49c0-9582-483ebcb58752.png", ["BitchBot"] = "https://tr.rbxcdn.com/74ac16e97027fc4dd6cec71eb2932dba/420/420/Image/Png"}

function isAlive(player)
    local alive = false
    if player ~= nil and player.Parent == game.Players and player.Character ~= nil then
		if player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("Humanoid") ~= nil and player.Character.Humanoid.Health > 0 and player.Character:FindFirstChild("Head") then
			alive = true
		end
    end

    return alive
end

function isTarget(plr, teammates)
	if isAlive(plr) then
		if not plr.Neutral and not lplr.Neutral then
			if teammates == false then
				return plr.Team ~= lplr.Team
			elseif teammates == true then
				return plr ~= lplr
			end
		else
			return plr ~= lplr
		end
	end
end

function getConfigs()
    local configs = {"-"}
    for i, v in pairs(listfiles("beanbot/Da Hood/configs/")) do
        if tostring(v):sub(-5, -1) == ".bean" then
            table.insert(configs, tostring(v):sub(24, -6))
        end
    end

    return configs
end

function RandomNumberRange(a)
    return math.random(-a * 100, a * 100) / 100
end

function RandomVectorRange(a, b, c)
    return V3new(RandomNumberRange(a), RandomNumberRange(b), RandomNumberRange(c))
end

function GetPlayerNames()
    local names = {lplr.Name}
    for i, v in pairs(game.Players:GetPlayers()) do
        if v ~= lplr then
            table.insert(names, v.Name)
        end
    end
    return names
end

local window = library:New({name = "JewishBot"})

local legittab = window:Tab({name = "Legit"})
local visualstab = window:Tab({name = "Visuals"})
local settings = window:Tab({name = "Settings"})

local SilentAim = legittab:Section({name = "Aimbot", side = "left"})
local SilentVisuals = legittab:Section({name = "Visuals", side = "right"})

local PlayerESP = visualstab:Section({name = "Player ESP"})
local LocalPlayer = visualstab:Section({name = "Local Player"})

local settings_ui = settings:Section({name = "UI"})
local settings_config = settings:Section({name = "Config"})
local settings_game = settings:Section({name = "Game", side = "right"})


local ragebotsettings = { 
    HookingMethod = "",
    enabled = false,
    key = Enum.KeyCode.Q,
    prediction = 0,
    part = "Head",
    radius = 180,
    fov = false,
    WallCheck = false,
    ClosestBodyPart = false,
    KnockedCheck = false,
    HitLogs = false,
    Tracer = false,
    HealthIndicator = false,
    AmmoIndicator = false,
    Chams = false,
    Glow = false,
    Resolver = false,
    AutoShoot = false,
    FireRateDelay = 0.1,
    Freestand = false,
    FreestandOffset = 1,
    FakeLag = false,
    FakeLagType = "Normal",
    TickTime = 0.14,
    Walk = false,
    WalkSpeed = 1,
    AutoReload = false,
    ChatSpam = false,
    ChatSpamType = "avon.hook",
    ChatSpamDelay = 2,
    HitSound = false,
    HitSoundType = "",
    DesyncResolver = false,
    HitChance = 100,
}

local AimAssist = {
    Settings = {
        Enabled = false,
        Prediction = 1,
        AimPart = 'Head'
    }
}

local CurrentCamera = game:GetService("Workspace").CurrentCamera
local RunService = game:GetService("RunService")
local Mouse = game.Players.LocalPlayer:GetMouse()
local Plr

function FindClosestPlayer()
    local closestPlayer
    local shortestDistance = math.huge

    for i, v in pairs(game.Players:GetPlayers()) do
        if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and
            v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") then
            local pos = CurrentCamera:WorldToViewportPoint(v.Character.PrimaryPart.Position)
            local magnitude = (V2new(pos.X, pos.Y) - V2new(Mouse.X, Mouse.Y)).magnitude
            if magnitude < shortestDistance then
                closestPlayer = v
                shortestDistance = magnitude
            end
        end
    end
    return closestPlayer
end

if game.PlaceId == 2788229376 then
    ragebotsettings.HookingMethod = "UpdateMousePos"
elseif game.PlaceId == 9825515356 then
    ragebotsettings.HookingMethod = "GetMousePos"
else
    ragebotsettings.HookingMethod = "UpdateMousePos"
end


getgenv().oldhealth = 0

--Drawing Lib Sets
local Line = Drawnew("Line")
Line.Color = Color3.fromRGB(133, 87, 242)
Line.Thickness = 1
Line.Transparency = 1
Line.Visible = false
Line.ZIndex = 1

--Health Indicator
local HealthIndicator = Drawnew("Text")
    HealthIndicator.Transparency = 1
    HealthIndicator.Visible = false
    HealthIndicator.Color = Color3.fromRGB(255, 255, 255)
    HealthIndicator.Size = 13
    HealthIndicator.Center = true
    HealthIndicator.Outline = true
    HealthIndicator.Font = 2
    HealthIndicator.Text = "Name [N/A]"

    --Ammo Indicator
local AmmoIndicator = Drawnew("Text")
AmmoIndicator.Transparency = 1
AmmoIndicator.Visible = false
AmmoIndicator.Color = Color3.fromRGB(1, 112, 255)
AmmoIndicator.Size = 13
AmmoIndicator.Center = true
AmmoIndicator.Outline = true
AmmoIndicator.Font = 2
AmmoIndicator.Text = "[N/A]"


local plr = game.Players.LocalPlayer
local mouse = game.Players.LocalPlayer:GetMouse()
local runserv = game:GetService('RunService')

fov = Drawnew("Circle")
fov.Color = Color3.fromRGB(133, 87, 242)
fov.Thickness = 0
fov.NumSides = 400
fov.Radius = ragebotsettings.radius
fov.Thickness = 0
fov.Transparency = 1
fov.Visible = ragebotsettings.fov
fov.Filled = false

local camera = game.Workspace.Camera
local target = false

function UpdateFOVFunctions()
fov.Thickness = 0
fov.Position = V2new(mouse.X, mouse.Y+35)
fov.Radius = ragebotsettings.radius
fov.Visible = ragebotsettings.fov

return fov
end

function WallCheck(part, ignore) 
if ragebotsettings.WallCheck then
    Origin = camera.CFrame.Position
    CheckRay = Ray.new(Origin, part- Origin)
    Hit = workspace:FindPartOnRayWithIgnoreList(CheckRay, ignore)
    return Hit == nil
else
    return true
end
end

function AutoWallCheck(part, ignore) 
    if ragebotsettings.AutoShoot and game.Players.LocalPlayer.Character then
        Origin = game.Players.LocalPlayer.Character:FindFirstChild("RightHand").Position
        CheckRay = Ray.new(Origin, part- Origin)
        Hit = workspace:FindPartOnRayWithIgnoreList(CheckRay, ignore)
        return Hit == nil
    else
        return true
    end
    end

function KnockCheck(player)
if ragebotsettings.KnockedCheck then
    if player.Character.BodyEffects:FindFirstChild("K.O").Value == false then
        return true
    end 
else
    return true
end
end

local gs = game:GetService("GuiService")
local ggi = gs.GetGuiInset

function FindMagnitudeOfPart(player)
local pos = camera:WorldToViewportPoint(player.Position)
local magnitude = (V2new(pos.X, pos.Y) - V2new(mouse.X, mouse.Y + ggi(gs).Y)).magnitude
return magnitude
end

function ClosestBodyPart(player)  
local Body = nil
local shortestDistance = math.huge
for i,v in ipairs(player.Character:GetChildren()) do
    if v.ClassName == "Part" or v.ClassName == "MeshPart" then
        local pos = FindMagnitudeOfPart(v)
        if pos < shortestDistance then
            Body = v.Name
            shortestDistance = pos
        end 
    end
end
return Body
end

local UIS = game:GetService('UserInputService')
local Workspace = game:GetService('Workspace')

function getclosestplayer()
local closest
local distance = fov.Radius

for i, v in pairs(game.Players:GetPlayers()) do
    if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and WallCheck(v.Character.HumanoidRootPart.Position,{plr.Character,v.Character}) and KnockCheck(v) and v.Character:FindFirstChild("LowerTorso") then
        

        local pos,vis = camera:WorldToViewportPoint(v.Character.PrimaryPart.Position)
        local magnitude = (V2new(pos.X, pos.Y) - V2new(mouse.X, mouse.Y)).Magnitude

        if (fov.Radius > magnitude and magnitude < distance and vis) then
            closest = v
            distance = magnitude
        end
    end
    end
    return closest
end

local Chams = Instance.new("Highlight")
Chams.Parent = game.CoreGui
Chams.FillColor = Color3.fromRGB(26, 220, 32)
Chams.OutlineColor = Color3.fromRGB(255,255,255)
Chams.FillTransparency = 1
Chams.OutlineTransparency = 1

getgenv().GunChams = false
getgenv().GunColor = Color3.fromRGB(255,255,255)
getgenv().SelfChams = false
getgenv().SelfColor = game.Players.LocalPlayer.Character.Head.Color
getgenv().AntiStomp = false
getgenv().AntiFling = false
getgenv().FakeAimViewer = false

    -- // Chance
    function CalculateChance(Percentage)
        -- // Floor the percentage
        Percentage = math.floor(Percentage)

        local chance = math.floor(Randomnew().NextNumber(Randomnew(), 0, 1) * 100) / 100

        return chance <= Percentage / 100
    end


--Main Loop--
runserv.Stepped:Connect(function()
    fov.Position = V2new(mouse.X,mouse.Y+35)

if actualtarget and ragebotsettings.ClosestBodyPart then
    AimAssist.Settings.AimPart = ClosestBodyPart(actualtarget)
end

    local Vector, OnScreen = camera:worldToViewportPoint(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position)
    Line.From = V2new(Vector.X, Vector.Y)

if ragebotsettings.Tracer == true and actualtarget then
    local Vector, OnScreen = camera:worldToViewportPoint(actualtarget.Character[AimAssist.Settings.AimPart].Position + actualtarget.Character:FindFirstChild("Humanoid").MoveDirection*AimAssist.Settings.Prediction)
    Line.Visible = true
    Line.To = V2new(Vector.X, Vector.Y)
else
    Line.Visible = false
end

if ragebotsettings.HealthIndicator == true and actualtarget then
    local Vector, OnScreen = camera:worldToViewportPoint(actualtarget.Character.Head.Position)
    local Health = actualtarget.Character.Humanoid.Health
    local Name = actualtarget.Character.Humanoid.DisplayName
    local Armor = actualtarget.Character.BodyEffects.Armor.Value
    HealthIndicator.Visible = true
    HealthIndicator.Position = V2new(Vector.X, Vector.Y - 30)
    HealthIndicator.Text = ""..Name.." ["..math.floor(Health).."/100] Armor: ["..Armor.."/130]"
else
    HealthIndicator.Visible = false
end

pcall(function()
if ragebotsettings.AmmoIndicator == true and actualtarget then
    local Vector, OnScreen = camera:worldToViewportPoint(actualtarget.Character.Head.Position)
    AmmoIndicator.Visible = true
    AmmoIndicator.Position = V2new(Vector.X, Vector.Y + 30)
    if actualtarget.Character:FindFirstChildOfClass("Tool") and actualtarget.Character:FindFirstChildOfClass("Tool"):FindFirstChild("Ammo") then
        local Ammo = actualtarget.Character:FindFirstChildOfClass("Tool"):FindFirstChild("Ammo").Value
    AmmoIndicator.Text = "["..Ammo.."]"
    else
        AmmoIndicator.Text = "[N/A]"
    end
else
    AmmoIndicator.Visible = false
end
end)

if ragebotsettings.AutoShoot and maintarget and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool"):FindFirstChild("Ammo") then
    if AutoWallCheck(maintarget.Character.HumanoidRootPart.Position,{plr.Character,maintarget.Character}) and KnockCheck(maintarget) then
        game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool"):Activate()
                wait(ragebotsettings.FireRateDelay)
    end
end

if ragebotsettings.AutoShoot and Plr and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool"):FindFirstChild("Ammo") then
    if AutoWallCheck(Plr.Character.HumanoidRootPart.Position,{plr.Character,Plr.Character}) and KnockCheck(Plr) then
        game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool"):Activate()
                wait(ragebotsettings.FireRateDelay)
    end
end

if ragebotsettings.AutoReload and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool"):FindFirstChild("Ammo") then
    local GunName = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Name

    if game.Players.LocalPlayer.Character[GunName]:FindFirstChild("Ammo").Value <= 0 then

local ReloadArgument = "Reload"
local GunPos = game.Players.LocalPlayer.Character[GunName]

if game.Players.LocalPlayer.Character.BodyEffects.Reload.Value == false then
game:GetService("ReplicatedStorage").MainEvent:FireServer(ReloadArgument, GunPos)
task.wait(2)
else
    task.wait(2)
end
    end
end

if getgenv().GunChams then
    pcall(function()
        if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool"):FindFirstChild("Ammo") then
    game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Default.Material = "ForceField"
    game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Default.Color = getgenv().GunColor
        end
    end)
else
    pcall(function()
    game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Default.Material = "Plastic"
    end)
end

if getgenv().SelfChams then
    pcall(function()
    if game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character.Humanoid and game.Players.LocalPlayer.Character.Humanoid.Health ~= 0 then
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA("MeshPart") or v:IsA("Part") then
                v.Material = "ForceField"
                v.Color = getgenv().SelfColor
            end
        end
    end
end)
else
    pcall(function()
    if game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character.Humanoid and game.Players.LocalPlayer.Character.Humanoid.Health ~= 0 then
        for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA("MeshPart") or v:IsA("Part") then
                v.Material = "Plastic"
                end
            end
        end
    end)
end

if getgenv().AntiStomp then
    pcall(function()
        if game.Players.LocalPlayer.Character.Humanoid.Health <= 5 then
            for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v:Destroy()
                end
            end
        end
    end)
end

if getgenv().FakeAimViewer then
    pcall(function()
        game.Players.LocalPlayer.Character.BodyEffects.MousePos.Value = V3new(0,0,0)
    end)
end

pcall(function()
    if target and ragebotsettings.DesyncResolver then
        actualtarget.Character.HumanoidRootPart.Velocity = V3new(0,0,0)
        actualtarget.Character.HumanoidRootPart.AssemblyLinearVelocity = V3new(0,0,0)
    end
end)

UpdateFOVFunctions()


if ragebotsettings.enabled and AimAssist.Settings.Enabled then
    maintarget = getclosestplayer()
    if maintarget then
    actualtarget = maintarget
    end
end

if ragebotsettings.enabled == false or AimAssist.Settings.Enabled == false then
    maintarget = nil
    actualtarget = nil
end

if maintarget == nil then
    actualtarget = nil
end

local Chance = CalculateChance(ragebotsettings.HitChance)
if Chance == false then
    maintarget = nil
end

if AimAssist.Settings.Enabled == true and ragebotsettings.enabled == false then
Plr = getclosestplayer()
end

if AimAssist.Settings.Enabled == false then
    Plr = nil
end

pcall(function()
if AimAssist.Settings.Enabled == true and ragebotsettings.enabled == false then
    local Vector = CurrentCamera:WorldToScreenPoint(Plr.Character[AimAssist.Settings.AimPart].Position + (Plr.Character.Humanoid.MoveDirection * AimAssist.Settings.Prediction))
    mousemoverel(Vector.X - Mouse.X, Vector.Y - Mouse.Y)
end
end)

end)

local gm = getrawmetatable(game)
local old_index = gm.__namecall
setreadonly(gm, false)
gm.__namecall = newcclosure(function(...)
local args = {...}
if maintarget and AimAssist.Settings.Enabled and getnamecallmethod() == "FireServer" and args[2] == ragebotsettings.HookingMethod then
        args[3] = maintarget.Character[AimAssist.Settings.AimPart].Position+(maintarget.Character.Humanoid.MoveDirection*AimAssist.Settings.Prediction)
    return old_index(unpack(args))
end
return old_index(...)
end)

UIS.InputBegan:Connect(function(input, gameProcessedEvent)
    if ragebotsettings.HitSound then
if input.UserInputType == Enum.UserInputType.MouseButton1 then
    if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool"):FindFirstChild("Ammo") then
        task.wait(0.3)
        if maintarget.Character.Humanoid.Health < getgenv().oldhealth then
        if ragebotsettings.HitSoundType == "Bubble" then
            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://7147454322"
            sound.Parent = game:GetService("SoundService")
            sound.Volume = 6
            sound.PlaybackSpeed = 0.4
            sound:Play()
            getgenv().oldhealth = maintarget.Character.Humanoid.Health
        elseif ragebotsettings.HitSoundType == "GL" then
            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://1981976520"
            sound.Parent = game:GetService("SoundService")
            sound.Volume = 6
            sound.PlaybackSpeed = 1
            sound:Play()
            getgenv().oldhealth = maintarget.Character.Humanoid.Health
        elseif ragebotsettings.HitSoundType == "PewPew" then
            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://3008769599"
            sound.Parent = game:GetService("SoundService")
            sound.Volume = 6
            sound.PlaybackSpeed = 5
            sound:Play()
            getgenv().oldhealth = maintarget.Character.Humanoid.Health
        end
    end
end
end
end
end)

        SilentAim:Toggle({name = "Enabled", flag = "FLAGfsacG", callback = function(callback) AimAssist.Settings.Enabled = callback end}):Keybind()
        SilentAim:Slider({name = "Prediction", min = 0, max = 5, def = 1, decimals = 0.1, suf = "cf", flag = "Tecsafst", callback = function(callback) AimAssist.Settings.Prediction = callback end})
        SilentAim:Dropdown({name = "Aimpart", options = {"Head", "Torso", "Stomach", "Pelvis"}, flag = "Dropdocsawfg", callback = function(callback) if callback == "Head" then AimAssist.Settings.AimPart = "Head" elseif callback == "Torso" then AimAssist.Settings.AimPart = "UpperTorso" elseif callback == "Stomach" then AimAssist.Settings.AimPart = "HumanoidRootPart" elseif callback == "Pelvis" then AimAssist.Settings.AimPart = "LowerTorso" end end})

SilentAim:Toggle({name = "Silent", flag = "FLAGOMG", callback = function(callback) ragebotsettings.enabled = callback end}):Keybind()
SilentAim:Slider({name = "Hit Chance", min = 0, max = 100, def = 100, decimals = 1, suf = "%", flag = "Tecsawdst", callback = function(callback) ragebotsettings.HitChance = callback end})
SilentAim:Toggle({name = "Wall Check", flag = "Ffsfasfass", callback = function(callback) ragebotsettings.WallCheck = callback end})
SilentAim:Toggle({name = "Closest Part", flag = "Ffcsas", callback = function(callback) ragebotsettings.ClosestBodyPart = callback end})
SilentAim:Toggle({name = "Knocked Check", flag = "Ffsvsaass", callback = function(callback) ragebotsettings.KnockedCheck = callback end})
SilentAim:Toggle({name = "Autoshoot", flag = "Ffsvsaass", callback = function(callback) ragebotsettings.AutoShoot = callback end})
SilentAim:Toggle({name = "Resolver", flag = "Ffsvsvda", callback = function(callback) ragebotsettings.DesyncResolver = callback end})
SilentVisuals:Toggle({name = "Show FOV", flag = "ToggleFlag", callback = function(callback) ragebotsettings.fov = callback end}):Colorpicker({name = "FOV Colour", flag = "Covasfsickerflag", def = Color3.fromRGB(133, 87, 242), callback = function(callback) fov.Color = callback end})
SilentVisuals:Slider({name = "Radius", min = 0, max = 180, def = 1, decimals = 1, suf = "px", flag = "Tvasdvsast", callback = function(callback) ragebotsettings.radius = callback*3 end})
SilentVisuals:Toggle({name = "Tracer", flag = "Toggcsag", callback = function(callback) ragebotsettings.Tracer = callback end}):Colorpicker({name = "Tracer Colour", flag = "Covasfsixsaflag", def = Color3.fromRGB(133, 87, 242), callback = function(callback) Line.Color = callback end})
SilentVisuals:Toggle({name = "Health Indicator", flag = "Togcsasfa", callback = function(callback) ragebotsettings.HealthIndicator = callback end})
SilentVisuals:Toggle({name = "Ammo Indicator", flag = "Togccsaa", callback = function(callback) ragebotsettings.AmmoIndicator = callback end})

local maintable = {
    visuals = {
        box = {
            masterswitch = false,
            enabled = false,
            outline = false,
            healthbar = false,
            color1 = Color3.fromRGB(255, 255, 255),
            color2 = Color3.fromRGB(0, 0, 0),
            healthbarcolor = Color3.fromRGB(255, 255, 255),
            filled = false,
            filledtrans = 0,
            self = false,
            rainbow = false,
            armorbar = false,
            armorbarcolor = Color3.fromRGB(255, 255, 255),
            armorbaroutline = false,
        },
                tracer = {
                    enabled = false,
                    unlocktracers = false,
                    color = Color3.fromRGB(255, 255, 255)
                },
                name = {
                    enabled = false,
                    outline = false,
                    size = 13,
                    font = 2,
                    color = Color3.fromRGB(255, 255, 255)
                },
                misc = {
                    teamcheck = false,
                    useteamcolors = false,
                    visibleonly = true
                },
                Toolsshow = {
                    enable = false,
                    outline = false,
                    size = 8,
                    font = 2,
                    color = Color3.fromRGB(255, 255, 255)
    },
},
}

local lplr = game.Players.LocalPlayer
local camera = game:GetService("Workspace").CurrentCamera
local CurrentCamera = workspace.CurrentCamera
local worldToViewportPoint = CurrentCamera.worldToViewportPoint
local mouse = game.Players.LocalPlayer:GetMouse()
local UserInput = game:GetService("UserInputService")

assert(maintable.visuals, "Loaded LLOLL")

function esp(v)
-- box --
local BLOCKOUTLINE = Drawnew("Square")
BLOCKOUTLINE.Visible = false
BLOCKOUTLINE.Color = Color3.new(0,0,0)
BLOCKOUTLINE.Thickness = 3
BLOCKOUTLINE.Transparency = 1

local BOXPLAYER = Drawnew("Square")
BOXPLAYER.Visible = false
BOXPLAYER.Color = maintable.visuals.box.color1
BOXPLAYER.Thickness = 1
BOXPLAYER.Transparency = 1
BOXPLAYER.Filled = maintable.visuals.box.filled

local HealthBarITSELF = Drawnew("Square")
HealthBarITSELF.Thickness = 1
HealthBarITSELF.Filled = false
HealthBarITSELF.Transparency = 1
HealthBarITSELF.Visible = false

local ArmorBarITSELF = Drawnew("Square")
ArmorBarITSELF.Thickness = 1
ArmorBarITSELF.Filled = false
ArmorBarITSELF.Transparency = 1
ArmorBarITSELF.Visible = false




-- tracer --

local Tracer = Drawnew("Line")
Tracer.Visible = false
Tracer.Color = Color3.new(1,1,1)
Tracer.Thickness = 1
Tracer.Transparency = 1

-- name --

local Name = Drawnew("Text")
Name.Transparency = 1
Name.Visible = false
Name.Color = maintable.visuals.name.color
Name.Size = 16
Name.Center = true
Name.Outline = false
Name.Font = 2
Name.Text = "name [100/100]"


--tool--

local toolshow = Drawnew("Text")
toolshow.Transparency = 1
toolshow.Visible = false
toolshow.Color = maintable.visuals.Toolsshow.color
toolshow.Size = 16
toolshow.Center = true
toolshow.Outline = false
toolshow.Font = 2
toolshow.Text = ""















local ESPLoop = runserv.Stepped:Connect(function()
if maintable.visuals.box.self == true then
if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v.Character.Humanoid.Health  > 0 and (not maintable.visuals.misc.teamcheck or v.TeamColor == lplr.TeamColor) then
    local Vector, onScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)
    local Distance = (CurrentCamera.CFrame.p - v.Character.HumanoidRootPart.Position).Magnitude
    local RootPart = v.Character.HumanoidRootPart
    local Head = v.Character.Head
    local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)
    local HeadPosition = worldToViewportPoint(CurrentCamera, Head.Position + V3new(0,0.5,0))
    local LegPosition = worldToViewportPoint(CurrentCamera, RootPart.Position - V3new(0,3,0))
    if (not maintable.visuals.misc.visibleonly or onScreen) then
        if maintable.visuals.box.masterswitch then
            BLOCKOUTLINE.Size = V2new(2500 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
            BLOCKOUTLINE.Position = V2new(RootPosition.X - BLOCKOUTLINE.Size.X / 2, RootPosition.Y - BLOCKOUTLINE.Size.Y / 2)
            BLOCKOUTLINE.Visible = maintable.visuals.box.outline
            BLOCKOUTLINE.Color = Color3.fromRGB(0, 0, 0)
            BLOCKOUTLINE.Filled = false
            

            BOXPLAYER.Size = V2new(2490 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
            BOXPLAYER.Position = V2new(RootPosition.X - BOXPLAYER.Size.X / 2, RootPosition.Y - BOXPLAYER.Size.Y / 2)
            BOXPLAYER.Visible = maintable.visuals.box.enabled
            if not maintable.visuals.misc.useteamcolors then
                local color = v.TeamColor
                BOXPLAYER.Color = maintable.visuals.box.color1
            else
                BOXPLAYER.Color = maintable.visuals.box.color1
            end
            BOXPLAYER.Filled = maintable.visuals.box.filled
            BOXPLAYER.Transparency = 1
                
            HealthBarITSELF.Size = V2new(2, (HeadPosition.Y - LegPosition.Y) / (v.Character.Humanoid.MaxHealth / math.clamp(v.Character.Humanoid.Health, 0,v.Character.Humanoid.MaxHealth)))
            HealthBarITSELF.Position = V2new(BOXPLAYER.Position.X - 8, BOXPLAYER.Position.Y + (1 / HealthBarITSELF.Size.Y))
            HealthBarITSELF.Color = maintable.visuals.box.healthbarcolor
            HealthBarITSELF.Visible = maintable.visuals.box.healthbar
            HealthBarITSELF.Filled = true

            if maintable.visuals.box.healthbar then
                ArmorBarITSELF.Size = V2new(2, (HeadPosition.Y - LegPosition.Y) / (100 / math.clamp(v.Character.BodyEffects.Armor.Value, 0,100)))
                ArmorBarITSELF.Position = V2new(BOXPLAYER.Position.X - 16, BOXPLAYER.Position.Y + (1 / HealthBarITSELF.Size.Y))
                ArmorBarITSELF.Color = maintable.visuals.box.armorbarcolor
                ArmorBarITSELF.Visible = maintable.visuals.box.armorbar
                ArmorBarITSELF.Filled = true
                else
                    ArmorBarITSELF.Size = V2new(2, (HeadPosition.Y - LegPosition.Y) / (100 / math.clamp(v.Character.BodyEffects.Armor.Value, 0,100)))
                    ArmorBarITSELF.Position = V2new(BOXPLAYER.Position.X - 8, BOXPLAYER.Position.Y + (1 / HealthBarITSELF.Size.Y))
                    ArmorBarITSELF.Color = maintable.visuals.box.armorbarcolor
                    ArmorBarITSELF.Visible = maintable.visuals.box.armorbar
                    ArmorBarITSELF.Filled = true
                end
            
            
            
        else
            BLOCKOUTLINE.Visible = false
            BOXPLAYER.Visible = false
            toolshow.Visible=false
            HealthBarITSELF.Visible = false
            ArmorBarITSELF.Visible = false
            Tracer.Visible = false
            Name.Visible = false
        end
        if maintable.visuals.tracer.enabled then
            if maintable.visuals.tracer.unlocktracers then
                Tracer.From = V2new(mouse.X, mouse.Y + 36)
            else
                Tracer.From = V2new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 1)
            end
            Tracer.To = V2new(Vector.X, Vector.Y)
            Tracer.Visible = maintable.visuals.tracer.enabled
            if not maintable.visuals.misc.useteamcolors then
                local color = v.TeamColor
                Tracer.Color = maintable.visuals.tracer.color
            else
                Tracer.Color = maintable.visuals.tracer.color
            end
        else
            Tracer.Visible = false
        end

        if maintable.visuals.Toolsshow.enable then
              local Equipped = v.Character:FindFirstChildOfClass("Tool") and v.Character:FindFirstChildOfClass("Tool").Name or "None"
            toolshow.Text = Equipped
            toolshow.Position = V2new(workspace.Camera:WorldToViewportPoint(v.Character.Head.Position).X, workspace.Camera:WorldToViewportPoint(v.Character.Head.Position).Y + 30)
            toolshow.Color = maintable.visuals.Toolsshow.color
            toolshow.Font = 3
            Name.Size = maintable.visuals.Toolsshow.size
            toolshow.Visible = true
            else
                toolshow.Visible = false
        end


        if maintable.visuals.name.enabled then
            Name.Text = tostring(v.Name).. " [" .. tostring(math.floor(v.Character.Humanoid.Health + 0.5)) .. "/" .. tostring(v.Character.Humanoid.MaxHealth) .. "]"
            Name.Position = V2new(workspace.Camera:WorldToViewportPoint(v.Character.Head.Position).X, workspace.Camera:WorldToViewportPoint(v.Character.Head.Position).Y - 30)
            Name.Visible = true
            Name.Size = maintable.visuals.name.size
            if not maintable.visuals.misc.useteamcolors then
                local color = v.TeamColor
                Name.Color = maintable.visuals.name.color
            else
                Name.Color = maintable.visuals.name.color
            end
            Name.Outline = maintable.visuals.name.outline
        else
            Name.Visible = false
        end
    else
        BLOCKOUTLINE.Visible = false
        BOXPLAYER.Visible = false
        toolshow.Visible=false
        HealthBarITSELF.Visible = false
        ArmorBarITSELF.Visible = false
        Tracer.Visible = false
        Name.Visible = false
    end
else
    toolshow.Visible=false
    BLOCKOUTLINE.Visible = false
    BOXPLAYER.Visible = false
    HealthBarITSELF.Visible = false
    ArmorBarITSELF.Visible = false
    Tracer.Visible = false
    Name.Visible = false
end
else
if v.Character ~= nil and v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("HumanoidRootPart") ~= nil and v ~= lplr and v.Character.Humanoid.Health  > 0 and (not maintable.visuals.misc.teamcheck or v.TeamColor == lplr.TeamColor) then
    local Vector, onScreen = camera:worldToViewportPoint(v.Character.HumanoidRootPart.Position)
    local Distance = (CurrentCamera.CFrame.p - v.Character.HumanoidRootPart.Position).Magnitude
    local RootPart = v.Character.HumanoidRootPart
    local Head = v.Character.Head
    local RootPosition, RootVis = worldToViewportPoint(CurrentCamera, RootPart.Position)
    local HeadPosition = worldToViewportPoint(CurrentCamera, Head.Position + V3new(0,0.5,0))
    local LegPosition = worldToViewportPoint(CurrentCamera, RootPart.Position - V3new(0,3,0))
    if (not maintable.visuals.misc.visibleonly or onScreen) then
        if maintable.visuals.box.masterswitch then
            BLOCKOUTLINE.Size = V2new(2500 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
            BLOCKOUTLINE.Position = V2new(RootPosition.X - BLOCKOUTLINE.Size.X / 2, RootPosition.Y - BLOCKOUTLINE.Size.Y / 2)
            BLOCKOUTLINE.Visible = maintable.visuals.box.outline
            BLOCKOUTLINE.Color = Color3.fromRGB(0, 0, 0)
            BLOCKOUTLINE.Filled = false

            BOXPLAYER.Size = V2new(2490 / RootPosition.Z, HeadPosition.Y - LegPosition.Y)
            BOXPLAYER.Position = V2new(RootPosition.X - BOXPLAYER.Size.X / 2, RootPosition.Y - BOXPLAYER.Size.Y / 2)
            BOXPLAYER.Visible = maintable.visuals.box.enabled
            if not maintable.visuals.misc.useteamcolors then
                local color = v.TeamColor
                BOXPLAYER.Color = maintable.visuals.box.color1
            else
                BOXPLAYER.Color = maintable.visuals.box.color1
            end
            BOXPLAYER.Filled = maintable.visuals.box.filled
            BOXPLAYER.Transparency = 1
            
            HealthBarITSELF.Size = V2new(2, (HeadPosition.Y - LegPosition.Y) / (v.Character.Humanoid.MaxHealth / math.clamp(v.Character.Humanoid.Health, 0,v.Character.Humanoid.MaxHealth)))
            HealthBarITSELF.Position = V2new(BOXPLAYER.Position.X - 8, BOXPLAYER.Position.Y + (1 / HealthBarITSELF.Size.Y))
            HealthBarITSELF.Color = maintable.visuals.box.healthbarcolor
            HealthBarITSELF.Visible = maintable.visuals.box.healthbar
            HealthBarITSELF.Filled = true

            if maintable.visuals.box.healthbar then
            ArmorBarITSELF.Size = V2new(2, (HeadPosition.Y - LegPosition.Y) / (100 / math.clamp(v.Character.BodyEffects.Armor.Value, 0,100)))
            ArmorBarITSELF.Position = V2new(BOXPLAYER.Position.X - 16, BOXPLAYER.Position.Y + (1 / HealthBarITSELF.Size.Y))
            ArmorBarITSELF.Color = maintable.visuals.box.armorbarcolor
            ArmorBarITSELF.Visible = maintable.visuals.box.armorbar
            ArmorBarITSELF.Filled = true
            else
                ArmorBarITSELF.Size = V2new(2, (HeadPosition.Y - LegPosition.Y) / (100 / math.clamp(v.Character.BodyEffects.Armor.Value, 0,100)))
                ArmorBarITSELF.Position = V2new(BOXPLAYER.Position.X - 8, BOXPLAYER.Position.Y + (1 / HealthBarITSELF.Size.Y))
                ArmorBarITSELF.Color = maintable.visuals.box.armorbarcolor
                ArmorBarITSELF.Visible = maintable.visuals.box.armorbar
                ArmorBarITSELF.Filled = true
            end
            
            
            
        else
            BLOCKOUTLINE.Visible = false
            BOXPLAYER.Visible = false
            toolshow.Visible=false
            HealthBarITSELF.Visible = false
            ArmorBarITSELF.Visible = false
            Tracer.Visible = false
            Name.Visible = false
        end
        if maintable.visuals.tracer.enabled then
            if maintable.visuals.tracer.unlocktracers then
                Tracer.From = V2new(mouse.X, mouse.Y + 36)
            else
                Tracer.From = V2new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 1)
            end
            Tracer.To = V2new(Vector.X, Vector.Y)
            Tracer.Visible = maintable.visuals.tracer.enabled
            if not maintable.visuals.misc.useteamcolors then
                local color = v.TeamColor
                Tracer.Color = maintable.visuals.tracer.color
            else
                Tracer.Color = maintable.visuals.tracer.color
            end
        else
            Tracer.Visible = false
        end

        if maintable.visuals.Toolsshow.enable then
              local Equipped = v.Character:FindFirstChildOfClass("Tool") and v.Character:FindFirstChildOfClass("Tool").Name or "None"
            toolshow.Text = Equipped
            toolshow.Position = V2new(workspace.Camera:WorldToViewportPoint(v.Character.Head.Position).X, workspace.Camera:WorldToViewportPoint(v.Character.Head.Position).Y + 30)
            toolshow.Color = maintable.visuals.Toolsshow.color
            toolshow.Font = 3
            Name.Size = maintable.visuals.Toolsshow.size
            toolshow.Visible = true
            else
                toolshow.Visible = false
        end


        if maintable.visuals.name.enabled then
            Name.Text = tostring(v.Name).. " [" .. tostring(math.floor(v.Character.Humanoid.Health + 0.5)) .. "/" .. tostring(v.Character.Humanoid.MaxHealth) .. "]"
            Name.Position = V2new(workspace.Camera:WorldToViewportPoint(v.Character.Head.Position).X, workspace.Camera:WorldToViewportPoint(v.Character.Head.Position).Y - 30)
            Name.Visible = true
            Name.Size = maintable.visuals.name.size
            if not maintable.visuals.misc.useteamcolors then
                local color = v.TeamColor
                Name.Color = maintable.visuals.name.color
            else
                Name.Color = maintable.visuals.name.color
            end
            Name.Outline = maintable.visuals.name.outline
        else
            Name.Visible = false
        end
    else
        BLOCKOUTLINE.Visible = false
        BOXPLAYER.Visible = false
        toolshow.Visible=false
        HealthBarITSELF.Visible = false
        ArmorBarITSELF.Visible = false
        Tracer.Visible = false
        Name.Visible = false
    end
else
    toolshow.Visible=false
    BLOCKOUTLINE.Visible = false
    BOXPLAYER.Visible = false
    HealthBarITSELF.Visible = false
    ArmorBarITSELF.Visible = false
    Tracer.Visible = false
    Name.Visible = false
end
end
end)
end

for i,v in pairs(game.Players:GetChildren()) do
esp(v)
end

game.Players.PlayerAdded:Connect(function(v)
esp(v)
end)

PlayerESP:Toggle({name = "MasterSwitch", flag = "Fvsafwas", callback = function(callback) maintable.visuals.box.masterswitch = callback end}):Keybind()
PlayerESP:Toggle({name = "Self", flag = "Fvvsawfadswas", callback = function(callback) maintable.visuals.box.self = callback end})
PlayerESP:Toggle({name = "Box", flag = "TovsafwaleFlag", callback = function(callback) maintable.visuals.box.enabled = callback maintable.visuals.box.outline = callback end}):Colorpicker({name = "Box Color", flag = "Covacsawflag", def = Color3.fromRGB(255,255,255), callback = function(callback) maintable.visuals.box.color1 = callback end})
PlayerESP:Toggle({name = "Health", flag = "Tovscsafwq", callback = function(callback) maintable.visuals.box.healthbar = callback maintable.visuals.box.healthbaroutline = callback end}):Colorpicker({name = "Bar Color", flag = "Covacvsteatsaafflag", def = Color3.fromRGB(255,255,255), callback = function(callback) maintable.visuals.box.healthbarcolor = callback end})
PlayerESP:Toggle({name = "Armor", flag = "Tovcsawfsafwq", callback = function(callback) maintable.visuals.box.armorbar = callback maintable.visuals.box.armorbaroutline = callback end}):Colorpicker({name = "Bar Color", flag = "Covacvscsawfsfaaafflag", def = Color3.fromRGB(255,255,255), callback = function(callback) maintable.visuals.box.armorbarcolor = callback end})
PlayerESP:Toggle({name = "Name", flag = "Tovscscsawfsawq", callback = function(callback) maintable.visuals.name.enabled = callback maintable.visuals.name.outline = callback end}):Colorpicker({name = "Text Color", flag = "Covacvsavaefadag", def = Color3.fromRGB(255,255,255), callback = function(callback) maintable.visuals.name.color = callback end})
PlayerESP:Toggle({name = "Tracer", flag = "Tovscvaswfsawfsawq", callback = function(callback) maintable.visuals.tracer.enabled = callback end}):Colorpicker({name = "Line Color", flag = "Covacvsafaswfsaag", def = Color3.fromRGB(255,255,255), callback = function(callback) maintable.visuals.tracer.color = callback end})

LocalPlayer:Toggle({name = "Body Chams", flag = "Tovscvascaswf", callback = function(callback) getgenv().SelfChams = callback end}):Colorpicker({name = "Body Color", flag = "Covacasffaswfsaag", def = game.Players.LocalPlayer.Character.Head.Color, callback = function(callback) getgenv().SelfColor = callback end})
LocalPlayer:Toggle({name = "Gun Chams", flag = "Tovscvasfeasfawfsawq", callback = function(callback) getgenv().GunChams = callback end}):Colorpicker({name = "Gun Color", flag = "Covacvsacawfsasaag", def = Color3.fromRGB(255,255,255), callback = function(callback) getgenv().GunColor = callback end})


settings_ui:Toggle({name = "Watermark", flag = "ui_watermark", callback = function() if library.loaded then window.watermark:Property("Visible", library.flags["ui_watermark"]) end end})
settings_ui:Toggle({name = "Keybinds", flag = "ui_keybinds", callback = function() if library.loaded then window.keybinds:Property("Visible", library.flags["ui_keybinds"]) end end})
settings_ui:Textbox({name = "Custom cheat name", flag = "ui_name", callback = function() window:Rename(library.flags["ui_name"]) if library.loaded then window.watermark:Property("Name", library.flags["ui_name"]) end end})
settings_ui:Dropdown({name = "Icon", options = {"JewishBot", "BitchBot"}, flag = "ui_icon", callback = function() if library.loaded then window.watermark:Property("Icon", icons_stuff[library.flags["ui_icon"]]) end end})
settings_ui:Colorpicker({name = "Accent 1", def = Color3.fromRGB(127, 72, 163), flag = "ui_accent1", callback = function() window:ChangeAccent("accent1", library.flags["ui_accent1"]) end})
settings_ui:Colorpicker({name = "Accent 2", def = Color3.fromRGB(87, 32, 127), flag = "ui_accent2", callback = function() window:ChangeAccent("accent2", library.flags["ui_accent2"]) end})
settings_ui:Button({name = "Unload", callback = function() window:Unload() end})

settings_config:Textbox({name = "Config name", flag = "config_name"})
settings_config:Dropdown({name = "Saved configs", options = getConfigs(), flag = "config_selected"})
settings_config:SubButtons({buttons = {
    {"Save", function()
        writefile("beanbot/configs/".. library.flags["config_name"].. ".bean", window:GetConfig())
    end},
    {"Load", function()
        if isfile("beanbot/configs/".. library.flags["config_selected"].. ".bean") then
            window:LoadConfig(readfile("beanbot/configs/".. library.flags["config_selected"].. ".bean"))
        end
    end}
}})
settings_config:Button({name = "Refresh", callback = function() library.pointers["Settings_Config_Saved configs"]:Refresh(getConfigs()) end})

settings_game:Slider({name = "FPS cap", min = 30, max = 360, def = 360, flag = "game_fps_cap", callback = function() if not library.flags["game_unlimited_fps"] then setfpscap(library.flags["game_fps_cap"]) end end})
settings_game:Toggle({name = "Unlocked FPS cap", flag = "game_unlimited_fps", callback = function() setfpscap(library.flags["game_unlimited_fps"] == true and 100000 or library.flags["game_fps_cap"]) end})

window:Update()
window:Load()
