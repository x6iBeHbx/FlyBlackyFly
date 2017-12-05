package game.entity;

/**
 * ...
 * @author Andrii Andriushchenko
 */
class EntityManager 
{

	private var entities:Map<String, Entity>;
	private var iterator:UInt = 0;
	public function new() 
	{
		entities = new Map<String, Entity>();
	}
	
	public function add(entity:Entity, key:String = ""):Void
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
	
	public function remove(key:String):Void
	{
		entities.remove(key);
	}
	
	public function has(key:String):Bool
	{
		return entities.exists(key);
	}
	
	public function get(key:String):Entity
	{
		return entities.get(key);
	}
	
	public function filterByComponents(keyArray:Array<String>):Array<Entity>
	{
		var list = new Array<Entity>();
		for (entity in entities)
		{
			if (entity.hasComponents(keyArray))
			{
				list.push(entity);
			}
		}
		
		return list;
	}
	
	public function filterByKyes(keyArray:Array<String>):Array<Entity>
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