package game 
{
	import org.flixel.FlxG;
	import org.flixel.FlxText;
	/**
	 * The title screen of the game
	 * @author morgan
	 */
	public class TitleState extends BaseState
	{
		public function TitleState() 
		{
			super();
			// TODO: Fix this whole state
			
			add(new FlxText(100, 10, 100, "X to start"));
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