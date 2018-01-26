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
import starling.events.TouchEvent;
import starling.textures.Texture;
import starling.utils.AssetManager;
import starling.utils.Color;

/**
 * ...
 * @author Andrii Andriushchenko
 */
class Game extends Sprite
{

	private var gameEngine:GameEngine;
	
	var i = 0;
	var texture:Texture;
	
	var bg:Image;
	var btn:Image;
	
	public function new() 
	{
		super();
		this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

	}
	
	private function onAddedToStage(e:Event)
	{
		//Need start prelaoder
		var loader = new LoadResource(ladedFinished);
		loader.load("assets/json/StartGameConfig.json");
		
		//welcomeScreen = new Welcome();
		//addChild(welcomeScreen);
		//welcomeScreen.initialize();
	}
	
	private function ladedFinished()
	{
		
		bg = new Image(ResourceWarehouse.getInstance().getTexture("bg"));
		btn = new Image(ResourceWarehouse.getInstance().getTexture("startBtn"));
		
		btn.x = 360 - btn.width * 0.5;
		btn.y = 130 - btn.height * 0.5;
		
		this.addChild(bg);
		this.addChild(btn);
		
		
		btn.addEventListener(TouchEvent.TOUCH, onTouched);		
		//gameEngine = new GameEngine(this);
	}
	
	private function onTouched(e:TouchEvent):Void 
	{
		this.removeChild(btn);
		this.removeChild(bg);
		
		gameEngine = new GameEngine(this);
		this.addEventListener(Event.ENTER_FRAME, tick);
	}
	
	private function tick(e:Event):Void 
	{
		gameEngine.update(2);
	}
}