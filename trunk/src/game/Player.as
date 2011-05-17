package game 
{
	import item.Inventory;
	import item.Item;
	import item.weapon.Weapon;
	import org.flixel.FlxG;
	/**
	 * Player class
	 * @author morgan
	 */
	public class Player extends Entity
	{
		
		public const STR_DMG_MOD:Number = 1; // Attack bonus per pt of str
		public const AGI_MOVE_MOD:Number = 3; // Move speed bonus per pt of agi
		public const AGI_AR_MOD:Number = 1; // Attack rate bonus per pt of agi
		public const INT_AP_MOD:Number = 1; // AP bonus per pt of int (should be 1, probably)
		public const DEF_HP_MOD:Number = 1; // Health bonus per pt of def
		
		public const BASESPEED:Number = 48;
		
		public var moveSpeed:Number = 0;
		
		public var stat_str:Number = 0;
		public var stat_agi:Number = 0;
		public var stat_int:Number = 0;
		public var stat_def:Number = 0;
		
		public var inventory:Inventory;
		
		public function Player(x:int, y:int) 
		{
			super(x, y);
			inventory = new Inventory();
		}
		
		public function updateControls():void
		{
			// Calculate movement speed based on stats
			moveSpeed = BASESPEED + stat_agi * AGI_MOVE_MOD;
			
			// Movement
			// This may become more complicated if we allow interesting combat mechanics.
			velocity.x = velocity.y = 0;
			if (FlxG.keys.LEFT)
			{
				velocity.x = -moveSpeed;
			}
			else if (FlxG.keys.RIGHT)
			{
				velocity.x = moveSpeed;
			}
			else if (FlxG.keys.UP)
			{
				velocity.y = -moveSpeed;
			}
			else if (FlxG.keys.DOWN)
			{
				velocity.y = moveSpeed;
			}
			
			var weaponSlotItem:Item = inventory.getEquipped(Inventory.EQUIP_WEAPON);
			if (weaponSlotItem is Weapon)
			{
				var weapon:Weapon = (Weapon)(weaponSlotItem);
				// Short attack
				if (FlxG.keys.A)
				{
					weapon.attackShort();
				}
				// Long attack
				if (FlxG.keys.S)
				{
					weapon.attackLong();
				}
				
			}
		}
		
		public function calcStats() : void
		{
			// TODO: calculate based on items
		}
		
		override public function update():void 
		{
			calcStats();
			updateControls();
			super.update();
		}
		
	}

}