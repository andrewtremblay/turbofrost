package item 
{
	/**
	 * Logical item class.
	 * @author morgan
	 */
	public class Item
	{
		public var itemSlots:Array = [Inventory.EQUIP_NONE];
		public var name:String = "default";
		
		protected var owner:Actor = null;
		
		public function Item() 
		{
			
		}
		
		// This exists mainly for cooldowns on weapons and spells, but 
		// it could be useful for items with constant effects (IE sunfire)
		public function update() : void
		{
			
		}
		
		public function setOwner(o:Actor):void
		{
			owner = o;
		}
		
	}

}