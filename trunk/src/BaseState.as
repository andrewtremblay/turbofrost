package  
{
	import org.flixel.FlxState;
	/**
	 * ...
	 * @author morgan
	 */
	public class BaseState extends FlxState
	{
		protected var rm:ResourceManager;
		public function BaseState() 
		{
			rm = ResourceManager.getRM();
			rm.initialize();
		}
		
	}

}