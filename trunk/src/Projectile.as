package  
{
	import org.flixel.FlxG;
	/**
	 * 
	 * @author morgan
	 */
	public class Projectile extends Entity
	{
		// Handy ways to get useful projectile collision functions
		public static function getProjectileDamageFunc(damage:int, knockback:Number):Function
		{
			return function(target:Actor):void
				{
					// knockback
					// TODO: make this based on projectile direction or something?
					target.knockbackX = -target.facingNormalX * knockback;
					target.knockbackY = -target.facingNormalY * knockback;
					// damage
					target.health -= damage;
				};
		}		
		
		private var onHitFunc:Function;
		private var timeout:Number;
		public function Projectile(x:int, y:int, xv:Number, yv:Number, timeout:Number, image:Class = null, onHitFunc:Function = null) 
		{
			super(x, y);
			velocity.x = xv;
			velocity.y = yv;
			loadGraphic(image);
			this.onHitFunc = onHitFunc;
			this.timeout = timeout;
		}
		
		override public function update():void 
		{
			timeout -= FlxG.elapsed;
			if (timeout <= 0)
			{
				kill();
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