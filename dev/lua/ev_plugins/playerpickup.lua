/*-------------------------------------------------------------------------------------------------------------------------
	Picking up players
-------------------------------------------------------------------------------------------------------------------------*/

local PLUGIN = {}
PLUGIN.Hooks = {}
PLUGIN.Title = "Player Pickup"
PLUGIN.Description = "Players can pick up other players with a lower rank"
PLUGIN.Author = "Overv"

function PLUGIN:PhysgunPickup( ply, ent )
	if ent:IsPlayer() and ply:IsAdmin() and !Evolve:SameOrBetter( ply, ent ) then
		ent:Freeze( true )
		return true
	end
end

function PLUGIN:PhysgunDrop( ply, ent )
	if ent:IsPlayer() and ply:IsAdmin() and !Evolve:SameOrBetter( ply, ent ) then
		ent:Freeze( false )
		return true
	end
end

Evolve:RegisterPlugin( PLUGIN )