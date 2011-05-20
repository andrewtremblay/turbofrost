package  
{
	import org.flixel.FlxG;
	import ui.StatBar;
	/**
	 * Base class for player and monsters. They can hold things, attack, cast spells
	 * @author morgan
	 */
	public class Actor extends Entity
	{
		private const knockbackMin:Number = 10;
		
		public var facingNormalX:Number = 0;
		public var facingNormalY:Number = 0;
		
		public var knockback:Boolean = false;
		public var knockbackX:Number = 0;
		public var knockbackY:Number = 0;
		
		public var casting:Boolean = false;
		
		public var healthbar:StatBar;
		
		public var maxHealth:Number = 0;
		
		public function Actor(x:int, y:int) 
		{
			super(x, y);
			health = maxHealth;
			FlxG.log(maxHealth);
		}
		
		override public function update():void 
		{
			super.update();	
			velocity.x = 0;
			velocity.y = 0;
			if (   knockbackX < -knockbackMin || knockbackX > knockbackMin
				|| knockbackY < -knockbackMin || knockbackY > knockbackMin )
			{
				knockback = true;
				knockbackX *= 0.75;
				knockbackY *= 0.75;
				velocity.x += knockbackX;
				velocity.y += knockbackY;
			}
			else
			{
				knockback = false;
			}
			
			if (healthbar)
			{
				healthbar.x = x;
				healthbar.y = y - 6;
			}
			
			if (health <= 0)
			{
				kill();
			}
		}
		
		public function takeDamage(d:int) : void
		{
			health -= d;
			if (healthbar)
			{
				healthbar.setValue(health);
			}
		}
		
		public function onHit(p:Projectile):void
		{
			
		}
		
		override public function kill():void 
		{
			if (healthbar)
			{
				healthbar.kill();
			}
			super.kill();
		}
		
	}

}