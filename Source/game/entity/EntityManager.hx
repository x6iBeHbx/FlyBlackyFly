package game.entity;
import game.utils.DCCList;
import openfl.utils.Dictionary;
import openfl.utils.Timer;

/**
 * ...
 * @author Andrii Andriushchenko
 */
class EntityManager 
{

	private var entities:Array<Entity>;
	private var kyes:Array<String>;
	private var iterator:UInt = 0;
	private var generatedKey:String;
	
	public function new() 
	{
		entities = new Array<Entity>();
		kyes = new Array<String>();
	}
	
	public function add(entity:Entity, key:String = "", needGenerateKey:Bool = false):Void
	{
		if (key == "" || needGenerateKey) 
		{
			
			generatedKey = key + Std.string(Date.now().getTime());
			entity.id = Std.string(generatedKey);
			kyes.push(Std.string(generatedKey));
			entities.push(entity);
		}else
		{
			entity.id = key;
			kyes.push(key);
			entities.push(entity);
		}
	}
	
	public function remove(entity:Entity):Void
	{
		//var index = kyes.indexOf(key);
		//entities[index];
		entities.remove(entity);
		entity = null;
		trace(entities.length);
	}
	
	public function has(key:String):Bool
	{
		return kyes.indexOf(key) != -1;
	}
	
	public function get(key:String):Entity
	{
		var index = kyes.indexOf(key);
		return entities[index];
	}
	
	public function filterByComponents(keyArray:Array<String>):DCCList<Entity>
	{
		var list = new DCCList<Entity>();
		for (entity in entities)
		{
			if (entity.hasComponents(keyArray))
			{
				list.add(entity);
			}
		}
		
		return list;
	}
	
	public function filterByKyes(keyArray:Array<String>):DCCList<Entity>
	{
		var list = new DCCList<Entity>();
		for (key in keyArray)
		{
			if (has(key))
			{
				list.add(get(key));
			}
		}
		
		return list;
	}
	
	public function filterByEReg(r:EReg):DCCList<Entity>
	{
		var list = new DCCList<Entity>();
		for (entity in entities)
		{
			if (r.match(entity.id))
			{
				list.add(entity);
			}
		}
		
		return list;
	}
}