package  
{
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
					
					// damage
					target.health -= damage;
				};
		}		
		
		private var onHitFunc:Function
		public function Projectile(x:int, y:int, xv:Number, yv:Number, image:Class = null, onHitFunc:Function = null) 
		{
			super(x, y);
			velocity.x = xv;
			velocity.y = yv;
			loadGraphic(image);
			this.onHitFunc = onHitFunc;
		}
		
		public function onHit(a:Actor):void
		{
			onHitFunc.call(this, a);
			kill();
		}
		
	}

}