package game.systems;
import game.components.PointComponent;
import game.components.VelocityComponent;
import game.entity.Entity;
import game.systems.iterfaces.ISystem;

/**
 * ...
 * @author Andrii Andriushchenko
 */
class MoveSystem implements ISystem
{
	public var id:String = "MoveSystem";
	
	private var entities:List<String>;
	public function new() 
	{
		entities = new List<String>();
		
		
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