package  
{
	import org.flixel.FlxG;
	import particle.Emitter;
	/**
	 * 
	 * @author morgan
	 */
	public class Projectile extends Entity
	{
		// Handy ways to get useful projectile collision functions
		public static function getProjectileDamageFunc(damage:int, knockbackX:Number, knockbackY:Number):Function
		{
			return function(target:Actor):void
			{
				// knockback
				// TODO: make this based on projectile direction or something?
				// TODO: also a function for kb instead of setting some vars
				target.knockbackX += knockbackX;
				target.knockbackY += knockbackY;
				// damage
				target.takeDamage(damage);
			};
		}		
		
		private var onHitFunc:Function;
		private var timeout:Number;
		private var emitter:Emitter;
		public function Projectile(x:int, y:int, xv:Number, yv:Number, timeout:Number, image:Class = null, onHitFunc:Function = null, emitter:Emitter = null) 
		{
			super(x, y);
			velocity.x = xv;
			velocity.y = yv;
			loadGraphic(image);
			this.onHitFunc = onHitFunc;
			this.timeout = timeout;
			this.emitter = emitter;
		}
		
		override public function update():void 
		{
			timeout -= FlxG.elapsed;
			if (timeout <= 0)
			{
				kill();
				destroy();
			}
			if (emitter)
			{
				emitter.update();
				emitter.x = x + width / 2;
				emitter.y = y + height / 2;
			}
			super.update();
		}
		
		public function onHit(a:Actor):void
		{
			// Projectiles can only hit enemies
			if (a.enemy != enemy)
			{
				onHitFunc.call(this, a);
				kill();
			}
		}
		
	}

}