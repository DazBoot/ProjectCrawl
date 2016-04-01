package game.dungeon.tile;
import game.dungeon.IMapObject;
import openfl.display.DisplayObject;

interface ITile extends IMapObject
{
	public var displayObject( get, null ):DisplayObject;
}