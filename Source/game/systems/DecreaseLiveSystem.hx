package game.systems;

import game.components.DisplayComponent;
import game.components.LiveComponent;
import game.entity.Entity;
import game.entity.EntityManager;
import game.systems.common.SystemManager;
import game.systems.iterfaces.ISystem;
import game.utils.DCCList;
import starling.text.TextField;

/**
 * ...
 * @author Andrii Andriushchenko
 */
class DecreaseLiveSystem implements ISystem 
{
	
	public var id:String = "DecreaseLiveSystem";
	public var entityManager:EntityManager;
	public var entities:DCCList<Entity>;
	
	private var systemManager:SystemManager;
	
	private var liveEntity:Entity;
	private var livesComponent:LiveComponent;
	private var display:DisplayComponent;
	private var textField:TextField;
	
	public function new(entityManager:EntityManager, systemManager:SystemManager) 
	{
		this.entityManager = entityManager;
		this.systemManager = systemManager;
		liveEntity = entityManager.get("liveText");
		livesComponent = cast(liveEntity.get("LiveComponent"), LiveComponent);
		display = cast(liveEntity.get("DisplayComponent"), DisplayComponent);
		textField = cast(display.view, TextField);
	}
	
	public function decreaseLive():Void
	{
		livesComponent.lives--;
		textField.text = Std.string(livesComponent.lives);
	}
	
	public function update(time:Int):Void 
	{
		if (livesComponent.lives <= 0)
		{
			//systemManager.clear();
		}
	}
	
	public function updateEntitySet():Void 
	{
		
	}
}