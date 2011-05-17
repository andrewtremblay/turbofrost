package item 
{
	import flash.utils.Dictionary;
	import item.Item;
	/**
	 * Consists of the inventory "bag" and the equipment
	 * @author morgan
	 */
	public class Inventory 
	{
		// AS3 has no enums.
		public static const EQUIP_NONE:int 		= 0;
		public static const EQUIP_HEAD:int 		= 1;
		public static const EQUIP_SPELL1:int 	= 2;
		public static const EQUIP_SPELL2:int 	= 3;
		public static const EQUIP_WEAPON:int 	= 4;
		public static const EQUIP_BODY:int 		= 5;
		
		// Items are the unused items in your inventory. For storage.
		// Equipped are the items you are wearing.
		private var items:Array;
		private var equipped:Dictionary;
		public function Inventory() 
		{
			items = new Array();
			equipped = new Dictionary();
			equipped[EQUIP_HEAD] 	= null;
			equipped[EQUIP_SPELL1] 	= null;
			equipped[EQUIP_SPELL2] 	= null;
			equipped[EQUIP_WEAPON] 	= null;
			equipped[EQUIP_BODY] 	= null;
		}
		
		// Add and remove inventory items
		public function addItem(i:Item):void
		{
			items.push(i);
		}
		public function removeItem(i:Item):void
		{
			items.splice(items.indexOf(i), 1);
		}
		
		public function getEquipped(equipSlot:int):Item
		{
			return equipped[equipSlot];
		}
		
		// Manipulate equipment
		// The item must be for the correct equipment slot
		public function equip(equipSlot:int, i:Item):void
		{
			if (i.itemSlot == equipSlot)
			{
				if (equipped[equipSlot] == null)
				{
					equipped[equipSlot] = i;
					removeItem(i);
				}
				else
				{
					addItem(equipped[equipSlot]);
					removeItem(i)
					equipped[equipSlot] = i;
				}
			}
		}
		
		public function unequip(equipSlot:int):void
		{
			if (equipped[equipSlot] != null)
			{
				addItem(equipped[equipSlot]);
				equipped[equipSlot] = null;
			}
		}
		
	}

}