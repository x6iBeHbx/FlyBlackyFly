package game.systems;

import game.components.DisplayComponent;
import game.components.PointComponent;
import game.entity.Entity;
import game.entity.EntityManager;
import game.systems.iterfaces.ISystem;
import game.utils.DCCList;
import starling.display.DisplayObjectContainer;
import starling.text.TextField;

/**
 * ...
 * @author Andrii Andriushchenko
 */
class RenderSystem implements ISystem 
{
	public var id:String = "RenderSystem";
	
	private var kyesForFilter:Array<String>;
	private var entities:DCCList<Entity>;
	private var entityManager:EntityManager;
	private var container:DisplayObjectContainer;
	
	
	private var point:PointComponent;
	private var display:DisplayComponent;
	
	public function new(entityManager:EntityManager, container:DisplayObjectContainer) 
	{
		this.container = container;
		this.entityManager = entityManager;
		
		kyesForFilter = ["PointComponent", "DisplayComponent"];
		
		updateEntitySet();
	}
	
	public function update(time:Int):Void 
	{
		for (entity in entities)
		{
			
			point = cast(entity.get("PointComponent"), PointComponent);
			display = cast(entity.get("DisplayComponent"), DisplayComponent);
			
			display.view.x = point.x;
			display.view.y = point.y;
			display.view.rotation = point.rotation * 180 / Math.PI;
		}
	}
		
	public function updateEntitySet():Void
	{
		entities = entityManager.filterByComponents(kyesForFilter);
		trace(entities.length);
		for (entity in entities)
		{
			var display:DisplayComponent = cast(entity.get("DisplayComponent"), DisplayComponent);
			container.addChild(display.view);
		}
	}
}