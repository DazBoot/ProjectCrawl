package game;

import core.display.PriorityContainer;
import core.display.SimplePrioritySprite;
import game.dungeon.map.IWorldModel;
import game.dungeon.map.IWorldView;
import game.dungeon.map.MapView;
import game.dungeon.map.MapModel;
import openfl.Lib;
import openfl.display.Sprite;

class Main extends Sprite 
{

	public function new() 
	{
		super();
		
		// Assets:
		// openfl.Assets.getBitmapData("img/assetname.jpg");
		
		var testMap:IWorldModel = new MapModel();
		var testView:IWorldView = new MapView();
		testView.setSource( testMap );
		
		Lib.current.stage.addChild( testView.displayObject );
		
		//Lib.current.stage.addChild( new SimpleMap().displayObject );
		   
		/*var testSpriteOne:SimplePrioritySprite = new SimplePrioritySprite( 100, 200, 0xFF0000 );
		testSpriteOne.setPriority( 2 );
		
		var testSpriteTwo:SimplePrioritySprite = new SimplePrioritySprite( 150, 50, 0x00FF00 );
		testSpriteTwo.setPriority( 1 );
		
		var testSpriteThree:SimplePrioritySprite = new SimplePrioritySprite( 125, 125, 0x0000FF );
		testSpriteThree.setPriority( 1 );
		
		var testDisplay:PriorityContainer = new PriorityContainer( );
		testDisplay.addObject( testSpriteOne );
		testDisplay.addObject( testSpriteTwo );
		testDisplay.addObject( testSpriteThree );
		
		Lib.current.stage.addChild( testDisplay.displayObject );*/
		
		//Lib.current.stage.addChild( testSpriteOne.displayObject );
		
	}
 
}
