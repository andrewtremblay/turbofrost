package  
{
	/**
	 * All of the images, sounds, etc. go in here. This way we only load things once.
	 * @author morgan
	 */
	public class ResourceManager 
	{
		// Place all embeds here. 
		[Embed (source = "../data/temp_small.png")] public var imgTempSmall:Class;
		
		private static var resourceManager:ResourceManager = null;
		private static var allowInstantiation:Boolean = false;
		
		// Singletons are a bitch to implement in as3. We only allow instantiation through this function.
		public static function getRM() : ResourceManager
		{
			if (resourceManager)
			{
				return resourceManager;
			}
			else
			{
				allowInstantiation = true;
				resourceManager = new ResourceManager();
				allowInstantiation = false;
				return resourceManager;
			}
		}
		
		// We have to do it this way because as3 has no private ctor
		public function ResourceManager() 
		{
			if (!allowInstantiation)
			{ 
				throw new Error("Singleton, don't construct. Use getRM()");
			}
		}
		
		public function initialize() : void
		{
			// Probably loading and caching sounds here.
		}
		
	}
}