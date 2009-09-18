/*-------------------------------------------------------------------------------------------------------------------------
	Shows who's rating who what
-------------------------------------------------------------------------------------------------------------------------*/

local PLUGIN = { }
PLUGIN.Title = "Sandbox rating monitor"
PLUGIN.Description = "Shows who's rating who what."
PLUGIN.Author = "Overv"
PLUGIN.ChatCommand = nil
PLUGIN.Usage = nil

if ( !evolve.oldConcommand ) then
	evolve.oldConcommand = concommand.Run
end
	
function concommand.Run( ply, com, args )
	if ( com == "rateuser" and tonumber( args[ 1 ] ) and args[ 1 ] != "0" ) then
		local target = ents.GetByIndex( args[1] )
		local rating = args[2]
		
		if ( ValidEntity( target ) and target:EV_IsRespected() and rating ) then
			target.RatingTimers = target.RatingTimers or { }
			if ( target.RatingTimers[ ply:UniqueID() ] and target.RatingTimers[ ply:UniqueID() ] > CurTime() + 60 ) then return end
			
			evolve:notify( target, evolve.colors.blue, ply:Nick(), evolve.colors.white, " rated you", evolve.colors.red, " " .. rating, evolve.colors.white, "." )
		end
	end
	
	return evolve.oldConcommand( ply, com, args )
end

evolve:registerPlugin( PLUGIN )