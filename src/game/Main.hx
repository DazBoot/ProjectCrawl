package game;

import game.dungeon.tile.SimpleTile;
import openfl.Lib;
import openfl.display.Sprite;

/**
 * ...
 * @author Josh Elliott
 */
class Main extends Sprite 
{

	public function new() 
	{
		super();
		
		// Assets:
		// openfl.Assets.getBitmapData("img/assetname.jpg");
		
		Lib.current.stage.addChild( new SimpleTile().displayObject );
	}

}
