package game.dungeon.map;
import openfl.display.DisplayObject;

interface IWorldView 
{
	public var displayObject( get, null ):DisplayObject;
	
	public var xPos( default, null ):Float;
	public var yPos( default, null ):Float;
	
	public function setSource( source:IWorldModel ):Void;
	
	public function moveView( dX:Float, dY:Float ):Void;
	public function setViewPos( xPos:Float, yPos:Float ):Void;
}