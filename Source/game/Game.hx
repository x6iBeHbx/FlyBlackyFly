package game;

import game.common.assets.LoadResource;
import game.common.assets.ResourceWarehouse;
import game.entity.Entity;
import starling.display.Image;
import starling.display.MovieClip;
import starling.display.Quad;
import starling.display.Sprite;
import starling.events.Event;
import starling.events.KeyboardEvent;
import starling.utils.AssetManager;
import starling.utils.Color;

/**
 * ...
 * @author Andrii Andriushchenko
 */
class Game extends Sprite
{

	private var gameEngine:GameEngine;
	
	public function new() 
	{
		super();
		this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
	}
	
	private function onAddedToStage(e:Event)
	{
		//Need start prelaoder
		var loader = new LoadResource(ladedFinished);
		loader.load("json/StartGameConfig.json");
		
		//welcomeScreen = new Welcome();
		//addChild(welcomeScreen);
		//welcomeScreen.initialize();
	}
	
	private function ladedFinished()
	{
		
		//var texture = ResourceWarehouse.getInstance().getTexture("bg");
		
		//this.addChild(new Image(texture));
		
				
		gameEngine = new GameEngine(this);
		this.addEventListener(Event.ENTER_FRAME, tick);
	}
	
	private function tick(e:Event):Void 
	{
		gameEngine.update(1);
	}
}