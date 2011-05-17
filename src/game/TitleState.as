package game 
{
	import org.flixel.FlxG;
	/**
	 * The title screen of the game
	 * @author morgan
	 */
	public class TitleState extends BaseState
	{
		public function TitleState() 
		{
			super();
		}
		
		override public function update():void 
		{
			super.update();
			
			if (FlxG.keys.justPressed("X"))
			{
				FlxG.switchState(new PlayState());
			}
		}
		
	}

}