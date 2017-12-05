package game.common.assets;
import flash.net.URLLoader;
import flash.net.URLRequest;
import game.common.assets.ResourceWarehouse;
import haxe.Json;
import openfl.events.Event;
import openfl.events.EventDispatcher;
import starling.utils.AssetManager;

/**
 * ...
 * @author Andrii Andriushchenko
 */
class LoadResource extends EventDispatcher
{
	
	private var loaded: Void->Void;
	public function new(callBack: Void->Void){
		super();
		loaded = callBack;
	};

	public function load(path:String):Void
	{
		var urlLoader = new URLLoader();
		urlLoader.addEventListener(Event.COMPLETE, resLoaded);
		urlLoader.load(new URLRequest(path));
	}
	
	private function resLoaded(e:Event):Void 
	{
		var loader = cast(e.target, URLLoader);
		var json = Json.parse(loader.data);
		
		//sendNotification(GeneralNotificationEnum.PREPARE_REEL_ENGINE_COMMAND, json);
		
		trace(json.resPath);
		ResourceWarehouse.getInstance().enqueue(json.resPath);
		ResourceWarehouse.getInstance().loadQueue(loadComplete);
	}
	
	private function loadComplete(ratio:Float):Void 
	{
		if (ratio >= 1){
			loaded();
		}
	}
	
	private function loadFinished():Void{
		
	}
}