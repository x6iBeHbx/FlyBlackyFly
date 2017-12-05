package game.components;
import game.components.interfaces.IComponent;

/**
 * @author Andrii Andriushchenko
 */
class VelocityComponent implements IComponent
{
	public var id:String = "VelocityComponent";
	
	public var velocityX:Int;
	public var velocityY:Int;
	public var angularVelocity:Int;
	public function new() {}
}