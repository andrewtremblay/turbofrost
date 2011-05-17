package  
{
	/**
	 * ...
	 * @author morgan
	 */
	public class Actor extends Entity
	{
		
		public var facingNormalX:Number = 0;
		public var facingNormalY:Number = 0;
		
		public var knockback:Boolean = false;
		public var knockbackX:Number = 0;
		public var knockbackY:Number = 0;
		
		public function Actor(x:int, y:int) 
		{
			super(x, y);
		}
		
		override public function update():void 
		{
			if ( knockbackX < -1 || knockbackX > 1 || knockbackY < -1 || knockbackY > 1 )
			{
				knockback = true;
				knockbackX *= 0.9;
				knockbackY *= 0.9;
				velocity.x = knockbackX;
				velocity.y = knockbackY;
			}
			else
			{
				knockback = false;
			}
			super.update();
		}
		
		public function onHit(p:Projectile):void
		{
			
		}
		
	}

}