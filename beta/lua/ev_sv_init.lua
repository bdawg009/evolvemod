/*-------------------------------------------------------------------------------------------------------------------------
	Serverside initialization
-------------------------------------------------------------------------------------------------------------------------*/

// Requirements
require( "glon" )

// Show startup message
print( "\n=====================================================" )
print( " Evolve 1.0 by Overv succesfully started serverside." )
print( "=====================================================\n" )

// Load plugins
evolve:loadPlugins( )

// Console command to reload all plugins
concommand.Add( "Evolve_ReloadPlugins", function( ply, com, args )
	if ( ply == NULL ) then
		evolve:loadPlugins( )
		evolve:message( "Evolve plugins reloaded!" )
	end
end )