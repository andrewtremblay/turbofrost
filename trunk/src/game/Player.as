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
		public const STR_HP_MOD:Number = 1; // Health bonus per pt of str
		
		public const AGI_MOVE_MOD:Number = 3; // Move speed bonus per pt of agi
		public const AGI_AR_MOD:Number = 1; // Attack rate bonus per pt of agi
		
		public const INT_AP_MOD:Number = 1; // AP bonus per pt of int (should be 1, probably)
		public const INT_CD_MOD:Number = 1; // CD bonus per pt of int
		
		public const BASESPEED:Number = 48;
		
		public var moveSpeed:Number = 0;
		
		public var stat_str:Number = 0;
		public var stat_agi:Number = 0;
		public var stat_int:Number = 0;
		
		public var stat_dmg:Number 	= 0;
		public var stat_hp:Number 	= 0;
		public var stat_move:Number = 0;
		public var stat_ar:Number 	= 0;
		public var stat_ap:Number 	= 0;
		public var stat_cd:Number 	= 0;
		
		public var inventory:Inventory;
		
		public function Player(x:int, y:int) 
		{
			maxHealth = 1;
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
			moveSpeed = BASESPEED + stat_move;
			
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
			
			// TODO: controls will be different because of class concept. Figure
			// out the right way to do this.
			
			// Weapon usage
			var weaponSlotItem:Item = inventory.getEquipped(Inventory.EQUIP_WEAPON);
			if (weaponSlotItem is Weapon)
			{
				
				var weapon:Weapon = (Weapon)(weaponSlotItem);
				// Short attack
				if (FlxG.keys.justPressed("A"))
				{
					weapon.attackWeak();
				}
				// Long attack
				if (FlxG.keys.justPressed("S"))
				{
					weapon.attackStrong();
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
			stat_ap = stat_int * INT_AP_MOD	
			stat_cd = stat_int * INT_CD_MOD
			stat_dmg = stat_str * STR_DMG_MOD;
			stat_hp = stat_str * STR_HP_MOD;
			stat_move = stat_agi * AGI_MOVE_MOD;
			stat_ar = stat_agi * AGI_AR_MOD
			
			// TODO: add to these based on items
			
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