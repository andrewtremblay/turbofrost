package  
{
	import org.flixel.*;
	import particle.Emitter;
	import particle.ParticleSystem;
	import ui.StatBar;
	/**
	 * ...
	 * @author morgan
	 */
	public class ObjectFactory 
	{
		// Hmmmmm
		public static var stateFactory:ObjectFactory = null;
		
		private var actors:FlxGroup;
		private var projectiles:FlxGroup;
		private var particleSystem:ParticleSystem;
		private var gui:FlxGroup;
		public function ObjectFactory(actors:FlxGroup, projectiles:FlxGroup, particleSystem:ParticleSystem, gui:FlxGroup) 
		{
			this.actors = actors;
			this.projectiles = projectiles;
			this.particleSystem = particleSystem;
			this.gui = gui;
		}
		
		public function makeProjectile(x:int, y:int, xv:Number, yv:Number, timeout:Number, image:Class, onHit:Function, emitter:Emitter = null):void
		{
			var p:Projectile = new Projectile(x, y, xv, yv, timeout, image, onHit, emitter);
			if (emitter) { emitter.setParticleSystem(particleSystem); }
			p.x -= p.width / 2;
			p.y -= p.height / 2;
			projectiles.add(p);
		}
		
		public function makeActor(actorClass:Class, x:int, y:int, healthbar:Boolean = true) : void
		{
			var a:Actor = new actorClass(x, y);
			if (healthbar)
			{
				a.healthbar = new StatBar(0xffff0000, a.maxHealth, a.health);
				gui.add(a.healthbar);
			}
			actors.add(a);
		}
		
		public function makeMonster(x:int, y:int)
		{
			
		}
		
	}

}