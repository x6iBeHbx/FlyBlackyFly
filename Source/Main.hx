package;


import game.Game;
import openfl.Lib;
import openfl.display.FPS;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.geom.Rectangle;
import starling.core.Starling;


class Main extends Sprite {
	
	
	private var _starling:Starling;
	public function new () {
		
		super ();
		
		this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		
	}
	
	private function onAddedToStage(e:Event):Void 
	{
		removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		
		var fps:FPS = new FPS(10, 10, 0x000000);
		this.addChild(fps);
		
		_starling = new Starling(Game, stage);
		_starling.antiAliasing = 1;
		_starling.start();
	}
}