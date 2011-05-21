package monster 
{
	/**
	 * ...
	 * @author morgan
	 */
	public class Monster extends Actor
	{
		//A monster has a list of components
		public var components:Array;
		public function Monster(x:int, y:int, componentClasses:Array) 
		{	
			enemy = true;
			maxHealth = 50;
			super(x, y);
			components = new Array();
			for each (var c:Class in componentClasses)
			{
				components.push(new c());
			}
		}
		
	}

}