package game.dungeon.tile;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.DisplayObject;
import openfl.display.Sprite;

class SimpleTile extends BaseTile implements ITile
{
	private static inline var TILE_WIDTH:Float = 100;
	private static inline var TILE_DEPTH:Float = 50;
	private static inline var TILE_HEIGHT:Float = 50;
	
	public function new() 
	{
		super();
		
		
		
		/*var testData:BitmapData = Assets.getBitmapData( "2d/dungeon/tile/SimpleTile.png" );
		m_asset.addChild( new Bitmap( testData ) );
		m_asset.scaleX = 0.5;
		m_asset.scaleY = 0.5;
		*/
		drawDebugDile();
	}
	
	private function drawDebugDile( ):Void
	{
		m_asset.graphics.clear();
		m_asset.graphics.lineStyle( 1, 0x000000 );
		
		//Draw the top
		m_asset.graphics.beginFill( 0x75FF46 );
		m_asset.graphics.moveTo( 0, TILE_DEPTH / 2 );
		m_asset.graphics.lineTo( TILE_WIDTH / 2, 0 );
		m_asset.graphics.lineTo( TILE_WIDTH, TILE_DEPTH / 2 );
		m_asset.graphics.lineTo( TILE_WIDTH / 2, TILE_DEPTH );
		m_asset.graphics.lineTo( 0, TILE_DEPTH / 2 );
		
		//Draw the left side
		m_asset.graphics.beginFill( 0x8F723A );
		m_asset.graphics.moveTo( 0, TILE_DEPTH / 2 );
		m_asset.graphics.lineTo( TILE_WIDTH / 2, TILE_DEPTH );
		m_asset.graphics.lineTo( TILE_WIDTH / 2, TILE_DEPTH + TILE_HEIGHT );
		m_asset.graphics.lineTo( 0, TILE_DEPTH / 2 + TILE_HEIGHT );
		m_asset.graphics.lineTo( 0, TILE_DEPTH / 2 );
		
		//Draw the right side
		m_asset.graphics.beginFill( 0xB7924D );
		m_asset.graphics.moveTo( TILE_WIDTH / 2, TILE_DEPTH );
		m_asset.graphics.lineTo( TILE_WIDTH, TILE_DEPTH / 2 );
		m_asset.graphics.lineTo( TILE_WIDTH, TILE_DEPTH / 2 + TILE_HEIGHT );
		m_asset.graphics.lineTo( TILE_WIDTH / 2, TILE_DEPTH + TILE_HEIGHT );
		m_asset.graphics.lineTo( TILE_WIDTH / 2, TILE_DEPTH );
	}
}