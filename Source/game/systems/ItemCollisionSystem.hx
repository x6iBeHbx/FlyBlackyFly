package game.systems;
import game.components.CoinsComponent;
import game.components.DisplayComponent;
import game.components.LiveComponent;
import game.components.PointComponent;
import game.components.RectangleComponent;
import game.entity.Entity;
import game.entity.EntityCreator;
import game.entity.EntityManager;
import game.systems.common.SystemManager;
import game.systems.iterfaces.ISystem;
import game.utils.DCCList;
import starling.display.DisplayObjectContainer;
import starling.text.TextField;

/**
 * ...
 * @author Andrii Andriushchenko
 */
class ItemCollisionSystem implements ISystem
{
	
	public var id:String = "CollisionItemSystem";

	private var entities:DCCList<Entity>;
	private var obstacleEntities:DCCList<Entity>;
	private var playerEntity:Entity;
	private var coinsEntity:Entity;
	
	private var entityManager:EntityManager;
	private var systemManager:SystemManager;
	
	private var container:DisplayObjectContainer;
	private var point:PointComponent;
	private var rectangleComponent:RectangleComponent;
	private var display:DisplayComponent;
	private var liveComponent:LiveComponent;
	
	
	public function new(entityManager:EntityManager, container:DisplayObjectContainer, systemManager:SystemManager) 
	{
		this.entityManager = entityManager;
		this.container = container;
		this.systemManager = systemManager;
		
		playerEntity = entityManager.get("player");
		updateEntitySet();
	}
	
	public function update(time:Int):Void 
	{
		
		for (entity in entities)
		{
			point = cast(entity.get("PointComponent"), PointComponent);
			rectangleComponent = cast(entity.get("RectangleComponent"), RectangleComponent);
			display = cast(entity.get("DisplayComponent"), DisplayComponent);
			
			if (display.view.bounds.intersects(cast(playerEntity.get("DisplayComponent"), DisplayComponent).view.bounds))
			{
				removeItem(entity);
				udpateCoins();
			}
			else if (point.x < 0)
			{
				removeItem(entity);
			}
			
		}
		
		for (obstacleEntity in obstacleEntities)
		{
			point = cast(obstacleEntity.get("PointComponent"), PointComponent);
			rectangleComponent = cast(obstacleEntity.get("RectangleComponent"), RectangleComponent);
			display = cast(obstacleEntity.get("DisplayComponent"), DisplayComponent);
			
			if (display.view.bounds.intersects(cast(playerEntity.get("DisplayComponent"), DisplayComponent).view.bounds))
			{
				removeItem(obstacleEntity);
				decreaseLive();
				//systemManager.clear();
			}
			else if (point.x < 0)
			{
				removeItem(obstacleEntity);
			}
			
		}
	}
	
	public function updateEntitySet():Void
	{
		entities = entityManager.filterByEReg(~/item/);
		obstacleEntities = entityManager.filterByEReg(~/obstacle/);
	}
	
	private function removeItem(entity:Entity)
	{
		entityManager.remove(entity);
		systemManager.updateEntitiesSetForAll();
		container.removeChild(display.view);
	}
	
	private function udpateCoins():Void
	{
		cast(systemManager.getSystem("UpdateCoinsSystem"), UpdateCoinsSystem).coinsUdpate();
	}
	
	private function decreaseLive():Void
	{
		cast(systemManager.getSystem("DecreaseLiveSystem"), DecreaseLiveSystem).decreaseLive();
	}
}