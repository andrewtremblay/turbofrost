package 
{
	import org.flixel.FlxGame;
	import game.*;
	/**
	 * The entry point.
	 * @author morgan
	 */
	
	[SWF(width="640", height="640", backgroundColor="0xffffff")]
	 
	public class Main extends FlxGame
	{
		
		public function Main():void 
		{
			super(320, 320, TitleState, 2, 60, 60);
		}
		
	}
	
}