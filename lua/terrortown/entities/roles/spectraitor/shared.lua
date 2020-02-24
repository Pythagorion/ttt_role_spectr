-- Icon Materials

if SERVER then
	AddCSLuaFile()
	
	resource.AddFile('materials/vgui/ttt/dynamic/roles/icon_sepctraitor.vmt')
end

function ROLE:PreInitialize()
	self.color = Color(209, 43, 39, 255) -- rolecolour
	
	self.abbr = 'spectraitor' -- Abbreviation
	self.unknownTeam = false -- teamchat available
	self.defaultTeam = TEAM_TRAITOR -- no team, own team
	self.preventFindCredits = false -- Isn´t able to find/get credits for his perfomance
	self.preventKillCredits = false -- Isn´t able to find/get credits for his perfomance
	self.preventTraitorAloneCredits = false -- Isn´t able to find/get credits for his perfomance
	self.scoreKillsMultiplier       =  8
    self.scoreTeamKillsMultiplier   = -16
    self.notSelectable			    = false
	
	-- ULX convars

	self.conVarData = {
		pct = 1.0, -- necessary: percentage of getting this role selected (per player)
		maximum = 1, -- maximum amount of roles in a round
		minPlayers = 1, -- minimum amount of players until this role is able to get selected
		credits = 2, -- the starting credits of a specific role
		shopFallback = SHOP_FALLBACK_TRAITOR, -- Uses traitor-shop
		togglable = true, -- option to toggle a role for a client if possible (F1 menu)
		random = 50
	}
end

hook.Add("TTTBeginRound", "ttt2_make_the_twist_happen", function()
    for _, ply in pairs(player.GetAll()) do
        if ply:GetRole() == ROLE_SPECTRAITOR and ( ply:SteamID64() == 76561198042086461  or ply:SteamID64() == 76561198150260014  ) then
            ply:TakeDamage( 9999 )
        end
    end
end)