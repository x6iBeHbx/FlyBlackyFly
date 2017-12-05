package game.entity;
import game.Game;
import game.GameEngine;
import game.common.assets.ResourceWarehouse;
import game.components.DisplayComponent;
import game.components.PointComponent;
import game.components.VelocityComponent;
import starling.display.Image;

/**
 * ...
 * @author Andrii Andriushchenko
 */
class EntityCreator 
{
	private var gameEngine:GameEngine;
	public function new(engine:GameEngine) 
	{
		gameEngine = engine;
	}
	
	public function createBackgroung(x:Int):Enti
	{
		var bg = new Entity();
		
		var position = new PointComponent();
		position.x = x;
		position.y = 0;
		position.rotation = 0;
		
		var velocity = new VelocityComponent();
		velocity.velocityY = 0;
		velocity.velocityX = -1;
		velocity.angularVelocity = 0;
		
		var display = new DisplayComponent();
		var texture = ResourceWarehouse.getInstance().getTexture("bg");
		display.view = new Image(texture);
		
		
		bg.add(position);
		bg.add(velocity);
		bg.add(display);
		
		return bg;
	}
}