package  
{
	import org.flixel.FlxSprite;
	/**
	 * Intended to be the base class for player, monsters, spells, visible items, etc.
	 * @author morgan
	 */
	public class Entity extends FlxSprite
	{
		public var enemy:Boolean = false;
		public function Entity(x:int, y:int)
		{
			super(x, y);
		}
		
	}

}