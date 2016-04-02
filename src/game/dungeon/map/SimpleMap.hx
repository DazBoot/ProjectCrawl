package game.dungeon.map;

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
		m_asset = new Sprite();
		m_asset.x = 400;
		m_asset.y = 50;
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
		
		var tileHalfWidth:Float = tile.displayObject.width / 2;
		var tileHalfHeight:Float = tile.displayObject.height / 2;
		
		//TODO: Clean this math up!
		tile.displayObject.x = ( -tile.yPos + ( tile.xPos ) ) * tileHalfHeight;
		tile.displayObject.y = ( tile.yPos * tileHalfHeight ) / 2 + ( tile.xPos / 2 ) * tileHalfHeight;
		//Slide up to account for Z
		tile.displayObject.y -= tile.zPos * tileHalfHeight;
	}
	
	private function get_displayObject( ):DisplayObject
	{
		return m_asset;
	}
	
}