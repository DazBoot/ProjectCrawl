package game.dungeon.tile;
import openfl.display.DisplayObject;
import openfl.display.Sprite;

class BaseTile
{
	public var displayObject( get, null ):DisplayObject;
	public var worldX( get, null ):Float;
	public var worldY( get, null ):Float;
	
	private var m_asset:Sprite;
	private var m_worldX:Float;
	private var m_worldY:Float;
	
	public function new() 
	{
		m_asset = new Sprite();
	}
	
	/***************************************************
	 * 				   Getters / Setters
	 **************************************************/
	private function get_displayObject( ):DisplayObject
	{
		return m_asset;
	}
	
	private function get_worldX( ):Float
	{
		return m_worldX;
	}
	
	private function get_worldY( ):Float
	{
		return m_worldY;
	}
}