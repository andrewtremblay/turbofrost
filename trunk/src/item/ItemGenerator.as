package item 
{
	/**
	 * This is for diablo-style generated items.
	 * @author morgan
	 */
	public class ItemGenerator 
	{
		
		public function ItemGenerator() 
		{
			
		}
		
		// I'm sure this will have parameters later
		public function makeItem() : Item
		{
			return new Item();
		}
		
		public function dropItem(x:int, y:int) : DroppedItem
		{
			var i:Item = makeItem();
			return new DroppedItem(x, y, i, null);
		}
		
	}

}