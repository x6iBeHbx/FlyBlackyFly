package game.systems;

import game.components.CoinsComponent;
import game.components.DisplayComponent;
import game.entity.Entity;
import game.entity.EntityManager;
import game.systems.iterfaces.ISystem;
import game.utils.DCCList;
import starling.text.TextField;

/**
 * ...
 * @author Andrii Andriushchenko
 */
class UpdateCoinsSystem implements ISystem 
{
	
	public var id:String = "UpdateCoinsSystem";
	public var entityManager:EntityManager;
	public var entities:DCCList<Entity>;
	
	private var coinsEntity:Entity;
	private var coins:CoinsComponent;
	private var display:DisplayComponent;
	private var textField:TextField;
	
	public function new(entityManager:EntityManager) 
	{
		this.entityManager = entityManager;
	}
	
	public function coinsUdpate():Void
	{
		coinsEntity = entityManager.get("coinsText");
		coins = cast(coinsEntity.get("CoinsComponent"), CoinsComponent);
		display = cast(coinsEntity.get("DisplayComponent"), DisplayComponent);
		textField = cast(display.view, TextField);
		coins.coins++;
		textField.text = Std.string(coins.coins);
	}
	
	public function update(time:Int):Void 
	{
	}
	
	public function updateEntitySet():Void 
	{
	}
	
}