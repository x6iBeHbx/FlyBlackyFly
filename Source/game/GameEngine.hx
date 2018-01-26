package game;
import game.components.DisplayComponent;
import game.entity.Entity;
import game.entity.EntityCreator;
import game.entity.EntityManager;
import game.systems.BackgroundSystem;
import game.systems.DecreaseLiveSystem;
import game.systems.ItemGenerationSystem;
import game.systems.MoveSystem;
import game.systems.ObstacleGenerationSystem;
import game.systems.PlayerControlSystem;
import game.systems.ItemCollisionSystem;
import game.systems.RenderSystem;
import game.systems.UpdateCoinsSystem;
import game.systems.common.SystemManager;
import game.systems.iterfaces.ISystem;
import openfl.display.FPS;
import openfl.display.Tilemap;
import openfl.utils.Timer;
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
	
	private var entityManager:EntityManager;
	
	public function new(mainScene:DisplayObjectContainer) 
	{
		
		this.mainScene = mainScene;
		
		entityManager = new EntityManager();
		entityCreator = new EntityCreator(entityManager);
		systemManager = new SystemManager();
		
		prepare();
		registerSytems();
	}
	
	function registerSytems() 
	{
		systemManager.addSystem(new BackgroundSystem(entityManager, entityCreator, systemManager));
		systemManager.addSystem(new MoveSystem(entityManager));
		systemManager.addSystem(new UpdateCoinsSystem(entityManager));
		systemManager.addSystem(new ItemGenerationSystem(entityManager, entityCreator, systemManager));
		systemManager.addSystem(new ObstacleGenerationSystem(entityManager, entityCreator, systemManager));
		systemManager.addSystem(new ItemCollisionSystem(entityManager, mainScene, systemManager));
		systemManager.addSystem(new DecreaseLiveSystem(entityManager, systemManager));
		systemManager.addSystem(new RenderSystem(entityManager, mainScene));
		systemManager.addSystem(new PlayerControlSystem(entityManager, mainScene));
	}
	
	public function prepare():Void
	{
		entityCreator.createBackgroung(0, 0, "bg1");
		entityCreator.createBackgroung(720, 0, "bg2");
		
		entityCreator.createPlayer(100, 100, "player");
		
		entityCreator.createCoinsText("coinsText", 0, 100, 10);
		entityCreator.createLiveText("liveText", 3, 150, 10);
	}
	
	public function update(time:Int):Void
	{
		if (systemManager.allSystemUpdated) 
		{
			systemManager.update(time);
		}
	}
}