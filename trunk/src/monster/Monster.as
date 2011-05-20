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
			super(x, y);
			enemy = true;
			health = 50;
		}
		
	}

}