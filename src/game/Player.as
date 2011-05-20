package game 
{
	import item.Inventory;
	import item.Item;
	import item.spell.SimpleMissile;
	import item.spell.Spell;
	import item.weapon.Sword;
	import item.weapon.Weapon;
	import org.flixel.FlxG;
	/**
	 * Player class
	 * @author morgan
	 */
	public class Player extends Actor
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
			
			//TODO: Remove
			var s:Sword = new Sword();
			s.setOwner(this);
			inventory.addItem(s);
			inventory.equip(Inventory.EQUIP_WEAPON, s);
			
			//TODO: Remove this too
			var m:SimpleMissile = new SimpleMissile();
			m.setOwner(this);
			inventory.addItem(m);
			inventory.equip(Inventory.EQUIP_SPELL1, m)
		}
		
		public function updateControls():void
		{
			// Calculate movement speed based on stats
			moveSpeed = BASESPEED + stat_agi * AGI_MOVE_MOD;
			
			// While casting, you can still move a bit
			if (casting) { moveSpeed *= 0.33; }
			
			// Movement
			// This may become more complicated if we allow interesting combat mechanics.
			if (FlxG.keys.LEFT)
			{
				velocity.x += -moveSpeed;
				facingNormalX = -1;
				facingNormalY = 0;
			}
			else if (FlxG.keys.RIGHT)
			{
				velocity.x += moveSpeed;
				facingNormalX = 1;
				facingNormalY = 0;				
			}
			else if (FlxG.keys.UP)
			{
				velocity.y += -moveSpeed;
				facingNormalX = 0;
				facingNormalY = -1;				
			}
			else if (FlxG.keys.DOWN)
			{
				velocity.y += moveSpeed;
				facingNormalX = 0;
				facingNormalY = 1;
			}
			
			
			// Weapon usage
			var weaponSlotItem:Item = inventory.getEquipped(Inventory.EQUIP_WEAPON);
			if (weaponSlotItem is Weapon)
			{
				
				var weapon:Weapon = (Weapon)(weaponSlotItem);
				// Short attack
				if (FlxG.keys.justPressed("A"))
				{
					weapon.attackShort();
				}
				// Long attack
				if (FlxG.keys.justPressed("S"))
				{
					weapon.attackLong();
				}
			}

			// Spell casting
			var spell1ItemSlot:Item = inventory.getEquipped(Inventory.EQUIP_SPELL1)
			if (spell1ItemSlot is Spell)
			{			
				var spell1:Spell = (Spell)(spell1ItemSlot);
				if (FlxG.keys.justPressed("D") && !casting)
				{
					spell1.beginCast();
				}
				if (FlxG.keys.justReleased("D"))
				{
					spell1.endCast();
				}
			}
				
			var spell2ItemSlot:Item = inventory.getEquipped(Inventory.EQUIP_SPELL2)
			if (spell2ItemSlot is Spell)
			{			
				var spell2:Spell = (Spell)(spell2ItemSlot);
				if (FlxG.keys.justPressed("F") && !casting)
				{
					spell2.beginCast();
				}
				if (FlxG.keys.justReleased("F"))
				{
					spell2.endCast();
				}
			}
		}
		
		public function calcStats() : void
		{
			// TODO: calculate based on items
		}
		
		override public function update():void 
		{
			inventory.updateEquipment();
			super.update();			
			calcStats();
			updateControls();
		}
		
	}

}