package game.dungeon.tile;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.DisplayObject;
import openfl.display.Sprite;

class SimpleTile extends BaseTile implements ITile
{
	public function new() 
	{
		super();
		
		var testData:BitmapData = Assets.getBitmapData( "2d/dungeon/tile/SimpleTile.png" );
		m_asset.addChild( new Bitmap( testData ) );
		m_asset.scaleX = 0.5;
		m_asset.scaleY = 0.5;
	}
}