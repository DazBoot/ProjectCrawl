package core.display;
import openfl.display.DisplayObject;

interface IPriorityObject 
{
	public var priority( get, null ):Int;
	public var displayObject( get, null ):DisplayObject;
	
	public function setPriority( priority:Int ):Void;
}