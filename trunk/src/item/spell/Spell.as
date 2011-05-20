package item.spell 
{
	import item.Inventory;
	import org.flixel.FlxG;
	import item.Item;
	/**
	 * ...
	 * @author morgan
	 */
	public class Spell extends Item
	{
		private var cooldown:Number = 1;
		private var cooldownTimer:Number = 0;
		private var casting:Boolean = false;
		
		private var chargeTime:Number = 0;
		private var maxCharge:Number = 1.0;
		
		public function Spell() 
		{
			itemSlots = [Inventory.EQUIP_SPELL1, Inventory.EQUIP_SPELL2];
		}
		
		protected function cast(charge:Number) : void
		{
			
		}
		
		protected function updateCast(charge:Number) : void
		{
			
		}		
		
		public function beginCast() : void
		{
			if (cooldownTimer <= 0)
			{
				chargeTime = 0;
				casting = true;
				owner.casting = true;
				FlxG.log("beginCast()")
			}
		}
		
		override public function update() : void
		{
			if (casting) {
				chargeTime += FlxG.elapsed;
				updateCast(chargeTime);
				if (chargeTime > maxCharge)
				{
					endCast();
				}
			}
			else
			{
				cooldownTimer = Math.max(cooldownTimer - FlxG.elapsed,0);	
			}
			super.update();
		}
		
		public function endCast() : void
		{
			if (casting)
			{
				casting = false;
				owner.casting = false;
				cooldownTimer = cooldown;
				cast(chargeTime);
				FlxG.log("endCast()")
			}
		}
		
	}

}