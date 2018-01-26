package game.systems;

import flash.events.HTTPStatusEvent;
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
class ObstacleGenerationSystem implements ISystem 
{
	public var id:String = "ObstacleGenerationSystem";
	public var entityManager:EntityManager;
	public var entities:DCCList<Entity>;
	
	private var entityCreator:EntityCreator;
	private var systemManager:SystemManager;
	
	private var random:Float;
	
	public function new(entityManager:EntityManager, entityCreator:EntityCreator, systemManager:SystemManager) 
	{
		this.entityManager = entityManager;
		this.entityCreator = entityCreator;
		this.systemManager = systemManager;
	}

	
	public function update(time:Int):Void 
	{
		random = Math.random();
		if (random < time/20)
		{
			randomGenerate();
			//entityCreator.createItem(730, Std.int(Math.random()*320));
			systemManager.updateEntitiesSetForAll();
		}
	}
	
	private function randomGenerate():Void
	{
		entityCreator.createObstacle(730, Std.int(Math.random()*320));
	}
	
	public function updateEntitySet():Void 
	{
	}
}