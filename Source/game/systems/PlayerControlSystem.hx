package game.systems;

import game.components.PointComponent;
import game.components.RectangleComponent;
import game.entity.Entity;
import game.entity.EntityManager;
import game.systems.iterfaces.ISystem;
import game.utils.DCCList;
import starling.display.DisplayObjectContainer;
import starling.events.Touch;
import starling.events.TouchEvent;

/**
 * ...
 * @author Andrii Andriushchenko
 */
class PlayerControlSystem implements ISystem 
{
	public var id:String;
	public var entityManager:EntityManager;
	public var entities:DCCList<Entity>;
	
	private var touch:Touch;
	private var container:DisplayObjectContainer;
	private var playerEntity:Entity;
	private var point:PointComponent;
	private var playerRect:RectangleComponent;
	
	public function new(entityManager:EntityManager, container:DisplayObjectContainer) 
	{
		this.entityManager = entityManager;
		this.container = container;
		
		container.addEventListener(TouchEvent.TOUCH, onTouched);
		playerEntity = entityManager.get("player");
		
		playerRect = cast(playerEntity.get("RectangleComponent"), RectangleComponent);
	}
	
	private function onTouched(event:TouchEvent):Void 
	{
		touch = event.getTouch(container);
		
		if (touch != null && touch.globalY <= (container.height - playerRect.height)) 
		{
			point = cast(playerEntity.get("PointComponent"), PointComponent);
			
			point.y = Std.int(touch.globalY);
		}
	}
	
	public function update(time:Int):Void 
	{
	}
	
	public function updateEntitySet():Void 
	{
	}
	
}