package game.dungeon.map;
import core.display.IPriorityObject;
import core.display.PriorityContainer;
import game.dungeon.tile.ITile;
import game.event.map.TileEvent;
import openfl.display.DisplayObject;

class MapView implements IWorldView
{
	public var displayObject( get, null ):DisplayObject;
	
	public var xPos( default, null ):Float;
	public var yPos( default, null ):Float;
	
	private var m_asset:PriorityContainer;
	private var m_map:MapModel;
	
	public function new() 
	{
		init();
	}
	
	private function get_displayObject( ):DisplayObject
	{
		return m_asset.displayObject;
	}
	
	private function init( ):Void
	{
		m_asset = new PriorityContainer();
		m_asset.displayObject.x = 400;
		m_asset.displayObject.y = 50;
	}
	
	public function setSource( source:IWorldModel ):Void
	{
		m_map = cast source;
		
		for ( tile in m_map.m_tileMap )
		{
			addTile( tile );
		}
	}
	
	private function addMapListeners( ):Void
	{
		m_map.dispatcher.addEventListener( TileEvent.TILE_ADDED, onTileAdded );
	}
	
	private function removeMapListeners( ):Void
	{
		m_map.dispatcher.addEventListener( TileEvent.TILE_ADDED, onTileAdded );
	}
	
	public function moveView( dX:Float, dY:Float ):Void
	{
		
	}
	
	public function setViewPos( xPos:Float, yPost:Float ):Void
	{
		
	}
	
	private function onTileAdded( e:TileEvent ):Void
	{
		var tarTile:ITile = e.tile;
		
		if ( tarTile != null )
		{
			addTile( tarTile );
		}
	}
	
	private function addTile( tile:ITile ):Void
	{
		var priority:Int = tile.xPos + tile.yPos + tile.zPos;
		tile.setPriority( priority );
		
		m_asset.addObject( tile );
		updateTilePosition( tile );
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
	
}