package game.systems;
import game.components.PointComponent;
import game.components.VelocityComponent;
import game.entity.Entity;
import game.entity.EntityManager;
import game.systems.iterfaces.ISystem;
import game.utils.DCCList;
import starling.text.TextField;

/**
 * ...
 * @author Andrii Andriushchenko
 */
class MoveSystem implements ISystem
{
	public var id:String = "MoveSystem";
	
	private var kyesForFilter:Array<String>;
	private var entities:DCCList<Entity>;
	private var entityManager:EntityManager;
	
	var point:PointComponent;
	var velocity:VelocityComponent;
	
	public function new(entityManager:EntityManager) 
	{
		kyesForFilter = ["PointComponent", "VelocityComponent"];
		this.entityManager = entityManager;
		
		updateEntitySet();
	}
	
	public function update(time:Int)
	{
		
		for (entity in entities)
		{
			point = cast(entity.get("PointComponent"), PointComponent);
			velocity = cast(entity.get("VelocityComponent"), VelocityComponent);
			
			point.x += velocity.velocityX * time;
			point.y += velocity.velocityY * time;
			point.rotation += velocity.angularVelocity * time;
		}
	}
	
	public function updateEntitySet():Void
	{
		entities = entityManager.filterByComponents(kyesForFilter);
	}
}