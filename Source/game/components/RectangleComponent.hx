package game.components;
import game.components.interfaces.IComponent;

/**
 * @author Andrii Andriushchenko
 */
class RectangleComponent implements IComponent
{
	public var id:String = "RectangleComponent";
	
	public var width:Int;
	public var height:Int;
	public function new() {}
}