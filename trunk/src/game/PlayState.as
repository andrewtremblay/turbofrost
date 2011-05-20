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
		
		private var particleSystem:ParticleSystem = new ParticleSystem(3000);
		
		public function PlayState() 
		{
			super();
			FlxG.bgColor = 0xffffffff;
		}
		
		override public function create():void 
		{
			super.create();
			
			var of:ObjectFactory = new ObjectFactory(actors, projectiles, particleSystem);
			ObjectFactory.stateFactory = of;
			
			// TEMP
			player = new Player(180, 180);
			var monster:Monster = new Monster(180, 60);
			
			// TEMP
			actors.add(player);
			actors.add(monster);
			
			add(interactables);
			add(actors);
			add(projectiles);
			add(particleSystem);
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