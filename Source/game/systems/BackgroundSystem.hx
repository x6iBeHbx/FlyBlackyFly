package game.systems;

import game.GameEngine;
import game.systems.common.SystemManager;
import game.systems.iterfaces.ISystem;

/**
 * ...
 * @author Andrii Andriushchenko
 */
class BackgroundSystem implements ISystem 
{
	public var id:String = "BackgroundSystem";
	
	public var entitiesKeyList:List<String>;
	
	private var systemManager:SystemManager;
	private inline var deltaForBackGeneration = 50; 
	
	public function new(systemManager:GameEngine) 
	{
		this.systemManager = systemManager;
	}
	
	public function update(time:Int):Void 
	{
		for (entity in entities)
		{
			var point:PointComponent = cast(entity.get("PointComponent"), PointComponent);
			var rectangleComponent:PointComponent = cast(entity.get("RectangleComponent"), RectangleComponent);
			
			if (point.x < deltaForBackGeneration)
			{
				
			}
		}
	}
	
	public function add(entity:String):Void
	{
		entities.add(entity);
	}
	
	public function remove(entity:String):Void
	{
		entities.remove(entity);
	}
	
	public function has(entity:String):Bool
	{
		
	}
}