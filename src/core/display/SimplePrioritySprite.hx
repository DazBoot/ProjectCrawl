package core.display;

import openfl.display.DisplayObject;
import openfl.display.Sprite;

/**
 * ...
 * @author Josh Elliott
 */
class SimplePrioritySprite extends Sprite implements IPriorityObject
{
	public var displayObject( get, null ):DisplayObject;
	public var priority( get, null ):Int;
	
	private var m_priority:Int = 0;
	
	
	
	public function new( width:Float, height:Float, color:Int ) 
	{
		super();
		
		this.graphics.beginFill( color );
		this.graphics.drawRect( 0, 0, width, height );
		this.graphics.endFill();
	}
	
	function get_priority():Int 
	{
		return m_priority;
	}
	
	
	function get_displayObject():DisplayObject 
	{
		return this;
	}
	
	public function setPriority( priority:Int ):Void 
	{
		m_priority = priority;
	}
	
}