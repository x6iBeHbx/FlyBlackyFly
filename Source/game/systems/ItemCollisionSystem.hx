package game.systems;
import game.components.CoinsComponent;
import game.components.DisplayComponent;
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
	private var playerEntity:Entity;
	private var coinsEntity:Entity;
	
	private var entityManager:EntityManager;
	private var systemManager:SystemManager;
	
	private var container:DisplayObjectContainer;
	private var point:PointComponent;
	private var rectangleComponent:RectangleComponent;
	private var display:DisplayComponent;
	
	
	
	public function new(entityManager:EntityManager, container:DisplayObjectContainer, systemManager:SystemManager) 
	{
		this.entityManager = entityManager;
		this.container = container;
		this.systemManager = systemManager;
		
		updateEntitySet();
	}
	
	public function update(time:Int):Void 
	{
		
		for (entity in entities)
		{
			point = cast(entity.get("PointComponent"), PointComponent);
			rectangleComponent = cast(entity.get("RectangleComponent"), RectangleComponent);
			display = cast(entity.get("DisplayComponent"), DisplayComponent);
			
			if (display.view.bounds.intersects(cast(playerEntity.get("DisplayComponent"), DisplayComponent).view.bounds) ||	point.x < 0)
			{
				//trace(entity.id);
				entityManager.remove(entity);
				container.removeChild(display.view);
				systemManager.updateEntitiesSetForAll();
				
				udpateCoins();
			}
		}
	}
	
	public function updateEntitySet():Void
	{
		entities = entityManager.filterByEReg(~/item/);
		playerEntity = entityManager.get("player");
	}
	
	private function udpateCoins():Void
	{
		cast(systemManager.getSystem("UpdateCoinsSystem"), UpdateCoinsSystem).coinsUdpate();
	}
}