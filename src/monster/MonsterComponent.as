package monster 
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author morgan
	 */
	public class MonsterComponent extends FlxSprite
	{
		public var positionOffsetX:int = 0;
		public var positionOffsetY:int = 0;
		public var owner:Monster;
		
		public function MonsterComponent(args:Array) 
		{
			super(0, 0);
		}
	}

}