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
		
		public function PlayState() 
		{
			super();
			FlxG.bgColor = 0xffffffff;
		}
		
		override public function create():void 
		{
			super.create();
			
			ObjectFactory.stateFactory.makeActor(Player, 180, 180);
			ObjectFactory.stateFactory.makeActor(Monster, 180, 60);
		}
		
		override public function update():void 
		{
			FlxG.overlap(projectiles, actors, oProjActor);
			FlxG.collide(actors, actors);
			
			super.update();
		}
		
		public function oProjActor(p:Projectile, a:Actor):void
		{
			p.onHit(a);
			a.onHit(p);
		}
		
	}

}