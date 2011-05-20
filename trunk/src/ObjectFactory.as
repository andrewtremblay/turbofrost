package  
{
	import org.flixel.FlxGroup;
	import particle.Emitter;
	import particle.ParticleSystem;
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
		public function ObjectFactory(actors:FlxGroup, projectiles:FlxGroup, particleSystem:ParticleSystem) 
		{
			this.actors = actors;
			this.projectiles = projectiles;
			this.particleSystem = particleSystem;
		}
		
		public function makeProjectile(x:int, y:int, xv:Number, yv:Number, timeout:Number, image:Class, onHit:Function, emitter:Emitter = null):void
		{
			var p:Projectile = new Projectile(x, y, xv, yv, timeout, image, onHit, emitter);
			if (emitter) { emitter.setParticleSystem(particleSystem); }
			p.x -= p.width / 2;
			p.y -= p.height / 2;
			projectiles.add(p);
		}
		
	}

}