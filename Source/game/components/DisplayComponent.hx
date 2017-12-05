package game.components;
import game.components.interfaces.IComponent;
import starling.display.DisplayObject;

/**
 * ...
 * @author Andrii Andriushchenko
 */
class DisplayComponent implements IComponent
{
	public var id:String = "DisplayComponent";
	
	public var view:DisplayObject;
	public function new() {}
}