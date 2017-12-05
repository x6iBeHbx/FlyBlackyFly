package game.systems;

import game.components.DisplayComponent;
import game.components.PointComponent;
import game.entity.Entity;
import game.entity.EntityManager;
import game.systems.iterfaces.ISystem;
import starling.display.DisplayObjectContainer;

/**
 * ...
 * @author Andrii Andriushchenko
 */
class RenderSystem implements ISystem 
{
	public var id:String = "RenderSystem";
	
	private var entitiesKeyList:Array<String>;
	private var entities:Array<Entity>;
	private var entityManager:EntityManager;
	private var container:DisplayObjectContainer;
	
	public function new(container:DisplayObjectContainer) 
	{
		this.container = container;
		entitiesKeyList = new Array<String>();
		entities = new Array<Entity>();
	}
	
	public function update(time:Int):Void 
	{
		for (entity in entities)
		{
			var point:PointComponent = cast(entity.get("PointComponent"), PointComponent);
			var display:DisplayComponent = cast(entity.get("DisplayComponent"), DisplayComponent);
			
			display.view.x = point.x;
			display.view.y = point.y;
			display.view.rotation = point.rotation * 180 / Math.PI;
		}
	}
	
	//public function add(key:String):Void
	//{
		//entitiesKeyList.add(key);
		//
		//var display:DisplayComponent = cast(entity.get("DisplayComponent"), DisplayComponent);
		//container.addChild(display.view);
	//}
	//
	//public function remove(key:String):Void
	//{
		//entitiesKeyList.remove(key);
		//
		//var display:DisplayComponent = cast(entity.get("DisplayComponent"), DisplayComponent);
		//container.removeChild(display.view);
	//}
	//
	//public function has(key:String):Bool
	//{
	//}
}