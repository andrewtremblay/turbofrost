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
		
		public function update() : void
		{
			
		}
		
		public function setOwner(o:Actor):void
		{
			owner = o;
		}
		
	}

}