package game.systems.common;
import game.entity.Entity;
import game.systems.iterfaces.ISystem;

/**
 * ...
 * @author Andrii Andriushchenko
 */
class SystemManager 
{
	public var systems(default, null):Map<String ,ISystem>;
	public function new() 
	{
		systems = new Map<String ,ISystem>();
	}
	
	public function addSystem(system:ISystem):Void
	{
		systems.set(system.id, system);
	}
	
	public function getSystem(key:String):ISystem
	{
		return systems.get(key);
	}
	
	public function removeSystem(key:String):Void
	{
		systems.remove(key);
	}
	
	public function addEnitytToSystem(entity:Entity, systemKey:String):Void
	{
		var system = getSystem(systemKey);
		system.add(entity);
	}
	
	public function removeEntityFromSystem(entity:Entity, systemKey:String):Void
	{
		var system = getSystem(systemKey);
		system.remove(entity);
	}
	
	public function removeEntityFromAllSysytem(entity:Entity):Void
	{
		for (system in systems)
		{
			system.remove(entity);
		}
	}
	
	private function set_systems(map:Map<String ,ISystem>):Map<String ,ISystem>
	{
		systems = map;
		return systems;
	}
	
	private function get_systems():Map<String ,ISystem>
	{
		return systems;
	}
}