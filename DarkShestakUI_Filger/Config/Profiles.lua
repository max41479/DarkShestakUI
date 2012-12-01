local T, C, L, _ = unpack(ShestakUI)
if C.unitframe.enable ~= true then return end

----------------------------------------------------------------------------------------
--	ShestakUI_Filger personal configuration file
--	BACKUP THIS FILE BEFORE UPDATING!
--	ATTENTION: When saving changes to a file encoded file should be in UTF8
----------------------------------------------------------------------------------------
--	Configuration example:
----------------------------------------------------------------------------------------
-- if T.name == "MegaChar" then
--		F["settings"].show_tooltip = true
--		F["positions"].player_buff_icon = {"BOTTOMRIGHT", "oUF_Player", "TOPRIGHT", 2, 173}
--		add("T_DEBUFF_ICON", {spellID = 115767, unitID = "target", caster = "player", filter = "DEBUFF"})
-- end
----------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------
--	Per Class Config (overwrite general)
--	Class need to be UPPERCASE
----------------------------------------------------------------------------------------
if T.class == "DRUID" then

end

----------------------------------------------------------------------------------------
--	Per Character Name Config (overwrite general and class)
--	Name need to be case sensitive
----------------------------------------------------------------------------------------
if T.name == "CharacterName" then

end

----------------------------------------------------------------------------------------
--	Per Max Character Level Config (overwrite general, class and name)
----------------------------------------------------------------------------------------
if T.level ~= MAX_PLAYER_LEVEL then

end

----------------------------------------------------------------------------------------
--	Function for insert spell
----------------------------------------------------------------------------------------
local add = function(place, spell)
	for class, _ in pairs(F["spells"]) do
		if class == T.class then
			for i = 1, #F["spells"][class], 1 do
				if F["spells"][class][i]["Name"] == place then
					table.insert(F["spells"][class][i], spell)
				end
			end
		end
	end
end

----------------------------------------------------------------------------------------
--	m2jest1c Config
----------------------------------------------------------------------------------------
if T.coauthor == true then
	F["settings"].show_tooltip = true
	if T.class == "WARRIOR" then
		add("T_DEBUFF_ICON", {spellID = 115767, unitID = "target", caster = "player", filter = "DEBUFF"}) -- Deep Wounds
	end
	if T.class == "PRIEST" then
		add("COOLDOWN", {spellID = 108968, filter = "CD"}) -- Void Shift
	end
	if T.class == "WARLOCK" then
		add("P_BUFF_ICON", {spellID = 116202, unitID = "player", caster = "player", filter = "BUFF"}) -- Aura of the Elements
	end
end