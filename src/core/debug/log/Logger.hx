package core.debug.log;

class Logger
{	
	public static function log( msg:Dynamic ):Void
	{
		trace( Std.string( msg ) );
	}
}