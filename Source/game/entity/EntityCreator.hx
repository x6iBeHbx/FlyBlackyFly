package game.entity;
import game.Game;
import game.GameEngine;
import game.common.assets.ResourceWarehouse;
import game.components.CoinsComponent;
import game.components.DisplayComponent;
import game.components.PointComponent;
import game.components.RectangleComponent;
import game.components.VelocityComponent;
import starling.display.Image;
import starling.display.Quad;
import starling.text.TextField;

/**
 * ...
 * @author Andrii Andriushchenko
 */
class EntityCreator 
{
	private var manager:EntityManager;
	public function new(manager:EntityManager) 
	{
		this.manager = manager;
	}
	
	public function createBackgroung(x:Int, y:Int, bgId:String):Entity
	{
		var bg = new Entity();
		bg.id = bgId;
		
		var position = new PointComponent();
		position.x = x;
		position.y = 0;
		position.rotation = 0;
		
		var velocity = new VelocityComponent();
		velocity.velocityY = 0;
		velocity.velocityX = -10;
		velocity.angularVelocity = 0;
		
		var display = new DisplayComponent();
		var texture = ResourceWarehouse.getInstance().getTexture('bg');
		display.view = new Image(texture);
		
		var rectangle = new RectangleComponent();
		rectangle.width = Std.int(display.view.width);
		rectangle.height = Std.int(display.view.height);
		
		
		bg.add(position);
		bg.add(velocity);
		bg.add(display);
		bg.add(rectangle);
		
		manager.add(bg, bg.id);
		
		return bg;
	}
	
	public function createPlayer(x:Int, y:Int, id:String):Entity
	{
		var player = new Entity();
		player.id = id;
		
		var position = new PointComponent();
		position.x = x;
		position.y = y;
		position.rotation = 0;
		
		var tempPl = new Quad(40, 40, 0xFF0000);
		
		var display = new DisplayComponent();
		var texture = ResourceWarehouse.getInstance().getTexture('player');
		display.view = new Image(texture);
		
		var rectangle = new RectangleComponent();
		rectangle.width = Std.int(display.view.width);
		rectangle.height = Std.int(display.view.height);
		
		
		player.add(position);
		player.add(display);
		player.add(rectangle);
		
		manager.add(player, player.id);
		
		return player;
	}
	
	public function createItem(x:Int, y:Int):Entity
	{
		var item = new Entity();
		var position = new PointComponent();
		position.x = x;
		position.y = y;
		position.rotation = 0;
		
		var velocity = new VelocityComponent();
		velocity.velocityY = 0;
		velocity.velocityX = -8;
		velocity.angularVelocity = 0;
		
		var display = new DisplayComponent();
		var texture = ResourceWarehouse.getInstance().getTexture('item');
		display.view = new Image(texture);
		
		var rectangle = new RectangleComponent();
		rectangle.width = Std.int(display.view.width);
		rectangle.height = Std.int(display.view.height);
		
		
		item.add(position);
		item.add(velocity);
		item.add(display);
		item.add(rectangle);
		
		
		manager.add(item, "item", true);
		return item;
	}
	
	public function createText(id:String, txt:String, x:Int = 0, y:Int = 0, rotation:Int = 0)
	{
		var text = new Entity();
		text.id = id;
		
		var position = new PointComponent();
		position.x = x;
		position.y = y;
		position.rotation = rotation;
		
		var coinsComponent = new CoinsComponent();
		coinsComponent.coins = 0;
		
		var textComponent = new DisplayComponent();
		textComponent.view = new TextField(50, 20, txt);
		
		text.add(position);
		text.add(coinsComponent);
		text.add(textComponent);
		
		
		manager.add(text, id);
		
		return text;
	}
}