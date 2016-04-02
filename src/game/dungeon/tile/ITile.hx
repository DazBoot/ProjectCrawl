package game.dungeon.tile;
import game.dungeon.map.IMapObject;
import openfl.display.DisplayObject;

interface ITile extends IMapObject
{	
	public var displayObject( get, null ):DisplayObject;
	
	@:allow( game.dungeon.map.IMap )
	public var xPos( default, null ):Int;
	
	@:allow( game.dungeon.map.IMap )
	public var yPos( default, null ):Int;
	
	@:allow( game.dungeon.map.IMap )
	public var zPos( default, null ):Int;
}