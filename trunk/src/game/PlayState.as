package game 
{
	import org.flixel.*;
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
		
		public function PlayState() 
		{
			super();
		}
		
		override public function create():void 
		{
			super.create();
			
			// TEMP
			player = new Player(180, 180);
			
			// TEMP
			actors.add(player);
			
			add(interactables);
			add(actors);
			add(projectiles);
		}
		
		override public function update():void 
		{
			FlxG.overlap(projectiles, actors, oProjActor);
			
			super.update();
		}
		
		public function oProjActor(p:Projectile, a:Actor)
		{
			p.onHit(a);
			a.onHit(p);
		}
		
	}

}