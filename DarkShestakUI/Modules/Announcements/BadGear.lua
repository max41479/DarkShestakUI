local T, C, L, _ = unpack(select(2, ...))
if C.announcements.bad_gear ~= true then return end

----------------------------------------------------------------------------------------
--	Check bad gear in instance
----------------------------------------------------------------------------------------
local frame = CreateFrame("Frame")
frame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
frame:SetScript("OnEvent", function(self, event)
	if event == "ZONE_CHANGED_NEW_AREA" then
		if not IsInInstance() then return end
		local item = {}
		for i = 1, 17 do
			if T.AnnounceBadGear[i] ~= nil then
				item[i] = GetInventoryItemID("player", i) or 0
				for j, baditemid in pairs(T.AnnounceBadGear[i]) do
					if item[i] == baditemid then
						PlaySound("RaidWarning", "master")
						RaidNotice_AddMessage(RaidWarningFrame, string.format("%s %s", CURRENTLY_EQUIPPED, GetItemInfo(item[i]).."!!!"), ChatTypeInfo["RAID_WARNING"])
						print(string.format("|cffffff00%s %s", CURRENTLY_EQUIPPED, GetItemInfo(item[i]).."!!!|r"))
					end
				end
			end
		end
	end
end)