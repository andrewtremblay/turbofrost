package item.spell 
{
	import item.Inventory;
	import org.flixel.FlxG;
	import item.Item;
	/**
	 * The item that casts a specific spell. 
	 * When subclassing, you should only need to override cast and updateCast.
	 * All spells are assumed to have a chargable part. So, if you hold down the 
	 * cast key, it will make it stronger in some way. If you want it to cast immediately,
	 * make maxCharge 0. 
	 * @author morgan
	 */
	public class Spell extends Item
	{
		protected var cooldown:Number = 1;
		private var cooldownTimer:Number = 0;
		protected var casting:Boolean = false;
		
		private var chargeTime:Number = 0;
		protected var maxCharge:Number = 1.0;
		
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
			}
		}
		
	}

}