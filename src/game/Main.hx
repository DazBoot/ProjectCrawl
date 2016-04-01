package game;

import game.dungeon.SimpleMap;
import openfl.Lib;
import openfl.display.Sprite;

class Main extends Sprite 
{

	public function new() 
	{
		super();
		
		// Assets:
		// openfl.Assets.getBitmapData("img/assetname.jpg");
		
		Lib.current.stage.addChild( new SimpleMap().displayObject );
	}

}
