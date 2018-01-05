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
	public var allSystemUpdated:Bool = true;
	
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
	
	public function clear():Void
	{
		systems = null;
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
	
	public function updateEntitiesSetForAll():Void
	{
		for (system in systems)
		{
			system.updateEntitySet();
		}
	}
	
	public function update(time:Int):Void
	{
		allSystemUpdated = false;
		
		for (system in systems)
		{
			system.update(time);
		}
		
		allSystemUpdated = true;
	}
}