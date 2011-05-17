package item 
{
	/**
	 * Physical item on the ground
	 * @author morgan
	 */
	public class DroppedItem extends Entity
	{
		public var inventoryItem:Item;
		public function DroppedItem(x:int, y:int, i:Item, imageClass:Class)
		{
			inventoryItem = i;
			super(x, y);
			loadGraphic(imageClass);
		}
		
	}

}