local function createWelcomeToZonePopup(zoneText)
	local popupName = "WTZ" .. zoneText
	StaticPopupDialogs[popupName] = {
		text = "Welcome to %s!",
		-- OKAY is a value for a localized string
		button1 = OKAY,
		timeout = 10,
		whileDead = true,
		hideOnEscape = true,
	}
	
	-- The second parameter is for the %s in text
	StaticPopup_Show(popupName, zoneText)
end

local frame = CreateFrame("FRAME")
frame:RegisterEvent("ZONE_CHANGED_NEW_AREA")

local function eventHandler(self, event, ...)
	createWelcomeToZonePopup(GetZoneText())
end

frame:SetScript("onEvent", eventHandler)