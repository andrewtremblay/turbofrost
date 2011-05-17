package item 
{
	/**
	 * Logical item class.
	 * @author morgan
	 */
	public class Item
	{
		public var itemSlot:int = Inventory.EQUIP_NONE;
		public var name:String = "default";
		
		protected var owner:Actor = null;
		
		public function Item() 
		{
			
		}
		
		public function setOwner(o:Actor):void
		{
			owner = o;
		}
		
	}

}