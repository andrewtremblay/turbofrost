package  
{
	import org.flixel.FlxGroup;
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
		public function ObjectFactory(actors:FlxGroup, projectiles:FlxGroup) 
		{
			this.actors = actors;
			this.projectiles = projectiles;
		}
		
		public function makeProjectile(x:int, y:int, xv:Number, yv:Number, image:Class, onHit:Function):void
		{
			var p:Projectile = new Projectile(x, y, xv, yv, image, onHit);
			projectiles.add(p);
		}
		
	}

}