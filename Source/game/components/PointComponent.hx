package game.components;
import game.components.interfaces.IComponent;

/**
 * @author Andrii Andriushchenko
 */
class PointComponent implements IComponent
{
	public var id:String = "PointComponent";
	
	public var x:Int;
	public var y:Int;
	public var rotation:Int;
	public function new() {}
}