package game.common.assets;
import openfl.Vector;
import openfl.utils.Dictionary;
import starling.textures.Texture;
import starling.utils.AssetManager;

/**
 * ...
 * @author Andrii Andriushchenko
 */
class ResourceWarehouse extends AssetManager
{
	private static var _instance:ResourceWarehouse;

	public static function  getInstance():ResourceWarehouse
	{
		if (_instance==null)
		{
			_instance = new ResourceWarehouse();
		}
		return _instance;
	}
}