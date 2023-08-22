local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Tamim468/releases/main/deadcell.lua"))()
--start
local menu = library:new_window({})
local test = menu:new_page({name = "development"})
local menu = menu:new_page({name = "menu"})
local page = test:new_section({name = "test stuff", size = "Fill"})
page:new_slider({flag = "walkspeed", name = "Player Walkspeed", min = 1, max = 200, default = 16, float = 0.1, callback = function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end})
       local accent = menu:new_section({name = "theme", size = "Fill"})
       -- colorpickers (ape)
       local theme_pickers = {}
       theme_pickers["Accent"] = accent:new_colorpicker({name = "accent",flag = 'theme_accent', default = Color3.fromRGB(61, 100, 227), callback = function(state) library:ChangeThemeOption("Accent", state) end})
       theme_pickers["Window Outline Background"] = accent:new_colorpicker({name = "window outline",flag = 'theme_outline', default = Color3.fromRGB(39,39,47), callback = function(state) library:ChangeThemeOption("Window Outline Background", state) end})
       theme_pickers["Window Inline Background"] = accent:new_colorpicker({name = "window inline",flag = 'theme_inline', default = Color3.fromRGB(23,23,30), callback = function(state) library:ChangeThemeOption("Window Inline Background", state) end})
       theme_pickers["Window Holder Background"] = accent:new_colorpicker({name = "window holder",flag = 'theme_holder', default = Color3.fromRGB(32,32,38), callback = function(state) library:ChangeThemeOption("Window Holder Background", state) end})
       theme_pickers["Window Border"] = accent:new_colorpicker({name = "window border",flag = 'theme_border', default = Color3.fromRGB(32,32,38), callback = function(state) library:ChangeThemeOption("Window Border", state) end})
       theme_pickers["Page Selected"] = accent:new_colorpicker({name = "page selected",flag = 'theme_selected', default = Color3.fromRGB(55,55,64), callback = function(state) library:ChangeThemeOption("Page Selected", state) end})
       theme_pickers["Page Unselected"] = accent:new_colorpicker({name = "page unselected",flag = 'theme_unselected', default = Color3.fromRGB(27,27,34), callback = function(state) library:ChangeThemeOption("Page Unselected", state) end})
       theme_pickers["Section Inner Border"] = accent:new_colorpicker({name = "border 1",flag = 'theme_border1', default = Color3.fromRGB(50,50,58), callback = function(state) library:ChangeThemeOption("Section Inner Border", state) end})
       theme_pickers["Section Outer Border"] = accent:new_colorpicker({name = "border 2",flag = 'theme_border2', default = Color3.fromRGB(19,19,27), callback = function(state) library:ChangeThemeOption("Section Outer Border", state) end})
       theme_pickers["Section Background"] = accent:new_colorpicker({name = "section background",flag = 'theme_section', default = Color3.fromRGB(27,27,34), callback = function(state) library:ChangeThemeOption("Section Background", state) end})
       theme_pickers["Text"] = accent:new_colorpicker({name = "text",flag = 'theme_text', default = Color3.fromRGB(245, 245, 245), callback = function(state) library:ChangeThemeOption("Text", state) end})
       theme_pickers["Risky Text"] = accent:new_colorpicker({name = "risky text",flag = 'theme_risky', default = Color3.fromRGB(245, 239, 120), callback = function(state) library:ChangeThemeOption("Risky Text", state) end})
       theme_pickers["Object Background"] = accent:new_colorpicker({name = "element background",flag = 'theme_element', default = Color3.fromRGB(41,41,50), callback = function(state) library:ChangeThemeOption("Object Background", state) end})
       accent:new_dropdown({flag = "settings/menu/effects", name = "accent effects", options = {"None", "rainbow", "shift", "reverse shift"}, default = "none"});
       accent:new_slider({flag = "settings/menu/effect_speed", name = "effect speed", min = 0.1, max = 2, default = 1, float = 0.1})
       game:GetService("RunService").Heartbeat:Connect(function()
           local AccentEffect = library.flags["settings/menu/effects"];
           local EffectSpeed = library.flags["settings/menu/effect_speed"];
           if AccentEffect == "rainbow" then
               local Clock = os.clock() * EffectSpeed
               local Color = Color3.fromHSV(math.abs(math.sin(Clock)), 1, 1);
               library:ChangeThemeOption("Accent", Color);
           end;
           if AccentEffect == "shift" then
               local ShiftOffset = 0
               local Clock = os.clock() * EffectSpeed + ShiftOffset;
               ShiftOffset = ShiftOffset + 0.01;
               local Color = Color3.fromHSV(math.abs(math.sin(Clock)), 1, 1)
               library.flags["theme_accent"] = Color;
               library:ChangeThemeOption("Accent", Color);
           end;
           if AccentEffect == "reverse shift" then
               local ShiftOffset = 0
               local Clock = os.clock() * EffectSpeed + ShiftOffset;
               ShiftOffset = ShiftOffset - 0.01;
               local Color = Color3.fromHSV(math.abs(math.sin(Clock)), 1, 1)
               library.flags["theme_accent"] = Color;
               library:ChangeThemeOption("Accent", Color);
           end;
       end);
       --
       local menu_other = menu:new_section({name = "other", size = "Fill", side = "right"})
       menu_other:new_keybind({name = "open / close", flag = 'menu_toggle', default = Enum.KeyCode.End, mode = "Toggle", ignore = true, callback = function() library:Close() end})
       library:Close() -- shitty ui moment LOL
       menu_other:new_seperator({name = "server"})
       menu_other:new_button({name = "rejoin", confirm = true, callback = function() game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId) end})
       menu_other:new_button({name = "copy join script", callback = function() setclipboard(([[game:GetService("TeleportService"):TeleportToPlaceInstance(%s, "%s")]]):format(game.PlaceId, game.JobId)) end})
       menu_other:new_button({name = "test", callback = function() library.notify("this is a test notif lol", 5) end})
--end
