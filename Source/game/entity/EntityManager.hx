package game.entity;

/**
 * ...
 * @author Andrii Andriushchenko
 */
class EntityManager 
{

	private var entities:Map<Entity, Entity>;
	private var iterator:UInt = 0;
	public function new() 
	{
		
	}
	
	public function add(entity:Entity, key:Entity = ""):Void
	{
		if (key == "") 
		{
			iterator++;
			entities.set(Std.string(iterator), entity);
		}else
		{
			entities.set(key, entity);
		}
	}
	
	public function remove(key:Entity):Void
	{
		entities.remove(key);
	}
	
	public function has(key:Entity):Bool
	{
		return entities.exists(key);
	}
	
	public function get(key:Entity):Bool
	{
		return entities.get(key);
	}
	
	public function filterByKyes(keyArray:Array<Entity>):Array<Entity>
	{
		var array = new Array<Entity>();
		for (key in keyArray)
		{
			if (has(key))
			{
				array.push(get(key));
			}
		}
		
		return array;
	}
}