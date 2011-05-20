package monster 
{
	/**
	 * ...
	 * @author morgan
	 */
	public class Monster extends Actor
	{
		
		public function Monster(x:int, y:int) 
		{	
			enemy = true;
			maxHealth = 50;
			super(x, y);
		}
		
	}

}