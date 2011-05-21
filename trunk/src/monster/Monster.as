package monster 
{
	import monster.components.HoldsWeaponComponent;
	/**
	 * ...
	 * @author morgan
	 */
	public class Monster extends Actor
	{
		public var components:Array;
		public function Monster(x:int, y:int, components:Array) 
		{	
			enemy = true;
			maxHealth = 50;
			super(x, y);
			this.components = components;
		}
		
		override public function update():void 
		{
			for each (var c:MonsterComponent in components)
			{
				c.x = x + c.positionOffsetX;
				c.y = y + c.positionOffsetY;
			}
			super.update();
		}
		
		override public function kill():void 
		{
			for each (var c:MonsterComponent in components)
			{
				c.kill();
			}			
			super.kill();
		}
		
	}

}