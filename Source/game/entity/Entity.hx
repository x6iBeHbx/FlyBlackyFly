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
		if(!has(component)) components.add(component);
		else throw('$component already added to Entity');
	}

	public function remove(component:IComponent):Void
	{
		if (has(component)) components.remove(component);
		else throw('Not found $component in Entity');
	}
	
	public function has(component:IComponent):Bool
	{
		for (comp in components)
		{
			if (comp.id == component.id)
			{
				return true;
			}
		}
		
		return false;
	}
	
	public function get(id:Entity):IComponent
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