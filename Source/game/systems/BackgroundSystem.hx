package game.systems;

import game.GameEngine;
import game.components.PointComponent;
import game.components.RectangleComponent;
import game.entity.Entity;
import game.entity.EntityCreator;
import game.entity.EntityManager;
import game.systems.common.SystemManager;
import game.systems.iterfaces.ISystem;
import game.utils.DCCList;

/**
 * ...
 * @author Andrii Andriushchenko
 */
class BackgroundSystem implements ISystem 
{
	public var id:String = "BackgroundSystem";

	
	public var kyesForFilter:Array<String>;
	private var entities:DCCList<Entity>;
	
	private var entityManager:EntityManager;
	private var entityCreator:EntityCreator;
	private var systemManager:SystemManager;
	
	var point:PointComponent;
	var rectangleComponent:RectangleComponent;
	
	public function new(entityManager:EntityManager, entityCreator:EntityCreator, systemManager:SystemManager) 
	{
		this.entityManager = entityManager;
		this.entityCreator = entityCreator;
		this.systemManager = systemManager;
		kyesForFilter = ["PointComponent", "RectangleComponent", "VelocityComponent"];
		
		updateEntitySet();
	}
	
	public function update(time:Int):Void 
	{
		
		for (entity in entities)
		{
			point = cast(entity.get("PointComponent"), PointComponent);
			rectangleComponent = cast(entity.get("RectangleComponent"), RectangleComponent);
			
			if (point.x <= -rectangleComponent.width)
			{
				var point2:PointComponent = cast(entities.nextElement(entity).get("PointComponent"), PointComponent);
				var rectangleComponent2:RectangleComponent = cast(entities.nextElement(entity).get("RectangleComponent"), RectangleComponent);
				
				point.x = point2.x + rectangleComponent2.width;
			}
		}
	}
			
	public function updateEntitySet():Void
	{
		//entities = entityManager.filterByComponents(kyesForFilter);
		entities = entityManager.filterByEReg(~/bg/);
	}
}