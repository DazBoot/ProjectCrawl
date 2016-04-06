package game.event.map;

import game.dungeon.tile.ITile;
import openfl.events.Event;

class TileEvent extends Event
{
	public static inline var TILE_ADDED:String = "TILE_EVENT_TILE_ADDED";
	
	public var tile( default, null ):ITile;
	
	public function new( type:String, ?tile:ITile ) 
	{
		super( type, false, false );
		this.tile = tile;
	}
	
}