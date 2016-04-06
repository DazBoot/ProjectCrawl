package game.dungeon.map;
import openfl.events.EventDispatcher;
import openfl.events.IEventDispatcher;

interface IWorldModel
{
	public var dispatcher( default, null ):IEventDispatcher;
}