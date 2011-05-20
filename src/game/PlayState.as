package game 
{
	import monster.Monster;
	import org.flixel.*;
	import particle.ParticleSystem;
	/**
	 * State for the main gameplay
	 * @author morgan
	 */
	public class PlayState extends BaseState
	{
		private var player:Player;
		
		private var interactables:FlxGroup 	= new FlxGroup();
		private var actors:FlxGroup 		= new FlxGroup();
		private var projectiles:FlxGroup 	= new FlxGroup();
		private var gui:FlxGroup 			= new FlxGroup();
		
		private var particleSystem:ParticleSystem = new ParticleSystem(3000);
		
		public function PlayState() 
		{
			super();
			FlxG.bgColor = 0xffffffff;
		}
		
		override public function create():void 
		{
			super.create();
			
			var of:ObjectFactory = new ObjectFactory(actors, projectiles, particleSystem, gui);
			ObjectFactory.stateFactory = of;
			
			of.makeActor(Player, 180, 180);
			of.makeActor(Monster, 180, 60);
			
			add(interactables);
			add(actors);
			add(projectiles);
			add(particleSystem);
			add(gui);
		}
		
		override public function update():void 
		{
			FlxG.overlap(projectiles, actors, oProjActor);
			
			super.update();
		}
		
		public function oProjActor(p:Projectile, a:Actor):void
		{
			p.onHit(a);
			a.onHit(p);
		}
		
	}

}