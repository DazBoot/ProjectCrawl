package game.dungeon.map;

import core.debug.log.Logger;
import game.dungeon.map.IWorldModel;
import game.dungeon.tile.ITile;
import game.dungeon.tile.SimpleTile;
import game.event.map.TileEvent;
import haxe.ds.StringMap;
import openfl.display.DisplayObject;
import openfl.events.EventDispatcher;
import openfl.events.IEventDispatcher;

class MapModel implements IWorldModel
{
	public var dispatcher( default, null ):IEventDispatcher;
	
	@:allow( game.dungeon.map.IWorldView )
	private var m_tileMap:StringMap<ITile>;
	
	public function new() 
	{
		init();
		
		addTile( 0, 0, 0, new SimpleTile() );
		addTile( 0, 1, 0, new SimpleTile() );
		addTile( 0, 2, 0, new SimpleTile() );
		addTile( 1, 0, 0, new SimpleTile() );
		addTile( 1, 1, 0, new SimpleTile() );
		addTile( 0, 0, 1, new SimpleTile() );
	}
	
	private function init():Void
	{
		m_tileMap = new StringMap<ITile>();
		dispatcher = new EventDispatcher();
		
		//m_asset = new Sprite();
		//m_asset.x = 400;
		//m_asset.y = 50;
	}
	
	private function addTile( xPos:Int, yPos:Int, zPos:Int, tile:ITile ):Void
	{
		var key:String = '($xPos, $yPos, $zPos)';
		if ( m_tileMap.exists( key ) )
		{
			Logger.log( 'Map already has a tile with coordinate $key' );
			return; //Early return
		}
		
		//Set the pos vars before we update the tile position
		tile.xPos = xPos;
		tile.yPos = yPos;
		tile.zPos = zPos;
		
		//m_asset.addChild( tile.displayObject );
		//updateTilePosition( tile );
		
		//Logger.log( 'Added tile to map at $key' );
		m_tileMap.set( key, tile );
		
		var addEvent:TileEvent = new TileEvent( TileEvent.TILE_ADDED, tile );
		
		
	}	
}