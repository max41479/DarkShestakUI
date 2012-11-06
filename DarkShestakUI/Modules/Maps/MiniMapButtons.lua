﻿local T, C, L, _ = unpack(select(2, ...))
if C.minimap.enable ~= true then return end

----------------------------------------------------------------------------------------
--	Switch layout mouseover button on minimap
----------------------------------------------------------------------------------------
local switch = CreateFrame("Button", "SwitchLayout", UIParent)
switch:SetTemplate("Transparent")
switch:SetBackdropBorderColor(unpack(C.media.border_color))
if C.actionbar.toggle_mode == true then
	switch:SetPoint("BOTTOMRIGHT", Minimap, "BOTTOMLEFT", -3, 18)
else
	switch:SetPoint("BOTTOMRIGHT", Minimap, "BOTTOMLEFT", -3, -2)
end
switch:SetSize(19, 19)
switch:SetAlpha(0)

switch.t = switch:CreateTexture(nil, "OVERLAY")
switch.t:SetTexture("Interface\\LFGFrame\\LFGROLE")
switch.t:SetPoint("TOPLEFT", switch, 2, -2)
switch.t:SetPoint("BOTTOMRIGHT", switch, -2, 2)

switch:SetScript("OnClick", function()
	if IsAddOnLoaded("DarkShestakUI_DPS") then
		DisableAddOn("DarkShestakUI_DPS")
		EnableAddOn("DarkShestakUI_Heal")
		ReloadUI()
	elseif IsAddOnLoaded("DarkShestakUI_Heal") then
		DisableAddOn("DarkShestakUI_Heal")
		EnableAddOn("DarkShestakUI_DPS")
		ReloadUI()
	elseif not IsAddOnLoaded("DarkShestakUI_Heal") and not IsAddOnLoaded("DarkShestakUI_DPS") then
		EnableAddOn("DarkShestakUI_Heal")
		ReloadUI()
	end
end)

switch:SetScript("OnEnter", function()
	if InCombatLockdown() then return end
	switch:FadeIn()
end)

switch:SetScript("OnLeave", function()
	switch:FadeOut()
end)

switch:RegisterEvent("PLAYER_LOGIN")
switch:SetScript("OnEvent", function(self)
	if IsAddOnLoaded("DarkShestakUI_DPS") then
		switch.t:SetTexCoord(0.25, 0.5, 0, 1)
	elseif IsAddOnLoaded("DarkShestakUI_Heal") then
		switch.t:SetTexCoord(0.75, 1, 0, 1)
	elseif not IsAddOnLoaded("DarkShestakUI_Heal") and not IsAddOnLoaded("DarkShestakUI_DPS") then
		switch.t:SetTexture("Interface\\InventoryItems\\WoWUnknownItem01")
		switch.t:SetTexCoord(0.2, 0.8, 0.2, 0.8)
	end
end)

----------------------------------------------------------------------------------------
--	Farm mode for minimap(by Elv22)
----------------------------------------------------------------------------------------
local show = false
SlashCmdList.FARMMODE = function()
	if show == false then
		MinimapAnchor:SetSize(C.minimap.size * 1.65, C.minimap.size * 1.65)
		Minimap:SetSize(MinimapAnchor:GetWidth(), MinimapAnchor:GetWidth())
		show = true
	else
		MinimapAnchor:SetSize(C.minimap.size, C.minimap.size)
		Minimap:SetSize(MinimapAnchor:GetWidth(), MinimapAnchor:GetWidth())
		show = false
	end
end
SLASH_FARMMODE1 = "/farmmode"
SLASH_FARMMODE2 = "/афкььщву"
SLASH_FARMMODE3 = "/fm"
SLASH_FARMMODE4 = "/аь"

----------------------------------------------------------------------------------------
--	Farm mode mouseover button(by m2jest1c)
----------------------------------------------------------------------------------------
local farm = CreateFrame("Button", "FarmMode", UIParent)
farm:SetTemplate("Default")
farm:SetPoint("BOTTOM", switch, "TOP", 0, 1)
farm:SetSize(19, 19)
farm:SetAlpha(0)

farm.t = farm:CreateTexture(nil, "OVERLAY")
farm.t:SetTexture("Interface\\Icons\\inv_misc_map_01")
farm.t:SetTexCoord(0.1, 0.9, 0.1, 0.9)
farm.t:SetPoint("TOPLEFT", farm, 2, -2)
farm.t:SetPoint("BOTTOMRIGHT", farm, -2, 2)

farm:SetScript("OnClick", function()
	SlashCmdList.FARMMODE()
end)

farm:SetScript("OnEnter", function()
	if InCombatLockdown() then return end
	farm:FadeIn()
end)

farm:SetScript("OnLeave", function()
	farm:FadeOut()
end)