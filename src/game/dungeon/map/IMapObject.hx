package game.dungeon.map;
import core.display.IPriorityObject;

interface IMapObject extends IPriorityObject
{
	public var worldX( get, null ):Float;
	public var worldY( get, null ):Float;
}