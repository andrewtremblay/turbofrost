package  
{
	import org.flixel.*;
	import particle.ParticleSystem;
	/**
	 * ...
	 * @author morgan
	 */
	public class BaseState extends FlxState
	{
		protected var interactables:FlxGroup 	= new FlxGroup();
		protected var actors:FlxGroup 			= new FlxGroup();
		protected var projectiles:FlxGroup 		= new FlxGroup();
		protected var extra:FlxGroup 			= new FlxGroup();
		protected var gui:FlxGroup 				= new FlxGroup();
		
		protected var particleSystem:ParticleSystem = new ParticleSystem(1000);		
		
		protected var rm:ResourceManager;
		public function BaseState() 
		{
			rm = ResourceManager.getRM();
			rm.initialize();
		}
		
		override public function create():void 
		{
			super.create();
			
			add(interactables);
			add(actors);
			add(extra);
			add(projectiles);
			add(particleSystem);
			add(gui);
			
			var of:ObjectFactory = new ObjectFactory(actors, projectiles, particleSystem, gui, extra);
			ObjectFactory.stateFactory = of;
			
		}
		
	}

}