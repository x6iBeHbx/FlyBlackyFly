package game.systems;
import game.components.PointComponent;
import game.components.VelocityComponent;
import game.entity.Entity;
import game.entity.EntityManager;
import game.systems.iterfaces.ISystem;

/**
 * ...
 * @author Andrii Andriushchenko
 */
class MoveSystem implements ISystem
{
	public var id:String = "MoveSystem";
	
	private var kyesForFilter:Array<String>;
	private var entities:Array<Entity>;
	private var entityManager:EntityManager;
	
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
			var point:PointComponent = cast(entity.get("PointComponent"), PointComponent);
			var velocity:VelocityComponent = cast(entity.get("VelocityComponent"), VelocityComponent);
			
			point.x += velocity.velocityX * time;
			point.y += velocity.velocityY * time;
			point.rotation += velocity.angularVelocity * time;
			
			trace(point.x);
		}
	}
	
	public function updateEntitySet():Void
	{
		entities = entityManager.filterByComponents(kyesForFilter);
	}
}