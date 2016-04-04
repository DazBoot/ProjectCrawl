package core.display;
import openfl.display.DisplayObject;
import openfl.display.DisplayObjectContainer;

interface IPriorityContainer 
{
	public var displayObject( get, null ):DisplayObjectContainer;
	
	public var numChildren( get, null ):Int;
	
	public function addObject( obj:IPriorityObject ):Void;
}