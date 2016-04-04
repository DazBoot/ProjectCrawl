package core.display;

import core.debug.log.Logger;
import core.display.IPriorityContainer;
import core.display.IPriorityObject;
import flash.display.DisplayObject;
import openfl.display.DisplayObjectContainer;
import openfl.display.Sprite;

class PriorityContainer implements IPriorityContainer
{
	public var displayObject( get, null ):DisplayObjectContainer;
	
	public var numChildren( get, null ):Int;
	
	private var m_displayObject:DisplayObjectContainer;
	private var m_childObjects:Array<IPriorityObject>;
	
	public function new() 
	{
		m_displayObject = new Sprite();
		m_childObjects = new Array<IPriorityObject>();
	}
	
	public function addObject( obj:IPriorityObject ):Void
	{
		if ( obj == null )
		{
			Logger.log( "Attempted to add object to PriorityContainer, but the object was null!" );
			return; //Early return
		}
		
		//See where we need to insert it
		for ( i in 0...m_childObjects.length )
		{
			var compareObj:IPriorityObject = m_childObjects[ i ];
			if ( obj.priority > compareObj.priority )
			{
				//First add the child to the correct location in sorted childObject array
				m_childObjects.insert( i, obj );
				
				//Then add the child to the actual displayObject at the localized index
				m_displayObject.addChildAt( obj.displayObject, m_displayObject.getChildIndex( compareObj.displayObject ) + 1 );
				
				return; //Early return
			}
		}
		
		//Otherwise we add it at the end
		m_childObjects.push( obj );
		m_displayObject.addChildAt( obj.displayObject, 0 );
		
	}
	
	public function removeChild( obj:IPriorityObject ):Void
	{
		if ( obj == null )
		{
			return;
		}
		
		if ( m_displayObject.getChildIndex( obj.displayObject ) != -1 )
		{
			m_childObjects.remove( obj );
			m_displayObject.removeChild( obj.displayObject );
		}
	}
	
	private function get_displayObject( ):DisplayObjectContainer
	{
		return m_displayObject;
	}
	
	private function get_numChildren( ):Int
	{
		return m_childObjects.length;
	}
}