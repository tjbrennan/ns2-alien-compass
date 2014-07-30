Script.Load("lua/Class.lua")

local ConfigFileName = "compass.json"
// TODO: config vars
// mode off, compass, orientation, /w rose
// color
// position
// marine

AddClientUIScriptForClass("Alien", "GUICompass")

// current modes
// 2 - compass
// 1 - orientation
// 0 - off

local config = LoadConfigFile(ConfigFileName)
kCompassMode = config and config.mode or 2

function OnCommandCompass(arg)
	if arg == nil then
		Shared.Message("compassMode : " .. tostring(kCompassMode))
		return
	end	
	
	arg = tonumber(arg)
	if arg > 2 then
	    arg = 2
	end
	kCompassMode = arg
	SaveConfigFile(ConfigFileName, { mode=arg })

	if ClientUI.GetScript("GUICompass") then
		if arg <= 0 then
			ClientUI.GetScript("GUICompass").compass:SetIsVisible(false)
		elseif arg > 0 then
			ClientUI.GetScript("GUICompass").compass:SetIsVisible(true)
		end
	end
end
Event.Hook("Console_compass", OnCommandCompass)

