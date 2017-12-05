package game;
import game.components.DisplayComponent;
import game.entity.Entity;
import game.entity.EntityCreator;
import game.systems.MoveSystem;
import game.systems.RenderSystem;
import game.systems.common.SystemManager;
import game.systems.iterfaces.ISystem;
import starling.display.DisplayObjectContainer;
import starling.display.Sprite;

/**
 * ...
 * @author Andrii Andriushchenko
 */
class GameEngine 
{

	private var systemManager:SystemManager;
	private var mainScene:DisplayObjectContainer;
	private var entityCreator:EntityCreator;
	
	public function new(mainScene:DisplayObjectContainer) 
	{
		this.mainScene = mainScene;
		
		entityCreator = new EntityCreator(this);
		systemManager = new SystemManager();
		
		registerSytems();
		prepare();
	}
	
	function registerSytems() 
	{
		systemManager.addSystem(new MoveSystem());
		systemManager.addSystem(new RenderSystem(mainScene));
	}
	
	public function prepare():Void
	{
		var bgEntity1 = entityCreator.createBackgroung(0);
		var displ:DisplayComponent = (cast(bgEntity1.get("DisplayComponent"), DisplayComponent));
		var bgEntity2 = entityCreator.createBackgroung(Std.int(displ.view.width));
		
		//systemManager.addEnitytToSystem(bgEntity1, "MoveSystem");
		//systemManager.addEnitytToSystem(bgEntity2, "MoveSystem");
		
		//systemManager.addEnitytToSystem(bgEntity1, "RenderSystem");
		//systemManager.addEnitytToSystem(bgEntity2, "RenderSystem");
	}
	
	public function update(time:Int):Void
	{
		for (system in systemManager.systems)
		{
			system.update(time);
		}
	}
}