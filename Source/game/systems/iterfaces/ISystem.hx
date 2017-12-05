package game.systems.iterfaces;
import game.entity.Entity;

/**
 * @author Andrii Andriushchenko
 */
interface ISystem 
{
	public var id:String;
	
	private var entitiesKeyList:List<String>;
	
	public function update(time:Int):Void;
	public function add(key:Entity):Void;
	public function remove(key:Entity):Void;
	public function has(key:Entity):Bool;
}