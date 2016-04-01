package game.dungeon;

import core.debug.log.Logger;
import game.dungeon.map.IMap;
import game.dungeon.tile.ITile;
import game.dungeon.tile.SimpleTile;
import haxe.ds.StringMap;
import openfl.display.DisplayObject;
import openfl.display.DisplayObjectContainer;
import openfl.display.Sprite;
import openfl.geom.Point;

class SimpleMap implements IMap
{
	public var displayObject( get, null ):DisplayObject;
	
	private var m_tileMap:StringMap<ITile>;
	
	private var m_asset:Sprite;
	
	public function new() 
	{
		init();
		
		addTile( 1, 1, new SimpleTile() );
		addTile( 1, 1, new SimpleTile() );
	}
	
	private function init():Void
	{
		m_tileMap = new StringMap<ITile>();
		m_asset = new Sprite();
	}
	
	private function addTile( xPos:Int, yPos:Int, tile:ITile ):Void
	{
		var key:String = '($xPos, $yPos)';
		if ( m_tileMap.exists( key ) )
		{
			Logger.log( 'Map already has a tile with coordinate $key' );
			return; //Early return
		}
		
		//Set the pos vars before we update the tile position
		//tile.xPos = xPos;
		//tile.yPos = yPos;
		
		m_asset.addChild( tile.displayObject );
		updateTilePosition( tile );
		
		Logger.log( 'Added tile to map at $key' );
		m_tileMap.set( key, tile );
	}
	
	private function updateTilePosition( tile:ITile ):Void
	{
		var displayObj:DisplayObject = tile.displayObject;
		
		//TODO: Get the calculation to translate pos to world coordinate
		//tile.worldX = tile.xPos;
		//tile.worldY = tile.yPos;
	}
	
	private function get_displayObject( ):DisplayObject
	{
		return m_asset;
	}
	
}