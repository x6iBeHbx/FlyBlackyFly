package game.systems.iterfaces;
import game.entity.Entity;
import game.entity.EntityCreator;
import game.entity.EntityManager;

/**
 * @author Andrii Andriushchenko
 */
interface ISystem 
{
	public var id:String;
	
	private var entityManager:EntityManager;
	private var entities:Array<Entity>;
	
	public function update(time:Int):Void;
}