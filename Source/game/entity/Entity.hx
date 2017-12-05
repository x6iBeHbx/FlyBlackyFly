package game.entity;

import game.components.interfaces.IComponent;
/**
 * ...
 * @author Andrii Andriushchenko
 */
class Entity
{

	private var components:List<IComponent>;

	public function new()
	{
		components = new List<IComponent>();
	}

	public function add(component:IComponent):Void
	{
		if(!has(component.id)) components.add(component);
		else throw('$component already added to Entity');
	}

	public function remove(component:IComponent):Void
	{
		if (has(component.id)) components.remove(component);
		else throw('Not found $component in Entity');
	}
	
	public function has(key:String):Bool
	{
		for (comp in components)
		{
			if (comp.id == key)
			{
				return true;
			}
		}
		
		return false;
	}
	
	public function hasComponents(keyList:Array<String>):Bool
	{
		for (key in keyList)
		{
			if (!has(key))
			{
				return false;
			}
		}
		
		return true;
	}
	
	public function get(id:String):IComponent
	{
		for (comp in components)
		{
			if (comp.id == id)
			{
				return comp;
			}
		}
		
		return null;
	}
}