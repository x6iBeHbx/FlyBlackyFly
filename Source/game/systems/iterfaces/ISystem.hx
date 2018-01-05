package game.systems.iterfaces;
import game.entity.Entity;
import game.entity.EntityCreator;
import game.entity.EntityManager;
import game.utils.DCCList;

/**
 * @author Andrii Andriushchenko
 */
interface ISystem 
{
	public var id:String;
	
	private var entityManager:EntityManager;
	private var entities:DCCList<Entity>;
	
	public function update(time:Int):Void;
	public function updateEntitySet():Void;
}